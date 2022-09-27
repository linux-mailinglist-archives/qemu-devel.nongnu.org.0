Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053F5EC467
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:27:58 +0200 (CEST)
Received: from localhost ([::1]:50574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAcu-00059l-4V
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od93T-0006pl-Dm
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:47:23 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od93Q-0005qm-GE
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:47:14 -0400
Received: by mail-ej1-x630.google.com with SMTP id 13so20120047ejn.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4rW0xzQSF2NcmC9VW8G5ihjG3KxSEvNbxRcfWvoPUFE=;
 b=aBZ9vaHodLO8UOY75z8GROo6zMRPArLUlzswjvhhU9xm0phjWQppdRRv4jbOcU3T3P
 fe/HXZr6l47I7WSMSx6YyZ1oW3CUTlInpBzI0HKl+kLJZPTMCxW2jP/K7rUzuxcjfgEq
 qeVDUazlVKpMBJwx6cCdMVZJ5lefdjWkhH3j2e2ny/WUIw+p0yZo/HVAGtpF1TmaGmLb
 mVK3WJeIpqoBsrHOnuDVsJCJ7ykQnQcxVirv5IOonP1IiB+8ED2szzGlqpqqFlg2g6hO
 u56Cy8+/Q1ro5wqDVkV+rUQY/URCsld1rs3Lpm0KPW3n4L+nYCmnKxLiSOMO4jNSYwqu
 shBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4rW0xzQSF2NcmC9VW8G5ihjG3KxSEvNbxRcfWvoPUFE=;
 b=8EiQaeGmWDgr96nJ2qwrrF/vmJDj7KPRWnwLxDnCNGLy0ruP9bx1VViJk97Ft69Bpm
 5RCj3lPW+BD3kZSASzZ8EUI+Xx1iHWFx7Z1fRXz8wTMTsfja7FChBycJVycOCTshre7o
 ilRn8m4TjpC9kIH+s7I3tb5ftv5FSgM6KBXICvN52bsGQ728LQPNQW1lJaclYqDirc3/
 /RleXmmlA41WaRA8B3q311gg3P5sEqDg1PDU+CQWLqGNma3nvWGIuglmac5gAAUShHLv
 XsOPXp1/gmafv/hSGUb0OwuYp/tBwH1aeiwh6+KHOWKjM02EUztH7q3rRXQfr9SqMdcY
 8vxA==
X-Gm-Message-State: ACrzQf0HQiIiJqtdERFkdjulHLA2meAxxIJSiptmbz++JAgVhGQpKBDU
 QqtxG8j/rz+sFSc3TveMOuvkWtJzIAOQwREMFf646Q==
X-Google-Smtp-Source: AMsMyM6hwOktXtCE1D+mudXCFnLOp8jMnUOy2AwATh9aisxJdMMdymQALLRH4UIUuRLIDiUTh99nEx6j2hUQY5lj1nk=
X-Received: by 2002:a17:907:728e:b0:782:8e91:64c8 with SMTP id
 dt14-20020a170907728e00b007828e9164c8mr19425852ejc.36.1664279230020; Tue, 27
 Sep 2022 04:47:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-8-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-8-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:46:58 +0100
Message-ID: <CAFEAcA8_mLVgvorF12qBMAW5NoZT2mXAzjfavCbDtcZjzcprow@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] hw/arm/virt: Fix devicetree warnings about the
 virtio-iommu node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The "PCI Bus Binding to: IEEE Std 1275-1994" defines the compatible
> string for a PCIe bus or endpoint as "pci<vendorid>,<deviceid>" or
> similar. Since the initial binding for PCI virtio-iommu didn't follow
> this rule, it was modified to accept both strings and ensure backward
> compatibility. Also, the unit-name for the node should be
> "device,function".
>
> Fix corresponding dt-validate and dtc warnings:
>
>   pcie@10000000: virtio_iommu@16:compatible: ['virtio,pci-iommu'] does not contain items matching the given schema
>   pcie@10000000: Unevaluated properties are not allowed (... 'virtio_iommu@16' were unexpected)
>   From schema: linux/Documentation/devicetree/bindings/pci/host-generic-pci.yaml
>   virtio_iommu@16: compatible: 'oneOf' conditional failed, one must be fixed:
>         ['virtio,pci-iommu'] is too short
>         'pci1af4,1057' was expected
>   From schema: dtschema/schemas/pci/pci-bus.yaml
>
>   Warning (pci_device_reg): /pcie@10000000/virtio_iommu@16: PCI unit address format error, expected "2,0"
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 2de16f6324..5e16d54bbb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1372,14 +1372,15 @@ static void create_smmu(const VirtMachineState *vms,
>
>  static void create_virtio_iommu_dt_bindings(VirtMachineState *vms)
>  {
> -    const char compat[] = "virtio,pci-iommu";
> +    const char compat[] = "virtio,pci-iommu\0pci1af4,1057";
>      uint16_t bdf = vms->virtio_iommu_bdf;

PCI_DEVICE_ID_VIRTIO_IOMMU is listed in include/hw/pci/pci.h
as 0x1014, so where does 1057 come from? (This is a hex value,
right?)

docs/specs/pci-ids.txt doesn't list either 1014 or 1057, so
I guess we forgot to update that...

thanks
-- PMM

