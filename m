Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87376328AA7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 19:22:10 +0100 (CET)
Received: from localhost ([::1]:53992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGnBJ-0002Sy-JL
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 13:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1lGn8z-00012Y-Ph
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:19:45 -0500
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:400:200::c]:17904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <olaf@aepfle.de>) id 1lGn8x-000325-NG
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 13:19:45 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1614622778; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=bLahahnxyeq9suwS4Q8wqKOHJ1PQ7FFAeymggFtwpxm/LqwDrM3liz0Xa1BvtyMp6b
 Jfj5OR/+WuyKyO1G2szeiNNL4NDgbvoIsToINhJAVXfUKdYN57PubC6k2nTNGWnPVCfu
 nn0L/2/Rt3+CdD84Zc8TyyGrPZ1NZDIlWL+t13dyMbgqOb89ZNCkLjhB7t35dm/+T22s
 0TxRUWFItkhb9n+CIRYQ1HWRIe70i/vajl43CdJXvdG4El3Nl7Xw+vcmA4qbHvK8fFob
 iv0QJbsBNHTu+JUro3IHA5mZvi17N7u8vnQP5MZbHNRB1TfWcrCj4CGtrh/Dcdyd4XyL
 gqBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614622778;
 s=strato-dkim-0002; d=strato.com;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=2rsZSWK2dz1pyQe/d2PYwLZpPMODNVXB/GMaV35Y6aY=;
 b=IhQafR4AXr18nxYR8pmzblBQxUSYG9D2rhQAlcUuIkMtKHEuqGAQpE5TQjUccUMyOm
 H8LLXC2B5lQb6ihZwGRiiGYOA6wpnAA+O+oe3saFgvEWtnbHEg3SHz4nA0pW6ZnVQRJl
 CMkpbtOCKfXVxvBfw9arUxkoxnO+VUhsIH/TzJ3Jtp/bDMMyILjvG+GSPnMYGT5njTJS
 PjoSmY2U3a/h60s5olFsMmTv0DeXBjxDnRNHz6RLxyxtlNQZS/nNapEt2UTg2iVNHRAE
 nr7qVnTe283E3d6S5XSC0erRxSwIM8m4Z8JWQuM6P298bjBoE1a2yBXP7iXoQjvzNR/t
 Vb4Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614622778;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
 From:Subject:Sender;
 bh=2rsZSWK2dz1pyQe/d2PYwLZpPMODNVXB/GMaV35Y6aY=;
 b=MQfaCZl3ExkZsRhAskT34FOCu9s/Hc7/xSGrBhYH09iybgjNkOB1Hk6MpCANuZ/J+1
 Yg9xQGc7tu4NR8r2mjxZmQErQQG0ro2jIv+871/pCSAGbq4tnZ2InJpTyhPU//99BYd2
 jvXQznrMyjBQ08WFZrDIuW1BlnMV+DUCjfBREi5U8cEalYSf40B0HiBmYlxxbtY7bd7d
 z/7L6DwPZyNbI5VQYMCn/YFruHjSLVwHUDCuMvd2IN/3SdvJQSRTin36V3TWwWup209i
 Rt2D4GXYsilQBxHeE8jNiOUb0e4Q3LNddi4kQXeBItptr3ubTQRzqE8Y/6tJuQO7I/sY
 qnXQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+j4/A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 47.20.2 DYNA|AUTH)
 with ESMTPSA id c0372ax21IJb270
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 1 Mar 2021 19:19:37 +0100 (CET)
Date: Mon, 1 Mar 2021 19:19:24 +0100
From: Olaf Hering <olaf@aepfle.de>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [RFC v1 34/38] target/arm: cpu: only initialize TCG gt timers
 under CONFIG_TCG
Message-ID: <20210301191924.0cb03520.olaf@aepfle.de>
In-Reply-To: <9c82fac6-68f3-6e27-1e2a-54cb2236c1d6@suse.de>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-35-cfontana@suse.de>
 <ef926947-1073-4d7e-0b59-c47fbbfb44a2@amsat.org>
 <9c82fac6-68f3-6e27-1e2a-54cb2236c1d6@suse.de>
X-Mailer: Claws Mail 2021.01.29 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/WOCkqIuds.Tpa2nCKNn4ZG_"; protocol="application/pgp-signature"
Received-SPF: none client-ip=2a01:238:400:200::c; envelope-from=olaf@aepfle.de;
 helo=mo6-p01-ob.smtp.rzone.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001, SPF_NONE=0.001,
 URIBL_SBL_A=0.1 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--Sig_/WOCkqIuds.Tpa2nCKNn4ZG_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Sun, 21 Feb 2021 14:59:38 +0100
schrieb Claudio Fontana <cfontana@suse.de>:

> On 2/21/21 10:55 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 2/21/21 10:24 AM, Claudio Fontana wrote: =20

> >> @@ -1347,7 +1348,8 @@ static void arm_cpu_realizefn(DeviceState *dev, =
Error **errp)
> >>          cpu->gt_timer[GTIMER_HYPVIRT] =3D timer_new(QEMU_CLOCK_VIRTUA=
L, scale,
> >>                                                    arm_gt_hvtimer_cb, =
cpu); =20
> > What about Xen? =20
> Good question, what about it..
> Ccing also Olaf.


Yes, what about Xen?

Does Xen on ARM use these code paths? I do not have the answer for this que=
stion.


Olaf

--Sig_/WOCkqIuds.Tpa2nCKNn4ZG_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmA9MC0ACgkQ86SN7mm1
DoBctQ//WksEqQ901r4Pe7nJMdoJ5T3oL/3J+vSLxYBwiqp1v4sbTW41/xjZGexY
V68NZkT1PXjkqMGwthuo8DjYvmIW7K2uB5bHMjzC8Rl5DP2YHh8EEkCNTGi3AIEW
rXS6h/2xwAxAGg3ymKYlPnemxgFXWiZLgUsrWe+WXi5zwgHZWwsp7iIiUNXLiDZP
r7BXA5oIxenQSz14E4Vp1PvozD9zLY8JKrPVMGyMWnYgF6J1eE/Kp2p0gWooH1Aq
Y/ZHR4VGgpdkve8HdRGedLSY0ojNofLvOPKifcGZfPLQsZGGfNApPp++j4isdPze
MaAh0F7GbHFHNCDbuLw4ULR8DNoTG/Do6G/HA/UjjhyDXrFZv4M5csSekukV9UJ5
0Qbc0xkuQbCGw/xf6bonoUZ5IaRZeHCgpG+iU9gCunPE26sbAhFuRnJZ7uF87CBU
K+qwhdm2rJIQrBjC6eGDJHL2kV0kfdA3Tmk65RPHq/uqvJHQBAhtyfC7x4oWXX9P
GKrblkf4kvsuQPqPuS13C1oFV0Yy1ZgRhVXT612bZdV6kYYH4+1lt8HizzssXNgz
vP5CM4BD8SAXs+y7uOtJfuzE0XU3haYsVHfm2khZUTUSOzuATt4QWrfErSPJzElF
86JVrWWsOEkCfGlRhQHjU6ByV5OgqDn9CcDKoITC6yS0vJQi6BU=
=tJhN
-----END PGP SIGNATURE-----

--Sig_/WOCkqIuds.Tpa2nCKNn4ZG_--

