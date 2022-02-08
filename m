Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227944AE026
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:58:42 +0100 (CET)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUlE-0003F5-Oc
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:58:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSwW-000218-60
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:02:12 -0500
Received: from [2a00:1450:4864:20::330] (port=41736
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nHSwT-0006zF-QP
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:02:11 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so2041032wmb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=31HcD6TbpT9ULS5A+upyHrN+3L9avFBtPvGQUD3ycCc=;
 b=bFKWO1WCD68axzwSf7VxVNgTrmQvgCwpFUbKk/ARL4SuoGfuPiaTFU4zHS9SVl+2D9
 6izFTJQXuWbjcbCGyOVWzfXF+LY73qCF6tNevRwvewKTJtQD8Hme1doKr/6Tpsg7oZjO
 gNKPIQQ7tpAfxnUVeKT+LRRvO+uspYAu4WYppduu7uG7MhSwBwrlBWOPzpiCWcQklAS3
 QyzgPR1DAjWiTwEznf3XS+s6qrii8v/bGiNwZQxJ3v8a7C6q1NFY5A/UwQ3y051vi79v
 I+FZjaP5QXu8XJAtS/OFywk3fzjGRk79an9sXwwmJqGbv3g46FwY9SCvD7TG8eFyUM8S
 4wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=31HcD6TbpT9ULS5A+upyHrN+3L9avFBtPvGQUD3ycCc=;
 b=xb3EiJ/E6XApqCDTtz1ixTx8bT8g08nnDFPPDlD1NYb/FMqZc1cvyQ9L/MgLaX9YCg
 Ea5q3uFo+icNsQvEBaofW91XYxcc0umdQZTY1LkYzEjO15lVMq8l2uFUnH+5ffgm+hgR
 iadmMvisoe/KzaefrKIPK747/KiugLzZOUmSkgh4WPMkCC3u9LNJUFh9dHlFZIzefXb8
 G3MmpOmwEl7i6+w+dVNfQgpjYirFt/nSq6aFBHueKF4/OBCvKgulDEj6POfQTwOLn+Qo
 XMP5GfIOL5kTP9Y0FmLPekGJ5QqDXmHoMCWwsrwXP1yFtEJnVnF+N5cnEUaMLDkZY+Gn
 SDFQ==
X-Gm-Message-State: AOAM532UWq4POhH77oSVEWV0Y8h18a7emMAW4n8cim7aJodO8Nv4DO5s
 pkgYWlgJcd+Djj2aSKEDlaAlJ/sGPaHXEbmuDH7XeQ==
X-Google-Smtp-Source: ABdhPJy/8QZNyMJaBbsZl8AqMSQHjt/LfAhqwGkJ4n/YqIe2fxmNNUwjzByXU9ivD1/+tgZRTOHlri9M99c9ytznaM4=
X-Received: by 2002:a7b:c5d1:: with SMTP id n17mr1693368wmk.32.1644336119199; 
 Tue, 08 Feb 2022 08:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
 <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
In-Reply-To: <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Feb 2022 16:01:48 +0000
Message-ID: <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
To: eric.auger@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: quintela@redhat.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, alex.williamson@redhat.com, imammedo@redhat.com,
 stefanb@linux.vnet.ibm.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi Peter,
>
> On 2/8/22 4:17 PM, Peter Maydell wrote:
> > On Tue, 8 Feb 2022 at 15:08, Eric Auger <eric.auger@redhat.com> wrote:
> >> Representing the CRB cmd/response buffer as a standard
> >> RAM region causes some trouble when the device is used
> >> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> >> as usual RAM but this latter does not have a valid page
> >> size alignment causing such an error report:
> >> "vfio_listener_region_add received unaligned region".
> >> To allow VFIO to detect that failing dma mapping
> >> this region is not an issue, let's use a ram_device
> >> memory region type instead.
> > This seems like VFIO's problem to me. There's nothing
> > that guarantees alignment for memory regions at all,
> > whether they're RAM, IO or anything else.
>
> VFIO dma maps all the guest RAM.

Well, it can if it likes, but "this is a RAM-backed MemoryRegion"
doesn't imply "this is really guest actual RAM RAM", so if it's
using that as its discriminator it should probably use something else.
What is it actually trying to do here ?

thanks
-- PMM

