Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEE031DE14
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 18:25:03 +0100 (CET)
Received: from localhost ([::1]:38492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCQZR-0000i7-Ob
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 12:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lCQYP-0000ES-A9
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:23:57 -0500
Received: from rev.ng ([5.9.113.41]:42097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1lCQYN-0005fD-DA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 12:23:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UsGpKGAhhIlJ9XKC9Ns6AiOrY7JARN+AtpwmTinXRlg=; b=c+BEEzArKfG/T/bYkzHuW/Xujj
 GI/YwLUHkcAFMee7n2kXKQ0t9TjaV88c9HtiNag1FwdB/Pvr+sK/LMmyMW/MzImfLnvcSAxQ3fCOc
 AG0kgv8/wDCmJKK4XpNO5IsMXL1FoWYTviK24cwebAzCaDS8y+uTb4BwuN4Rongnk/nM=;
Date: Wed, 17 Feb 2021 18:23:34 +0100
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org, Alex
 =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>, bcain@quicinc.com, Fam
 Zheng <fam@euphon.net>, richard.henderson@linaro.org, laurent@vivier.eu
Subject: Re: [PATCH v8 35/35] Add Dockerfile for hexagon
Message-ID: <20210217182334.0fb3b75e@orange>
In-Reply-To: <6a5411a3-3d48-d30e-df70-4c73328c5fed@amsat.org>
References: <1612763186-18161-1-git-send-email-tsimpson@quicinc.com>
 <1612763186-18161-36-git-send-email-tsimpson@quicinc.com>
 <6a5411a3-3d48-d30e-df70-4c73328c5fed@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=5.9.113.41; envelope-from=ale@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale.qemu@rev.ng>
From:  Alessandro Di Federico via <qemu-devel@nongnu.org>

On Sun, 14 Feb 2021 19:50:41 +0100
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> Hi Alessandro!

Hi Philippe!

> I had to add this to build your image with QEMU build system:
>=20
> -- >8 -- =20
>
> diff --git a/tests/docker/Makefile.include
> b/tests/docker/Makefile.include index 93b29ad823e..ba73fb4b1f0 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -146,6 +146,8 @@ docker-image-debian-riscv64-cross:
> docker-image-debian10 docker-image-debian-s390x-cross:
> docker-image-debian10 docker-image-debian-sh4-cross:
> docker-image-debian10 docker-image-debian-sparc64-cross:
> docker-image-debian10
>+docker-image-debian-hexagon-cross-build-local:
> \
>+
> EXTRA_FILES:=3D$(SRC_PATH)/tests/docker/dockerfiles/debian-hexagon-cross.=
build-toolchain.sh
>=20
>  docker-image-travis: NOUSER=3D1
>=20
> ---

OK, I'll drop `-local` (see below).

> > +++ b/tests/docker/dockerfiles/debian-hexagon-cross.docker
> > @@ -0,0 +1 @@
> > +FROM revng/qemu:debian-hexagon-cross =20
>=20
> Once this patch gets merged, the image will be available on
> qemu/qemu:debian-hexagon-cross.
>=20
> I suppose for the final merge patch we want:
> - rm debian-hexagon-cross.docker
> - mv debian-hexagon-cross-build-local.docker
> debian-hexagon-cross.docker
>=20
> Is that correct?

The `revng/qemu:debian-hexagon-cross` image was there only to let
people quickly try out a toolchain without building it from source.

If building from source is OK with you, that works for us.
In any case, people will be able to use
`qemu/qemu:debian-hexagon-cross`, right?

> If so, can you amend that detail after the '---'
> separator of the commit description so we don't merge this patch
> as it?

I'm a bit confused, do you want me to send a patch corrected by hand
here?
I'll send a new patch tomorrow.

> Also, can you add a job to build your image in
> .gitlab-ci.d/containers.yml?

OK, is there a quick way for me to test changes I make to that file?

--=20
Alessandro Di Federico
rev.ng Srls, CEO

