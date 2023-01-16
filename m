Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6262266B915
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:31:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKts-0006Q7-5l; Mon, 16 Jan 2023 03:31:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKtl-0006Nb-97
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:31:22 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKtj-0001tZ-If
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:31:20 -0500
Received: by mail-wm1-x336.google.com with SMTP id o15so19384715wmr.4
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yi+6umWeh/wQ8iFGMjXHQP++laoWO3hjLzBs/nVNf8Y=;
 b=DBHlRHamZp24VRVoxxGH5b9WPf5/odGZKMD5PmYrINKybjWYM3T1ccBr/v6VkRTwZM
 J1oSoWEq9YU6lBgI2xKCHrmluyydpC9eUBoLa07V8VqEXPXnk1Mgf/6Omlr3iAmmvueZ
 EztESqgwkksW8p2S+gz1Ug24Tzpomk0PdxcBXv3InJEH+gRd0uAgtZ99ypFu/k4M9XRX
 RSaBPkVKfDYB1aCXv236+wOD/8t4ef4CwN+jdrLFfaljKMVPrPguq13asl2uY8JhALq3
 mb8NHRw/1bWoI2cB2FWcDuqnzz0whrNYyixrJ/UKvPJho3KTGP7E/zCdMhIZQl+t94ms
 FX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yi+6umWeh/wQ8iFGMjXHQP++laoWO3hjLzBs/nVNf8Y=;
 b=OoYkbC0lZFcyT+CqqmG+X6VKJEBEuIwePwAkVBNLfmXskk9y0TCddtVxkW9cBvUCHL
 3fYsfwPLbr3DUz9UgGz4IfpLGr3cWps95P/ulrYJwfcxfGQOaYDmsasj3vqdr9RedMcz
 8d+sNbZ+frj//zrvQp3/LVyo+qX3S7b9Td13zClZtctdTY7Pdqo234mW+8j43ZQjMyDP
 +Ty1UVnlA+a0LhWjVoHooF2RlVycAdGMw7oXwD3P2bHRe5DrLMQh/hQXTnSlPBfaaMAv
 hp1Nbq7YZz3HOlN+hSbHjuOWEcZNcKJO9Tj9QP+MbmO0L2RDWlTSQBYWUTZu3MK8eqsY
 0QdQ==
X-Gm-Message-State: AFqh2kqB0am7BQIym9pLeNrhu3KbhCbTpRPymUpwgKne2gHxBGWwHpg2
 CYGTKDL94P/KqA0awN6Ti+gVthKZ2bEoI1D9
X-Google-Smtp-Source: AMrXdXvHLpTlk4AOvh7Qlbze1cmpXo2e9VNV6fThkMsqtF3TsuwnL4i8HnAey12z5O/eaaC0FRliwA==
X-Received: by 2002:a05:600c:4fd4:b0:3d3:4877:e556 with SMTP id
 o20-20020a05600c4fd400b003d34877e556mr68937417wmq.29.1673857877813; 
 Mon, 16 Jan 2023 00:31:17 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm41184209wmq.32.2023.01.16.00.31.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:31:17 -0800 (PST)
Message-ID: <30269eb2-1c3b-50c5-9a5b-d1d19ceb68e4@linaro.org>
Date: Mon, 16 Jan 2023 09:31:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2] hw/net/lan9118: log [read|write]b when mode_16bit is
 enabled rather than abort
Content-Language: en-US
To: Qiang Liu <cyruscyliu@gmail.com>, qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>
References: <20230116031431.1378346-1-cyruscyliu@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230116031431.1378346-1-cyruscyliu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/1/23 04:14, Qiang Liu wrote:
> This patch replaces hw_error to guest error log for [read|write]b
> accesses when mode_16bit is enabled. This avoids aborting qemu.
> 
> Fixes: 1248f8d4cbc3 ("hw/lan9118: Add basic 16-bit mode support.")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1433
> Reported-by: Qiang Liu <cyruscyliu@gmail.com>
> Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
> Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> v2 removes BADF() macro and the "hw/hw.h" inclusion

Thanks!

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/net/lan9118.c | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)

