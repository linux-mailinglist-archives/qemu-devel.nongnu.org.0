Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEE03AB0DB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 12:04:37 +0200 (CEST)
Received: from localhost ([::1]:51376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltot2-00047D-JG
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 06:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1ltoTn-0000z8-Jd
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:38:31 -0400
Received: from sonic307-20.consmr.mail.sg3.yahoo.com ([106.10.241.37]:38746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pjp@fedoraproject.org>)
 id 1ltoTl-0002Vf-5V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1623922703; bh=pPgV1OkwIhl7RSZca3i+66gMHoc6NpY+YNuXwh/g9Xo=;
 h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To;
 b=D6UGoZun5KtTx9NO7v3AORQu4x33LalGGs4Gbla0OEB6nM8kactLkRuTjHmtyJCB2s+A0Qre4Uwujzu6Ktn8BwI4ZdmLCSQKj7gEFuzHMDuGNL7Vzs0tBs7DweMcPR+8xQeREOpVvnb+WkrgPC9Ko3/fam6eBPH7WXswSbsyp+smrTzws6uVg1E+XjmxlyV8L8cqILTaBjtnmqDzJFAapL1P4ol5HqTyJ6R01GGgMaThE3V0McmwvNmrRqs6FOJzn9TysnOWfUQrm8fXET2DgzdBLUMeUcNKtbcqqdre2voR1E9a/l2ZBfNkc3yyHm+vlAfcxxySxt3FgaRBEhnszQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1623922703; bh=AVvtf+6kt0arFFzPPDY3e7yYrN50N4m3kWj8Vi+jdNn=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=crf6BxKhPTwTuOlan8E12jSj79HSKq4SJVFjQaGtSDIz2KUXxkTPtR8OLhlHYzYJwaeZAD3PL1Rgeq8seqhVcXa8dm68sRJo5ZCxOW2k1FeXlmDSQS26b0cvinU9WD/2jJOk+4dNRUf7KaSHzvFmphVqnLA1GK51TrGu6K/I92nG1EvytqKMQ1M4Ir4FaK5bwLrxdhcDK8R3R1GkGlrTCdLiY16LiEmMR7+gFj3TTOjYi4Bsa93A50Lkq8uUvv/v0RDVWRxLAZuz2R7Rk0IhwQXTM75NqRvGViskytp+IEHWiK4bMKQjq4BEIe3gaY1ei/dNq00bqAVgCrJj2/2FHA==
X-YMail-OSG: okukdI4VM1k_T2105leoz0_FeT0qLlj79q0aWKIKMJ0hpQQ2E7yMx.IrAIZK7rg
 _uctpVWC4ORIZjljlVN0I_h2YScpw6T_xz.k03tstMVTzDG0j2C2BQzRhCafy2eFMAahHGHJp8Vg
 a9doKmvmPOV4tDFeleHjeidkPeyBAtFnl37RkMd4gPiaezTfB4eMCQwWmYKD1fCoU_dWg2KmIK7x
 6YIhjJOgRquOJNGtPD7QzPyrCQviOTvLSTFhdeAvEZBzZhO7D5MFhOkfeIncQTV8G_gJpr5UzNfi
 Yda14EBhVQNTtxNkb2VpDHru4e0rC7BWW3U8FrnHKVqQZbmUY8Ha0hvj285DcwFfp2jVS4P.IA_1
 McvNc8jFBRHx3w70zE0njOShVFEmplSKQdWyiHXaqs.W0tlYrDRPKcNQRaw.u3xAI4uD24.tmJrg
 OE5LQYjb3vqvIx4cI2bGQAUX36Xrntd06ZrSY9RDwTl7TtX6gJfzMN3nviTdjYpX0z9sCoiFIyYl
 jPcrELeZ3S9bg.Iqdvgs8UsfqRAU17WVvEs26uU9NiBSbh3eHh0i2i5o8EJgVirhk5pEsvqWSJGi
 0CYwVK8Vp4UR6X_rBGhgIbSpuUDhN5De3ieKWsvV1OGkkSgvVSdShGHA0hisbvRoNiBoMIfkev8Z
 WJpphszEmH_2TEWZJBF2HE8yGy3KeBxQM4WqNfNwGmAZUR8ZQEkY6jTxqvlc5wGWI1BJ17rfpCUC
 FW90gc_kal8ZMCYgA4gHwSjBnsQTlnzFKgG2ymmU0HEDZLhCQUa3jQ7QZiHBEGAGY.xag1pG8B78
 T_VUc8BuwwLLjwCtERJtdiKFb5VpYoM__TksIGmluRWPY1rzVrgFhF7qAXD2rT0eMfP.lBC4LJck
 tNhQFX4wZhM_AEDKhYeJ78_ayy3caQePTiNLViJa1mXqwcTjnS7_M6AWKnRJ7LmPHXh5YBbqVxw8
 Nfb2aFt958mjaUvciJVf7vBvdQtUTCBkwVlk7Wy2tCLvw9470o3eUs1VXCPck.loR8LgdMe_1GeS
 09yOjX8YRi7T3eaUrwWoUwWq.j4EtVK8xPZEnSS7mzh7fCjNz2.gb7G.kM7mJlsDiDLyULyGJ1MM
 sY1LSF36RO9CZV8Dy8aOxOCLUUxe5UJufv0ENZonGuq.ebMapu95tLXs3Pg0osBH.gktci40hQ2D
 zYPiPZaY3HzYqlThWWoKd_FY4xbMROO0U2v_DU9C0irNyJ87h7fBA0Wl1jC9NjYcP3XIxergMCEj
 o3arB.x2.uP1H1sIewS8K3tfL.an0hp97OUqD47RDWrSoio2UZKcRz7gZaLl.TIIdJzLzY_NI69M
 4RGUbgTi2dpVPVFE9pv.fbHVUqCZbvxNgPN686vx3hg7lHfvU7OzQcFBolAtuuS9tv0vin52U7cS
 hya5EDUSScpVhMwl_rPQCw4gr8ePxK7mcek0UP_yXxA4a85OuDcjiKXT6xQMlPGTS2rmmSG4YUYv
 ukJFt_BOg.WAAe3HXwzDYgwsQUvpO89mPosTe4kCALl4FJRVpuyjsYdhcyi2eWFjZbuG3IkyXMSi
 EUuUxHzQQ1e4VwPg_w.CpxH__JwVqzt27u3o3GlV9n68OguvIIuXhY.okYi8q91RO3xoBiGK5gC8
 NnfPVuWEEAcrQ5zle0fpG7WIaAr2dJG1rc3yweQJRgfB2UbtkqqiFJcneLmtk2a60PNnx78IlqeP
 VwCbddMEUv8KVVEG6.PmoQnJRZm2x8K1h3ojVklM41K2nRDpitI4ZI0rtZGCCKWHj61NIEyEGwVl
 cl7omLjbsh6dJLMf6AWIhp8JM9epmjqbNN0bZfJrCaRelb53TdDoWoFHCxzaZ6HzwgUd9UFkI6JH
 s_4UyMRJbKtIl_6uyuDY0CCqpGWQUNXFXizCHnFjIhxfIosnjLoK7y78FP09a2a5dYYDj1wJsOZ9
 PE9drla8vH32s4r.rW3.ohFqthrkMnlI_K8rQ4cMK_bLOoAoIFrKyLxQekhXe5O_081eLk8.8yLq
 k5yKXR69tou27CQqBYHAc7FVl7L8wgZh4xf7VsZF8b9Ldad_ilR1fgw_K54o5m42.nPuM1H9HqJN
 C5U4QlCtJXE0wnuzbuMMYGPBwtQ6Oc6nwTYcMI8rGKBFlk8I5WwPcr1BknRK7qPNsYS_msR5qsB.
 8xRsgCaFS7Bfz9pwa38_uHt63FmeBS5CHQFfLgm99hiwUwQde8jaTfKXGk8j6e9YTbsdmXHvQxxB
 cKGPjlqCTal_Ggf3RD2bzhY8fUdfiV0RhCGa9IPVYsyVKkks6pMmt5qIojIl.IsI9nJtJlZLL9K8
 4w4Czwz_lMhvRF1_qrT1mvDhAyTPZhnOkpzyLUIF4vYUPmQJlPoEO62eozz5HfRWYJnZqdtt3mBO
 BcF9VFnYGGamK6Y33l3Pp56ArChor5bHlTMBkAYfH1n3efrpoBSuvdAisUiAGbOH3_T966GV7iDr
 TWUUJo31xFPE2eKQ8VOKRFjRtFzXMmTDiW5YAFmL.0i_UByhzm4w1gei6aFzaj_6TBedpwaaAYaA
 L.qfn6b4N_yHfUeYYBGvIl3P1IRyRwflQqLcDu7wHTk9hAg_leffEDACyk5hvBusxbgB7a.0D1T8
 qMLfOQWvBJTPfO.HDpF1mEuwFUkPh_ale8SbhyvYxxd_z.M4425ZUnooIKTHFIyMXGWqtkqDrMfz
 ad.BxUjn8usU.MrMlXSlEIPEepFaHcpJ8swwWbaDKG_JAlfOJ3fGl84yuaKS3ljKlVBNTt3wyUHi
 fbFuKg.596X7iodY5U_HeoH7TEMjdAak694GKmz_fnfN5OZh2PPOfYAlbXySKxQ7RyEzDRhz9BKr
 nSQY_yQsUrGNP4_LoNSzwfNO03Lnnj6mJSlY-
X-Sonic-MF: <pjp@fedoraproject.org>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.sg3.yahoo.com with HTTP; Thu, 17 Jun 2021 09:38:23 +0000
Date: Thu, 17 Jun 2021 09:38:22 +0000 (UTC)
From: P J P <pjp@fedoraproject.org>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <1417967078.884998.1623922702917@mail.yahoo.com>
In-Reply-To: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
References: <20210616110600.20889-1-marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH] hw/rdma: Fix possible mremap overflow in the pvrdma
 device (CVE-2021-3582)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.18469 YMailNorrin
Received-SPF: neutral client-ip=106.10.241.37;
 envelope-from=pjp@fedoraproject.org;
 helo=sonic307-20.consmr.mail.sg3.yahoo.com
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
Cc: "vv474172261@gmail.com" <vv474172261@gmail.com>,
 "mcascell@redhat.com" <mcascell@redhat.com>,
 "yuval.shaia.ml@gmail.com" <yuval.shaia.ml@gmail.com>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 16 June, 2021, 04:36:09 pm IST, Marcel Apfelbaum <marcel.apfe=
lbaum@gmail.com> wrote:
>From: Marcel Apfelbaum <marcel@redhat.com>
>diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
>index f59879e257..dadab4966b 100644
>--- a/hw/rdma/vmw/pvrdma_cmd.c
>+++ b/hw/rdma/vmw/pvrdma_cmd.c
>@@ -38,6 +38,12 @@ static void *pvrdma_map_to_pdir(PCIDevice *pdev, uint64=
_t pdir_dma,
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>=C2=A0 =C2=A0 }
>
>+=C2=A0 =C2=A0 length =3D ROUND_UP(length, TARGET_PAGE_SIZE);
>+=C2=A0 =C2=A0 if (nchunks * TARGET_PAGE_SIZE !=3D length) {
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report("Invalid nchunks/length (%u=
, %lu)", nchunks, length);
>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;
>+=C2=A0 =C2=A0 }
>+
>=C2=A0 =C2=A0 dir =3D rdma_pci_dma_map(pdev, pdir_dma, TARGET_PAGE_SIZE);
>=C2=A0 =C2=A0 if (!dir) {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report("Failed to map to page direc=
tory");
>

Looks okay.
Reviewed-by: Prasad J Pandit <pjp@fedoraproject.org>


Thank you.
---
=C2=A0 -P J P
http://feedmug.com

