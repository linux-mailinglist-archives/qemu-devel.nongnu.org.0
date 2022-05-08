Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 510C651EB3B
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:17:39 +0200 (CEST)
Received: from localhost ([::1]:47310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXQQ-0006Ns-FV
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXOq-00056j-Pj
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:16:01 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXOp-0008KM-9w
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:16:00 -0400
Received: by mail-pg1-x52b.google.com with SMTP id a191so9323678pge.2
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=PxIyzaONnoe+sqRlzwys+8aV1yI0mvvbgDyLz+InIjI=;
 b=stgt1PZey3NvW4Ih4Jt53IPsG6W1exvAQR+gBDE1phY9ImLAVtNHLLo+riUgk63R9w
 Z47TwsAy3CWEaZWHGS9oq7ZQQF0+2Miudn4ei3582D5dHiPbQF7L2f9b7wc3rxIAo1Vq
 QwH/9z7MUgmjn9iGmd8f8h3EV1T8hLU8PvbpndF4q8SegkBrcAjR4tmEx5YR2xTUDyfZ
 JGOa2AuVnq5R2lKaT7n9LC8eqiarH/3j1CVBCNjPSCGNxPR7dRlXUeI2dRdISYfrj3pa
 vI4IsL88cu76PiqXH0QdgA5oehlq2N7jifcJKM5eWQgz7npGoGQpVNTIPcBfpib7yXpX
 hpZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PxIyzaONnoe+sqRlzwys+8aV1yI0mvvbgDyLz+InIjI=;
 b=kxWQftKsoXx7o8vByEMuTVb1ixIjTrMv2dBUryO5h1TpdMLiS+u0dPRhMvfmgX/b4f
 neTd4O6lCPU/rc7qtlT3ewmaHpqqpIlcXmIUkpmxx1zI/70KwXAbGxGXt2mf4UhSoXAv
 FXUMPnsy2VYP8xF/pRaRA9TF5JiUvgvkosWMXqljbVEzAnuvk8iC9I7V3ga/jr9xPYrm
 SzIMQ0lUYri3QZCzgm8atN4cZeCDSCeHRrOKCq83RNFF3NQ6b1Y7Na6BE7mZ5n0MQYjj
 uT/XJSqFcbx2fXsw9uvQaSHQ4i2UXHgYSNEKgSMCnN39SmtGY1gJ5FOlCTILjNSkpPpd
 EmSA==
X-Gm-Message-State: AOAM532HfSYfFDhlyWUQkm6kFsv6n4tzZtLFwX57Uj7zlrRY1Vlfro2Q
 xAT3RvpMbkH0u7WAZLOoQw8k0w==
X-Google-Smtp-Source: ABdhPJxgx4MJigMOoGUmcIJ59AXQQ1Ock5JjygWGAqdB/tHUXtbUdLXCR6oZLEaBr0EWZnrxZ6zB0Q==
X-Received: by 2002:a63:6a42:0:b0:3b4:276c:8c3 with SMTP id
 f63-20020a636a42000000b003b4276c08c3mr8225898pgc.337.1651979751916; 
 Sat, 07 May 2022 20:15:51 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 c85-20020a621c58000000b0050dc7628189sm5977731pfc.99.2022.05.07.20.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:15:51 -0700 (PDT)
Message-ID: <493188bc-7ee1-d4fb-7165-1ffd22f03d63@linaro.org>
Date: Sat, 7 May 2022 22:15:48 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 45/50] hppa: remove unused trace-events from from
 hw/hppa
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-46-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-46-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
> Now that there are no longer any devices in hw/hppa the trace-events file is
> empty and can be removed.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/trace-events | 1 -
>   meson.build          | 1 -
>   2 files changed, 2 deletions(-)
>   delete mode 100644 hw/hppa/trace-events

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

