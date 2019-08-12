Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 128E88A069
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 16:11:41 +0200 (CEST)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxB2y-0001xE-A8
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 10:11:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60208)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hxB28-0001Am-OH
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hxB27-0007pe-SF
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:10:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35502)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hxB27-0007pT-NJ
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:10:47 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1592866971
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 14:10:47 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D45E85DD61;
 Mon, 12 Aug 2019 14:10:46 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 942391136444; Mon, 12 Aug 2019 16:10:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <20190709185936.31335-1-armbru@redhat.com>
Date: Mon, 12 Aug 2019 16:10:41 +0200
In-Reply-To: <20190709185936.31335-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 9 Jul 2019 20:59:36 +0200")
Message-ID: <877e7itqxq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Mon, 12 Aug 2019 14:10:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qdev: Collect HMP handlers command
 handlers in qdev-monitor.c
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
Cc: pbonzini@redhat.com, berrange@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> Move hmp_device_add(), hmp_device_del() from monitor/hmp-cmds.c to
> qdev-monitor.c, where they are covered by MAINTAINERS section "QOM",
> just like qapi/qdev.json.  hmp_info_qtree() and hmp_info_qdm() are
> already there.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Queued for 4.2.

