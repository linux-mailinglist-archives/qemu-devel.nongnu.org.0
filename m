Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23733A698F
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 17:04:59 +0200 (CEST)
Received: from localhost ([::1]:55810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lso94-0003g5-Tn
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 11:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lso7f-0002LP-6i; Mon, 14 Jun 2021 11:03:31 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lso7a-0005Dq-6r; Mon, 14 Jun 2021 11:03:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 m41-20020a05600c3b29b02901b9e5d74f02so166409wms.3; 
 Mon, 14 Jun 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nPilWeX4Q/XwbpuRQ6BJZhLRkRqu22D11UgWcv2Br0g=;
 b=hsJfvmWxX+/VpKZwtA7z+JqS5/ZgyZDibx14b4q7abnSMcROvoYzoLr9gGTxk1mFAf
 cc82IrNgrhehnpojrbS/RGKOwGudBdUYUylGdHbulBGi4lHUyUC3RQ7XkEu4UBjy8Siw
 LzccyczJBPKyxUbO5nqULDwNQH/tkDWvwBwx3kuOlOti0efZnBgnPuAQ9kBSoOuXEGmc
 R7USshuAi3oeW6BMmGNrhG4ojhJMZC7t/uO4ZQgFBkcjkD51zH7/IxDbblyLqceU8GO2
 wNY/Jg5VWTppSnFb+K9I3eMKIO2+jJyErv/msVicYlj7LnqBlJDU48ynLBV0nHPMe4hb
 RdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nPilWeX4Q/XwbpuRQ6BJZhLRkRqu22D11UgWcv2Br0g=;
 b=VOJE0TI87AXsSgoonddhX2z5XBoX5sdO81okMbx7mcy0jybj6jQAww/l9G5TRs1Kya
 Gytfy5B+WR+sGFb3V5JDxHraa0yMRPObigh1Dlj25Na5HX3bB8VWQ9NYwCfYQJgmrV8I
 oYNsjFsE17c5zYzat3fN4sp7T9gjV3kx9KDNUbwnC3tOKC5e/P8KepFk3MXvQoj6KA12
 w43NAuLOMYIntadUBpRsJA6kInx0ItzGRSetJ7o9+aMRF5fE0HNU2AftMhQD02QyQQY/
 TUA7BVdB0/n0vX+XZgeUHu0JkitnJP9SlWybhaEjqpHddHxn/UuZH2Q/Kyc9xkQQQZCc
 yKjg==
X-Gm-Message-State: AOAM530IFsFHZWcMoAxepZ/0542O4jhWbq7r62JknAXF/dTTY9azVK4w
 z6HP00/K26zy5+EhWHP/mBo=
X-Google-Smtp-Source: ABdhPJxy5BKKhEYdyg8Zivu3q1HygJliPxGoiIVXA5RczKiG3C6IgNBgYKe7BPqNGI6oHc+ea7ntBw==
X-Received: by 2002:a05:600c:4ecc:: with SMTP id
 g12mr33809816wmq.40.1623683004200; 
 Mon, 14 Jun 2021 08:03:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l16sm20887213wmj.47.2021.06.14.08.03.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 08:03:23 -0700 (PDT)
Subject: Re: [PATCH v2] linux-user/trace-events: fix minor typo in format
 string
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210614144245.17660-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <19ad42a0-1105-2380-24dc-65c0d67edbd5@amsat.org>
Date: Mon, 14 Jun 2021 17:03:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210614144245.17660-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/21 4:42 PM, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - fix typo in summary :-O
> ---
>  linux-user/trace-events | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

