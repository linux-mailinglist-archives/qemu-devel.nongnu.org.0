Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4851EB29
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:00:04 +0200 (CEST)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnX9P-0004qC-Gk
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:00:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX7q-00047N-R6
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:58:26 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnX7p-00060I-6N
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:58:26 -0400
Received: by mail-pl1-x631.google.com with SMTP id c11so10946014plg.13
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=oE4fzb0Wzfml+GR2tsOZlJtqkUBAPu1z6BXQ7ljhQWs=;
 b=D9r6GKIfhWeFu8CmHUQ01H4tsulW6kRuO8Rh7MGYoxBbS3RuONupMPJRmAiNfvmdfp
 cxT9PxqHzQ8HDXrCORUZ9omxBveS3qEeZAHo9OAqYYwxqs+gQepjobU89RFm+9enhOsK
 LiTiQt+JTGS8kff8qoGVk86nPDvlXksSAVdtk+qzeFpb2elDjmE9oZFF7Z7jO5idmkGb
 IxmjS7MgqXGy8HUtPEJiiYV+LDN2ZiTXRT2bA7sJHfzyiIM0FnJ1k2EGSAOHDw380gym
 FXbY6Tc28wvjjdaJyOAP1zIWKEUDKuCeOKZo3+pQWNv6nUn1XUytE98iFLHjdpD45dla
 O1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oE4fzb0Wzfml+GR2tsOZlJtqkUBAPu1z6BXQ7ljhQWs=;
 b=X8wA3yIcre4Tna95xjpxUL1nU84u2oslpzcHfjc1/l3LG8r6g82bQB8up06bVVijqo
 16FZpEk/dNbKm+/K0oIhKYhJIB+L9d3xQX4p4wOilq/t8e64+iVEVz7txUMbFX8A7/WQ
 pq8nErMI6DFxzQUkHrBDhaEXniZqj9BcdgMe+X3/omfV7+hi3x/wb79LyYtfHfhHey0+
 UBoyV58bqNukarRI72AXzn78GrxqKXxbX3hwNciOgpdcPbOERHeT9itvBhfh4QxVtzW1
 +qylEA37OZ9kOO4tTL+NVI4C+c23BOJf5gGNBTKmRW/wdS38P63OqB33zpiCFoE6p3qp
 qkzQ==
X-Gm-Message-State: AOAM533VGVCNG3u9LFjNjKtcg69TdJqpuskOO99t1N5+PUrdvCxYuWed
 tm21Y3i8aUfiKnTV+r8+mDHPvw==
X-Google-Smtp-Source: ABdhPJy0oe3oFFMWWGPhL6rlIELZeru9d4hRe5ClOYPW/PxG5eQJHUHn9HfJzYAU6bV9EJhmI0WaxA==
X-Received: by 2002:a17:90a:bc8a:b0:1db:382d:6fb5 with SMTP id
 x10-20020a17090abc8a00b001db382d6fb5mr19814935pjr.100.1651978703579; 
 Sat, 07 May 2022 19:58:23 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 i10-20020a17090332ca00b0015e8d4eb265sm4341611plr.175.2022.05.07.19.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:58:23 -0700 (PDT)
Message-ID: <2381f1af-acf0-8a72-07e2-2c91d86dd2f7@linaro.org>
Date: Sat, 7 May 2022 21:58:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 40/50] lasi: use numerical constant for iar reset value
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-41-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-41-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
> This is to allow us to decouple the LASI device from the board logic. If it is
> decided later that this value needs to be configurable then it can easily be
> converted to a qdev property.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/lasi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

