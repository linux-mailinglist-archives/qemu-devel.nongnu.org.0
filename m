Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F953D29D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 22:07:30 +0200 (CEST)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxDZx-0005nU-8y
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 16:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDW2-0000ZU-Ij; Fri, 03 Jun 2022 16:03:27 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:55987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1nxDW0-00015E-RS; Fri, 03 Jun 2022 16:03:26 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 9C0393200319;
 Fri,  3 Jun 2022 16:03:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 03 Jun 2022 16:03:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=irrelevant.dk;
 h=cc:cc:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1654286602; x=1654373002; bh=3q
 UK4C4RussdpJFI2xljUKpEYub7fIu8ZqaukY6DMhA=; b=Nx5niVexqRe9wdojt4
 MCrSu7IK+jOMGxRq0WZrzGh0x30nbf53OlqdAJpbtFuzOm12+orTRQ0/a18tbayy
 UwP4cPEv28OcooM1C2/xzOTbdDpUJvVX/pvKI4CS2tOBr0PsZ8Og2OdBQwi6AfT9
 w8ROT7EYaBB7VDLe1bUX4jKA15OLw7c90RP4ZXiC3C3dLr2/lzK7qajCt1Df++dt
 x/3YFJYd41wGqNbJMH1icQN6ZWLp6TGATeqOBacuY8kcBiMWJsxXhukz6Wk4gqZk
 z+3TDOz07+x4knVlyrxhlST/mjMKY4ZTPWDod4r/cVZ0AANQL0IEGF9VTa+ueRfB
 PDHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1654286602; x=1654373002; bh=3qUK4C4RussdpJFI2xljUKpEYub7
 fIu8ZqaukY6DMhA=; b=WRPOW3l8iKR0Ys5OwROe+9WgdDlSJ6wh4w7D2ncnsd6B
 l0bcSaVN9HDTL3L7RA3R/XFDUJFIDb2Ips0f1Nx8DfeInextHRN7hlAJA9Gipxcx
 5KmT+JfMdLhWcbbkJLcmU7QNO6qo9Y0iQwoo2sPusvZt4ik3Ky6Udhpo3c/c1B2d
 NOqKNkwA+wwzDVmb54GuUnmdN8wdpT4jUy2xpsUWl7gFBawkYEKDV4LbQqVZLFOc
 WcftUI9mLxMM5pzB0BE5b6L0XDQ6QJZUDWLMz5RWte6nlNjTzZ0nZeSh59PCCQ0m
 cB0qCyQTtUy7thfVCIRuIHzYmDNXSnLSzdCHrgQzgA==
X-ME-Sender: <xms:CWmaYjFSekdEMZ6nIompm4qIRrPdmSwSRrlHW1r3V_gTJ9ML_Iou5g>
 <xme:CWmaYgUhD-BqZLTSu_BMpwh0dmicP9LDSMuPxV72jjzNBqRp-UMsavj0kZi_yWfvw
 nKW8RTr7X0Dt3PAouw>
X-ME-Received: <xmr:CWmaYlLlF7zBZka4Brlbfz7fggxqijwmBatjUyNRJuYdczLVH38yWBnUk-ArTUOBurXH2VF2oiDcL8VISQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigddugedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepmfhlrghu
 shculfgvnhhsvghnuceoihhtshesihhrrhgvlhgvvhgrnhhtrdgukheqnecuggftrfgrth
 htvghrnhepjefgjeefffdvuefhieefhffggfeuleehudekveejvedtuddugeeigeetffff
 jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepih
 htshesihhrrhgvlhgvvhgrnhhtrdgukh
X-ME-Proxy: <xmx:CWmaYhG8r1bM8ukx5gnIDapq_ruT_J-52WMpGIkvQwPvwlQungBgNQ>
 <xmx:CWmaYpUduiXged7-q2yanPk_Jx8GN_WpQkUJpsfa9jpoPUcGX1tM3w>
 <xmx:CWmaYsMSFUN5FfSMwuEjem6r3XYjd365Fg6M2Jzm_VYbgcHXU53f5g>
 <xmx:CmmaYrKlVGSEPVDg4H5pJPeUZxe_ffxw-YAORRi3s3bXmuRgsu6_0A>
Feedback-ID: idc91472f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 16:03:20 -0400 (EDT)
Date: Fri, 3 Jun 2022 22:03:18 +0200
From: Klaus Jensen <its@irrelevant.dk>
To: Jonathan Derrick <jonathan.derrick@linux.dev>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Keith Busch <kbusch@kernel.org>,
 Francis Pravin AntonyX Michael Raj <francis.michael@solidigm.com>,
 Michael Kropaczek <michael.kropaczek@solidigm.com>,
 Jonathan Derrick <jonathan.derrick@solidigm.com>
Subject: Re: [PATCH] hw/nvme: Fix deallocate when metadata is present
Message-ID: <YpppBsxOJ7aCxgYw@apples>
References: <20220603191440.3625-1-jonathan.derrick@linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4Sa69npZiIfYkUAu"
Content-Disposition: inline
In-Reply-To: <20220603191440.3625-1-jonathan.derrick@linux.dev>
Received-SPF: pass client-ip=64.147.123.24; envelope-from=its@irrelevant.dk;
 helo=wout1-smtp.messagingengine.com
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


--4Sa69npZiIfYkUAu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Jun  3 13:14, Jonathan Derrick wrote:
> When metadata is present in the namespace and deallocates are issued, the=
 first
> deallocate could fail to zero the block range, resulting in another
> deallocation to be issued. Normally after the deallocation completes and =
the
> range is checked for zeroes, a deallocation is then issued for the metada=
ta
> space. In the failure case where the range is not zeroed, deallocation is
> reissued for the block range (and followed with metadata deallocation), b=
ut the
> original range deallocation task will also issue a metadata deallocation:
>=20
> nvme_dsm_cb()
>   *range deallocation*
>   nvme_dsm_md_cb()
>     if (nvme_block_status_all()) (range deallocation failure)
>       nvme_dsm_cb()
>       *range deallocation*
>         nvme_dsm_md_cb()
>           if (nvme_block_status_all()) (no failure)
>           *metadata deallocation*
>     *metadata deallocation*
>=20
> This sequence results in reentry of nvme_dsm_cb() before the metadata has=
 been
> deallocated. During reentry, the metadata is deallocated in the reentrant=
 task.
> nvme_dsm_bh() is called which deletes and sets iocb->bh to NULL. When ree=
ntry
> returns from nvme_dsm_cb(), metadata deallocation takes place again, and
> results in a null pointer dereference on the iocb->bh:
>=20
> BH deletion:
> #0  nvme_dsm_bh (opaque=3D0x55ef893e2f10) at ../hw/nvme/ctrl.c:2316
> #1  0x000055ef868eb333 in aio_bh_call (bh=3D0x55ef8a441b30) at ../util/as=
ync.c:141
> #2  0x000055ef868eb441 in aio_bh_poll (ctx=3D0x55ef892c6e40) at ../util/a=
sync.c:169
> #3  0x000055ef868d2789 in aio_dispatch (ctx=3D0x55ef892c6e40) at ../util/=
aio-posix.c:415
> #4  0x000055ef868eb896 in aio_ctx_dispatch (source=3D0x55ef892c6e40, call=
back=3D0x0, user_data=3D0x0) at ../util/async.c:311
> #5  0x00007f5bfe4ab17d in g_main_context_dispatch () at /lib/x86_64-linux=
-gnu/libglib-2.0.so.0
> #6  0x000055ef868fcd98 in glib_pollfds_poll () at ../util/main-loop.c:232
> #7  0x000055ef868fce16 in os_host_main_loop_wait (timeout=3D0) at ../util=
/main-loop.c:255
> #8  0x000055ef868fcf27 in main_loop_wait (nonblocking=3D0) at ../util/mai=
n-loop.c:531
> #9  0x000055ef864a2442 in qemu_main_loop () at ../softmmu/runstate.c:726
> #10 0x000055ef860f957a in main (argc=3D29, argv=3D0x7ffdc9705508, envp=3D=
0x7ffdc97055f8) at ../softmmu/main.c:50
>=20
> nvme_dsm_cb() called for metadata after nvme_dsm_bh() completes from reen=
trant task:
> Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
> 0x000055ef868eb07c in aio_bh_enqueue (bh=3D0x0, new_flags=3D2) at ../util=
/async.c:70
> 70          AioContext *ctx =3D bh->ctx;
> (gdb) backtrace
> #0  0x000055ef868eb07c in aio_bh_enqueue (bh=3D0x0, new_flags=3D2) at ../=
util/async.c:70
> #1  0x000055ef868eb4cf in qemu_bh_schedule (bh=3D0x0) at ../util/async.c:=
186
> #2  0x000055ef862db21e in nvme_dsm_cb (opaque=3D0x55ef897b41a0, ret=3D0) =
at ../hw/nvme/ctrl.c:2423
> #3  0x000055ef8665a662 in blk_aio_complete (acb=3D0x55ef89c6d8c0) at ../b=
lock/block-backend.c:1419
> #4  0x000055ef8665a940 in blk_aio_write_entry (opaque=3D0x55ef89c6d8c0) a=
t ../block/block-backend.c:1486
> #5  0x000055ef868edcf2 in coroutine_trampoline (i0=3D-536848976, i1=3D326=
02) at ../util/coroutine-ucontext.c:173
> #6  0x00007f5bfe0bc510 in __start_context () at ../sysdeps/unix/sysv/linu=
x/x86_64/__start_context.S:91
> #7  0x00007f5bf757bb40 in  ()
> #8  0x0000000000000000 in  ()
>=20
> The fix is to return when an nvme_dsm_cb() is reentered due to failure to
> deallocate the block range, so that metadata deallocate is then only issu=
ed in
> the reentrant task and prevent doing it again when the reentrant task ret=
urns
> to the original task.
>=20
> Reproduction steps (with emulated namespace):
> nvme format --lbaf=3D1 -f /dev/nvme0n1
> mkfs.ext4 /dev/nvme0n1
> mkfs.ext4 -F /dev/nvme0n1
>=20
> Signed-off-by: Francis Pravin AntonyX Michael Raj <francis.michael@solidi=
gm.com>
> Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
> Signed-off-by: Jonathan Derrick <jonathan.derrick@solidigm.com>
> ---
>  hw/nvme/ctrl.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
> index 03760ddeae..74540a03d5 100644
> --- a/hw/nvme/ctrl.c
> +++ b/hw/nvme/ctrl.c
> @@ -2372,6 +2372,7 @@ static void nvme_dsm_md_cb(void *opaque, int ret)
>          }
> =20
>          nvme_dsm_cb(iocb, 0);
> +        return;
>      }
> =20
>      iocb->aiocb =3D blk_aio_pwrite_zeroes(ns->blkconf.blk, nvme_moff(ns,=
 slba),
> --=20
> 2.25.1
>=20

Yeah, thanks for the elaborate analysis!

A fix for this has been lingering in nvme-next. I sincerely apologize
for not sending the pull request to master earlier, which might have
saved you the trouble of tracking this down.

I just sent the pull request to Peter.

--4Sa69npZiIfYkUAu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEUigzqnXi3OaiR2bATeGvMW1PDekFAmKaaQUACgkQTeGvMW1P
DelxeQf8CKbGNpNNHYUYQESCLuwgJbjKxe7DYuAWRK8mTmkYs/s674S8jIaaYpiR
zykXiFylxqR76FSaOfRbaPYxqholqjt+ELLKYvjfF+6weZk1cS93kJKbE4zF3dyk
LmntUX3+DtVNCzvbgb8GwTpPpl5LED+2/OhisuMFSUaJjWdsrL7ODZ/reQYIwti9
mIp1lDPjfll1hDpzHvSV9ZAJ2a1wjKlbEvtW3zBcP+ssWDLLt75WwuuytkO/jXzt
cozw/ektcwEMNZNcDe18lNx/rNhskdjguPwmcFyKkE7MZ6rYO8FvxGBSunw9ihDu
M9k3MakVj5nYDUm0Uu7QcFf/NZheAw==
=80ik
-----END PGP SIGNATURE-----

--4Sa69npZiIfYkUAu--

