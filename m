Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C202FE9F4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 13:27:01 +0100 (CET)
Received: from localhost ([::1]:46434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Z3E-0002zZ-Ft
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 07:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1l2Ywt-0005d0-CC
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:20:27 -0500
Received: from rev.ng ([5.9.113.41]:45553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ale@rev.ng>) id 1l2Ywr-0006yD-69
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 07:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VgjqUpIXqYgb9DTjj8is4uhRtbOq6csn/Nol5vqpHF8=; b=cpDJAi11HRmEJx1qLyQkcGlk6T
 NbIgXuIwU4JoL0aR10zPJ9pi5M/YRgSd7eQ+82boLJ86UgvsNukPZE1sYdJ4hcNFcIezrzjVW7PGH
 qYIgSRiZrOX7aROXiyDJnCZLqE5/LFhuqzu1zii+YqN75tuIC6eDfTVpdJvfZOIo6K3c=;
Date: Thu, 21 Jan 2021 13:20:03 +0100
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v6 34/35] Auto-import Docker support files
Message-ID: <20210121132003.7789adab@orange>
In-Reply-To: <87h7nmm2mn.fsf@linaro.org>
References: <1610080146-14968-1-git-send-email-tsimpson@quicinc.com>
 <1610080146-14968-35-git-send-email-tsimpson@quicinc.com>
 <874kjmnz71.fsf@linaro.org> <20210112145319.1c9440a9@orange>
 <87h7nmm2mn.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, bcain@quicinc.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, laurent@vivier.eu,
 Taylor Simpson <tsimpson@quicinc.com>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Alessandro Di Federico <ale@rev.ng>
From: ale--- via <qemu-devel@nongnu.org>

On Tue, 12 Jan 2021 18:26:29 +0000
Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:

> I'm confused - extra-files is while building the docker image, not
> running it.
>=20
> >
> > Or am I missing some part of how this works? =20
>=20
> Add an explicit rule in Makefile.include:
>=20
>   docker-image-debian-hexagon-cross: EXTRA_FILES=3Dfoo.bar

The following patch seems to do the trick. This one is no longer needed.
Thanks for pointing this out!

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index 02ec92830b..1e60e5f980 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -134,6 +134,8 @@ docker-image-debian-s390x-cross: docker-image-debian10
 docker-image-debian-sh4-cross: docker-image-debian10
 docker-image-debian-sparc64-cross: docker-image-debian10
=20
+docker-image-debian-hexagon-cross: EXTRA_FILES=3D$(DOCKER_FILES_DIR)/debia=
n-hexagon-cross.build-toolchain.sh
+
 docker-image-travis: NOUSER=3D1
=20
 # Specialist build images, sometimes very limited tools


--=20
Alessandro Di Federico
rev.ng Srls, CEO

