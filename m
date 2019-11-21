Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09B105062
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Nov 2019 11:21:18 +0100 (CET)
Received: from localhost ([::1]:38400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iXjaP-00029g-6i
	for lists+qemu-devel@lfdr.de; Thu, 21 Nov 2019 05:21:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42175)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iXjVX-0006ka-2m
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iXjVU-0007Qc-54
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:12 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55086
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iXjVT-0007QG-Qg
 for qemu-devel@nongnu.org; Thu, 21 Nov 2019 05:16:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574331370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNqTV2GPuHQuPlAY1sCf7QR48w3WXhuPbkilqO5Sz2Y=;
 b=g0u9ARi68aFTQuacPx1aIt/IsAzUr69xGJE5BmYEwN6/gZGJDmCmNwu1nPvE/yYtUY5j6h
 GnRCMOIdZ+i0h0Sdk8yLFyr7hAn+ks8glV5lnMxhRLIgvTGcKUWyVoFNcAlvgkTDLv/QKK
 EmzlOGE34hMEsqkJeY3JzLWOJozPTxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-nFitahV6OgauFi4GwJFblg-1; Thu, 21 Nov 2019 05:16:07 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 114AEDBA3;
 Thu, 21 Nov 2019 10:16:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-67.ams2.redhat.com
 [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AADDD60BCE;
 Thu, 21 Nov 2019 10:16:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DBF1016E08; Thu, 21 Nov 2019 11:16:04 +0100 (CET)
Date: Thu, 21 Nov 2019 11:16:04 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: yanminhui163 <yanminhui163@163.com>
Subject: Re: [PATCH] ui/gtk: fix gettext message's charset.
Message-ID: <20191121101604.nxuanstohxclxzyq@sirius.home.kraxel.org>
References: <20191116031037.1207-1-yanminhui163@163.com>
 <20191120133222.ssfo63bdimopwqhe@sirius.home.kraxel.org>
 <55efa019.40fa.16e8bcc1531.Coremail.yanminhui163@163.com>
MIME-Version: 1.0
In-Reply-To: <55efa019.40fa.16e8bcc1531.Coremail.yanminhui163@163.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: nFitahV6OgauFi4GwJFblg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: qemu-devel@nongnu.org, 565101222@qq.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 21, 2019 at 10:30:38AM +0800, yanminhui163 wrote:
> I had compiled on NeoKylin (i18n LANG=3Dzh_CN.UTF-8), but gtk menu's text=
 is wrong.

Please keep the qemu-devel mailing list Cc'ed (reply-to-all should do this)=
.

So qemu doesn't do a full locate setup, to avoid confusing non-gtk parts
of qemu (see longish comments in ui/gtk.c).  Which is probably the
reason why the menus are not working properly, any non-ascii characters
are not displayed as question marks.  Explicitly calling
bind_textdomain_codeset() does indeed fix that.

It might not work for non-utf8 locales (latin1, big5, ...), but is still
a clear improvement over the current situation.  Unlike setlocale() it
should not have unwanted side effects elsewhere, so lets go with it.

Queued up for 4.2.

thanks,
  Gerd


