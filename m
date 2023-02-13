Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE31694700
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 14:29:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRYtB-00084Y-Vb; Mon, 13 Feb 2023 08:29:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYt9-000848-G3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:28:59 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRYt7-0007Mm-SQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 08:28:59 -0500
Received: by mail-wr1-x42f.google.com with SMTP id a2so12225132wrd.6
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 05:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uLxFP/vrJGhXSrnfyTl+dsgXn+ix9/gHnbMY8oLEzJM=;
 b=qOkP3l5H9IaatkupCLJnp87TLO5FoJ8aASWBCUvu8FtUUadgdZOUTj4EXhTV9kXBBN
 rC2GF/AAWgmrYzRRTRzvU4ktlKfoLNONQbhd5DllgwAxzkfoQyU86LqsJ62agws1L2qd
 O3nMo+UooHBvHr6fpbexfyOPoAwnjnBjcSaSlAwvIHzuHv6AB3ZicJwgVcM1C0MS7zn0
 mUpOrwuUKtn0ECjLsHAea9mP06TNDdqw/vwmuTQkyAxob2t1JC9IrnSbU5typbtRRkAb
 9c6Ygqr+jR2w97BOCQDypOp3NeIcNCMcG8yja+Dj5YuHqVnngCoENu5XwdT5ICWsz4Nb
 QxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uLxFP/vrJGhXSrnfyTl+dsgXn+ix9/gHnbMY8oLEzJM=;
 b=1dCTXkSzTPX7SQYjzX6VKxBbNR0C+PpoipPsXxuYmEu0HcExbOfU+F7EaASYQgv4SI
 i22lETNhirvQyRpvEB7Tl/xNE11+wNkJTbG4ehiD5W4cSfnMzMT174quT+t11f4fOxTN
 txk8Kljfed+tZccuNkv1ywcSYoUGDsUUb8pCVt3I/uXYHruYc1udmgASptV+qHWFhfiX
 qeSXf2iznxNdMcEN5Sm4TFbnwi7KyawdFwmTUJIyy4dY0lIKCx28tAWYKh7cIiPpJCkQ
 o7XwaAekSUAeOBXXdck5lvOMriVR5ifYSGm9sWZ+gfQF9DXbJqrTFrxYGiW2sSN4cRJG
 sQ3A==
X-Gm-Message-State: AO0yUKUNbikcxQV3zZk9ZPITwwPh87OM2EsX/FzHD06uEQvrHAYoE0Os
 GDbt88tjzKhkffZGPiEVGrKsgw==
X-Google-Smtp-Source: AK7set8q/8/kk71mLBxrL2ZtgRXQ5SVWHJQpyID01Wi+QVrpzLRtyhD/sHAC2Dn6K54dGRvjzs3Wvg==
X-Received: by 2002:adf:db05:0:b0:2c5:4aea:d121 with SMTP id
 s5-20020adfdb05000000b002c54aead121mr7690451wri.15.1676294936313; 
 Mon, 13 Feb 2023 05:28:56 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m18-20020a5d6252000000b002c3dc4131f5sm10667093wrv.18.2023.02.13.05.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 05:28:55 -0800 (PST)
Message-ID: <0a17a258-2eef-38e9-5446-1eff19320c44@linaro.org>
Date: Mon, 13 Feb 2023 14:28:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [RFC 34/52] i386: Rename variable topo_info to apicid_topo
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
 <20230213095035.158240-35-zhao1.liu@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213095035.158240-35-zhao1.liu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
> Since X86ApicidTopoInfo is only used for APIC ID related work, the
> common variable topo_info of X86ApicidTopoInfo type should be also
> renamed to better suit its purpose.
> 
> Generic topology access should be obtained from MachineState.topo
> (for the whole machine) or CPUState.topo (for the current CPU), and
> apicid_topo (X86ApicidTopoInfo type) is only used to collaborate with
> APIC ID.
> 
> Co-Developed-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhuocheng Ding <zhuocheng.ding@intel.com>
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/i386/x86.c                |  38 ++++-----
>   include/hw/i386/topology.h   |  76 ++++++++---------
>   include/hw/i386/x86.h        |   2 +-
>   target/i386/cpu.c            |  71 ++++++++--------
>   tests/unit/test-x86-apicid.c | 158 +++++++++++++++++------------------
>   5 files changed, 173 insertions(+), 172 deletions(-)

The 'id' suffix doesn't add a lot of value IMO. Anyway,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


