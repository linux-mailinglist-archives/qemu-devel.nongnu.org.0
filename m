Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9379651EB26
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:54:13 +0200 (CEST)
Received: from localhost ([::1]:54076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnX3k-0007uV-OX
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX1y-00078G-Fz
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:52:22 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX1w-0005NB-UH
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:52:22 -0400
Received: by mail-pl1-x636.google.com with SMTP id x18so10954746plg.6
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PTstqwjUUKvOcyeHmomBAT7qyMoSWLfPKjVGJlxa9jQ=;
 b=OBgAYRghkvtYRl4rAkRp+aH8LVXDqNYSE3Y/7BvE2NC4yYDxKQwZJyddKktaxTpbkZ
 vKARF+ky7VtQXLmGzwFqtUVyuutKIpXaBDTyvyrbN/LDT+r2nFCnqEq9PkQQtNEHvce7
 hmHVpQXPbB1gDlfnG/gJYlmpknhNzbL588SC1TdmUi2KB3GCX+36p2024XEm6hutDktl
 gfzMugHlqWPYDHZbEwXBV33TWm3HmBog9lvYhxJfL8GARGg4e64+d1V2vSfhJy5+mAC4
 +QT9MhqxoN89srWBwGzplOrvgU+D0k5X+3XNSniBVxCoZOoE9CKppwWuHv5mhGgEA4e8
 Tt+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PTstqwjUUKvOcyeHmomBAT7qyMoSWLfPKjVGJlxa9jQ=;
 b=VlDrgBDxfiL7XNcNOCyFUyo7IrjqFp89qk6w2n4F4fO6DDpxdTO+fetqVqRKf9Eong
 tmww80n/R58urUwbu51Jiy6g6w+wBddzuqo63oA8XNIJv72SpJCqewJ6K9GpK+43rACB
 tOk7cMPSZPEbtiMP8z62F80mj+uTTtj6KX8yo312wYnblkGamgkMC/Af8TNoguMoRLO4
 cNsvc5Fz3GhhL3Op+KToNyCkz6TqxkW/cqpY05HLj/2XJTbMERU5TiNEFsWECIPY/0eD
 NQrJhyWJUF8HxGxvd7s8dMC6XnUC/6jNYRpa0ycF6GpIyImmd/u2df3B07tAruP5Caxn
 QeNg==
X-Gm-Message-State: AOAM531NVAEm2rZPTB2UwWeKPNzP/Z4u3Mdz4pRKtcuQ3Io5EONOrE3m
 iemGpqcg4AWEF4FoYjvJm08+ew==
X-Google-Smtp-Source: ABdhPJwXS10XsHakLqr2ujiL8YBqueMeutYifiPC9H5GHnilrOuYH9js8NdS8NWU0gOVmkk/sUY7Fg==
X-Received: by 2002:a17:90a:884:b0:1d9:531c:9cd6 with SMTP id
 v4-20020a17090a088400b001d9531c9cd6mr11395117pjc.211.1651978339386; 
 Sat, 07 May 2022 19:52:19 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 c14-20020a170902848e00b0015e8d4eb205sm4283821plo.79.2022.05.07.19.52.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:52:18 -0700 (PDT)
Message-ID: <7d0e6c9d-4d85-f9e7-ce90-cd38abbb23bd@linaro.org>
Date: Sat, 7 May 2022 21:52:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 36/50] lasi: move PS2 initialisation to machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-37-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-37-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c    | 5 -----
>   hw/hppa/machine.c | 5 +++++
>   2 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

