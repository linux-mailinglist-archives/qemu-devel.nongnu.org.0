Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427C36EAC40
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 16:05:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pprMp-0003dp-Kt; Fri, 21 Apr 2023 10:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pprMn-0003dX-FD
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pprMl-0002gA-Lp
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 10:04:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682085838;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1woYF7pbyM8oL+uuUw130Xlaeec/LmrP6gK7/APd4SQ=;
 b=Djy8SPRn7HzbB1fyy8eyHSShwnftrOr6KoBUuw+ulTCJaR+u3aHXxU11LgM6iwDixrBXC8
 SfG89eMTV6x24IoibwoOKvnlX0PqAPdKqhjDgr26K6VRE1z6+6tTTlDQD8B81w6H6/ZNwd
 44UA5FKYK4yEqugpg3sVQeL2u+Og6kk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197--kTsSWKrN2Cd2d2LvpR28A-1; Fri, 21 Apr 2023 10:03:57 -0400
X-MC-Unique: -kTsSWKrN2Cd2d2LvpR28A-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f18b63229bso28878345e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 07:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682085836; x=1684677836;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1woYF7pbyM8oL+uuUw130Xlaeec/LmrP6gK7/APd4SQ=;
 b=mFk7wXpSWJ7llh4z/sL9Ok8vAI7s0ugc8GYQRC9QwENtTRWJft1uIfDdSeL6k3Yoq1
 1hkoqIGZmaPC8RcuhcDsJaP0UJ5+7QOV5SNewrM3J3+1+An9XicUrqmAY0PeKsI0t2mA
 uj3PtQ2ZhpHYng3919a8iQnXZx42eJ17nBHCneIg0jGmQFCPce83mSSYVShs/K3Gu0tI
 G47AA9EzqwfLYdvO0xbUiv+5/J0xllqL0VlAm8hwjQwjPu1TWCPS/C1eIO2QOI2v5+KF
 ZKQj2RmkDDdJdnhIU85R9koOr8vWgLmbTCNBIul4XbXpKLc8ewTUSn2mTkhVvTG0/kQ+
 FM4A==
X-Gm-Message-State: AAQBX9fEwhCUFHJlu0uPwxMRkVHpSfLQzE+faJR0xN1Y3HjjLW5OlD57
 oLhf2VTNAGj4iyVy9f79pkf0ADey81s6fRSNZEhW2b1Gv+FbKFmgty16rbArg+jIF5JI1i7dAKj
 XWbaRRDb2CsIGr0w=
X-Received: by 2002:a05:600c:5114:b0:3f1:6fb4:5645 with SMTP id
 o20-20020a05600c511400b003f16fb45645mr2240010wms.1.1682085835986; 
 Fri, 21 Apr 2023 07:03:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350awuFhWykuBWWvQZnOoC7kOivEYsdCVFxNz+EK6CldOtv/sWteOTQre57bLz+D8/PSlbrgQGw==
X-Received: by 2002:a05:600c:5114:b0:3f1:6fb4:5645 with SMTP id
 o20-20020a05600c511400b003f16fb45645mr2239950wms.1.1682085835201; 
 Fri, 21 Apr 2023 07:03:55 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-20.web.vodafone.de.
 [109.43.178.20]) by smtp.gmail.com with ESMTPSA id
 w13-20020adff9cd000000b002cea9d931e6sm4469561wrr.78.2023.04.21.07.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 07:03:54 -0700 (PDT)
Message-ID: <9c5833a1-33af-501a-d5ff-b75efc9ae788@redhat.com>
Date: Fri, 21 Apr 2023 16:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Fan Ni <fan.ni@samsung.com>,
 linuxarm@huawei.com
References: <20230420142750.6950-1-Jonathan.Cameron@huawei.com>
 <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 1/2] hw/pci-bridge: pci_expander_bridge fix type in
 pxb_cxl_dev_reset()
In-Reply-To: <20230420142750.6950-2-Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.297, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 20/04/2023 16.27, Jonathan Cameron via wrote:
> Reproduce issue with
> 
> configure --enable-qom-cast-debug ...
> 
> qemu-system-x86_64 -display none -machine q35,cxl=on -device pxb-cxl,bus=pcie.0
> 
>    hw/pci-bridge/pci_expander_bridge.c:54:PXB_DEV: Object 0x5570e0b1ada0 is not an instance of type pxb
>    Aborted
> 
> The type conversion results in the right state structure, but PXB_DEV is
> not a parent of PXB_CXL_DEV hence the error. Rather than directly
> cleaning up the inheritance, this is the minimal fix which will be
> followed by the cleanup.
> 
> Fixes: 154070eaf6 ("hw/pxb-cxl: Support passthrough HDM Decoders unless overridden")
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>   hw/pci-bridge/pci_expander_bridge.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
> index ead33f0c05..a78327b5f2 100644
> --- a/hw/pci-bridge/pci_expander_bridge.c
> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -311,7 +311,7 @@ static void pxb_cxl_dev_reset(DeviceState *dev)
>        * The CXL specification allows for host bridges with no HDM decoders
>        * if they only have a single root port.
>        */
> -    if (!PXB_DEV(dev)->hdm_for_passthrough) {
> +    if (!PXB_CXL_DEV(dev)->hdm_for_passthrough) {
>           dsp_count = pcie_count_ds_ports(hb->bus);
>       }
>       /* Initial reset will have 0 dsp so wait until > 0 */

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1586

Reviewed-by: Thomas Huth <thuth@redhat.com>


