Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07630D735
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 11:18:10 +0100 (CET)
Received: from localhost ([::1]:45560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7FEf-0000Lb-GN
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 05:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1l7FBz-0006y4-3L
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:15:24 -0500
Received: from sonic309-19.consmr.mail.sg3.yahoo.com ([106.10.244.82]:41033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1l7FBq-0002E4-VP
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 05:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612347307; bh=44vX9mGz6C+c7N/FfZWxP+iYhEcTCmHO6V7suuFGDfg=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=r25a/ZU31KyYw7nS6ArwoKXv8f6imbDIDWckQjGhY8sYxmO2Q8lSoPT0ItG84cSTWdQqcmm76MZZzgwEgCvCPV0ol0lfD5+qqHl+pu4zAm31EWz7bRDnrukwZ4HDV5bRuht9oCe3XhcawgyoQVGEOKOb3/NsU9SjhYccp9i2YisBP8eaeA7ym7naMeoaZ/B5+Geo0GN+Jeri8K7XVHdtl9M182fxGzoJFsxMxeFSwQkWSgkVWy8pB0ohoQD8GkGb2W0GfOqTy3OtWOtQ3s1NyGhvT6JREI1uK3FnUW4D+d91bfFbJNvqJzxfH4nzLaWYyg/3CF65Quoxr4ZgvjIPZg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612347307; bh=GnpOSx+gJtZdgwanTnxS1atOE7Z/fG8RuSFJg8g9FX4=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=X9QxLf/slkld6pDl/Q07lkp4O/YCyT9AP3Urn/lryTIGb1ZDIdr6W0qJW/BSQclZ57KMHejZGFKH9nmBvpzTumxk5rz9MRE8YN4bxUI64cFzVpLGNqcMawVdzsjcX51L5VqpeSf4Qzppdj2/pHC4Xr0FICXqqs+iL8J3FkYQA1QHHToQDtiem9sQ0d2RgOwa9yePAs8AvvlP0CtROfSNH3zeFhjdD+XIG12o7t8bGhyDQsXFQ4SEnUhKqIXc45KbvsnNtJFeisqDlGFjTUZh8iHC/jN+aAV58QZ3Sb5f5Xx3G+LXeJq4M0OdtWyVnL6s2PZ9qPJsjFbeuKJ0+RrU4g==
X-YMail-OSG: 4UAPYz8VM1mQSpryWhXjdYFWvGKcXwVgC7PgvkXlo1AhxiyJRNM6ulA5HX5u2SE
 KhoyiK7Cq6C8GJSqCi20quI5GwqW5NONARXuwQ1FcPiS7.FeZHua.QWfOKicX86rTgLiKZmL9ZPj
 0Sz69cT.u8Tv6Gx2mqpiv.sxKdnGoxyftqwoSsao.hkbG0n7X0_VnNpBfn8_eugKO7ONFFNor9wc
 bD1Ejr4D.KMZ41sOByID6v29N6As9uoU6eRxjKrEAC1q9kTV0rUh3ItEn5yYkieEYHIDMy6vKUtB
 BbVYcJEgkycoow3JAelHfbE.lJBFayX2w5eV4OyNBwP5UqycLPjW0y6w8XBbo1uWyuqyFEiYP4IK
 Gj7o9YD3k3TVzpZTr2UP76xo0OrQmPc.HJgyvFsSx2OdD0ePsgr2AiDFggudiopjiVPRQw8OHE8V
 wHO1vot5mtkhuKQzcs5XapvQ379OegyGPMeMwPbINKLDEeFGhv0Dj7xk8Z1zqBFKhzyHPDYMFpcX
 Rd5k_xb8BhGecbbGh5MGjKoqxGy0CqAx9y5O9aZA846eJl6zo5_YtKYRgnjpb0RlCIgK6gZsCpSG
 TtLQ2FPFlPdXZfYTyu0jL0vZDPJ0fRODj38951z3c01KmDvQuzXocKz5hLuzI9EbdKGYolXVr1c0
 5.r7IwTLbkpZ2AmBq8.4EV_RP.6l2R6WOlTrVetiUyFLZu5yZQmm8rhsbgqRv55YvBlxGd_Gju2B
 aQp0nSV.v7uKfc4epZPyHApspGjCNiBIJdyLsiCgY9Rh7svNcyl.gpcG0vc2tFYuftrGhj6tfcFC
 ZWSqVeYSFzK6r_zzp3A37Gn.WWnxEhxUartf3BnCSGweqr2yTzXQMkpCw0L6ePea_fJmfde00SFM
 gITuLvCldGvX8cH_ayLLQtNad1ZQdeM5DmKK81MmN3midwhrJUciT9nNXlrN5NvqqWW4UPd2wP6q
 Uesy8_ckQSnTUPktPxDt5f35gLu4vCd4BTu4of5jQ3B3qcquuC3kofu0_6igWEwcNpWAdXgSHCNV
 SBx3FWvqkthW2fYSrdXTE0IT22ZFPtGe7Dz.h111ZhhJ5B2GZLux26P8_gTgBiZ8sMqs7cAiZ0vO
 nQaCZo2B3yad_3UztUSfUsYrHHHb8.vk1dIi9dpT0e7h_01CDJoowwnZmmBI.Q2e3MoTdFrOeARO
 a.t4h5pE7PrnjX.HNSSi51VlUpfyjAKtAxikkm1rUELk6du7WvroJK8b.7VicwTI1RndcRZNK6Rn
 01n_TwtxN_Wbi8Ffe6mzrM8CfLTvRQbtJR4DiwlA3NKYVxXGHsVSrzk9.6kTiV.aLw72gaaTNONS
 HXiaV8uuxwRemTNejfSt0IzSswI.rWgaaixmLtT6OuElUa_pVCOz7oZGypkSTwBY36VJCBLiYEZN
 6h.A9ek.8JXmk3yrTfinRgyQ2azhdYjbrCPmmGXQ9UF_oj9e1udTiZGURuc5ydVztb1wQtf0OAC6
 y.3Fon_zqqYSCCCN4vH0WNd8npXcDIjo1pWVJBu8J99qa7EzYhVLG3THRMfVWvNEevjASIEkYouK
 PA1wOp3wiN2Ex2S92oK1fewZuIi6FF__q_kX_pLeLcKWsHLzu60sCWol4dINRoOeng.wjCGrjB.O
 QB2T4w0HYHtmLHyVk3UDQaQ9vOAiVmy2yRxvNpWbfNhVfcgieULkd87mJMsDKYE4cWzXaeTZdOqB
 yK1qN7h.eEBVAIhDWi1CLxop0ZDibr8fH8rYQ8.ed3hPrfYX9VtvX_HhmzFWMQbwPKBzT77kGOln
 tpEZPlNC7v.GVaP2aJ460KeCFcVoI3RQY_iS3bif5HXKcIXJKRm.37LVOPllBVlVqPGGy1PzXnQe
 bO2uCsXeK.sFviojE6trZQijRvwiUoh.NzHRndRRHoTieo2W2zNcWb4p6XR0E.R.OjMmrx8Mi.LH
 3xYEcKTAw1of8_0JGirbfDUnkIghWeS7kZsaPBCK9_tb2ohuRxM7jrUaMDZnPvOJgN15F5W4gpQh
 suXLbbGtF8cRoTj15JbFaevYizTWKHM3sUc2Pg1.UMN5n3yFBd5ZQc7MHF95BxiRMyTygnzwD3WJ
 G8LrFmR5wW8fEuQ_G.CojAoL5u7mQ8h3MDD97Xh8pAeMZjE_4._38KqQauTWmlRXL3cRDRkv1Hpw
 BDi4np4Z2uliMqjOnBlkt.hB2D.yqNGi2uvqtzXPYjrWAm64B3_JOtKNsYvfucIjKRkXQ.yNnvxE
 xn01yvs6VP16XkW8P.IEQdHEIrc_m2FEXbghFz.0e3xVMnYpRdKDytrkIaxIS74ETBvH7OWYAHsI
 I0gVLVYAxNA_8hgK5TU6NwVZui9de3klKk1vMRxHGIWadVO_607uHDjTTV5PykMcJ5SMF1nZofSh
 vlh7InLLChTGEl9X_aOoGscIphRDfBgoW8Lmi801y9b2d5uPRhzDELJvBAIl_LhcXnUcm8PMA58Z
 UGXkZS5LpNQiAfz2XwzcTX3GTHuYyJsd7iguxqnvQff3CTFq4ixhHU.EqRwGB2IdA8Yfv8O6U3zL
 z4EXrQmgJ3rngt_ebvgzugNVjUWxKEMP1J5BVzZwfagoq2QCI3YAC41rS60UYmDJamF8U0K1uaGu
 OH4PCabBtfV1dQQKls.Xp.EUe5yS3Zw6YlKmIFebmfuftJ6TIGng6Np3iqnmQQy_esevUaoCUNWc
 YA_wtqM_dzAecAu6bdJaeQStCPKpPVoAQh8YGtbY4Zca5S4XDo7Nd79yxq0s37fS0_4sVaXGMFZ6
 gqb7aR0Bn6FO5lyjCzU9VkFi0yyQWArYBb322C9axsP7R2zbKdKHi92KjlGELgn1aC2IrwavRZqm
 kKejmglpCv4.gtphevm5lconR2DrIcN7U2fGQb3NwpmWm_V2J7xfq22CcMu2rVvQLNOpD7vRX3.Y
 jLINPXJMzU7nF5lYA1yNJr0MUjU4L4jcF2Y9M9A1jwCIj37Nz2ZYrXcB9KneqSzc_y5nKpbGUDbu
 _bjkyRGYRPsk0nv1jfZAwkxXTorYtQQmr8dJkCIpHc_cQZeudxeQY_i89sBp7gvKV0r37jI5kQkn
 EHkxJIATZ4MpuV1Dd1gciv17KMFx5zj0n7j0wWM4B7eP4RcoHfL3cvrvUfLdU
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.sg3.yahoo.com with HTTP; Wed, 3 Feb 2021 10:15:07 +0000
Date: Wed, 3 Feb 2021 10:15:06 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, 
 Peter Maydell <peter.maydell@linaro.org>
Message-ID: <1610888787.1119424.1612347306125@mail.yahoo.com>
In-Reply-To: <CAFEAcA-Q8swS84GVd20wo4Pp41UUPdDknxbCMn=pchgi96UgRQ@mail.gmail.com>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
 <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
 <787280826.1146023.1612246917145@mail.yahoo.com>
 <3bd70da2-39ec-6e6b-d46d-6052f1b8f0b0@amsat.org>
 <CAFEAcA-Q8swS84GVd20wo4Pp41UUPdDknxbCMn=pchgi96UgRQ@mail.gmail.com>
Subject: Re: [QEMU-SECURITY] [PATCH] hw/intc/arm_gic: Fix interrupt ID in
 GICD_SGIR register
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.17648 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/87.0.4280.88 Safari/537.36
Received-SPF: neutral client-ip=106.10.244.82;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic309-19.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Reply-To: P J P <pj.pandit@yahoo.co.in>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 QEMU Security <qemu-security@nongnu.org>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2 February, 2021, 08:45:19 pm IST, Peter Maydell <peter.maydell=
@linaro.org> wrote:=C2=A0
>On the CVE:
>
>Since this can affect systems using KVM, this is a security bug for
>us. However, it only affects an uncommon configuration:
>you are only vulnerable if you are using "kernel-irqchip=3Doff"
>(the default is 'on', and turning it off is an odd thing to do).
>

'CVE-2021-20221' assigned by Red Hat Inc.
=C2=A0 ->=C2=A0https://bugs.launchpad.net/qemu/+bug/1914353/comments/3

Thank you.
---
=C2=A0 -P J P
http://feedmug.com

