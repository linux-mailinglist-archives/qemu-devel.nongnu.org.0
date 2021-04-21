Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DA0366364
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 03:36:28 +0200 (CEST)
Received: from localhost ([::1]:56580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ1n1-0006wF-78
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 21:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1mC-0006VW-V1
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:35:36 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:34352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lZ1mB-0007gL-AR
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 21:35:36 -0400
Received: by mail-pl1-x62e.google.com with SMTP id t22so20385083ply.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 18:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TgJI0a72rP9OUDE3WC8TFzmdlciwSF7Rc6QwZHpaDIU=;
 b=GEslSv7h3qh2dR6azqrKxTpw1MvYkxKUh8Afnvd3xf2KhKso+//rc67PIPnECh7rYb
 rywhXA+2losDg6cUFYaHNuzFEqwazBj/4Y/BSS4ysl/KlPqV/qBggBl/C1eh7VdSwy6k
 wwsYAw95OMRB3Pb48iE0AIgpHqUoZO2wfmLwHo3H83YtNPsMyufMV5U4curcsNvRTVps
 pIsT4kCWVrDn+8cSIgplxiatyWG+yC+dgYqzO14mafBac75b7nuobjiSxMGAAUt0MM7M
 gJ/BYTOC3PNqnjBNELC5JPXjnMOMFh96Ubcm1Fn5CVe5l8UyF0+SnyyvTJhYPwVeiVry
 7G/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TgJI0a72rP9OUDE3WC8TFzmdlciwSF7Rc6QwZHpaDIU=;
 b=aNo3n40kTDP/DJ6QG+/LSFeZxC3Wk1aW2YmdDLhxH3MsAhmSW6eIgRvarawWpaWfWx
 nM10AgvBJ7Rq3dogSCnotO1v3pCDG2oplj3Wo9geRA+CjFO53E6JOAZpJ9v3xK37lUQq
 jx3iUGfu4hr8krJ6FWStNayra+lsb3hgG/4szqDx/2I4l2MquZpm0fN7Keb/BsoEFADD
 fcoeoq0enCEkQA7ljPWd/g9oawSIAFxzAK7T9pfQcCo+N9cT9yvjDSH/b0LpNZK8Pg5c
 sxT1VcAqjjIhYMxRmyDGlyMY+7oce/LWkZHmXtc3Q8Da3NTT6tcmQi71nyWLZdd88/+H
 XNgw==
X-Gm-Message-State: AOAM530fuwi5R3jwhIjaCCc+pL2Q90Z2JKEgVWGjhDx4TIpnjGG19UME
 HjqL9vGx/A3Vlz7sgosqBHq5jg==
X-Google-Smtp-Source: ABdhPJyhWP9Sa/LrMScOTOdprDIguZtPKE6rUb8p1XvPKrGdATzbfm69GlGUba7wgevX5Ux/87qZxA==
X-Received: by 2002:a17:902:e289:b029:eb:29e7:beda with SMTP id
 o9-20020a170902e289b02900eb29e7bedamr31545076plc.78.1618968933794; 
 Tue, 20 Apr 2021 18:35:33 -0700 (PDT)
Received: from [192.168.73.113]
 (50-200-230-211-static.hfc.comcastbusiness.net. [50.200.230.211])
 by smtp.gmail.com with ESMTPSA id k20sm227815pfa.34.2021.04.20.18.35.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 18:35:33 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/mips: Simplify CP0 check in nanoMIPS P.LS.E0
 EVA pool
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210420193453.1913810-1-f4bug@amsat.org>
 <20210420193453.1913810-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c94a4b5-484e-c840-c722-5c346ac9dee0@linaro.org>
Date: Tue, 20 Apr 2021 18:35:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420193453.1913810-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 12:34 PM, Philippe Mathieu-Daudé wrote:
> The nanoMIPS P.LS.E0 pool contains the EVA instructions,
> which are privileged. Simplify by moving the CP0 check
> at the top of the pool swich case.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/translate.c | 16 +---------------
>   1 file changed, 1 insertion(+), 15 deletions(-)

This isn't the same for the default case, raising RI instead of CuP.


r~

