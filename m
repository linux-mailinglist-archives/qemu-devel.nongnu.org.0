Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333B56755C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 19:14:09 +0200 (CEST)
Received: from localhost ([::1]:58528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8m7k-0004OQ-7K
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 13:14:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o8m5V-00031p-6J
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:11:49 -0400
Received: from wout2-smtp.messagingengine.com ([64.147.123.25]:58871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>) id 1o8m5T-0007Bo-5I
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 13:11:48 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9EE4B32001AB;
 Tue,  5 Jul 2022 13:11:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 05 Jul 2022 13:11:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1657041100; x=1657127500; bh=u7
 7e9bFkinpe1tnh73UVduIwDmgGTnzAx+cc6X8PmVg=; b=aOWMSut4xJSCPMCux+
 jz2ljr5mFXu7LSY+15nCToP+oH6ubNXy8OKScWGLdlYRfvw5V56uIgR/KWgRxmpz
 E5mVrX/YOPdeC+ag9SPBicIIX6eO5ah3cqRGg0AH4Bhp/zXSPBLmhkhOyPugBoZY
 wL0AsX7tZaLOmv1Tf3x4m2SkEt0A8dFQ1NDZW7m6JELvXS+TNlFiwWynoNHDSLzR
 m+4TjeSuCThyaHE/2w5LnMx3fqEHcqmoOHPkIWY5vr4ux/QlOHAGX2qlg1NTxKjd
 nVUB/lsZz6pHuH6UYD642FppOG6u/Eshax3jSn2WK1xK3TLj2cddDf5sKq1wmXmi
 j2wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1657041100; x=1657127500; bh=u77e9bFkinpe1tnh73UVduIwDmgG
 TnzAx+cc6X8PmVg=; b=nI4kTWniATJIWhjMk1aNjfkU2tzDAWFJqegsHuwve20b
 2Ua+V/Kov7t0mDjeyPifvtRiiCjVEe2quucbDvWNV73leRd6ehwxUugJ12GSAfBc
 Ta2JDIniRAH5EGxTMQv2LzgKdbZxmCqyxKpGRD5l/inYZnIK+A4oL7w3jg2dEKjf
 5D1uhssK2OEwO1jTsO0e3bJ663RkRPq7Kxtup4Z2KEIANRoQ/qnhNCwVaw5g+pi/
 tjm5GCBsrSFZNHrqGpd3bjNycSU2v2GZ0Z20v/CfqIKIXJ2GkXoCIIdkWSLm023O
 tJqRkLzNsUsCRMpNeVKBEq0kHhjW5PDcJKgWD3f17w==
X-ME-Sender: <xms:ynDEYu4nCF6Gup8gLi4puwX4vTYbUGVxvhp-jd2g3qtbucuFnPXRoA>
 <xme:ynDEYn7wtti1HQUWoBa7gNeF8G7SvwFPVCAIPLcr2WYUwaNdF_DplyoM9GtFZwTQm
 KPohbXelDz2EDuY6sI>
X-ME-Received: <xmr:ynDEYtfxfZFeixfKZyDvO6jM9j5fR-Gc1yQbcJNte49xwr-KiUvW20D9Zd98LU8Bcl4SsSUojtEuPZB4KhU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiuddguddufecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesgh
 dtreertddtjeenucfhrhhomhepmfhlrghushculfgvnhhsvghnuceoihhtshesihhrrhgv
 lhgvvhgrnhhtrdgukheqnecuggftrfgrthhtvghrnhepjefgjeefffdvuefhieefhffggf
 euleehudekveejvedtuddugeeigeetffffjeevnecuvehluhhsthgvrhfuihiivgeptden
 ucfrrghrrghmpehmrghilhhfrhhomhepihhtshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:ynDEYrKO_sKec0PJCGXa-u28kIx8oSyyUHRXC4OZdWlAKBBMTyCvSA>
 <xmx:ynDEYiJy8t7MaHKdsAhTZRe5_n1e4xpNXOg7X7OQWbPZhKM1XQ-J8A>
 <xmx:ynDEYszAA_SmII7Gvv5hyEm4zFY4S6GBdDVpm1ML8CSSjmWS2tL4sA>
 <xmx:zHDEYpXh2Kt4-Nb2OhPM3qqptJl264qc4nyofgc6VEqpG7qhc9UH1g>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 5 Jul 2022 13:11:38 -0400 (EDT)
Date: Tue, 5 Jul 2022 19:11:36 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org
Subject: Re: [PATCH v4] hw/nvme: Use ioeventfd to handle doorbell updates
Message-ID: <YsRwyMONg0+mHVsL@apples>
References: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TmRYvMmAcN4Y2IbC"
Content-Disposition: inline
In-Reply-To: <20220705142403.101539-1-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=64.147.123.25; envelope-from=its@irrelevant.dk;
 helo=wout2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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


--TmRYvMmAcN4Y2IbC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jul  5 22:24, Jinhao Fan wrote:
> Add property "ioeventfd" which is enabled by default. When this is
> enabled, updates on the doorbell registers will cause KVM to signal
> an event to the QEMU main loop to handle the doorbell updates.
> Therefore, instead of letting the vcpu thread run both guest VM and
> IO emulation, we now use the main loop thread to do IO emulation and
> thus the vcpu thread has more cycles for the guest VM.
>=20

This is not entirely accurate.

Yes, the ioeventfd causes the doorbell write to be handled by the main
iothread, but previously we did not do any substantial device emulation
in the vcpu thread either. That is the reason why we only handle the
bare minimum of the doorbell write and then defer any work until the
timer fires on the main iothread.

But with this patch we just go ahead and do the work (nvme_process_sq)
immediately since we are already in the main iothread.

> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index c952c34f94..4b75c5f549 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -1374,7 +1374,14 @@ static void nvme_enqueue_req_completion(NvmeCQueue=
 *cq, NvmeRequest *req)
> =20
>      QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
>      QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
> -    timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
> +
> +    if (req->sq->ioeventfd_enabled) {
> +        /* Post CQE directly since we are in main loop thread */
> +        nvme_post_cqes(cq);
> +    } else {
> +        /* Schedule the timer to post CQE later since we are in vcpu thr=
ead */
> +        timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
> +    }

Actually, we are only in the vcpu thread if we come here from
nvme_process_db that in very rare circumstances may enqueue the
completion of an AER due to an invalid doorbell write.

In general, nvme_enqueue_req_completion is only ever called from the
main iothread. Which actually causes me to wonder why we defer this work
in the first place. It does have the benefit that we queue up several
completions before posting them in one go and raising the interrupt.
But I wonder if that could be handled better.

Anyway, it doesnt affect the correctness of your patch - just an
observation that we should look into possibly.


LGTM,

Reviewed-by: Klaus Jensen <k.jensen@samsung.com>

--TmRYvMmAcN4Y2IbC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmLEcMYACgkQTeGvMW1P
Delu6gf/erweLf1prgM1hg7IZrBOd6/5OGBYJ9r0UXfGm4E6n1PSlORB5C3wif6U
0lytVkIJM+0QAqPoLY2oKSz3Rv3q22dfSu5AsfnHQXBzSYihUaLoSqyl2B3gVZbr
FcI9ARPUM/HcMigkNuasLwW3lV3ytx9SMAJiDWX+14raxos/Q518nr1Paiu52ZgO
c+JxTfvC5pyYVobeva3o6Msb7gXb5Nes3wBEbUZCc3d5pqaTonCyKqwkhV1pAxVd
YnnZTpTTcbRk67QKUI9OyAwmg2M1UUkFsArUx0t9/WIKiZdj/z4YoV9qZPhB+LBn
5KkQIN8B4EoUbF+8MMoJRBlYdeN/BQ==
=yumZ
-----END PGP SIGNATURE-----

--TmRYvMmAcN4Y2IbC--

