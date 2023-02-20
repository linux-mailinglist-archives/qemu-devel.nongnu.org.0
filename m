Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BEE69C5DF
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 08:15:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU0NB-0004g1-37; Mon, 20 Feb 2023 02:14:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0NA-0004fV-1X
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:14:04 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU0N7-0007St-R2
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 02:14:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id bp28so1773875wrb.2
 for <qemu-devel@nongnu.org>; Sun, 19 Feb 2023 23:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FRdaT2BGSqLnZXO2Zi0tP7HPxr/RbYkgZy6QNsqAOxI=;
 b=azZTftO7eWS1xDVJF0Ehrc+m2Tz0wzuq1K16vKG32D4sJ8MDbzCXGutTIltzWjrYgS
 YQJxzCCPFSHh+TsETBPn1ccD3bDwC5Ud/pW9eXkEENamEXOCH1v0e3nFIx0hrDsY4Qm4
 O1I86/cWB7WdjXsOAxIdYJS8vKzgBAfZqHI5t4v57youf+Ept/v2DwKt2uk4tjuwQZp5
 E0NlzDBdavB6vSAHI8XwQcWUEwq32JRS3DXSj4S0b6qr4cHWkyWrojYvHsPT/YDD5eS0
 Dv8yXTlvsk3kt4tJs0e4a1uiXf6KPf70tf3pH4bR0idliRpy5zjDc1mimntzYEV9VrS7
 5BXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FRdaT2BGSqLnZXO2Zi0tP7HPxr/RbYkgZy6QNsqAOxI=;
 b=rHTf41eN/Fj8K7FukdSdG3PK0BaSxNG2QkPPVKlrRc0LifWzmckbxVha8YnnCS1ZGE
 oj+cp+e8m1ySrabIimmxGj79GoFi6STjrxC3cmmxO52TO6lh34HHbubFk8LdQHB/8nBa
 3bHXnrKjY1ezOJjm1MXqnZc7zGJIDzV/lCq64IW9ASKCb2WrR8CJ8IHg3Hdv4YIhXG1a
 Idm1O81x5SM6d8+nKiffx3gqooqAwq0A8Sql6/3q4b+LLerRZ/QlRJcJls1RUCbOHGhH
 6SfTC1Kq+kA9Zt6Fq4sawP8w9gt+8U8C4MZ/6tl7eG6/gv8dsXrTXvv+p/qhb20frafR
 sG1g==
X-Gm-Message-State: AO0yUKWj3m+5M4rMHA0DRfEyBkr5pTj6uDPvuqQji8LaeV6E062ZceMS
 7asrKvlNk5V3jjfWXJ5U4gdAUQ==
X-Google-Smtp-Source: AK7set8GX/VEj0IAT3e5kShqwCfSACg1TpdND6ylbJVIfu+4OQUkhfbkivJ72G839kaE3+lbdJdKFQ==
X-Received: by 2002:a5d:4e8d:0:b0:2c5:519d:7993 with SMTP id
 e13-20020a5d4e8d000000b002c5519d7993mr1969032wru.27.1676877239596; 
 Sun, 19 Feb 2023 23:13:59 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 e4-20020a5d5004000000b002c5706f7c6dsm11223875wrt.94.2023.02.19.23.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Feb 2023 23:13:58 -0800 (PST)
Message-ID: <395e6119-83e4-b8bf-fb7a-e09131ed74de@linaro.org>
Date: Mon, 20 Feb 2023 08:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] xio3130_downstream: Add ACS (Access Control Services)
 capability
To: wlfightup <wlfightup@gmail.com>, mst@redhat.com, marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20230131063013.65588-1-wlfightup@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230131063013.65588-1-wlfightup@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

Hi Paul,

On 31/1/23 07:30, wlfightup wrote:
> When vfio-pci devices are attached to the downstream, pcie acs
> capability may be needed, Consistent with physical machine.
> 
> It has been tested in our environment, and pcie acs capability
> is required in some scenarios.
> 
> Claim ACS support in the downstream port to allow
> passthrough of individual functions of a device to different
> guests (in a nested virt.setting) with VFIO.
> Without this patch, all functions of a device, such as all VFs of
> an SR/IOV device, will end up in the same IOMMU group.
> A similar situation occurs on Windows with Hyper-V.
> 
> Signed-off-by: wlfightup <wlfightup@gmail.com>

Please use your real name, "Paul Schlacter <wlfightup@gmail.com>"
See https://www.qemu.org/docs/master/devel/submitting-a-patch.html

Cc'ing VFIO maintainers.

Regards,

Phil.

> ---
>   hw/pci-bridge/xio3130_downstream.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/hw/pci-bridge/xio3130_downstream.c b/hw/pci-bridge/xio3130_downstream.c
> index 38a2361fa2..2017cf42a3 100644
> --- a/hw/pci-bridge/xio3130_downstream.c
> +++ b/hw/pci-bridge/xio3130_downstream.c
> @@ -40,6 +40,8 @@
>   #define XIO3130_SSVID_SSID              0
>   #define XIO3130_EXP_OFFSET              0x90
>   #define XIO3130_AER_OFFSET              0x100
> +#define XIO3130_ACS_OFFSET \
> +        (XIO3130_AER_OFFSET + PCI_ERR_SIZEOF)
>   
>   static void xio3130_downstream_write_config(PCIDevice *d, uint32_t address,
>                                            uint32_t val, int len)
> @@ -111,6 +113,10 @@ static void xio3130_downstream_realize(PCIDevice *d, Error **errp)
>           goto err;
>       }
>   
> +    if (!s->disable_acs) {
> +        pcie_acs_init(d, XIO3130_ACS_OFFSET);
> +    }
> +
>       return;
>   
>   err:
> @@ -137,6 +143,7 @@ static void xio3130_downstream_exitfn(PCIDevice *d)
>   static Property xio3130_downstream_props[] = {
>       DEFINE_PROP_BIT(COMPAT_PROP_PCP, PCIDevice, cap_present,
>                       QEMU_PCIE_SLTCAP_PCP_BITNR, true),
> +    DEFINE_PROP_BOOL("x-disable-acs", PCIESlot, disable_acs, true),
>       DEFINE_PROP_END_OF_LIST()
>   };
>   


