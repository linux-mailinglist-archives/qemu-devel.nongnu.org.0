Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA3A6061B3
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 15:34:21 +0200 (CEST)
Received: from localhost ([::1]:49660 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVgh-0006WY-M2
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:34:19 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olVPm-0005sm-1t
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 09:16:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTbs-0001iw-6S; Thu, 20 Oct 2022 07:21:17 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1olTS7-0006Az-GP; Thu, 20 Oct 2022 07:11:11 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 30D665C0079;
 Thu, 20 Oct 2022 07:11:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 20 Oct 2022 07:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1666264261; x=1666350661; bh=W6
 nuDm9bbKYFMvmtYH+Ms5dCiqmsBynF+2jAqyL3/q4=; b=Dvpn1BsL7odqqCi+UZ
 +ogf7H/3RtHHU/XMSN2GPWKoHI6cR9mEsCMfaguaJCT3ogNgJjI70TASZJRM05hP
 hFHmwzhQpI6Px4M6Q/L4rb1wtTYnwilNbQ0loGhVDiC9k1RmLOX2n2DAzXyiiGZ5
 Riu86l6CwYhkPngm215ITshR9jh4vkYAcUCEuEtyoRWplI5RRHYPT1b0eNg4+bZr
 45SYPEzItrzePAMUlUqiErV0A7AbwDEjVfTM2zfVchNHKXe+KWCqZKgw2QJ8vO1G
 oOklVAdCXDz9+fPjsUnGcIUKt47jHyXp1YT2LJZDyW8R0sfZ3pfFnMVzd6pcXVu8
 ARig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1666264261; x=1666350661; bh=W6nuDm9bbKYFMvmtYH+Ms5dCiqms
 BynF+2jAqyL3/q4=; b=A9nbLRPMIhFLFLYtOtHPa22A6DSQup39QNLdlGykSCbW
 4SPY06TmDTxZUrYJ5vf/XP3nsxcDwOp/An5Cn+whchHtoHqJoJtnGoEHrI9q5TTS
 qMmOgMWqVNkucTCUfampQ2lKEyKUD/o+d7xqFOMdagz+SaK96puXy0wFux3WnU4R
 KUGbfqSFErEQbEefVErsRZInsGrhYrKXyM+dHbL9VB/7w1tkjLfme4KhvNCEeHEl
 crenp7Sbdtty18CplxqZiVYW4camkihqeRa8SeZuLBPNx69reLLoFv9gSL5RSXWU
 aqFaCdccXkwX5usWokW76OpI2uSTylH37oDykuZNJQ==
X-ME-Sender: <xms:xCxRYwtFJl4xnQ94qvTxHoWGVtD7qoKuWEebZlueyNEG_7IivTkpcQ>
 <xme:xCxRY9djbfC5ukvX4bUOS53XHUd6zz_yky411-x2t2HhLp4JIKmylj5mzwdz5o--c
 BkqR78-B8XJzL7ets0>
X-ME-Received: <xmr:xCxRY7wE2xnRX_3TLDP6exN4cACwxJ6SzEzzNvY7WI2bbgAoqs6lFljSxOOk8oHEdNta>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgfeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehgtd
 erredttdejnecuhfhrohhmpefmlhgruhhsucflvghnshgvnhcuoehithhssehirhhrvghl
 vghvrghnthdrughkqeenucggtffrrghtthgvrhhnpeejgfejfeffvdeuhfeifefhgffgue
 elhedukeevjeevtdduudegieegteffffejveenucevlhhushhtvghrufhiiigvpedtnecu
 rfgrrhgrmhepmhgrihhlfhhrohhmpehithhssehirhhrvghlvghvrghnthdrughk
X-ME-Proxy: <xmx:xCxRYzNYtXJyIa_diFcLs6gRCbXUmellU-ZvPNr7JC2pulYT9WJlpA>
 <xmx:xCxRYw8kvImdEP7odfIh7obMdxdlM-4FPLkxqzvAPf18-kzDpvwmJw>
 <xmx:xCxRY7VwO26Xn9OaRJZFly0XDTxL8MQakFTrxq6JN3p8KnhmhccwgA>
 <xmx:xSxRY0YX5-eREBtdQGYgIFV3OPmpY9zg4yD9snbefbfoPf2PBXiTcw>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 07:10:59 -0400 (EDT)
Date: Thu, 20 Oct 2022 13:10:57 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jinhao Fan <fanjinhao21s@ict.ac.cn>
Cc: qemu-devel@nongnu.org, kbusch@kernel.org, stefanha@gmail.com,
 "open list:nvme" <qemu-block@nongnu.org>
Subject: Re: [PATCH v3 4/4] hw/nvme: add polling support
Message-ID: <Y1EswYz077swwhuc@cormorant.local>
References: <20220827091258.3589230-1-fanjinhao21s@ict.ac.cn>
 <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="GC7KOIjaWYJrXYx/"
Content-Disposition: inline
In-Reply-To: <20220827091258.3589230-5-fanjinhao21s@ict.ac.cn>
Received-SPF: pass client-ip=66.111.4.25; envelope-from=its@irrelevant.dk;
 helo=out1-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


--GC7KOIjaWYJrXYx/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 27 17:12, Jinhao Fan wrote:
> Add AioContext polling handlers for NVMe SQ and CQ. By employing polling,
> the latency of NVMe IO emulation is greatly reduced. The SQ polling
> handler checks for updates on the SQ tail shadow doorbell buffer. The CQ
> polling handler is an empty function because we procatively polls the CQ
> head shadow doorbell buffer when we want to post a cqe. Updates on the
> SQ eventidx buffer is stopped during polling to avoid the host doing
> unnecessary doorbell buffer writes.
>=20
> Comparison (KIOPS):
>=20
> QD        1   4  16  64
> QEMU     53 155 245 309
> polling 123 165 189 191
>=20
> Signed-off-by: Jinhao Fan <fanjinhao21s@ict.ac.cn>
> ---
>  hw/nvme/ctrl.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++----
>  hw/nvme/nvme.h |  1 +
>  2 files changed, 70 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 869565d77b..a7f8a4220e 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -298,6 +298,8 @@ static const uint32_t nvme_cse_iocs_zoned[256] =3D {
> =20
>  static void nvme_process_sq(void *opaque);
>  static void nvme_ctrl_reset(NvmeCtrl *n, NvmeResetType rst);
> +static void nvme_update_sq_eventidx(const NvmeSQueue *sq);
> +static void nvme_update_sq_tail(NvmeSQueue *sq);
> =20
>  static uint16_t nvme_sqid(NvmeRequest *req)
>  {
> @@ -4447,6 +4449,21 @@ static void nvme_cq_notifier(EventNotifier *e)
>      nvme_post_cqes(cq);
>  }
> =20
> +static bool nvme_cq_notifier_aio_poll(void *opaque)
> +{
> +    /*
> +     * We already "poll" the CQ tail shadow doorbell value in nvme_post_=
cqes(),
> +     * so we do not need to check the value here. However, QEMU's AioCon=
text
> +     * polling requires us to provide io_poll and io_poll_ready handlers=
, so
> +     * use dummy functions for CQ.
> +     */
> +    return false;
> +}
> +
> +static void nvme_cq_notifier_aio_poll_ready(EventNotifier *n)
> +{
> +}
> +
>  static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
>  {
>      NvmeCtrl *n =3D cq->ctrl;
> @@ -4459,8 +4476,10 @@ static int nvme_init_cq_ioeventfd(NvmeCQueue *cq)
>      }
> =20
>      if (cq->cqid) {
> -        aio_set_event_notifier(n->ctx, &cq->notifier, true, nvme_cq_noti=
fier,
> -                               NULL, NULL);
> +        aio_set_event_notifier(n->ctx, &cq->notifier, true,
> +                               nvme_cq_notifier,
> +                               nvme_cq_notifier_aio_poll,
> +                               nvme_cq_notifier_aio_poll_ready);

There is no reason to set up these polling handlers (since they don't do
anything).

>      } else {
>          event_notifier_set_handler(&cq->notifier, nvme_cq_notifier);
>      }
> @@ -4482,6 +4501,44 @@ static void nvme_sq_notifier(EventNotifier *e)
>      nvme_process_sq(sq);
>  }
> =20
> +static void nvme_sq_notifier_aio_poll_begin(EventNotifier *n)
> +{
> +    NvmeSQueue *sq =3D container_of(n, NvmeSQueue, notifier);
> +
> +    nvme_update_sq_eventidx(sq);
> +
> +    /* Stop host doorbell writes by stop updating eventidx */
> +    sq->suppress_db =3D true;

This doesn't do what you expect it to. By not updaring the eventidx it
will fall behind the actual head, causing the host to think that the
device is not processing events (but it is!), resulting in doorbell
ringing.

> +}
> +
> +static bool nvme_sq_notifier_aio_poll(void *opaque)
> +{
> +    EventNotifier *n =3D opaque;
> +    NvmeSQueue *sq =3D container_of(n, NvmeSQueue, notifier);
> +    uint32_t old_tail =3D sq->tail;
> +
> +    nvme_update_sq_tail(sq);
> +
> +    return sq->tail !=3D old_tail;
> +}
> +
> +static void nvme_sq_notifier_aio_poll_ready(EventNotifier *n)
> +{
> +    NvmeSQueue *sq =3D container_of(n, NvmeSQueue, notifier);
> +
> +    nvme_process_sq(sq);
> +}
> +
> +static void nvme_sq_notifier_aio_poll_end(EventNotifier *n)
> +{
> +    NvmeSQueue *sq =3D container_of(n, NvmeSQueue, notifier);
> +
> +    nvme_update_sq_eventidx(sq);
> +
> +    /* Resume host doorbell writes */
> +    sq->suppress_db =3D false;
> +}
> +
>  static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
>  {
>      NvmeCtrl *n =3D sq->ctrl;
> @@ -4494,8 +4551,13 @@ static int nvme_init_sq_ioeventfd(NvmeSQueue *sq)
>      }
> =20
>      if (sq->sqid) {
> -        aio_set_event_notifier(n->ctx, &sq->notifier, true, nvme_sq_noti=
fier,
> -                               NULL, NULL);
> +        aio_set_event_notifier(n->ctx, &sq->notifier, true,
> +                               nvme_sq_notifier,
> +                               nvme_sq_notifier_aio_poll,
> +                               nvme_sq_notifier_aio_poll_ready);
> +        aio_set_event_notifier_poll(n->ctx, &sq->notifier,
> +                                    nvme_sq_notifier_aio_poll_begin,
> +                                    nvme_sq_notifier_aio_poll_end);

You can remove the call to aio_set_event_notifier_poll() since the
supress_db "trick" shouldnt be used anyway.

>      } else {
>          event_notifier_set_handler(&sq->notifier, nvme_sq_notifier);
>      }
> @@ -6530,7 +6592,9 @@ static void nvme_process_sq(void *opaque)
>          }
> =20
>          if (n->dbbuf_enabled) {
> -            nvme_update_sq_eventidx(sq);
> +            if (!sq->suppress_db) {
> +                nvme_update_sq_eventidx(sq);
> +            }

Remove this change.

>              nvme_update_sq_tail(sq);
>          }
>      }
> diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
> index 224b73e6c4..bd486a8e15 100644
> --- a/hw/nvme/nvme.h
> +++ b/hw/nvme/nvme.h
> @@ -380,6 +380,7 @@ typedef struct NvmeSQueue {
>      QEMUTimer   *timer;
>      EventNotifier notifier;
>      bool        ioeventfd_enabled;
> +    bool        suppress_db;

Remove this.

>      NvmeRequest *io_req;
>      QTAILQ_HEAD(, NvmeRequest) req_list;
>      QTAILQ_HEAD(, NvmeRequest) out_req_list;
> --=20
> 2.25.1
>=20

I tested with the patch modified for the above and I am not seeing any
difference in performance. But without the supress_db, this seems more
"correct".

--=20
One of us - No more doubt, silence or taboo about mental illness.

--GC7KOIjaWYJrXYx/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmNRLMEACgkQTeGvMW1P
DenQXggAji86OzJJs18vosQWQjqJAAlZRdwR+K7cE1gedpz5k5Jr4+GghuX74Eu9
0Sef32S1L/k3U/13Io79WVnWFT9IXIMHWqjlacqe4MP0gnY1c4rrq3XPO+IuY5eK
O8CvZ1IK9EvX3Ts64/S4fmWOY5zoAwVZBOlrlFJY3EboNRhisTSEAuVUu+ly/RZb
m3KVZiqqogZd6N2qQ78MwZSXQGI/p9G8XpwBB7UmOMQODplggmNwqe+AEVvJrnUq
sLB0tOY+HKESqKeaVzLLkFC4ueKXsn1YtZHiCXcLZ5IJEpR4wGI+25uapYoVTB6I
/SjqG/2E0ZTi5uk18psTfTFC7uU0Vw==
=yeC4
-----END PGP SIGNATURE-----

--GC7KOIjaWYJrXYx/--

