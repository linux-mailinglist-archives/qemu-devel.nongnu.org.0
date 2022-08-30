Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49A5A6352
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:29:25 +0200 (CEST)
Received: from localhost ([::1]:51210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0Mu-0003K8-AT
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0Ga-0004SI-Lt
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:23:09 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:37741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0GZ-00015J-1A
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 08:22:52 -0400
Received: by mail-pg1-x531.google.com with SMTP id bh13so10522030pgb.4
 for <qemu-devel@nongnu.org>; Tue, 30 Aug 2022 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=d79T3r+QbfAIOUrw6kQa03k0z2PJfETRZaP3a/azmpg=;
 b=cpG6Uz3ZH4jUTFLaCNpNY1h4i1vFB4haWPCaF7JaVhOBiMj/TAELMJOkpsZiLzJYdJ
 IDhJ7EcSUKw4U1fmXc7/jWjNrjms2Y6DxuB1TOjfpaKHyar2Ebh8HL23b66EbzFLScp+
 gu5EM0KF6pJgrDLGr/l1RlM85gYizJW/pteww6B4FUC5CDdbiK4cwY0xOnSVm9olcQL2
 v044nwdjDnoBYAzzjUVNZDMu/mp5S8QZEuxH2+Gsi+GpI+zzpm07Mm+nyZYRynXoHvPH
 2ecMvXcxBacNCn6LD87umNLlF4m7XmSllP0XAlcXF+DSZR3e7dnVMeXOrkHJX2Xb0l7I
 qJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=d79T3r+QbfAIOUrw6kQa03k0z2PJfETRZaP3a/azmpg=;
 b=zjJ4GSwllN5+r/xiNuEW0TwHcp92Y7LqhySTfgB57FHkPCGH5pnh56xJkm5OFFm1XU
 3KRif47Z0eVO1x7NLBxNOH6IHY4a4a3Km+4/B9l3/CViLrm6woG9hyQznk5zVmJs49Mm
 iVm4WnMc0iSfLfCiQVIUzxx6HVBsEc0l/tSH2kScLcDSqq5HtjdeiT8bghiFiEmzp17C
 SdbTnAVfMLUchq9Vtqxt03rblkeCkzXs1h+BYhCVZXPMuiYiHYSy2gV6ZqrS1U9tnLaU
 Yqeug87MiVOanOPkPmnkl3U/sB0f5ebHoOUjYHlmjBB5Z2CagRJIuuNjdgrYWU2iVnqT
 kJmg==
X-Gm-Message-State: ACgBeo2xdG5pDhvwFGshFV782vwe5RA6b43vzGsCSTzaNQkafkxeb73f
 fE34eBS3mrHh6WCBZEx+gcI=
X-Google-Smtp-Source: AA6agR5gplY/fiBFwI0FnLvpkyGvOIC0e9V0NyR9eHxVvfyEbe0NcG8/sMYwLN6/ygjft5iaY6TtNA==
X-Received: by 2002:a63:4142:0:b0:42b:5b22:f2fc with SMTP id
 o63-20020a634142000000b0042b5b22f2fcmr18346632pga.573.1661862169198; 
 Tue, 30 Aug 2022 05:22:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a17090a284400b001fd81970d1fsm6389280pjf.47.2022.08.30.05.22.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:22:48 -0700 (PDT)
Message-ID: <cb58cf0b-7b1a-916b-d0e9-70ed9daaa704@amsat.org>
Date: Tue, 30 Aug 2022 14:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/3] util/main-loop: Avoid adding the same HANDLE twice
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: Bin Meng <bin.meng@windriver.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20220824085231.1630804-1-bmeng.cn@gmail.com>
 <20220824085231.1630804-2-bmeng.cn@gmail.com>
In-Reply-To: <20220824085231.1630804-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 24/8/22 10:52, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Fix the logic in qemu_add_wait_object() to avoid adding the same
> HANDLE twice, as the behavior is undefined when passing an array
> that contains same HANDLEs to WaitForMultipleObjects() API.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v3:
> - new patch: avoid adding the same HANDLE twice
> 
>   include/qemu/main-loop.h |  2 ++
>   util/main-loop.c         | 10 ++++++++++
>   2 files changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

