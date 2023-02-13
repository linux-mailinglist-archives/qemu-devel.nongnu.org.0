Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A408E6946FC
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:27:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYrp-0007Ja-Az; Mon, 13 Feb 2023 08:27:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYrb-0007Iw-Tv
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:27:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYra-0007Dk-9M
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:27:23 -0500
Received: by mail-wr1-x42a.google.com with SMTP id by3so10903321wrb.10
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RJIBKtS/lHTkghuD4YRwfAwG4vCkQ6X1h+pfowf5/Q8=;
 b=ETBUphBKFz4MMxvs6L6pazsau5pA9i+QVzzuCzrTk6mpVudWS3FNpQPbDqtH5FiJej
 N7mI59/xZzg0prXXHwUFusapDaLHhhGhN+eTGvhSNadScKPoQVFMtAaC/sBcgoe1qRlL
 ti+ttBRWZ9sHtoHrfS95CSxt+aVa7+TBGICzU8FDyHL+vfjdO85VczdnYXoayp8XC3qk
 7vCeLuh39J9xSC79rJorUkVJseok0ZFCjejDgZeaBXkX/jWrGK+b34uum/j06QK+Rqd6
 YPCxbVDD5+h/qy6u4DQrXlkVTPfzdF7/6ZCIkxjSR6nZMPi+r6w7+zkg8IfBp49wvNsG
 r5GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RJIBKtS/lHTkghuD4YRwfAwG4vCkQ6X1h+pfowf5/Q8=;
 b=Ks5wl5L0eb/Nf9ZZBea/uWjKlunIeg1KaDtbVtBiNqc5jUUw55mYNGqYpvRRMGsqC9
 SFNFUbqgsDvgF0rg03eGJze5Zin25nTamVaABGJweWUcovCGLVFFqRejOBzNNiJV2vLA
 XLVODcydgKRUwrmRN3YYSOOC+nk5Q2Lvn3ADnSQLmql3kY/VhQVpWPGevVpLdG58KwjW
 ABEtDoE9/nRIzyjMC9PNcPtgtCyrH//cZhTXQuYmpuLHvr6/Pw+bLNi3NVKUM5ViaWRs
 IUdHyLc8yx85Ww41PkIFFJ0mVExc73+5OOUxfMTLxcbvPlTwdPI1EvNQovSpNvEdGUyT
 mm4Q==
X-Gm-Message-State: AO0yUKWGNQLZv70dlJZwC0D1jO1y2Q2ZBIC9xHUMsCyxqndY8K67w3A3
 C8Q0/YAq98algvxDBCYBa7SLJA==
X-Google-Smtp-Source: AK7set+erlPCxb5RzY4HIGBSRiV1SJyGnKRMBj965NN38VsZTDbPWorHWb5Ld+J/H18PWZrzIlVwIg==
X-Received: by 2002:a5d:488b:0:b0:2c3:db9e:4b07 with SMTP id
 g11-20020a5d488b000000b002c3db9e4b07mr19501876wrq.64.1676294840200; 
 Mon, 13 Feb 2023 05:27:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 s11-20020adfeccb000000b002bfcc9d9607sm10458880wro.68.2023.02.13.05.27.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:27:19 -0800 (PST)
Message-ID: <d43f8d3b-2376-5004-ef92-24e3aac36af9@linaro.org>
Date: Mon, 13 Feb 2023 14:27:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 33/52] i386: Rename init_topo_info() to init_apic_topo_info()
Content-Language: en-US
To: Zhao Liu <zhao1.liu@linux.intel.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Zhenyu Wang <zhenyu.z.wang@intel.com>,
 Dapeng Mi <dapeng1.mi@intel.com>, Zhuocheng Ding <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>,
 Sean Christopherson <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-34-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-34-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
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

On 13/2/23 10:50, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Rename init_topo_info() to init_apic_topo_info() to adapt
> X86ApicidTopoInfo.
> 
> Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c         | 12 ++++++------
>   include/hw/i386/x86.h |  3 ++-
>   2 files changed, 8 insertions(+), 7 deletions(-)


> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index ac6f1e4a74af..d84f7717900c 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -98,7 +98,8 @@ struct X86MachineState {
>   #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
>   OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
>   
> -void init_topo_info(X86ApicidTopoInfo *topo_info, const X86MachineState *x86ms);
> +void init_apicid_topo_info(X86ApicidTopoInfo *topo_info,
> +                           const X86MachineState *x86ms);

Maybe s/init_apicid_topo_info/init_apic_topo_info/?

Otherwise,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



