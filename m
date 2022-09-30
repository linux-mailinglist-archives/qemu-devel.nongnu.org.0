Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF05F07A5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 11:31:45 +0200 (CEST)
Received: from localhost ([::1]:42172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeCMy-0007ek-FL
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 05:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeCLB-00065V-5D
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:29:53 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:36840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oeCL9-0006VU-Dg
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 05:29:52 -0400
Received: by mail-ej1-x62a.google.com with SMTP id 13so7847535ejn.3
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=EsCSbfAPVUWC4yvF36053OfNVRiKeHKVLuD1hNI1SA4=;
 b=kT6uot83W+wM3fwKYVk9YSSgAQG4IU4dc5yz51rDOs8f26tL5hpZta3Pm9j5N3xzEI
 ZvkLLW7QFGhLs4chMUFr7lB/mqxogytnh7CpYhlGcQl85EjfbaowFDr5S6KUuEM2owRj
 4sm/CIlHM2hFNOw+5ZL9ALVvzS5J6SB1bomtlXESpMoV+jjcX36MHEiqLT68RZL/6Nk6
 Ujn2SdPzplcA+F5zA9r6wL5SvKPVT6y0a6bj+X7bjPNc0K4MdLy7WiCsML1TltmU7/06
 VQBr3OHuJ6nCxeUGaw3ecrpCLMcF+serbCqdw/hdn9HWSAsvvd4RfWZAGpl2iO1VRy4o
 huDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=EsCSbfAPVUWC4yvF36053OfNVRiKeHKVLuD1hNI1SA4=;
 b=2XoLL8wxf2atz9mJtkXY7qPKGP+JjGbKks0q3bXOzkwoJlMa5DDQ2KhOk7HkLtbMHP
 ezynL5DYi6R91IGfDDpa0Yk8/syq/llMgnIBFN+C3tGvaTZ8BqWshlwRL7L+50KKjN3Y
 JhX/15jPRUvoI0Z+R7RZcLGw32BVk63ZQsq+fjTyC/j126XzGKQyTzyrdCU/eXE30QOZ
 brZpZ4zcEzDf/6lpcyLI9yLyVwMJtnvgN7oOicFkBuC6VnR/EcDYnD+6UpaoOqw9Fp87
 xOhR/vyX2O/6RfTxC/KAdKVMA/z7nkXvO6OVvDvSUUWjInk3Ja2W8PpSCHbyeAiS8b6g
 lHiw==
X-Gm-Message-State: ACrzQf0XSXTgTxj0QwONa7+ctmQbJIYkrEcBGOxixBXqSPX626LkTECy
 GsRbWyJwnRbnO6oReCedtrbbxDCR8bgRH2+jYjeaXQ==
X-Google-Smtp-Source: AMsMyM4k+fW0D5rAeWIJJhoEtO/nE0sdHqfdSIFOuU0TrIl9HhwW1eYhOua01D1IKHwcN2o5kljUq3YVeQiLRTc5Wc4=
X-Received: by 2002:a17:907:724b:b0:782:f2bb:24d3 with SMTP id
 ds11-20020a170907724b00b00782f2bb24d3mr5742068ejc.555.1664530189790; Fri, 30
 Sep 2022 02:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220930073553.1626190-1-kraxel@redhat.com>
In-Reply-To: <20220930073553.1626190-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Sep 2022 10:29:38 +0100
Message-ID: <CAFEAcA9sOemC56_icMxS9rp7ZiCe00v+WpeWpEzJWdWqjnbXZQ@mail.gmail.com>
Subject: Re: [PATCH] pci-ids: sync docs + header
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 30 Sept 2022 at 08:35, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> docs/specs/pci-ids.txt and include/hw/pci/pci.h are out of sync,
> fix that.  Try improve the comment which points to pci-ids.txt.
>
> Also drop the list of modern virtio devices and explain how they
> are calculated instead.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  docs/specs/pci-ids.txt | 19 ++++++++++---------
>  include/hw/pci/pci.h   |  7 ++++++-
>  2 files changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
> index dd6859d039d0..6be7bc108d66 100644
> --- a/docs/specs/pci-ids.txt
> +++ b/docs/specs/pci-ids.txt
> @@ -22,16 +22,17 @@ maintained as part of the virtio specification.
>  1af4:1004  SCSI host bus adapter device (legacy)
>  1af4:1005  entropy generator device (legacy)
>  1af4:1009  9p filesystem device (legacy)
> +1af4:1012  vsock device (legacy)
> +1af4:1013  pmem device (legacy)
> +1af4:1014  iommu device (legacy)
> +1af4:1015  mem device (legacy)
>
> -1af4:1041  network device (modern)
> -1af4:1042  block device (modern)
> -1af4:1043  console device (modern)
> -1af4:1044  entropy generator device (modern)
> -1af4:1045  balloon device (modern)
> -1af4:1048  SCSI host bus adapter device (modern)
> -1af4:1049  9p filesystem device (modern)
> -1af4:1050  virtio gpu device (modern)
> -1af4:1052  virtio input device (modern)
> +1af4:1040  Start of id range for modern virtio devices.  The pci device
> +           id is is calculated from the virtio device id by adding the
> +           0x1040 offset.  The virtio ids are defined in the virtio
> +           specification.  The linux kernel has a header file with
> +           defines for all virtio ids (linux/virtio_ids.h), qemu has a
> +           copy in include/standard-headers/.

I think you should also specify the end point of this range, in the
same way that the "experimental usage" range has both a defined
start and end point. Otherwise we have no way to know how much
(if any) of the space before 10f0 is available for other uses.

Nits: capitalization: ID, PCI, Linux.

>  1af4:10f0  Available for experimental usage without registration.  Must get
>     to      official ID when the code leaves the test lab (i.e. when seeking

thanks
-- PMM

