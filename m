Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E861191744
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 18:10:54 +0100 (CET)
Received: from localhost ([::1]:52428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGn4m-0006a3-UT
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 13:10:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54450)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jGn3p-0005lJ-9b
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:09:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jiaxun.yang@flygoat.com>) id 1jGn3o-0002LX-4m
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:09:53 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17824)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1jGn3n-0002Jh-4I
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 13:09:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585069725; 
 s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
 h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
 bh=bVplZ+igSUO/7rPM614JndCdh7GRlZT7JtJc0rDrx4M=;
 b=XD4TUHpcYLTLqAVgxth+KLXKH0gf0FIXhJEiJWbbT1b9kRvPu2Q9wGANRDQI3ECh
 5fndpzJlyA49Nw+30gFkzMSMSxvQfOjsNpmhnSxn2AxHh8YEEScIM7euvaY25Mvy0lE
 CKQnQmk69Vymcjn/rIY/fqd6zzU6Y/dXkYp0CW44=
Received: from [10.233.233.252] (183.157.60.227 [183.157.60.227]) by
 mx.zoho.com.cn with SMTPS id 1585069723305683.1787165071842;
 Wed, 25 Mar 2020 01:08:43 +0800 (CST)
Date: Wed, 25 Mar 2020 01:08:30 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHiYmc7MN8pUg7FJ=wcn1h0pr2A05nv4SQaOZmL47NCnNzUJRA@mail.gmail.com>
References: <20200324122212.11156-1-jiaxun.yang@flygoat.com>
 <CAHiYmc7MN8pUg7FJ=wcn1h0pr2A05nv4SQaOZmL47NCnNzUJRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH for-5.0,
 v1] target/mips: Fix loongson multimedia condition instructions
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <623EF6C4-18D0-4A9C-B758-A3BE0B0AAF25@flygoat.com>
X-ZohoCNMailClient: External
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 124.251.121.243
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
Cc: Huacai Chen <chenhc@lemote.com>, aleksandar.rikalo@rt-rk.com,
 richard.henderson@linaro.org, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8825=E6=97=A5 GMT+08:00 =E4=B8=8A=E5=8D=881=
2:56:41, Aleksandar Markovic <aleksandar=2Eqemu=2Edevel@gmail=2Ecom> =E5=86=
=99=E5=88=B0:
>14:23 Uto, 24=2E03=2E2020=2E Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom> =
=D1=98=D0=B5
>=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>>
>> Loongson multimedia condition instructions were previously
>implemented as
>> write 0 to rd due to lack of documentation=2E So I just confirmed with
>Loongson
>> about their encoding and implemented them correctly=2E
>>
>> Signed-off-by: Jiaxun Yang <jiaxun=2Eyang@flygoat=2Ecom>
>> Acked-by: Huacai Chen <chenhc@lemote=2Ecom>
>> ---
>> v1: Use deposit opreations according to Richard's suggestion=2E
>> ---
>
>Thanks, Jiaxun!
>
>But, your numeration of patches is wrong=2E The first version of the
>patch
>should be sent with prefix [PATCH]
>and the second (this) version of the patch with prefix [PATCH v2]=2E This
>is
>the second time you make the same mistake=2E Please make sure that you
>have
>the correct numeration in future=2E But, anyhow, thanks for this version=
=2E

Sorry for that=2E
I'm doing like this for years=2E
I promise it won't happen in future=2E

Thanks=2E

>
>Yours,
>Aleksandar
>
--=20
Jiaxun Yang

