Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBE1847FE
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Aug 2019 10:47:18 +0200 (CEST)
Received: from localhost ([::1]:38884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvHbK-0005Xz-1T
	for lists+qemu-devel@lfdr.de; Wed, 07 Aug 2019 04:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47797)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hvHap-000532-Vd
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 04:46:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hvHap-0002rz-39
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 04:46:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52340)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hvHao-0002rf-Ue
 for qemu-devel@nongnu.org; Wed, 07 Aug 2019 04:46:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1997030EA19F;
 Wed,  7 Aug 2019 08:46:46 +0000 (UTC)
Received: from redhat.com (ovpn-116-161.ams2.redhat.com [10.36.116.161])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8746060BE1;
 Wed,  7 Aug 2019 08:46:45 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Ivan Ren <renyime@gmail.com>
In-Reply-To: <1564464816-21804-4-git-send-email-ivanren@tencent.com> (Ivan
 Ren's message of "Tue, 30 Jul 2019 13:33:36 +0800")
References: <1564464816-21804-1-git-send-email-ivanren@tencent.com>
 <1564464816-21804-4-git-send-email-ivanren@tencent.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Wed, 07 Aug 2019 10:46:43 +0200
Message-ID: <87sgqd2wi4.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Wed, 07 Aug 2019 08:46:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 3/3] migration: update ram_counters for
 multifd sync packet
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, richardw.yang@linux.intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ivan Ren <renyime@gmail.com> wrote:
> From: Ivan Ren <ivanren@tencent.com>
>
> Multifd sync will send MULTIFD_FLAG_SYNC flag info to destination, add
> these bytes to ram_counters record.
>
> Signed-off-by: Ivan Ren <ivanren@tencent.com>
> Suggested-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

