Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877DA5A22CB
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 10:19:27 +0200 (CEST)
Received: from localhost ([::1]:37546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRUYj-0000un-Kt
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 04:19:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fanjinhao21s@ict.ac.cn>)
 id 1oRUVb-0007KC-Uv
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:16:07 -0400
Received: from smtp21.cstnet.cn ([159.226.251.21]:54750 helo=cstnet.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fanjinhao21s@ict.ac.cn>) id 1oRUVX-0007j3-3N
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 04:16:07 -0400
Received: from smtpclient.apple (unknown [159.226.43.20])
 by APP-01 (Coremail) with SMTP id qwCowAAHhmAmgQhj+tFXAA--.12337S2;
 Fri, 26 Aug 2022 16:15:35 +0800 (CST)
Content-Type: multipart/mixed;
 boundary=Apple-Mail-95B6ABBB-F647-466B-BF65-C26910FAA9AA
Content-Transfer-Encoding: 7bit
From: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] hw/nvme: Add iothread support
Date: Fri, 26 Aug 2022 16:15:32 +0800
Message-Id: <912375DB-4A24-4032-9607-006521FBA1E3@ict.ac.cn>
References: <YwhyG3JktHitinMW@apples>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
In-Reply-To: <YwhyG3JktHitinMW@apples>
To: Klaus Jensen <its@irrelevant.dk>
X-Mailer: iPhone Mail (19E241)
X-CM-TRANSID: qwCowAAHhmAmgQhj+tFXAA--.12337S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFWfCw1rKw47Ary3Cw4xtFb_yoW8GFW7pF
 y3Jaya9FWxAwnxCw13tanrXF1rJws5XF4UZa43tr1fGwn8C345tFy8Kr1rury5urs3GrWj
 qr4jyry5WFWqyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_KF4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
 C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487M2AExVA0xI80
 1c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7V
 C2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAI
 w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
 4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
 rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
 CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
 6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jOb18UUUUU=
X-Originating-IP: [159.226.43.20]
X-CM-SenderInfo: xidqyxpqkd0j0rv6xunwoduhdfq/
Received-SPF: pass client-ip=159.226.251.21;
 envelope-from=fanjinhao21s@ict.ac.cn; helo=cstnet.cn
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail-95B6ABBB-F647-466B-BF65-C26910FAA9AA
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sure. I=E2=80=99ve already reworked this iothread patch upon the new irqfd p=
atch. I think I can post a v2 patch today. Do you mean I include irqfd v3 in=
 the new iothread patch series?

=E5=8F=91=E8=87=AA=E6=88=91=E7=9A=84iPhone

> =E5=9C=A8 2022=E5=B9=B48=E6=9C=8826=E6=97=A5=EF=BC=8C15:12=EF=BC=8CKlaus J=
ensen <its@irrelevant.dk> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> =EF=BB=BFOn Jul 20 17:00, Jinhao Fan wrote:
>> Add an option "iothread=3Dx" to do emulation in a seperate iothread.
>> This improves the performance because QEMU's main loop is responsible
>> for a lot of other work while iothread is dedicated to NVMe emulation.
>> Moreover, emulating in iothread brings the potential of polling on
>> SQ/CQ doorbells, which I will bring up in a following patch.
>>=20
>> Iothread can be enabled by:
>> -object iothread,id=3Dnvme0 \
>> -device nvme,iothread=3Dnvme0 \
>>=20
>> Performance comparisons (KIOPS):
>>=20
>> QD         1   4  16  64
>> QEMU      41 136 242 338
>> iothread  53 155 245 309
>>=20
>> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
>> ---
>> hw/nvme/ctrl.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++----
>> hw/nvme/ns.c   | 19 +++++++++---
>> hw/nvme/nvme.h |  6 +++-
>> 3 files changed, 95 insertions(+), 10 deletions(-)
>>=20
>=20
> Jinhao,
>=20
> Are you gonna respin this based on the irqfd patches? I suggest you just
> add this work on top and post a series that is irqfd+iothread. Then, if
> we find the irqfd ready for merge, we can pick that up for the next
> release cycle early and continue on iothread work.

--Apple-Mail-95B6ABBB-F647-466B-BF65-C26910FAA9AA
Content-Type: application/octet-stream;
	name=signature.asc;
	x-apple-part-url=C16EB8B9-3A97-4A05-990E-44DDDD2249B5
Content-Disposition: attachment;
	filename=signature.asc
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmMIchkACgkQTeGvMW1P
DemFzQgAq7T7IoD01Sd+UZ5eD3TkAusWJ9R5q06UGat2fUMtlsClowml+QEbzGOI
R6L/9RP5ejxyhHCP83gCl0tAvUh2grbe+7W6QxeIZ1EKS8rOrdRyM5lysVyFkotH
PRswnOCBUMGMcqy9dvStGFjglCMAZdyyxXzWZHEf7sVUadrVoP63H7jUqvfOlMKN
PVaOX7wHvmDzB4KwFEBZXTHjQGlvvTfpAmtTAqnvOfNVxC61QPesWmMC//MuOLKt
k6oA+oDP5AMe3GpGaFZSSdsDKobBq2ZFGCJlQUBhlSWQAoCOkr8bTJpOMEx7R3Sf
42feTthla0bRaHGkfB4nwcmgXjrnSg==
=g/n7
-----END PGP SIGNATURE-----

--Apple-Mail-95B6ABBB-F647-466B-BF65-C26910FAA9AA--


