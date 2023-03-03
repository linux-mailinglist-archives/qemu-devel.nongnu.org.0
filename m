Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 919AA6A9439
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 10:35:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY1oW-0006OD-0K; Fri, 03 Mar 2023 04:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1oT-0006EF-EW
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:34:53 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pY1oR-0003nv-J8
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 04:34:53 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso860387wmp.4
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 01:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677836090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e4YsFMpNkyRrB189mJ3hQXPF7xdS8Cewo8PVyyAr4AM=;
 b=QaMi9qQm9fnkH1R97P7XC/aW6ZRc0DA16b33LgacyF5mJ8ic+uXBCwGgUwOuugHiPY
 7nYOXrvRkcxV4nZdNObUqoWYffaJ4Zb4ChbCXvWKJOnICcq5VcDwa0Zr1qYEB6m01+UI
 ZCW4YoTkS5akZfVBOmUfL3XVhaSwcRp23MqkduEiomPK104KYbXAF56cZwTBMxsgFynH
 27rUoc5FocFVbJA79sE7dsqEAnM68MK/KjcH9T92g8bP3kSDZgdg0kz+BUduLROaVHEg
 lbnIGra2UNpR5jrGD9LTWUjujdtKuw2JQrN+Z6fm6KX9xNgkg/n7Z5MPth9nVIIMzScl
 mdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677836090;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e4YsFMpNkyRrB189mJ3hQXPF7xdS8Cewo8PVyyAr4AM=;
 b=YEs3swDUMhsRRfgWfQ8p88s1NKWN7PPlkaNmWIOYCaJxoIU62ZqgBrPe6Oly3zEI7R
 6KaxUrCUCQFETsiE/vqqafEVuA5VQuzimIGqGX+cYyeUJsr184EXvSOUN9HhHhsWfns4
 yyG8eB+dVRAgneMxoxV+Oe8EyJbiJFRS3cOAS4hB0XY+5U5GIgEvrsbx9oe4PuEhWCVi
 1eQ0FagzTndsdh10+KntYdwo0+lL3psG8L8ZTh5442nXmmqLj6Ztbl6RX10xz84EcdS1
 ggPOUCwVxKTt9yYSlGialJhuJ42JN0tbZ7QDf2m+ZWmDDNVnFvlzIfAPfW+OHgzTC6SM
 /Kww==
X-Gm-Message-State: AO0yUKXpAMoI2pc03grAiWnAA4L8l4+BpNasQxcLRSNAK89Sd4TWTQow
 eLit6G/TWCaUni8Hezz+/oOjiQ==
X-Google-Smtp-Source: AK7set/m+FRi+8NX1UaH2Cqo9H6a97nAb3GrlCgfVp429HswyRwpEihlVpvPIo3M3hxvVo70oQ71tw==
X-Received: by 2002:a05:600c:3b11:b0:3df:fbc7:5b10 with SMTP id
 m17-20020a05600c3b1100b003dffbc75b10mr1017221wms.0.1677836089914; 
 Fri, 03 Mar 2023 01:34:49 -0800 (PST)
Received: from [192.168.59.175] (180.red-88-28-30.dynamicip.rima-tde.net.
 [88.28.30.180]) by smtp.gmail.com with ESMTPSA id
 x8-20020a1c7c08000000b003eb2e33f327sm8987812wmc.2.2023.03.03.01.34.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 01:34:49 -0800 (PST)
Message-ID: <93a2b734-d3b1-27e8-32f4-d46342dc6b00@linaro.org>
Date: Fri, 3 Mar 2023 10:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2] vfio: Fix vfio_get_dev_region() trace event
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
References: <20230303074330.2609377-1-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230303074330.2609377-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 08:43, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> Simply revert 'x8' to fix the typo and remove the ending '8'
> 
> Fixes: e61a424f05 ("vfio: Create device specific region info helper")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1526
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/vfio/trace-events | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> index 669d9fe07c..28e82541a2 100644
> --- a/hw/vfio/trace-events
> +++ b/hw/vfio/trace-events
> @@ -117,7 +117,7 @@ vfio_region_mmaps_set_enabled(const char *name, bool enabled) "Region %s mmaps e
>   vfio_region_unmap(const char *name, unsigned long offset, unsigned long end) "Region %s unmap [0x%lx - 0x%lx]"
>   vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Device %s region %d: %d sparse mmap entries"
>   vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
> -vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
> +vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%08x"

8 digits might be over-engineered, but at least is future-proof :)

$ git grep -E 'VFIO_REGION_(SUB)?TYPE_' linux-headers/
linux-headers/linux/vfio.h:322:#define VFIO_REGION_TYPE_PCI_VENDOR_TYPE 
(1 << 31)
linux-headers/linux/vfio.h:323:#define VFIO_REGION_TYPE_PCI_VENDOR_MASK 
(0xffff)
linux-headers/linux/vfio.h:324:#define VFIO_REGION_TYPE_GFX 
       (1)
linux-headers/linux/vfio.h:325:#define VFIO_REGION_TYPE_CCW 
        (2)
linux-headers/linux/vfio.h:326:#define 
VFIO_REGION_TYPE_MIGRATION_DEPRECATED   (3)
linux-headers/linux/vfio.h:328:/* sub-types for VFIO_REGION_TYPE_PCI_* */
linux-headers/linux/vfio.h:331:#define 
VFIO_REGION_SUBTYPE_INTEL_IGD_OPREGION   (1)
linux-headers/linux/vfio.h:332:#define 
VFIO_REGION_SUBTYPE_INTEL_IGD_HOST_CFG   (2)
linux-headers/linux/vfio.h:333:#define 
VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG    (3)
linux-headers/linux/vfio.h:341:#define 
VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM   (1)
linux-headers/linux/vfio.h:350:#define 
VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD     (1)
linux-headers/linux/vfio.h:352:/* sub-types for VFIO_REGION_TYPE_GFX */
linux-headers/linux/vfio.h:353:#define VFIO_REGION_SUBTYPE_GFX_EDID 
       (1)
linux-headers/linux/vfio.h:402:/* sub-types for VFIO_REGION_TYPE_CCW */
linux-headers/linux/vfio.h:403:#define VFIO_REGION_SUBTYPE_CCW_ASYNC_CMD 
        (1)
linux-headers/linux/vfio.h:404:#define VFIO_REGION_SUBTYPE_CCW_SCHIB 
        (2)
linux-headers/linux/vfio.h:405:#define VFIO_REGION_SUBTYPE_CCW_CRW 
        (3)
linux-headers/linux/vfio.h:407:/* sub-types for 
VFIO_REGION_TYPE_MIGRATION */
linux-headers/linux/vfio.h:408:#define 
VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED (1)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


