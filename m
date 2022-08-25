Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D1D5A0A17
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:24:49 +0200 (CEST)
Received: from localhost ([::1]:42028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR7EO-0004FP-79
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:24:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1oR738-0007ah-9i
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:13:10 -0400
Received: from sonic307-20.consmr.mail.sg3.yahoo.com ([106.10.241.37]:41417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1oR735-0004eF-Lj
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 03:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1661411579; bh=lRd/BbAinyvhEAoiCuSpKcwcBjFR8jVgY88dqUJacxM=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Q9weJwIpljNJTDzkLYNXm0w4GqR5MvvuJhKA5JrseN5s8xEUPu7Gq3wIaXQs+0ABa6viB8mHVyaiqYxWnl2vlnD6B4FX02OT5ED/cW3B4dP/PdZeJ3Hd4QZ/QpU+UHB7vdHbaVaO1+7Y+Z/AS+fQZwplBhzhW+7UFpumRKnAKdKH+Hu62KCFyDvvojHLd6ly/R+oKlOYtHr2y/2WGD60f7K9atD6v/bF0vtGJ3+lCEDu/MXA70Jdcwp5rDVIhfqLi58OP6b1ZAxNN+ShPmm63oTCjwzuMOteFZgvsZhsYe/ZR5h1EFFKgI2+PWPCN0UzjL0FFAT9USjCHiP1DaI6pw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1661411579; bh=cQDeOpkWuyay9myEcupWvDzvFlCxgyTx1MIKvmflXH8=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=IrUaOriQ0rPotkAYY+dC9SnGFak+v7sFo6yw23s/ZFNoWAAHrwocPGSD1K9GTQpHNdSUGiukOLMUUJ/lNCmuk9bTqIcNwRBjgx841UolgeYqIZC+PVoDohp58gGplns9uDzq9IEGC4z5sYJsPOTuZWT0ahn6h1SmFsyuqlYTlsvebNKVYG5FbSl96seCxUV7/sn+UJkzhZqjTzHjlRKZmkdjyJjHJAzBz7NLj6nQVqH7vV9TWRUd5ksptZqFODb0CDL50rlSpYxERhRzxYr9rFm1K+fehYJ2/cjordZyxxD3pzj3XcpupKj3iuuteCRmXmxQxeY1gszKgYv79Ei4fQ==
X-YMail-OSG: d34SDUYVM1l7RVRCMENFM_G26L29h6DjhMPm7NgxYNLA_9Wtbkv6gUBTfNgS_37
 cpQxIBfY7_xurUDuv0Jxiqf2uxrvLQ5LnWPzOJB..HR88ZDEcT3QPEF1EhT8G755gB9E8Rbp_XbG
 JhQdK.jMYQ.jd3TBG7jPZ3yXTXDOnx_6k_iYqXWrqgM0ocf6JsBPSFdR_VrSsyVjITAevZrtxO6p
 dCDBYgkiKTaJhOKZpVLL0iXXDjloJGNjULIrka16XykEgSmDttfxYY2wxopZzvwmmuvPHAJvBT8M
 F9ULtGxglXeI8U_3HcLI2NHAib2lVfa_tlVQQkhYRBy5zluq09Md8NhPm5snGXQt.YaxJN_v7fvl
 gjeWdCjc8_mw2FTAiE1ZsukTIjtwE4UY4kkXXeYWUfPu7e5LM56cENpdiza19pMUhR2wMzBeSM40
 juGIc6oz4xqi72Vj7ZVfblB9smVd9dGGv3kljiEah9nWxykhRRn2PWPoLL.4HqBSPxbNGaCMpZOm
 ZBN4S1J74OHxo0PRoBRDIl8o5J5_PXCqfH3iTiAwHpdwgNj_kaJtH5CYD5IuJeIREwr7nHeJIJKf
 pffJ_vHKWl42eCI3LlocRTsT4fn_k6Z9mccYbVErwRdO9cTcCWHk.Oli4.iJfd2FDaqZo5urhWeI
 eG5eRD924G4P3V9yj2JuiWnEfJx8YNIlPHg_KG8.NIvu9eCNyhVx89a7uQW0l8651Y_AgIaw2tof
 QvXOaxmRy3V0t.pSbZMRK5pz5erTqrmEvTxAKnMYiVANFQC9Z_PQ.kxsLPtue4cWq89dtCcYfoD5
 p2X0Ucs2BScmgeGq0_Uyjt0uwK0FPc.Ka_QiLsAiNfuwXuyi28nJUB9eOJ7YU5ct5506vT._nUrC
 rB1acSFqBW9Xeo5bYb5yBiq7qFvMTvjHDh7Dx8Jh_QzsvP1joZV9qIos22bOZBRcDMT0N1nH0uMN
 jc1VFGHlqbwHc7ZI5XyaHQjQ.Qi90GTZ15vWE2zD.5bbqZkAjwSwn8X0AG9Vhc0tIeaczVp5vSey
 sQ9bPi9KTMVNLweragWFOuLZTsmQ1pViUuMc9Ni8lPf8228GKIq0Wvzbn0.nf8b.GWBBCPZjKjFf
 tmtiRxVIXuneWaO_jjfuywFa8RNjb4enHwDOFfQue.ro8plhp5Ffcxz4440ZC8iwboREj7K5XllM
 XTsq0yPuDyhJUV5wISa37zpn28u5sCFgaq9qwjaU4HDf.9u8QU6jbFs5mYXbEPjzG3lPizJBl8O8
 a_.UBIA556tFl71VMEAEdL.Y_ukbgVx5WFWYj_Y1yogvYmkSlTlz0_n.fplH2dDvVWN4iNn_bcsJ
 xhMmgwS5OeTrBZKP8p9bPP17N57htd3G5nkqyTsHwg_W4xRK9hyCDIQY552BBAvLtnMIFkAxHqav
 vN.V.IEIjHTAS2KoPtRf8LZAv65TJ0JEPf2WnRvUTZitWK9v2Jqz.x_nO_asyzUoZC7vhWlIPx02
 cFLpZ4m2gB7Dtz.0jn4jybsqzD5X9IrvSIg_sXAdemfT3w18QLhUJJLAe1Iw7SR1DONexEjz4dqR
 _qRhR0A1LpyJt0WxrYUYur0n4Fp8Juf.M55hOi4vqlhmn8.SgpdtHmdIXuFI2d7pm662zlw.FB3f
 gyuUOgMJQP0.dgo7EOOmlFZpwfCcjmIod9FdEfhh_zi9LwoL86OSwM9zEiuj_H6bA.zDs3URmxrb
 RK2r2LdgM6lZqaXSBaTRphgd3y2jYwSTOsqRvvWIz6AUTVzGotmnTb8.isOF2hr76fRlDLjJl2OL
 2LuztXeJG4LEtfABnfiXe5pANu1yfauyV2ieViFn9YFsWIhbLLOUCLQ7TUXWWinDyryVvVfdJBYX
 gGmE4GCtRrA920nKUS2JrkuBh6Fau4h9EJKzoINwnVXiHOOIpi6ckV6tU5eKYrJs2SYgaY8gcQkR
 RdL4MBtoFXHHvTxeyENQlHV7xNCavQZ9RfO_5VOtqup9xqLFNBVL7loKPs5cJsHipKg9wghWPNaz
 I_KsD5zzGwB.nNY6VMwSKVzkxfy5kExTntV4eAvpWLmtDbaBeJ.woctKCI7QDndA7TpF2W_gzjcl
 7q_.QG8QkocAWUjKBzy6BV65inqcg_g1Ec93t6mGbz44KqpSAShhEYgRjyttOTjV6iZG901PtSPW
 CWfvdb_J5iK2bfQRLNRmgLJUHeB8UPbPoWcoLK8gln_.JBMDvNR_dpnTkCBKz.8X2oUnm.YAkgkG
 Vos74h.i_A1OoheTdCg.nl4IMQP8hdwAPU7ZiweJ6mjV8gJclKxboySTsPRcLr3MwkluQwtY5oez
 IbljEIp2u8VlZMRjGwzRyL1NrTBsafrGU
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 25 Aug 2022 07:12:59 +0000
Date: Thu, 25 Aug 2022 07:12:57 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Fiona Ebner <f.ebner@proxmox.com>
Cc: "dmitry.fleytman@gmail.com" <dmitry.fleytman@gmail.com>, 
 "jasowang@redhat.com" <jasowang@redhat.com>
Message-ID: <923204157.2056746.1661411577676@mail.yahoo.com>
In-Reply-To: <20220824110845.353435-1-f.ebner@proxmox.com>
References: <20220824110845.353435-1-f.ebner@proxmox.com>
Subject: Re: [RFC] hw/net/vmxnet3: allow VMXNET3_MAX_MTU itself as a value
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.20560 YMailNorrin
Received-SPF: neutral client-ip=106.10.241.37;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic307-20.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: P J P <pj.pandit@yahoo.co.in>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 24 August, 2022, 04:46:21 pm IST, Fiona Ebner <f.ebner@proxmo=
x.com> wrote:
>Reported by one of our users running into the failing assert():
>https://forum.proxmox.com/threads/114011/#post-492916
>
>- assert(VMXNET3_MIN_MTU <=3D s->mtu && s->mtu < VMXNET3_MAX_MTU);
>+ assert(VMXNET3_MIN_MTU <=3D s->mtu && s->mtu <=3D VMXNET3_MAX_MTU);
> VMW_CFPRN("MTU is %u", s->mtu);
>

* I wonder if setting s->mtu =3D=3D buffer_upper_limit may lead to an out-o=
f-bounds access issue?

* IIUC, VMXNET3_MAX_MTU OR s->mtu does not seem to be used to allocate and/=
or access packet buffer(s)
=C2=A0 so above check might work, but still it does not seem clean, ie. it =
may lead to some confusion.

* Nonetheless, Jason has acked it, so that's good.

Thank you.
---
=C2=A0 -P J P
http://feedmug.com

