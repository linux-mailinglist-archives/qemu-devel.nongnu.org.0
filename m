Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A231429CC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 12:47:47 +0100 (CET)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itVX0-0006lc-46
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 06:47:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48560)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mjt@tls.msk.ru>) id 1itVVu-0006LI-9Z
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:46:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mjt@tls.msk.ru>) id 1itVVq-00089P-30
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:46:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39535)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mjt@tls.msk.ru>) id 1itVVp-00088F-SW
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 06:46:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 7AC6E40795;
 Mon, 20 Jan 2020 14:46:30 +0300 (MSK)
Received: from [192.168.177.99] (mjt.vpn.tls.msk.ru [192.168.177.99])
 by tsrv.corpit.ru (Postfix) with ESMTP id 7BE5F23F;
 Mon, 20 Jan 2020 14:46:32 +0300 (MSK)
Subject: Re: audio: audio input with new backend makes qemu to freeze
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <321c7f50-6fd5-a532-16a2-9e940b88ca0f@msgid.tls.msk.ru>
Message-ID: <ac06db96-5658-6013-d595-0da6943c704a@msgid.tls.msk.ru>
Date: Mon, 20 Jan 2020 14:46:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <321c7f50-6fd5-a532-16a2-9e940b88ca0f@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 86.62.121.231
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

20.01.2020 14:27, Michael Tokarev wrote:
> Hello.
>=20
> There's a bugreport about audio subsystem being unable to use microphon=
e
> (audio input) with new backend, since 286a5d201e432ed2963e5d860f239bb27=
6edffeb
> See full details with stack traces at http://bugs.debian.org/948658

Hmm. I wonder if this is fixed by a recent patch from Volker R=C3=BCmelin=
 titled
"audio: fix audio recording"...

/mjt

