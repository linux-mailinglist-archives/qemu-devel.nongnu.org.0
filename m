Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658798521D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 19:31:58 +0200 (CEST)
Received: from localhost ([::1]:43850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvPn3-0008HR-Lj
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 13:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55412)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <dgilbert@redhat.com>) id 1hvPmO-0007q0-0C
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:31:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hvPmM-0001VQ-47
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:31:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49828)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hvPmL-0001Rl-Hm
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 13:31:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 87D64550BB;
 Wed,  7 Aug 2019 17:31:11 +0000 (UTC)
Received: from work-vm (ovpn-117-204.ams2.redhat.com [10.36.117.204])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A902D600C6;
 Wed,  7 Aug 2019 17:31:10 +0000 (UTC)
Date: Wed, 7 Aug 2019 18:31:08 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190807173108.GF27871@work-vm>
References: <20190709140924.13291-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190709140924.13291-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 07 Aug 2019 17:31:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/3] migration/savevm: move non
 SaveStateEntry condition check out of iteration
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Wei Yang (richardw.yang@linux.intel.com) wrote:
> qemu_savevm_state_complete_precopy() iterates SaveStateEntry and does proper
> tasks for migration.
> 
> For each iteration, in_postcopy and iterable_only would be checked to see
> whether it should skip. Since these two conditions are not SaveStateEntry
> specific, it is proper to move the check out of iteration.
> 
> These three patches prepare the code and move the condition check out of the
> iteration.
> 

Queued

> 
> Wei Yang (3):
>   migration/savevm: flush file for iterable_only case
>   migration/savevm: split qemu_savevm_state_complete_precopy() into two
>     parts
>   migration/savevm: move non SaveStateEntry condition check out of
>     iteration
> 
>  migration/savevm.c | 68 ++++++++++++++++++++++++++++++++++------------
>  1 file changed, 50 insertions(+), 18 deletions(-)
> 
> -- 
> 2.17.1
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

