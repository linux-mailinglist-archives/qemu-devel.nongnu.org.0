Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746B8468698
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Dec 2021 18:38:02 +0100 (CET)
Received: from localhost ([::1]:37560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtYz3-0007FC-Iw
	for lists+qemu-devel@lfdr.de; Sat, 04 Dec 2021 12:38:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYxv-0005rQ-Tw
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:36:52 -0500
Received: from [2a00:1450:4864:20::333] (port=41846
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mtYxu-0006zy-3T
 for qemu-devel@nongnu.org; Sat, 04 Dec 2021 12:36:51 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so4672214wmb.0
 for <qemu-devel@nongnu.org>; Sat, 04 Dec 2021 09:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QM8XfpFTRZv3FDb/PCZlEyDIyiFkrsmSgkIyDbWi78=;
 b=MJl4/Fg184hYBSU2sksRvGLPCn5LrnI8E5Qdpyc1+E/F2TakwFbad5YmAsd5MGvDA2
 F/fWUEh26h3I0f69y9EdNOGr8k2Ovhwqs3+zzyu7lSg3i1rlsaQ0qcj14YDhk48jbFMh
 2/3L5mkKJPUFOWxREBd7mspCml341mHOgp+svE3rNZ3yxaw2DHzlZWIvq25WuGMGM4lu
 zjKaG/9MO2g3hD07dLssEal5KXLaP0k/jUwtBgb4k0JZbp5D83MuQlFYuJIY8tMFJ+Lw
 4L3SasQKk9It5j6df8+yGVvUmzeFWpGW2EZcTRtZRNeNrafkbILG3WSd8+lROhASWnam
 K52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3QM8XfpFTRZv3FDb/PCZlEyDIyiFkrsmSgkIyDbWi78=;
 b=PF440NU58gznx7gSx6GrjKX9PnSyvn9q7yVfGko9Er65B5gqRLEO6uFIZfuLdQeG40
 6N8AihFLDzItFcgPy4aR0tQxUja/XD0U325VPMlDU/uBpKThtq+R4ziP1IxLDtA8NkO1
 BiRPsdqAxjI/hQC94R0b24oQlPYtphFM19hPQ8M73AHhnaMDgdjoHZfQWiwyMfxfQLwM
 Y2LrZTzySPDuZRAbbXgR5Wv8qnHgITHfnZkGPgOrPWfINr266Jh94K0/ACN0x8hMenzb
 yxWGdfoGGa7VSF0hmpGj4D+b9/VjgD2fY+C9CWEaDIuMy3Xf49/N5y1zTDfukCG09EDi
 WqOg==
X-Gm-Message-State: AOAM5314ms/arz7wd50tBx7VKR+/Ph0qi0hX61XxXyBgTh2iwFAJ5tfE
 G8ELBM89LRpNgllY7nhw4oI=
X-Google-Smtp-Source: ABdhPJzJPSkryGkqaHeT3El+JYwiPBhLrWCJvhBrEUma7t/K3CWcUgm7B+Rrc82M6LD+Me1ehL6ERw==
X-Received: by 2002:a05:600c:b46:: with SMTP id
 k6mr25087636wmr.45.1638639408769; 
 Sat, 04 Dec 2021 09:36:48 -0800 (PST)
Received: from [192.168.43.238] (168.red-176-83-218.dynamicip.rima-tde.net.
 [176.83.218.168])
 by smtp.gmail.com with ESMTPSA id k37sm6499151wms.21.2021.12.04.09.36.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Dec 2021 09:36:48 -0800 (PST)
Message-ID: <9b8413dc-8e4d-ff42-aef9-98a187648afa@amsat.org>
Date: Sat, 4 Dec 2021 18:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v13 17/26] linux-user: Add LoongArch generic header files
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1638610165-15036-1-git-send-email-gaosong@loongson.cn>
 <1638610165-15036-18-git-send-email-gaosong@loongson.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1638610165-15036-18-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-1.011,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/4/21 10:29, Song Gao wrote:
> This includes:
> - sockbits.h
> - target_errno_defs.h
> - target_fcntl.h
> - termbits.h
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/loongarch64/sockbits.h          | 11 +++++++++++
>  linux-user/loongarch64/target_errno_defs.h | 12 ++++++++++++
>  linux-user/loongarch64/target_fcntl.h      | 11 +++++++++++
>  linux-user/loongarch64/termbits.h          | 11 +++++++++++
>  4 files changed, 45 insertions(+)
>  create mode 100644 linux-user/loongarch64/sockbits.h
>  create mode 100644 linux-user/loongarch64/target_errno_defs.h
>  create mode 100644 linux-user/loongarch64/target_fcntl.h
>  create mode 100644 linux-user/loongarch64/termbits.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

