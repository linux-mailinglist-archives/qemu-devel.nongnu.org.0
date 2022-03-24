Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6CE4E63E8
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 14:13:55 +0100 (CET)
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXNHm-0000d0-Oh
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 09:13:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXNFq-0006z3-86
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:11:57 -0400
Received: from [2607:f8b0:4864:20::112f] (port=42598
 helo=mail-yw1-x112f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nXNFo-0007aT-M4
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 09:11:53 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2e612af95e3so50116767b3.9
 for <qemu-devel@nongnu.org>; Thu, 24 Mar 2022 06:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/R0+EQEKHUAq95gDpYq2nU9GsBlpRmRFPSB2mqWTfA0=;
 b=eQvsYZUDNqYNypj3tzceac2D7tLfuvd3LklZOABnjjPgvVSkhP1tn0y6Fwgpu/6N1K
 UAxLzy2LSPnn7ceXW45g+4t2k2NyTKTwAgEWYWSk63I33AlnPX41ssvUnZc+erpf1M2r
 S3aMUq8WrjU9LZjP6NwxtF9QevlYwzqkiU+t+dVgGQtmVP3aGc1SJd7rtR9FtS2K2JCK
 8OQEgW1juL05yPvpHxlqpuBGnGFmOoqIAaC5GqHS062MHbTauxRi/YoUvjPjjY4DDn2V
 rUIjylV4uXvMnt2NbrTMROf02TaeSQqz+WLHykbwZr7oVQ37Yzc6wvgsHaTDgsaE3MDB
 Sd1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/R0+EQEKHUAq95gDpYq2nU9GsBlpRmRFPSB2mqWTfA0=;
 b=y0Wm81ywwo6hQ9fqJ7vzeiPNIZb2WsatxTuqGtCYet7NNjShpgUJ76Ae8YQJnMohYM
 WN85YaOVSSuzSb/GM9ip08HqLk0HZAcFTTCo2tq8dVrJ4KiwAW3q1xfejcbtqOd9hlay
 d+W77ubjd62LPIU47p1OlBz6+gNzlHTkU3UcYTpiC4H23RZw/4tPTvkVORc2SDZbtM+N
 C+kmvJe9Rrrl6D8K3ncvO/9kKzYg2fqKsROuUEOaV/cgeDlDpAZsYIeamcZlF4tYtnca
 QA6682mZWqjS9xMyVvM0ebdcHcPQ8pShuQIiJyCsUtbuXuMbAGer3xL48u2Bkfkb3qNy
 b+Fg==
X-Gm-Message-State: AOAM533AMJAg5k3op0qxCu5s0Cts4oJFgMHIpXecGr5lXJI+mNeSv7+k
 B2zK2A/tVGDVfo2WCKJQZKQ9PyK6twxoPNxUmfPsNA==
X-Google-Smtp-Source: ABdhPJx5zQ8ftwkJHxV19bqI9or2WCARnGa/yGhy6LCCwgX7MTadh0qP4yNC2pHtrzi6WNgZ9KkWjGr5R4zG2L/P8Z4=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr4697796ywb.257.1648127511669; Thu, 24 Mar
 2022 06:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220324082243.451107-1-bmeng.cn@gmail.com>
 <20220324082243.451107-2-bmeng.cn@gmail.com>
In-Reply-To: <20220324082243.451107-2-bmeng.cn@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Mar 2022 13:11:38 +0000
Message-ID: <CAFEAcA-p3ctvYrCbfB84Uqzp609hje=je2GC=Egwxe-FWVPv3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] hw/core: loader: Setting is_linux to true for VxWorks
 uImage
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Mar 2022 at 08:38, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> VxWorks 7 now uses the same boot interface as the Linux kernel on
> Arm64, PowerPC and RISC-V architectures, except Arm. Add logic to
> set is_linux to true for VxWorks uImage for these architectures in
> load_uboot_image().
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/core/loader.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index ca2f2431fb..af14b377f1 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -697,6 +697,21 @@ static int load_uboot_image(const char *filename, hwaddr *ep, hwaddr *loadaddr,
>          if (is_linux) {
>              if (hdr->ih_os == IH_OS_LINUX) {
>                  *is_linux = 1;
> +            } else if (hdr->ih_os == IH_OS_VXWORKS) {
> +                /*
> +                 * VxWorks 7 uses the same boot interface as the Linux kernel
> +                 * on Arm64, PowerPC and RISC-V architectures, except Arm.

"on Arm (64-bit only), PowerPC and RISC-V architectures".

thanks
-- PMM

