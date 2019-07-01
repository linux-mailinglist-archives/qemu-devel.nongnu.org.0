Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A48683C65F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 10:47:57 +0200 (CEST)
Received: from localhost ([::1]:52884 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hacRg-0006WG-Oo
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 04:47:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53905)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hacNh-0004G8-Gd
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:43:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hacEf-00045K-Th
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:34:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48392)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hacEf-00044v-Ob
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 04:34:29 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 05552307D91F;
 Tue, 11 Jun 2019 08:34:28 +0000 (UTC)
Received: from redhat.com (ovpn-117-129.ams2.redhat.com [10.36.117.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9179719C70;
 Tue, 11 Jun 2019 08:34:27 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190611082548.GB11125@richard> (Wei Yang's message of "Tue, 11
 Jun 2019 16:25:48 +0800")
References: <20190401061457.9393-1-richardw.yang@linux.intel.com>
 <20190611082548.GB11125@richard>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 11 Jun 2019 10:34:25 +0200
Message-ID: <87v9xctt9q.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 11 Jun 2019 08:34:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] migration: cleanup check on ops in
 savevm.handlers iteration
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
Reply-To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wei Yang <richardw.yang@linux.intel.com> wrote:
> On Mon, Apr 01, 2019 at 02:14:57PM +0800, Wei Yang wrote:
>>During migration, there are several places to iterate on
>>savevm.handlers. And on each iteration, we need to check its ops and
>>related callbacks before invoke it.
>>
>>Generally, ops is the first element to check, and it is only necessary
>>to check it once.
>>
>>This patch clean all the related part in savevm.c to check ops only once
>>in those iterations.
>>
>>Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
>
> Hi, David
>
> Are you willing to pick up this one?

also will pick up this one.

Later, Juan.

