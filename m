Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B528397D37
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 01:50:43 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loE9i-00056Y-DP
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 19:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE8A-0003EY-0Q
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:49:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:56009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1loE88-000806-7n
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 19:49:05 -0400
Received: by mail-pj1-x1036.google.com with SMTP id k7so595453pjf.5
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 16:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XPoqKan+4itFh1hdpJ+sVnIwWTWf7KUvVqLY0zCh1e8=;
 b=x2mHEYCumvIJKH89ruwbA9rXaxIOLq4U/H3BJpodYtCJJ/g6/r+9VSuk71jH2iG+bJ
 EvKbFEM8QwtDEdOysVwdZ9/5s+mVspGLd7R8v9TaTDtNEbL+zXVr1cHG6PEKdyDy0Uhp
 kH8IhTBY7hmzDEQvk9p2Jvoq2yaDlZv9jdwKQLC97owDo//WwVMbdmwV8Hmv9WZ9DodG
 v7F9wqg9LcTTpMj/IJusBQ1UvgYRDXDrW3ymQpHX0T8C0YJIUSJD8vIcnjC8FgFCPxPJ
 gfesxAgTTODXEjES39GRV2lfQpRgb4YyFdZ0smGJpxPBQx3EmbsTAml1VcVTq8rCP0G5
 vtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XPoqKan+4itFh1hdpJ+sVnIwWTWf7KUvVqLY0zCh1e8=;
 b=m9rdTBWj0OK7mkpIAxabJ3Se0CwDZe6lulemzbEsXeZx8uMAQHNvPgHGMaF8P60s7H
 XOMgy3wj9FZLSRQmvaVzBkZaSZcEIp3oiXElVGC8pIf50xPX3DxvmZCuiOLmbzwwaLJ9
 WW6nuW7z5j+FBy+vlhas0e2Kb33KhaQLMUDAnj2BxLUPsCnlEIc+8Q/zj6zAhq3f77vd
 URzpaAUuhgyhiNTsix7iLFSWnbhhydTNdL5AyJtDAaioAdsKB6alRRTx7pmRM31N1C/k
 +oJDU3vSJMP/kINCAYC9DiVBYaZ57Hhby7KvSNzAji7SQZOxefT0rCP7tYsVlMZk3Edb
 PsYQ==
X-Gm-Message-State: AOAM531fHrTQf3xSMOqC5ufXvOIKw3miW2KG672Rhm5PepGsyPRcv4v8
 7PFWsQbJYz/OAxpDFIzHexDW2w==
X-Google-Smtp-Source: ABdhPJy6CqzUt6oB3uW+HleIPNapfzDgwQotEM8sddE9+Fgbjc7EPe6BV0w70xWVMXebSTuaHYQS4w==
X-Received: by 2002:a17:90a:560b:: with SMTP id
 r11mr27322394pjf.224.1622591342793; 
 Tue, 01 Jun 2021 16:49:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 n17sm3625667pfv.125.2021.06.01.16.49.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 16:49:02 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] Hexagon (target/hexagon) cleanup
 gen_store_conditional[48] functions
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1622589584-22571-1-git-send-email-tsimpson@quicinc.com>
 <1622589584-22571-4-git-send-email-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0f158963-3426-14c9-5ebd-8f0c96db712f@linaro.org>
Date: Tue, 1 Jun 2021 16:49:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1622589584-22571-4-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.613,
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
Cc: ale@rev.ng, bcain@quicinc.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 4:19 PM, Taylor Simpson wrote:
> Previously the store-conditional code was writing to hex_pred[prednum].
> Then, the fGEN_TCG override was reading from there to the destination
> variable so that the packet commit logic would handle it properly.
> 
> The correct implementation is to write to the destination variable
> and don't have the extra read in the override.
> 
> Remove the unused arguments from gen_store_conditional[48]
> 
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h |  4 ++--
>   target/hexagon/macros.h  |  2 +-
>   target/hexagon/genptr.c  | 10 ++++------
>   3 files changed, 7 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

