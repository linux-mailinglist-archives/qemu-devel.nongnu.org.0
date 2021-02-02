Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C767F30B7C6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 07:23:30 +0100 (CET)
Received: from localhost ([::1]:56846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6p5z-00028f-IH
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 01:23:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1l6p53-0001jP-Bv
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 01:22:29 -0500
Received: from sonic309-21.consmr.mail.sg3.yahoo.com ([106.10.244.84]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1l6p51-00082l-8B
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 01:22:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612246941; bh=4N7AlC5pczwVOPWxuv+EDuxjBJ1WJYk2Q/kXpm1jUyA=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=Uw7q5S3JSy/mmaEXrYUSbCa9l+UUJD+gjAfl9pTGr/5FiItA6Ey7lMQ0xIJ0uWwJAEd62Khnr0eqQa+biomIamXtulxflBmrFjqGhZSncCkhFMhJc3lK2CbPeaMFkJEmXZkGgz7PnVJ/RxvVWrYeTzxwX80rlyWJCcA46RT5eu87v6dJLJ01cHJOpn1DYVbloG+U6WdhbqgM1XsQPnYIpLiGBhI+z2y4mWCLcuTyiOxdYwnNzqhEsjhoPcpaqda+9GvUcQO8rP5dhRmPoGAVAk4BpT/6oiMnap4ZMinNHMKZEwv5G5j/ufxT5QN/6kmc9Xv86/JeyoHS9dixEFjSOw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1612246941; bh=tT+71lRFpFlI6XdZ/CDeOQ86m0Z3arqyqtwaqCWbHfe=;
 h=Date:From:To:Subject:From:Subject:Reply-To;
 b=KxKfS9llmqx7QNJdYQ2df3hchhcJCmzWmz6T/uU5XKzzSxBhycvvoYvYih8DTnB8oNgp8c8t1dOgEgsH5tYn6NKi5CV/78bt8kvJaBd5nUXy/W5tXUIFEjgivUwIJm84aDSlvf+nln9A42B0HmB8NrgjvYiKdFnlq0SCJfo32tg/zNEAOmAYf4r2h1+Rl/V/2QAo3ivn0QO+7sLbx185CdrY2cx+0ZviJP56tUgyDV/Nv2RyMeiRIYXtK0+zoz2Eeiq7F3jQ7w+8QP2xvZBE38zmszIbK6lbUXi9t/2s8eYAEdUTvqWjiULDOMz10R/BHJDIjr2fSBDT2zpYv++Zjg==
X-YMail-OSG: k9cn6BoVM1l4IPmTVmHVxXN7qQ4ifvvjr_GvT5ttMKG6CAD41oADtaJolkm2dZP
 qNhXfvjfWLybGlfbF6CsCavvEb7y8v3MfmmG5ECELxJ0OP1XzyTys_fG3aUSaEme3rwGoIOm_SvH
 renEJ5wdyAKnTA7xW_uBy1Up4lf85jRmaOwkpUrd7X4VnmQizCivn8dD_Efj0vZLVHGT4DTbJkb_
 1sMf8Y2wOGRdN9cVhKgVorbLXwVhkFZWpkl6PugjZsTt5Uo4JLktSDDIdjHe0KsWs44CS5sh.UVm
 mFEHO53Im1.qd_TG.zXeSvpCTRa.CETfJVFzRtOf7ZXSA2TQfr.4ScefKaLu6SN2gGs99UnlwDmq
 ZI_2n.1HRcAs0b_lCpVW98EZXkhdlTwZiapctMkD1VaoUCqtwOA2BgMoN1iQmf7rATg8Dk2ZiiyG
 vfFuVETQTTLsSv5H4bjcNQlSMhf97JPJgDce.2JAcdIwDos0BdIuO5Qcq_fal6fOGZR3F5nm5XFL
 wrlcbleiMczUZ3xfM7QhsaO25PRTIZaTReTFdfLijay64sguS2OaCKlVDbTN6A8uTqcUggGV28Qb
 oXinVUxuq2kg7_a3wtNtxiq7cgm7kLnqrvZUjGL.3qlZCJR3tT8_lZsbyImryZQ_bUnyoTx_ui_f
 K0Ab4IFZVb.mRGA8PUu.u6zi21dO9l3FHGZdny5VdPA98zRNQGA3cenqaO4_yxkCGjJOPv3naBGR
 nRmwn9DkH5snTrOKQSwLyU6HNq7po6EE_HqrS6OLN2gS9ZJcq.IdzCoIB9boGK2kaEDN2fpaxkUG
 KbVMpLMQXT7S.gc6NEKrLLFCUNhWqSglo4QeYklTOb6rz.cwS0t6WTe5Xc5AH69K3d8.QAaeZ8Xk
 B8Q6QxpqaXrqKRXJMh7rJv4cDZOGrC5szIkWSZmzySB0wikvpF2R7NPJQCqh2XvA3JV7u7pfYSj8
 cB962oj8bISP9iFIV_wy1cspMTwT834HFbt1XdimvyHxzuxZUaZz404Nr5Dpdy1W3QE02emJ.iZ5
 iq2mG4wgPM7VeO3doAuVnYYS8kTeafNjSdi_VUoexwF8tmsVHj.hg4FquOWFwRJ1kjMXLOKKMtj4
 kkKXYX9hkQvS52IPbtbQCuCbd.jUsK9dHLQJR16dExVTfrvFfGhC3Sj81cA8voWdDwUOc0Lel4s8
 .E9X7DgPadiq.vYmnU.okVjDNzTxNTMUYf5Abpahz9GKog4EeG4kv7iP71awde5PWCUv9OqF3.Hu
 q0sHQqzmPQD3Pnw9EYtPNt90Vxds4H3YyFQFEUem24TSLz..U_z7SXnSqBtqvgnVC.iZ4hhziTle
 fOTW2lx6PDkT87xAO2gEhKutl1.WNWLRzX3ELtmSq8T4gfp7b0R1.Ru2M6bMaVGo2IEPTEu4HCNV
 3tMBY9cT.eGSuWaFOYi.pBzqP5YsVtNp2Re3yi8.mwiW8e1EBOzrR4IZWjqGgqMwz3CSfeS3QRQ8
 n3MDcRlkQO9GjcxFMkOOVsdXR9PUfRMVhjb3iurN8T7exXf9HsZKqhK9jhzOytjZtmmhg51bnTT5
 S3EYT9gUwtCrPw0cOzvjt7tGsIFIA71sZq2_JcQaDuiTZcNo6bbZmbQasYZX0zfhpIUldrr3B0cS
 HsFarpV0DzitK8yPaN4RTqXYOluoYdLZZKuK95DhUIDMQxQ0hQPXpCpPTXrCaZtN3EPdtryMER.S
 8XgBqjVq24mNmQfppi_Kzb4tItbrdw_S7iBQjgY66sng4e9x0D6uQWHpVdRW_CCLiN_drFGhN.QC
 ZCS.Kfscu54LA.rF_bUfliJbrtg4rl21AS0xvTZzHmtqciAzytJ0rnOgxpUsjYGK_DGqZtE3iHar
 dc3UMNyBpc4UPVPM0zWQK7gBID4UHqfUUXTO5vTOy6SZr2mBr3aYWWNXLowCOPHN2ZDHHj8hXFFn
 0SHS1rxz02c8mulgEagIUuOQR4QYAXN1MCpzELX2CQ1h0vNRvMLOlsMKF0q1ko7k8DwoI2lQ4p91
 TJyPgjUWt23Emq_BANAI.AorGY442G6oKIhfIraksP5tV8lvOjImELHFKs576qL9P8jVAQZaPE3t
 _eg3XQJZkYzl3t2qTKuz6eGJZNSoQ6fRfD34P2wKapNFf8LMGhkCwlLrLp1xOHA71We5SR.DbBrI
 Id8jceMi7.26GEyY545erEaOmFi3rApbZSP2E47eTSZB4uXqTWTe0ASbQaltAkCYX5sF7wqSzWJo
 wk6ZKDtKO_ZgE615.K2n9yxAqiT5z5Tr96SxPrqOwPGxTODBZrjcr759mrOsz1J7TVwYQJyQa.1s
 HKLcDYYJzzAqHYTG3aqs0if_.9n9j2NTHSZc8P3IKR1.d.kfPycqcy0kmCGDkecmSOWWFT1IRpJA
 0E_ZiIDpLBqpqV8Nln5xocsd5PQHiCOvwOByMuVtI.le3NPwe2Nmpqrw2o6EOFw2m.6z9zi5BkAw
 tA35x5xK91kZeN1cKTXTqDynhKopGTjwEbQl.U72D6kAkGx59vIbet2nqEiBlB71uE0PrjxgmrFL
 z.JibbshI_wnaa7dyZU9Ea_6Z_vIjBmkp1NGPFYRdbBKH6570o5PDp1svwdbWGKEmIGW71Af3LF1
 VQF4A7YKFVmfmBtQbwIFqqNIaW9SVsBH61VN3DmOvyA49lnUutPXoG0SmNAzwLBKH5urquAsFA0.
 QW_6oIOLmZfsRxzrXw.zQkzOfeDeobIF0RfW6lnbUW7MHqWLKWHm_1x4ve3Oeop8LvSShMg9C7rO
 WSwHsZIppSo44X7NuKs7KgXJ.1bo9EcLi4KdL.wIe4r.2jHgyZIR1p7ZdW7S9M6im7AEh9BCGOfX
 m8HxDlYtrk9pNxfqXt57yLNAdRhjZc552mPNMsFk5G9poi5ix.i_38a6q.5hrcjmK6fisHVND.Ny
 wzWTcszKgr7yi_FFBXLFVyU8kxl0Z8aU5j7WwJ5_QNcPbS5RE9BwaloFjq3LFhV2iVKSVdY90USj
 fgZgHqr890rMlw9BDgHIkOwcTRfqx.1gfc0cPkl2uI9coBGaZ1LKErcqqI5sfZ3bsZPx_bxnvWCl
 8n7YD.WqNyk0lDaujZ3swHqzmxRE8s9etSxehT8kwiPa1b_QH03nOVAsG6FYk3FoOcin9NEfmn0s
 RhpTCX8YB.xJL1hTJ3g--
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.sg3.yahoo.com with HTTP; Tue, 2 Feb 2021 06:22:21 +0000
Date: Tue, 2 Feb 2021 06:21:57 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: P J P <ppandit@redhat.com>, QEMU Security <qemu-security@nongnu.org>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Message-ID: <787280826.1146023.1612246917145@mail.yahoo.com>
In-Reply-To: <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
 <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
Subject: Re: [QEMU-SECURITY] [PATCH] hw/intc/arm_gic: Fix interrupt ID in
 GICD_SGIR register
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.17648 YMailNorrin Mozilla/5.0 (X11;
 Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko)
 Chrome/87.0.4280.88 Safari/537.36
Received-SPF: neutral client-ip=106.10.244.84;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic309-21.consmr.mail.sg3.yahoo.com
X-Spam_score_int: 10
X-Spam_score: 1.0
X-Spam_bar: +
X-Spam_report: (1.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FREEMAIL_FORGED_REPLYTO=2.095, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
 Peter Maydell <peter.maydell@linaro.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>, Li Qiang <liq3ea@gmail.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alexander Bulekov <alxndr@bu.edu>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sunday, 31 January, 2021, 08:48:26 pm IST, Philippe Mathieu-Daud=C3=A9 <=
f4bug@amsat.org> wrote:=C2=A0
>Forwarding to qemu-security@ to see if this issue is worth a CVE.
>
> | On 1/31/21 11:34 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> | > Per the ARM Generic Interrupt Controller Architecture specification
> | > (document "ARM IHI 0048B.b (ID072613)"), the SGIINTID field is 4 bit,
> | > not 10:
> | >=C2=A0
> | >=C2=A0 =C2=A0 - Table 4-21 GICD_SGIR bit assignments
> | >=C2=A0
> | >=C2=A0 =C2=A0 The Interrupt ID of the SGI to forward to the specified =
CPU
> | >=C2=A0 =C2=A0 interfaces. The value of this field is the Interrupt ID,=
 in
> | >=C2=A0 =C2=A0 the range 0-15, for example a value of 0b0011 specifies
> | >=C2=A0 =C2=A0 Interrupt ID 3.
> | >=C2=A0
> | > diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> | > index af41e2fb448..75316329516 100644
> | > --- a/hw/intc/arm_gic.c
> | > +++ b/hw/intc/arm_gic.c
> | > @@ -1476,7 +1476,7 @@ static void gic_dist_writel(void *opaque, hwadd=
r offset,
> | >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int target_cpu;
> | >=C2=A0=C2=A0
> | >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu =3D gic_get_current_cpu(s);
> | > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D value & 0x3ff;
> | > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D value & 0xf;
> | >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch ((value >> 24) & 3) {
> | >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 0:
> | >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mask =3D (value >> 16=
) & ALL_CPU_MASK;
> | >=C2=A0
> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917

* Does above patch address both these bugs? For BZ#1913917 'irq' is derived=
 from 'offset' it seems.

=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Interrupt Configuration.=C2=A0 */=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
=C2=A0 =C2=A0 =C2=A0 =C2=A0 irq =3D (offset - 0xc00) * 4;


> | > Correct the irq mask to fix an undefined behavior (which eventually
> | > lead to a heap-buffer-overflow, see [Buglink]):
> | >=C2=A0
> | >=C2=A0 =C2=A0 $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch=
64 -M virt,accel=3Dqtest -qtest stdio
> | >=C2=A0 =C2=A0 [I 1612088147.116987] OPENED
> | >=C2=A0 [R +0.278293] writel 0x8000f00 0xff4affb0
> | >=C2=A0 ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of b=
ounds for type 'uint8_t [16][8]'
> | >=C2=A0 SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/i=
ntc/arm_gic.c:1498:13
> | >=C2=A0
> | > Cc: qemu-stable@nongnu.org
> | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
> |
> | > ---
> | > Isnt it worth a CVE to help distributions track backports?
> | > ---

Thank you for reporting this issue. Will process further.


Thank you.
---
=C2=A0 -P J P
http://feedmug.com

