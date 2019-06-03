Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5620432A9D
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 10:18:29 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59449 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXiAi-0000HT-SW
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 04:18:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hXi8Q-0007WJ-Mw
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:16:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hXi8P-0000oW-SW
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:16:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hXi8P-0000n9-Mr
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 04:16:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 270EA3002F32;
	Mon,  3 Jun 2019 08:15:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-223.ams2.redhat.com
	[10.36.117.223])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 983965B684;
	Mon,  3 Jun 2019 08:15:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 3329D11386A0; Mon,  3 Jun 2019 10:15:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20190523094433.30297-1-yury-kotov@yandex-team.ru>
	<87k1ebdsbm.fsf@dusky.pond.sub.org> <20190531190753.GO3169@work-vm>
Date: Mon, 03 Jun 2019 10:15:50 +0200
In-Reply-To: <20190531190753.GO3169@work-vm> (David Alan Gilbert's message of
	"Fri, 31 May 2019 20:07:53 +0100")
Message-ID: <87sgsrt77t.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Mon, 03 Jun 2019 08:16:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3] monitor: Fix return type of
 monitor_fdset_dup_fd_find
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yury Kotov <yury-kotov@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> writes:

> * Markus Armbruster (armbru@redhat.com) wrote:
>> David, got anything queued for the monitor?  If yes, can you stick this
>> in?  If not, I can handle it.
>
> I've not got anything else, so please take it;
> am I right in thinking this supercedes
>
>   'monitor: Fix fdset_id & fd types for corresponding QMP commands'

Correct.

> Thanks,

Queued.  Thanks!

