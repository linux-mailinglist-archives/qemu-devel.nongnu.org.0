Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4556494F2
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Dec 2022 16:44:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4OUE-0001ZA-Dw; Sun, 11 Dec 2022 10:43:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OU9-0001Yn-UM
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:43:26 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4OU8-0006ou-Cl
 for qemu-devel@nongnu.org; Sun, 11 Dec 2022 10:43:25 -0500
Received: by mail-ed1-x52e.google.com with SMTP id a16so9593351edb.9
 for <qemu-devel@nongnu.org>; Sun, 11 Dec 2022 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UT0UhsjjCPuA3tPQb9ZCcyLidSPb7uD9khllTcIHSOE=;
 b=rXR5VEc0MqfzEfu0uqpmrZNNnpSSjYKk5NjltadXY//jJV545WKOfWAdMffAWK+O9J
 YCGE0nhKqJxbz17O+Vi6kHV+m7xKwdgPEqwjtvsdL3wBTEu7uka/qj3FjluB61oPxBui
 +ixGQYqW00uiMK1JfDTAgvP6T/nch+GjXBWTDbqWGsI7tvY1+h47Uyf1y6Z6/ByAnZOB
 rtmt2U5mWCeJjxqTGMXDor5XhGkxoj/kM+adLxTluAP6CdzG5K/INnA5J5k1ZkeeU9d/
 tOi+6pO9qiP9b4lsvn6ysxhgGI9SQtpPxFbMhAF+XlImfDtZPMc1DhCwC/Z4OgMzGpS9
 QiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UT0UhsjjCPuA3tPQb9ZCcyLidSPb7uD9khllTcIHSOE=;
 b=Ab2/s0XnHeBbepDyBcQMRhGa0hiiHnJ3DBYfjJ+rLk9Ge99wvbc97hF0nwsAFWNGHv
 J97tspRkyjLVRxNAlB2yI0GbQ6qpvWAW7ifn/bXYH5axpjXSOugtpgFQXg+6Vd3RVC9Q
 4ZoGpgDX2yzaA/eky+cPXnLIsaAjehTIJLJ16B3RpJBBIJVg7sezPLC/thhkYNTRiWwo
 prMWUA+ZAKjh00e+yy7IhAUdxFOU6TUt9SJUy9xiaN2qhIG1ZoreZ/HyoPTK+R8Z5T1y
 qeJoHS/a4I/zXjdCCav0YAl9j1V2SqzkzyV92ggajjfYzFKr4TAujytd4gocvQEU1aO2
 7d6w==
X-Gm-Message-State: ANoB5pmZUMnTLqMZVkMb2+4a7Nningvet8bQLB0b60cZct/UUTU5oQ+S
 qBaNRBB+sPwqVu5zRByP2x7rFA==
X-Google-Smtp-Source: AA0mqf5A1UjZOmOc6lnUoyPhlGYkSIufC5h2Oaq/bdSxrxfdTa20DIIqz+0C4pNRUdIttAJlQ3tlbw==
X-Received: by 2002:a05:6402:1d8c:b0:46c:c16b:b4c9 with SMTP id
 dk12-20020a0564021d8c00b0046cc16bb4c9mr11883090edb.7.1670773402430; 
 Sun, 11 Dec 2022 07:43:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l4-20020aa7c304000000b0046b1d63cfc1sm2806509edq.88.2022.12.11.07.43.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Dec 2022 07:43:21 -0800 (PST)
Message-ID: <05d190b3-1d48-1ef9-12b9-2759a6dce416@linaro.org>
Date: Sun, 11 Dec 2022 16:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 02/27] target/s390x: Use tcg_constant_* for DisasCompare
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221211152802.923900-1-richard.henderson@linaro.org>
 <20221211152802.923900-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221211152802.923900-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52e.google.com
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

On 11/12/22 16:27, Richard Henderson wrote:
> The a and b fields are not modified by the consumer,
> and while we need not free a constant, tcg will quietly
> ignore such frees, so free_compare need not be changed.
> 
> Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/tcg/translate.c | 44 ++++++++++++++++++------------------
>   1 file changed, 22 insertions(+), 22 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


