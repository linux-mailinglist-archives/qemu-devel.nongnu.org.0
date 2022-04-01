Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218F64EEAA7
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:46:09 +0200 (CEST)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDr2-0003Ck-2Y
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:46:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDOH-00057w-U6
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:16:23 -0400
Received: from [2607:f8b0:4864:20::1130] (port=45169
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naDOF-0006TR-8P
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 05:16:20 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2e6650cde1bso25211097b3.12
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 02:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9neAYDtGx+KQx7nHLS+gmJm8c/U/NChd1rRSg9h859I=;
 b=KsiTDuyzFIfw50oz6n6b0hRTErJPKp19JDp4l6muDYR4e18hwEdWf9qAQl2MtrYrYi
 W796WFgMgxCcT3fA5/U7qSPutaA2lzJoGkSI/RZOrGrpiLGhMpqku7Aof0sdRlLQA1uC
 Dk98jxM+oN4u7dYjDv5pQ0CET4keVreMxokAa/nStk0kHAR1GZvF0jlUN/uFyYy/VO+7
 23tSsduf6h1mfwn+K6f/hKaYv9s5gt9j62FU2CfxUL4zpDQLKSC3zX5dX6AV4h4/cf8u
 wxQxdHnX0B4BmQCz64DTGv3X6jFFVVPdUazlW/JIjyEHz49hImD6GRrWcVyLEPjm9JF+
 g96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9neAYDtGx+KQx7nHLS+gmJm8c/U/NChd1rRSg9h859I=;
 b=jM1/fpybWWAHlRzpAYOZ/Mf+Ct/dOJJe+DVoT3Epl/QHZ1178DWhEDuVQ5f75WwYnF
 dJFC5AHEbYuNDf4CKL5dzeRfrPY2BQm7ui0ljmlACrblkibVzfsnn+xg/7s5AaSxo2R8
 yT5EiWrP2wH1uNb+8XysMAvbYt9g5Gid+PyPmYRwgF9ifvrHnG43hwsexDXHAtTguQ3V
 JSJf+M19uSvylwMQd8yxiUquQADBarI7pAT+WOwFIPLJ4tzbJlU4/vjzICGCEQINHmMn
 wWLXCY+C34MOot9Pgu9cRjEsGIzTja+sBQpPWkfCIBFZdAQAbyU7I1lPPe16QjaDG7DF
 zLjg==
X-Gm-Message-State: AOAM531bBxrIXVG6uO9Jv4mr4GtvtoZ+dxiTu+1+5e9/rOmsWQ0TLm64
 M81F9Y2sMH7HGCsaVmGnpCdCHDttdWyrdP+JX84VrQ==
X-Google-Smtp-Source: ABdhPJynLJtWeDab9ajCYaX/uGn5K8iOzquOPlWXq1l/A5gRDMqBNFkz+dIi4d4g7VD7xgBB6gzouUrNrl7pTT9vxOY=
X-Received: by 2002:a81:a4e:0:b0:2e5:9946:525a with SMTP id
 75-20020a810a4e000000b002e59946525amr8817134ywk.455.1648804577056; Fri, 01
 Apr 2022 02:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220401022824.9337-1-jasowang@redhat.com>
In-Reply-To: <20220401022824.9337-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 10:16:05 +0100
Message-ID: <CAFEAcA96v=11m96pnW6E2LqThrFBFf0OXtNPuXm4g_CwvMxUww@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: correct the value used for error_setg_errno()
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: qemu-devel@nongnu.org, peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 03:29, Jason Wang <jasowang@redhat.com> wrote:
>
> error_setg_errno() expects a normal errno value, not a negated
> one, so we should use ENOTSUP instead of -ENOSUP.
>
> Fixes: Coverity CID 1487174
> Fixes: ("intel_iommu: support snoop control")
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/i386/intel_iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index c64aa81a83..e05d69a2c0 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -3032,7 +3032,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
>
>      /* TODO: add support for VFIO and vhost users */
>      if (s->snoop_control) {
> -        error_setg_errno(errp, -ENOTSUP,
> +        error_setg_errno(errp, ENOTSUP,
>                           "Snoop Control with vhost or VFIO is not supported");
>          return -ENOTSUP;
>      }
> --
> 2.25.1

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

