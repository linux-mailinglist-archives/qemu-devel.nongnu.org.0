Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0983A32EB
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 20:19:19 +0200 (CEST)
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrPGw-0008MT-5O
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 14:19:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lrPCp-0007NY-T4; Thu, 10 Jun 2021 14:15:03 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:52305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1lrPCn-0006e4-K4; Thu, 10 Jun 2021 14:15:03 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A85BD5C00B2;
 Thu, 10 Jun 2021 14:14:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 10 Jun 2021 14:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=6RWT18uxe0+cnUVKiIGTUT+aXIW
 pIAqIwJzscwgI5fk=; b=jLAPlSXB/S7qiemwLn/hTjVyaW7qdSgSNuEZk6mfxdP
 cqW783Vfum1x23+8V4kF/9EZYl1Vwr8XxdNi1P26Jdjv6LDSxhPDB3iydNeJRRH1
 SEeZDXPh4I62LNc0QgreRINZrGbID46tdhrK1PGC8mEH0BOg0FcHfdTOPHMq5v1Z
 N9OybJOH8t5Ks+xGmvgn1Pen9BX25LYZcvKSEatvHceMHPnM0cvJV9viAh4LRANn
 uhFebB+mmUsO+NEfiAAmaZm6OdZ1mRQdiL0NEXjGi/lVU6KchnSjNVBJP/v7DiaA
 jha9GSBM6Ri5ImLoqrbQGMiSSGoDeFBB+Z71ncj1GNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=6RWT18
 uxe0+cnUVKiIGTUT+aXIWpIAqIwJzscwgI5fk=; b=XZRWxSip8kY+707Cl3LVc+
 VZf+5AnL2flx/FUsqh/iZe8uvYI/tDj46gP7u8vghjwESWpEolc4+F7Wb8QDGfs1
 ZiSHKxVtHLOpn+pzUpKeE99zvvXMo9dZLcyVLQ0fho6UEG0sZYrfCAHkGGYVd0f1
 f58ltXMgnJXUZTsFzGlMFouJoRVDg+5kAGJseqfhpAWdqTaQBClvegx+Oj1dHjV5
 rc2CPo7GavefqC56pg/4I8dG0uK4Y91ZB/ugSQgbnjHGcHyppoMETmckW47Ljv52
 8CWTlZAbHEgMo5pqrCItvDgv8LUDieffj9g3beSkHmxLtg9kmpx338nJqzUPo1rA
 ==
X-ME-Sender: <xms:olbCYHeHxVdh2xCNGz8wgxLVu2jYUg7FvbDFk5wXJdEW9vK5ThpxFw>
 <xme:olbCYNOzeTJmoIGocsoiyTzgbbpBiDfg7z2rFHH2nfs8rZRnI-mHqW6XMd670Za78
 ccpicz5h8PmW15gXRM>
X-ME-Received: <xmr:olbCYAh7RY326tfrbVCYZvAdJKO96sjkw3EpyULyIRKBKlrpQbdJzlQhyWWx0x9YBeyzJMnGRlRNQlXMUirl3xFbCEppeO1L_WYZULgTTcQe1nSGng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedufedguddvudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjeegudffueeiteekieelkedvueelteevjeduieeludfffeejgeffhfduvddu
 ffeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:olbCYI_-YTOQJVRIvmg0obkYDlRyUrMtzTPxcDDDVzH30SJX9JZcnA>
 <xmx:olbCYDuhhdVpOF9512Y06QBkqubf0QJrUfjBAPSwJG2nz4dH2tn7oA>
 <xmx:olbCYHFEC0ZLDhJoWko5Sgx0TOOkjvXZZumiO7W1cCjW_YH43QnXyA>
 <xmx:o1bCYNJ7BQCCdMqFZdCufAcUVSpHAMJIawI6I-gdpBFZda3PGCSngQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 10 Jun 2021 14:14:57 -0400 (EDT)
Date: Thu, 10 Jun 2021 20:14:55 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jakub =?utf-8?B?SmVybcOhxZk=?= <jakub.jermar@kernkonzept.com>
Subject: Re: [PATCH] hw/nvme: be more careful when deasserting IRQs
Message-ID: <YMJWn27U+Gubgdl3@apples.localdomain>
References: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rML5CM3u+evBLthL"
Content-Disposition: inline
In-Reply-To: <20210610114624.304681-1-jakub.jermar@kernkonzept.com>
Received-SPF: pass client-ip=66.111.4.27; envelope-from=its@irrelevant.dk;
 helo=out3-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: its@irrelevant.dk, kbusch@kernel.org, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--rML5CM3u+evBLthL
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun 10 13:46, Jakub Jerm=C3=A1=C5=99 wrote:
>An IRQ vector used by a completion queue cannot be deasserted without
>first checking if the same vector does not need to stay asserted for
>some other completion queue.
>
>Signed-off-by: Jakub Jermar <jakub.jermar@kernkonzept.com>
>---
> hw/nvme/ctrl.c | 21 +++++++++++++++++++--
> 1 file changed, 19 insertions(+), 2 deletions(-)
>
>diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
>index 0bcaf7192f..c0980929eb 100644
>--- a/hw/nvme/ctrl.c
>+++ b/hw/nvme/ctrl.c
>@@ -473,6 +473,21 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQueue=
 *cq)
>     }
> }
>
>+/*
>+ * Check if the vector used by the cq can be deasserted, i.e. it needn't =
be
>+ * asserted for some other cq.
>+ */
>+static bool nvme_irq_can_deassert(NvmeCtrl *n, NvmeCQueue *cq)
>+{
>+    for (unsigned qid =3D 0; qid < n->params.max_ioqpairs + 1; qid++) {
>+        NvmeCQueue *q =3D n->cq[qid];
>+
>+        if (q && q->vector =3D=3D cq->vector && q->head !=3D q->tail)
>+            return false;  /* some queue needs this to stay asserted */
>+    }
>+    return true;
>+}
>+
> static void nvme_req_clear(NvmeRequest *req)
> {
>     req->ns =3D NULL;
>@@ -4089,7 +4104,9 @@ static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest=
 *req)
>         trace_pci_nvme_err_invalid_del_cq_notempty(qid);
>         return NVME_INVALID_QUEUE_DEL;
>     }
>-    nvme_irq_deassert(n, cq);
>+    if (nvme_irq_can_deassert(n, cq)) {
>+        nvme_irq_deassert(n, cq);
>+    }
>     trace_pci_nvme_del_cq(qid);
>     nvme_free_cq(cq, n);
>     return NVME_SUCCESS;
>@@ -5757,7 +5774,7 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr addr=
, int val)
>             timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + =
500);
>         }
>
>-        if (cq->tail =3D=3D cq->head) {
>+        if (nvme_irq_can_deassert(n, cq)) {
>             nvme_irq_deassert(n, cq);
>         }
>     } else {
>--=20
>2.31.1
>

This is actually an artifact of commit ca247d35098d3 ("hw/block/nvme:=20
fix pin-based interrupt behavior") that I did a year ago. Prior to that=20
fix, the completion queue id was used to index the internal IS register=20
(irq_status), which, while wrong spec-wise, had the effect of...=20
actually working.

Anyway, I agree that the logic is flawed right now, since we should only=20
deassert when all outstanding cqe's have been acknowledged by the host.

nvme_irq_can_deassert should be guarded with a check on msix_enabled(),=20
but in any case I am not happy about looping over all completion queues=20
on each cq doorbell write. I think this can be ref counted? I.e.=20
decrement when cq->tail =3D=3D cq->head on the cq doorbell write and=20
increment only when going from empty to non-empty in nvme_post_cqes().

--rML5CM3u+evBLthL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmDCVp0ACgkQTeGvMW1P
DelZHggAgTLylhxbxoCOOOrdErmFRdsA+NpTWe7QHvVz2Mooz2Pc9w5A4lfNIwj1
60xBU4eooSlJhxaLgWOM2ncD6eik+/PgRfjwaGZLTa7vipYbvGTyjyC+2fmW737x
K2tcEnS0ClbsFAYbLZXefNEQFMDsOjQwGubmLL//BRjTauAulOC/viKqnhtNWUrI
8hZtqKwutK50XQq//Zd9rS4NN0B8izFOBItl2KW4jMvwKmn8d2DeaKVY4+Wnikwh
CTnXZBKnqjn7ckeIXgGQ8aQmVdCH4xLd/9N9wL4BQJNadZTisy/3lIfS/Ng2m5VA
eAxX7FaIkGjWy/sCqqBxyaslRbRQkw==
=teNp
-----END PGP SIGNATURE-----

--rML5CM3u+evBLthL--

