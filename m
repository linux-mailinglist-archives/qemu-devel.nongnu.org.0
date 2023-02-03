Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EA0689E66
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 16:37:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNy6w-00031h-32; Fri, 03 Feb 2023 10:36:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNy6p-0002yq-T3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:36:17 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pNy6m-0000mB-Da
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 10:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRj3fztn8iVE/wyLEwf8cCned6AONcK+ZbamBDCHgAE=; b=st+5j4o72iEZp2WfRrh1rLj7vx
 z+dijJXL8Rk/hcWT3aKaatcN5ObAtMQvH5J5kMEH1xajQwbkrCy+hdvnWCWrXIk5wJRr7C+Iitrsv
 k5lv+WAfLm60fk4zlwydj24DcXaYLXHUTHki3AbrpuksKVCcufP+In9rybWe6yZZ6NpA=;
Date: Fri, 3 Feb 2023 16:36:03 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH] tests/docker: Use binaries for debian-tricore-cross
Message-ID: <20230203153603.cbvaf7sctottvkml@schnipp-desktop>
References: <20230203145404.1043301-1-kbastian@mail.uni-paderborn.de>
 <c21d19e6-7e8a-a66e-0c65-f05954e429d7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c21d19e6-7e8a-a66e-0c65-f05954e429d7@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.3.152717, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-Sophos-SenderHistory: ip=84.154.177.181, fs=369716, da=163047632, mc=4, sc=0,
 hc=4, sp=0, fso=369716, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Phil,

On Fri, Feb 03, 2023 at 04:02:16PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Bastian,
> 
> On 3/2/23 15:54, Bastian Koppelmann wrote:
> > since binutils is pretty old, it fails our CI repeatedly during the
> > compilation of tricore-binutils. We created a precompiled version using
> > the debian docker image and download it instead of building it ourself.
> > 
> > Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> > ---
> > Peter, I was having trouble with the new version of binutils, I mentioned. I
> > think this needs more time to sort out. So for now, let's just use a precompiled
> > version of the current binutils.
> > 
> >   .../dockerfiles/debian-tricore-cross.docker    | 18 +++---------------
> >   1 file changed, 3 insertions(+), 15 deletions(-)
> > 
> > diff --git a/tests/docker/dockerfiles/debian-tricore-cross.docker b/tests/docker/dockerfiles/debian-tricore-cross.docker
> > index 5ae58efa09..4abcf07e68 100644
> > --- a/tests/docker/dockerfiles/debian-tricore-cross.docker
> > +++ b/tests/docker/dockerfiles/debian-tricore-cross.docker
> > @@ -16,32 +16,20 @@ MAINTAINER Philippe Mathieu-Daudé <f4bug@amsat.org>
> >   RUN apt update && \
> >       DEBIAN_FRONTEND=noninteractive apt install -yy eatmydata && \
> >       DEBIAN_FRONTEND=noninteractive eatmydata apt install -yy \
> > -       bison \
> > +       curl \
> >          bzip2 \
> >          ca-certificates \
> > -       ccache \
> 
> You might not use ccache, but others do, so please let it:
> 
> $ git grep DOCKER_CCACHE
> tests/docker/Makefile.include:203:DOCKER_CCACHE_DIR :=
> $$HOME/.cache/qemu-docker-ccache
> tests/docker/Makefile.include:212:      @mkdir -p "$(DOCKER_CCACHE_DIR)"
> tests/docker/Makefile.include:234:                              -v
> $(DOCKER_CCACHE_DIR):/var/tmp/ccache:z \
> 
> > -       flex \
> > -       g++ \
> > -       gcc \
> > -       git \
> >          libglib2.0-dev \
> >          libpixman-1-dev \
> >          locales \
> > -       make \
> 
> Why remove gcc/(git)/make?

I'm not cloning any repository and not building anything. Why download things, if we
don't need them?

Anyways, if you prefer, then I can revert the changes to the installed packages.

Cheers,
Bastian

