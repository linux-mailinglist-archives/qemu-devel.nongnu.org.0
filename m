Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF02EE8567
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 11:21:42 +0100 (CET)
Received: from localhost ([::1]:54314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPOdB-0004dX-Nf
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 06:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lekiravi@yandex-team.ru>) id 1iPOcL-0004D5-9f
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lekiravi@yandex-team.ru>) id 1iPOcI-0008EW-8v
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:20:47 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:43176)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lekiravi@yandex-team.ru>)
 id 1iPOcH-00089o-O1
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 06:20:46 -0400
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 667042E1553;
 Tue, 29 Oct 2019 13:20:40 +0300 (MSK)
Received: from localhost (localhost [::1])
 by mxbackcorp1j.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
 o2Oje8lhGt-Ke9iuYLc; Tue, 29 Oct 2019 13:20:40 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1572344440; bh=mY1LcKtbNfXEUb6215DWFvxEqovKYmnUCSrFZyjgG1w=;
 h=Cc:Subject:Date:References:To:From:Message-Id;
 b=1PMQWw03WWtIbHf3DXO0XzgEdE4Bx49OkF2855irvK83gzzEc/9D2xTlBd2qH8hYA
 CNxMS4S5mVCYl5NtSwKCo4yliyFMXdqz2doNsanfDd/JgaID8xR22MEf8cxsoIhBJG
 BusQEsM08X1WpPwTQLHHoDear0AvBMvswy2RQx0E=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
X-Yandex-Sender-Uid: 1120000000161690
X-Yandex-Avir: 1
Received: from mxbackcorp1o.mail.yandex.net (localhost [::1])
 by mxbackcorp1o.mail.yandex.net with LMTP id OyQEalPFoA-A78qcewW
 for <lekiravi@yandex-team.ru>; Tue, 29 Oct 2019 13:20:29 +0300
Received: by sas1-eb34c5849710.qloud-c.yandex.net with HTTP;
 Tue, 29 Oct 2019 13:20:29 +0300
From: Alex Kirillov <lekiravi@yandex-team.ru>
To: Markus Armbruster <armbru@redhat.com>
References: <713881571320392@iva8-147456c4bd40.qloud-c.yandex.net>
 <87d0elmmdt.fsf@dusky.pond.sub.org>
Subject: Re: QMP netdev_add multiple dnssearch values
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 29 Oct 2019 13:20:39 +0300
Message-Id: <2137591572344429@sas1-eb34c5849710.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a02:6b8:0:1619::183
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "jasowang@redhat.com" <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> What exactly goes wrong? Does the QMP command fail? Does it succeed
> but the network backend incorrectly?

QMP command succesfully creates Slirp backend, but ignore whole arguments=
:
- `dnssearch`
- `hostfwd`
- `guestfwd`

As example, `dnssearch` field of `NetdevUserOptions` goes straight to the=
 function `slirp_dnssearch` (net/slirp.c), where it converts to `char **`=
. But at this moment, this parameter is simply NULL, when I pass somethin=
g differrent from simple string.

This is very strange, because type of this parameters is `StringList` and=
 must require something like [{"str": "a"}, {"str": "b"}].


--=C2=A0
Alex Kirillov
Yandex.Cloud

