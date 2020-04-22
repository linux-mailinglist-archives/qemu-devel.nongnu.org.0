Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05EB1B4A66
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 18:23:20 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRI9e-0004tm-Sm
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 12:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59842)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1jRI54-0007sC-GW
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1jRI4p-0000wh-Kb
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:18:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:51668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1jRI4p-0000dR-6y; Wed, 22 Apr 2020 12:18:19 -0400
Received: by mail-wm1-x336.google.com with SMTP id x4so3065850wmj.1;
 Wed, 22 Apr 2020 09:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=o07n5auFQtbWMeOi+T/XpGNeJDKGraAPFTqT1F32lDE=;
 b=EqcEwM55qcum9P4ZYpoH82lL5PLLqmX3IMFxhU+cMFTsaqRCuSQHQ8WnoZJI1uuoqZ
 V+7d65C4NziGyhPnY725XwHgnMJ4TGqCDcN7OdrJ5urQR6/GDyivuRRz3X1dMpE1S3Rh
 13uv4RDtxk/MIZbADiz/BD8NK5ah8XlB5afQMfTLlk7w+Ckla8gq03SRFswEbxR9pM9D
 vldjju7+waAqQxM8CJuNSCSrwInOSM6xRpwd1M10kseSUD8eSK3W+bUxI2F5AGueXWxo
 NGuGIcFXKIuuqmMmEldDsbAMOULdO9u3OrAsk0WuLuIBKUvFACUpJJwyTxcoYx4nR7FX
 ujxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=o07n5auFQtbWMeOi+T/XpGNeJDKGraAPFTqT1F32lDE=;
 b=Jyrgai+eRgWL9LMS9wpxGpo/+A4C6CHVAFr2RXnDfLiQw02wd5UQJslxh+FbePGQN4
 Yda8UBN8oX5mrhVATbq5rpwaxjdio89X6lj6CSuwR0xtw68DJsDu3rMDrnm6cnn4ONbO
 2EmeEDMSkmIAqOEvGe/ln5ogocpmN/HXH6oHOk8djuVz3Auhc74Bw4tmWoyFKmQVBfJ4
 vNf5gjFD29mGEKLN3y35Fhf7vCidaXDzjaDbPaacTgjGRc9qZErs9Ab+NgjBigQmLzzB
 o1lC/FaiCSxnPGSTXHe1R3wECfheC+OMXiH2fOhs6N9ioU/lIEjI9zFig6NVLqPp6KNF
 uFdg==
X-Gm-Message-State: AGi0PuaNRMK7kPNK4ecUMQwJy97EK2TFYc+kSGUXiVNRlMPXowyI0A2f
 c+orqUuTx+rxQl9F6/7JTuk=
X-Google-Smtp-Source: APiQypLlH9FTGhSrlOa+mKeAI3e8X8qt+ZWv+P7kYHi3C8PdMmZlk0wkU836r4SSYoIGGKXWoUT2bw==
X-Received: by 2002:a1c:492:: with SMTP id 140mr12024967wme.9.1587572295620;
 Wed, 22 Apr 2020 09:18:15 -0700 (PDT)
Received: from localhost ([51.15.41.238])
 by smtp.gmail.com with ESMTPSA id y5sm9201785wru.15.2020.04.22.09.18.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 09:18:14 -0700 (PDT)
Date: Wed, 22 Apr 2020 17:18:13 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: janine.schneider@fau.de
Subject: Re: Integration of qemu-img
Message-ID: <20200422161813.GI47385@stefanha-x1.localdomain>
References: <00fc01d61256$35f849c0$a1e8dd40$@fau.de>
 <877dyfc1if.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Content-Disposition: inline
In-Reply-To: <877dyfc1if.fsf@dusky.pond.sub.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=stefanha@gmail.com; helo=mail-wm1-x336.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::336
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 16, 2020 at 09:50:48AM +0200, Markus Armbruster wrote:
> Cc: qemu-block
>=20
> <janine.schneider@fau.de> writes:
>=20
> > Dear Sir or Madam,
> >
> > =20
> >
> > I am a PhD student at the Friedrich-Alexander-University Erlangen-N=FCr=
nberg
> > in Bavaria Germany and I am currently working on an open-source forensic
> > analysis tool. I would like to use qemu-img for converting virtual disc=
s to
> > raw files and to get virtual disc information. By now I tried to create=
 a
> > qemu-img DLL with the qemu source code you provide on your website, but=
 I am
> > unable to compile it properly. Therefore, I would like to ask you if th=
ere
> > is a simple solution to integrate qemu-img to other C++ projects? Or is
> > there a precompiled qemu-img DLL which I could use? Thank you very much=
 for
> > your support.

Can you simply spawn a qemu-img process from your application?  That
would be much easier than trying to build it as a library and link it
into your application.

qemu-img has --output=3Djson exactly for this case.  It will let you parse
the output as JSON.

Stefan

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAl6gbkUACgkQnKSrs4Gr
c8gZSwgAp0zCeBhRw7d1yHpSV1SBhhJTHWOmjo057ztozDjs1kijTAlx4jtRhxPp
Q+PLdv325DV/B4IfjpNaTiSunEPrlWjq1/8TXy8OMGrl5+cqzl2AHvTQC+c91Qhr
tXJQZua+RONy7sxQLfenIh0ZfuS9iaOT7jhhVVbJu9MGh2Bokf2PvNxzpkdcygME
kpF5eRPE889m645Lr4tPEmja73fDRy7fk79nl2k7HiNGSCslRndETW2QN4F/budZ
Ef8vhH2A1vZUGNqNX/qKz/ajvsUo81lQnhb25C40sK1ut9Q5js2o8jnd3JbXLC7A
Yx74HTlEH4/DmgKYmXo9LCF8J16bjg==
=9TqJ
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--

