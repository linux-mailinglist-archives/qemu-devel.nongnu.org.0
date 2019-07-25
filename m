Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E921D74B6F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 12:21:51 +0200 (CEST)
Received: from localhost ([::1]:58412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqash-0008FZ-6a
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 06:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54606)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqasV-0007qG-9G
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:21:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqasT-0007zi-LO
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:21:38 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40785)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqasT-0007z8-8X
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 06:21:37 -0400
Received: by mail-oi1-x242.google.com with SMTP id w196so15947466oie.7
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 03:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FNn3g7qWnYCH2x9x/5xxjgFDmLnc/jI9f+OqI2GBMMA=;
 b=l9WAuv4JHCAqojgsiN0h2Gtnm9b+lBgI0TUUH7/G9zFeWs87UClemepGi2892LXJNd
 8qPlielDsGuYyZZlwzGQQmU/SrKpl5tfMwIlx6ltZrDzdubXTPyWBJKfKbz5iuOo4qwo
 CXDs+Uaizdn2aAVjteCoom7RvGapq1BpBbYuueh6IR6IILOQocJTl2bz93mALjws4h/N
 is3f27t5AXXa+QAauf2vA+jLNFB40SmYQDxOxhfckYeqe+nEWF6vRxpJHh5LNZY9a/g0
 DxxIbTeHvBhwiEuuY46y21RUdkPsJOuBoD2viUVIzaRGn9oA6E8MSi4Nx7AiH/kD35nE
 VxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FNn3g7qWnYCH2x9x/5xxjgFDmLnc/jI9f+OqI2GBMMA=;
 b=DQmmiCClNtsO+1UDcwnMpKHizIAslm0izzszzzu8aczzJmWm1B8qIS/upVKExLsYXx
 LZC1dLTQeii+q/WbQfnuVk6Ru+Hk6iweO1Do6GLMh/8yXj90DTtfjn6YC4Y2xg+EmyaM
 3CNGclRj3j0GQap/B+9+VRxuhe22rXme35A6Z4b6gsHe32bC/pkyy7etDSShZI+Wifzg
 oXp7l3quXBR3fBm3ZsIRyDK2nXcer70JTdJydKlRtjaKNBMT8DDNV87PVSiGTQU+p/BF
 /VbzUIPb2Ze4vgsu4bhGxxO4A3UlUa9DdCas5grjH1YfnxbopFYQ5Xwyz5gSj14vaB5D
 aW/Q==
X-Gm-Message-State: APjAAAVUBSAHemTkcrEW2gpdSLNS3exVfkyGhWPz7HmXSRW9u+rvwG2N
 vJFT3bLmpZApVU1Z06ow30zx+3PcLlYpkzhhBy6B9Q==
X-Google-Smtp-Source: APXvYqzGZiwmu3mfjHRVXFpee/8LLmdOvsEB2+ywVK19EVsDP+jx5wWVE1RY93dvut8a74mCi3hf3e5Gk9Ud/PAx8eM=
X-Received: by 2002:aca:5cd7:: with SMTP id
 q206mr39096268oib.146.1564050096196; 
 Thu, 25 Jul 2019 03:21:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190725101836.1273-1-pbonzini@redhat.com>
In-Reply-To: <20190725101836.1273-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Jul 2019 11:21:25 +0100
Message-ID: <CAFEAcA-ta49Qe29zoSzW52OWXYHf+c5t+X3t27Qc3n=harDT=Q@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH] 9p: simplify source file selection
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Jul 2019 at 11:18, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Express the complex conditions in Kconfig rather than Makefiles, since Kc=
onfig
> is better suited at expressing dependencies and detecting contradictions.
>
> Cc: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Kconfig.host        | 1 +
>  fsdev/Makefile.objs | 2 +-
>  hw/9pfs/Kconfig     | 5 +++++
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Kconfig.host b/Kconfig.host
> index aec95365ff..bb6e116e2a 100644
> --- a/Kconfig.host
> +++ b/Kconfig.host
> @@ -28,6 +28,7 @@ config VHOST_USER
>
>  config XEN
>      bool
> +    select FSDEV_9P if VIRTFS
>
>  config VIRTFS
>      bool
> diff --git a/fsdev/Makefile.objs b/fsdev/Makefile.objs
> index 24bbb3e75c..42cd70c367 100644
> --- a/fsdev/Makefile.objs
> +++ b/fsdev/Makefile.objs
> @@ -1,6 +1,6 @@
>  # Lots of the fsdev/9pcode is pulled in by vl.c via qemu_fsdev_add.
>  # only pull in the actual 9p backend if we also enabled virtio or xen.
> -ifeq ($(call land,$(CONFIG_VIRTFS),$(call lor,$(CONFIG_VIRTIO_9P),$(CONF=
IG_XEN))),y)
> +ifeq ($(CONFIG_FSDEV_9P),y)
>  common-obj-y =3D qemu-fsdev.o 9p-marshal.o 9p-iov-marshal.o
>  else
>  common-obj-y =3D qemu-fsdev-dummy.o

Maybe we should update the comment here somehow too now?

Patch definitely looks like a good idea, though -- those
nested land/lor calls are pretty ugly :-)

thanks
-- PMM

