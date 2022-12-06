Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A12D7643EA7
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 09:31:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2TLg-0002ik-IM; Tue, 06 Dec 2022 03:30:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2TLd-0002iV-H7
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:30:41 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p2TLb-0007U1-R5
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 03:30:41 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so13734067wmb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 00:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GMMuCpcIdtii8Pz2Djp902s2hzr98oNeN/v7E17vgAE=;
 b=bev6Sb2vkLjw0L7g3aZu+aOFwWjfeK2ayoiaFszrAm6w1jDkeroJqofedh/hnC4pbq
 Wo2lZbRf2RHpDLPtSOPs0vTVJvNwaQgyEntOtliobZ3RAlNCvMPOsA86CbVzuS3LqqGt
 sC1kaoDdh5ZRH/h14X8hvW1/Qgdc72xeHy0aATDEafgijI4u0cBHwZ72N9S9B59yp5G6
 0Uk95gddHCXbAAjPgZT7JnPXIhT8E/t9XmBymHTNxfvE/HQCMOnvAzDoAILqX1MzE9tZ
 HTl1H2omcjNXqW9nDDh3Q/NzXedR++FPVmZNMGYTjdV/dg8HeXVJUyk4LwQCyyqTfeZE
 2aWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GMMuCpcIdtii8Pz2Djp902s2hzr98oNeN/v7E17vgAE=;
 b=nOrBMWQbpJAiL/dRY0UwHFqmLGgedCbOJdJUSJWUJq2bhdJkfiAIkix/QQoiwafyZ/
 ibReKuzuuly8DdJwKFWrl5nUK8AbdmNrKXaW1PVpRhUdyFH8z0BIup0S5ZXtEK/CXRwg
 Q0uFPVq8bUkdepAOW1mnAF8Rs76G9ctzxFTy1BS+8jcLNuGHpUDYYUQ5khYqvatXwlXA
 djguwQPYBB7/zv48VbEH8SUmyUIa8TTmQMXy7IeN+2VCbOG5a3xGTjbmvxas8G/eNRyw
 +g8tM581fuXVDwmc7XQQ/horUfFeTRCWE0SfpEkUfwuBUh5VtLvRqelA5FHSehqZqjuw
 SA3A==
X-Gm-Message-State: ANoB5pnH01oJAB8n1poReiiqTVGh+m5jl7RlHmWRlbjlGeEX6r2r8jUJ
 mR3v8iwKeowIaGroRc44d09fMw==
X-Google-Smtp-Source: AA0mqf4PbCgLhy15luT3rQRT+I45BNjX9Y6U9VychV9PUt7SNZ0J3ZnPqBe0X7CvQmjesGdCiC8g2w==
X-Received: by 2002:a1c:7715:0:b0:3cf:d18d:3bfe with SMTP id
 t21-20020a1c7715000000b003cfd18d3bfemr64717446wmi.203.1670315437709; 
 Tue, 06 Dec 2022 00:30:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c444e00b003a1980d55c4sm25513247wmn.47.2022.12.06.00.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Dec 2022 00:30:37 -0800 (PST)
Message-ID: <fd68f23b-218e-0d76-972b-a89c612b7e44@linaro.org>
Date: Tue, 6 Dec 2022 09:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] vdpa: commit all host notifier MRs in a single MR
 transaction
Content-Language: en-US
To: "Longpeng(Mike)" <longpeng2@huawei.com>, stefanha@redhat.com,
 mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com
Cc: cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com,
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
References: <20221206081841.2458-1-longpeng2@huawei.com>
 <20221206081841.2458-3-longpeng2@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221206081841.2458-3-longpeng2@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.265,
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

On 6/12/22 09:18, Longpeng(Mike) via wrote:
> From: Longpeng <longpeng2@huawei.com>
> 
> This allows the vhost-vdpa device to batch the setup of all its MRs of
> host notifiers.
> 
> This significantly reduces the device starting time, e.g. the time spend
> on setup the host notifier MRs reduce from 423ms to 32ms for a VM with
> 64 vCPUs and 3 vhost-vDPA generic devices[1] (64vq per device).
> 
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
> 
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>   hw/virtio/vhost-vdpa.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)


> @@ -562,16 +571,25 @@ static void vhost_vdpa_host_notifiers_init(struct vhost_dev *dev)
>           return;
>       }
>   
> +    /*
> +     * Pack all the changes to the memory regions in a single
> +     * transaction to avoid a few updating of the address space
> +     * topology.
> +     */
> +    memory_region_transaction_begin();
> +
>       for (i = dev->vq_index; i < dev->vq_index + dev->nvqs; i++) {
>           if (vhost_vdpa_host_notifier_init(dev, i)) {
>               goto err;

Could we simplify by replacing this goto statement with:

                vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
                break;

?

>           }
>       }
>   
> +    memory_region_transaction_commit();
>       return;
>   
>   err:
>       vhost_vdpa_host_notifiers_uninit(dev, i - dev->vq_index);
> +    memory_region_transaction_commit();
>       return;
>   }
>   


