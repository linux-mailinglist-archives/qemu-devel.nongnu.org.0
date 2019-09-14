Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DB0B2C95
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Sep 2019 20:41:45 +0200 (CEST)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9CzQ-0007mi-Gb
	for lists+qemu-devel@lfdr.de; Sat, 14 Sep 2019 14:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52476)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1i9CyU-0007LT-TU
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:40:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1i9CyS-0001NT-7U
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:40:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51848)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1i9CyS-0001Me-2V
 for qemu-devel@nongnu.org; Sat, 14 Sep 2019 14:40:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B8A31301A3AC;
 Sat, 14 Sep 2019 18:40:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7180160BE0;
 Sat, 14 Sep 2019 18:40:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05A94113865F; Sat, 14 Sep 2019 20:40:41 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Cyrill Gorcunov <gorcunov@gmail.com>
References: <20190913154344.GH1508@uranus>
Date: Sat, 14 Sep 2019 20:40:40 +0200
In-Reply-To: <20190913154344.GH1508@uranus> (Cyrill Gorcunov's message of
 "Fri, 13 Sep 2019 18:43:44 +0300")
Message-ID: <87sgoy3emv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Sat, 14 Sep 2019 18:40:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] error-report: Add info_report_once helper
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

You neglected to cc: the maintainer (me).  I spotted this anyway, more
or less by chance.  Next time, please use scripts/get_maintainer.pl to
find people you might want to cc:.

Cyrill Gorcunov <gorcunov@gmail.com> writes:

> We already have error_report_once and warn_report_once,
> thus lets add info_report_once to complement. Actually
> I use this helper a lot so might be usefull for others.
>
> Signed-off-by: Cyrill Gorcunov <gorcunov@gmail.com>

Patch looks reasonable enough.  However, the new info_report_once() and
info_report_once_cond() aren't used.  Your commit message suggests you
have users in unpublished code.  Is that correct?

