Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461D92B946A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 15:18:53 +0100 (CET)
Received: from localhost ([::1]:33422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfklw-0002sB-BS
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 09:18:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kfkkx-0002Ry-Oq
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:17:51 -0500
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:43973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1kfkkv-0002wA-T1
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 09:17:51 -0500
Received: by mail-il1-x12e.google.com with SMTP id z14so3728072ilm.10
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 06:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CvLJSoYfHka2BxTfnySjrcjzYRDWK2jTGF6U9KTX/C8=;
 b=K4jnGobGOGi4gDmJDpUlMPld7ZEVIyh+yDHY4hy+kLNl1QlqotSbTbFXrcpvftJZgo
 ljzoYUja0nB13wTxpk9clyTBrMtUC61C4FiSoqA9piijx4DSFDvqS3Tux270c+6ZmfWt
 YnG73i4ylc8gVvLLKGr270OXzglQFsL6VtUAQLkAbZalj5mL2KzXA+ocyj9astHa5Bzk
 bs3BAFeuxwRLpIBMIeI2/uQHEh68grbfPyuZfoSapFUClbD/BLmdPYXP6UXDzVA1TO8K
 r4xxt4f4zOd82sm61Og2Nm7eQgTnHxIQ2hM17bL2/WkmbGhSBYNWRoggAzE6CaxOsTrm
 1KJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CvLJSoYfHka2BxTfnySjrcjzYRDWK2jTGF6U9KTX/C8=;
 b=KETPBZcSUrFOzcjpJ40XUYBUX2bn2Yzu71W43JaIyxGgN8rihY7bFN+xbE/03NBKp5
 m5mq4xpZewNhG7m4XOpv5lX8sOsp69bFqcFoMT2Wvn/vcr/WaiOx3jma/aXaVOkI8yoA
 Y8yD61Qo46EfWuLBSflDM+72a6PDGSaF+j6GrMEjDBvZTCZBeHceJ68RdlGMnBANIVns
 xwzQppblfiIGMIuermJlmWU4jODya4hBifjMMWDIcDisYJ3Qcc5wQGTU3qp7v96sgC9V
 UfXmG+ZgBgsjN1jCRF5k3rD7tRto/LhBuMFxX1Eq4J5qE7ju/M3ORNwnuEDraUbJfuUR
 kXBg==
X-Gm-Message-State: AOAM532WEdTAlqtiborWTZBaZr2wybrskmA9quxQlHASXcvTgP7p6y1V
 ozCnyGTo9t7fCqv9MaTz3UKL1hvWaSQdOvx87UeQVV6TJ1k=
X-Google-Smtp-Source: ABdhPJwhhCBul/tIMYP6kbZb6X6dbIVSfn12dwEFQrt7yB3Q6DCsUG4waWTHYGcF/C0LsRI03hAJ2f5J0igfsH3o15g=
X-Received: by 2002:a92:79ce:: with SMTP id u197mr370635ilc.85.1605795468550; 
 Thu, 19 Nov 2020 06:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-5-peter.maydell@linaro.org>
In-Reply-To: <20201112144041.32278-5-peter.maydell@linaro.org>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 19 Nov 2020 15:17:37 +0100
Message-ID: <CAM9Jb+hP8MTGhtpkCFSyXWN6A5A4Ad5e7WGGhDK4RzppjP2J0Q@mail.gmail.com>
Subject: Re: [for-5.2 4/9] docs/system/virtio-pmem.rst: Fix minor style issues
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> The virtio-pmem documentation has some minor style issues we hadn't
> noticed since we weren't rendering it in our docs:
>
>  * Sphinx doesn't complain about overlong title-underlining the
>    way it complains about too-short underlining, but it looks odd;
>    make the underlines of the top level title the right length
>
>  * Indent of paragraphs makes them render as blockquotes;
>    remove the indent so they just render as normal text
>
>  * Leading 'o' isn't rst markup, so it just renders as a literal
>    "o"; reformat as a subsection heading instead
>
>  * "QEMU" in the document title and section headings are a bit
>    odd and unnecessary since this is the QEMU manual; delete
>    or rephrase them
>
>  * There's no need to specify what QEMU version the device first
>    appeared in.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/system/virtio-pmem.rst | 55 ++++++++++++++++++-------------------
>  1 file changed, 27 insertions(+), 28 deletions(-)
>
> diff --git a/docs/system/virtio-pmem.rst b/docs/system/virtio-pmem.rst
> index 4bf5d004432..e5f91eff1c2 100644
> --- a/docs/system/virtio-pmem.rst
> +++ b/docs/system/virtio-pmem.rst
> @@ -1,38 +1,37 @@
>
> -========================
> -QEMU virtio pmem
> -========================
> +===========
> +virtio pmem
> +===========
>
> - This document explains the setup and usage of the virtio pmem device
> - which is available since QEMU v4.1.0.
> -
> - The virtio pmem device is a paravirtualized persistent memory device
> - on regular (i.e non-NVDIMM) storage.
> +This document explains the setup and usage of the virtio pmem device.
> +The virtio pmem device is a paravirtualized persistent memory device
> +on regular (i.e non-NVDIMM) storage.
>
>  Usecase
>  --------
>
> -  Virtio pmem allows to bypass the guest page cache and directly use
> -  host page cache. This reduces guest memory footprint as the host can
> -  make efficient memory reclaim decisions under memory pressure.
> +Virtio pmem allows to bypass the guest page cache and directly use
> +host page cache. This reduces guest memory footprint as the host can
> +make efficient memory reclaim decisions under memory pressure.
>
> -o How does virtio-pmem compare to the nvdimm emulation supported by QEMU?
> +How does virtio-pmem compare to the nvdimm emulation?
> +-----------------------------------------------------
>
> -  NVDIMM emulation on regular (i.e. non-NVDIMM) host storage does not
> -  persist the guest writes as there are no defined semantics in the device
> -  specification. The virtio pmem device provides guest write persistence
> -  on non-NVDIMM host storage.
> +NVDIMM emulation on regular (i.e. non-NVDIMM) host storage does not
> +persist the guest writes as there are no defined semantics in the device
> +specification. The virtio pmem device provides guest write persistence
> +on non-NVDIMM host storage.
>
>  virtio pmem usage
>  -----------------
>
> -  A virtio pmem device backed by a memory-backend-file can be created on
> -  the QEMU command line as in the following example::
> +A virtio pmem device backed by a memory-backend-file can be created on
> +the QEMU command line as in the following example::
>
>      -object memory-backend-file,id=mem1,share,mem-path=./virtio_pmem.img,size=4G
>      -device virtio-pmem-pci,memdev=mem1,id=nv1
>
> -  where:
> +where:
>
>    - "object memory-backend-file,id=mem1,share,mem-path=<image>, size=<image size>"
>      creates a backend file with the specified size.
> @@ -40,8 +39,8 @@ virtio pmem usage
>    - "device virtio-pmem-pci,id=nvdimm1,memdev=mem1" creates a virtio pmem
>      pci device whose storage is provided by above memory backend device.
>
> -  Multiple virtio pmem devices can be created if multiple pairs of "-object"
> -  and "-device" are provided.
> +Multiple virtio pmem devices can be created if multiple pairs of "-object"
> +and "-device" are provided.
>
>  Hotplug
>  -------
> @@ -59,14 +58,14 @@ the guest::
>  Guest Data Persistence
>  ----------------------
>
> - Guest data persistence on non-NVDIMM requires guest userspace applications
> - to perform fsync/msync. This is different from a real nvdimm backend where
> - no additional fsync/msync is required. This is to persist guest writes in
> - host backing file which otherwise remains in host page cache and there is
> - risk of losing the data in case of power failure.
> +Guest data persistence on non-NVDIMM requires guest userspace applications
> +to perform fsync/msync. This is different from a real nvdimm backend where
> +no additional fsync/msync is required. This is to persist guest writes in
> +host backing file which otherwise remains in host page cache and there is
> +risk of losing the data in case of power failure.
>
> - With virtio pmem device, MAP_SYNC mmap flag is not supported. This provides
> - a hint to application to perform fsync for write persistence.
> +With virtio pmem device, MAP_SYNC mmap flag is not supported. This provides
> +a hint to application to perform fsync for write persistence.
>
>  Limitations
>  ------------

Reviewed-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>

