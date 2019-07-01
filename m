Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55ACF4223A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jun 2019 12:21:44 +0200 (CEST)
Received: from localhost ([::1]:58402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hb0Nz-0001o0-Gv
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 06:21:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51257)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hb0Hj-00008R-KT
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:15:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hb0Hd-0008Bh-No
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:15:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39246)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hb0Hb-00089B-O9
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 06:15:09 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 78AD981F0D;
 Wed, 12 Jun 2019 10:15:06 +0000 (UTC)
Received: from redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 059EE6A250;
 Wed, 12 Jun 2019 10:15:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
In-Reply-To: <20190610004159.20966-1-richardw.yang@linux.intel.com> (Wei
 Yang's message of "Mon, 10 Jun 2019 08:41:59 +0800")
References: <20190610004159.20966-1-richardw.yang@linux.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 12 Jun 2019 12:15:03 +0200
Message-ID: <87wohrm7o8.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 12 Jun 2019 10:15:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] migration/xbzrle: update cache and
 current_data in one place
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
> When we are not in the last_stage, we need to update the cache if page
> is not the same.
>
> Currently this procedure is scattered in two places and mixed with
> encoding status check.
>
> This patch extract this general step out to make the code a little bit
> easy to read.
>
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

