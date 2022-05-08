Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEC251EB12
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 04:43:24 +0200 (CEST)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnWtH-00041D-CY
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 22:43:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWrw-0002rU-TC
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:42:00 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:55102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnWru-000424-Sb
 for qemu-devel@nongnu.org; Sat, 07 May 2022 22:42:00 -0400
Received: by mail-pj1-x102b.google.com with SMTP id fv2so10321090pjb.4
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 19:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=wFSwkhJdsMOqqu45NapiBsY0HTY9DRLwTIFOUtaZiEo=;
 b=bN6vlhuLT6XkSsyT2fSRlyD9Fwatyu/mhdalPwp2qt4SohHvZlggJegA2hUjQzr/VY
 p6pB49iVa+pEwPHNTMTDYk18SUcRHIkChB8Fr1Ne1qEDaH6stWZlL7fxn76WzbEsbyUz
 aGCf3YmZRIp+JK4MgG9QGOBfrT7ACOWJiGakGR+ef806AdE5YtSfGJOvfzpuBvpIKrpm
 KZRs0t1iWnjt+xLWHV0hYrD/KAlj8MKa62RHc+e0W/J9Vq1tCTtwBGyAvObTL4RhmPiV
 bYczKHm5zt+uGO23SzZGjAGZSXpu91j0CF6Ys1uS+M/Yks2Hfj7eN33aj02QgN+oDeog
 BV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wFSwkhJdsMOqqu45NapiBsY0HTY9DRLwTIFOUtaZiEo=;
 b=meVOFgPZM1pj5K4g/cRygz0CNILCGs8GmE1IaYlRZCmcYG5GQQlTx777Iy9qcHVDNY
 h/aKQXEy5YeI1Ekv0q/mvK1Ivt7ovIRdZsnyFTwuT8M5Nos9laZ+NEy7IfuBnoyYDDKK
 cvZqTWSvPGzXbVwlewe0j50IT2pbrFEHa7rHHO4ZAbBLWvW5PuGCfwBiULz0WunI38Rn
 2qqzAwTBA7KjM8m97MxNS/i+8OYtJZ4gwkBbgKF5I+forpcu73TvlbX7SQ6QoaJF0TXe
 93nLA9QxxQv7VX54WmD9ImUW10ln+ycmwG9IFW6/XwN3RoKQVqsCPxkpAAEuqsBkTTQA
 lsCA==
X-Gm-Message-State: AOAM530wM++xc+s2VGINniRcTIBhI173Si6IIfuvJaooZAIZPoDh26Jt
 i2d0WCz5hXaz94lyERCmGW+rrQ==
X-Google-Smtp-Source: ABdhPJzMHApvPwizCprOlmDH+KvAP85pkXESpNKBXDiMYAoiWmwX7Ye96hd7216P6vxbL6ReVehRwg==
X-Received: by 2002:a17:903:18b:b0:15e:92b9:783 with SMTP id
 z11-20020a170903018b00b0015e92b90783mr10580368plg.30.1651977717285; 
 Sat, 07 May 2022 19:41:57 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 t15-20020a1709028c8f00b0015e8d4eb1d7sm4229592plo.33.2022.05.07.19.41.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 19:41:56 -0700 (PDT)
Message-ID: <c4996872-e3cc-bb47-88f5-7779af065357@linaro.org>
Date: Sat, 7 May 2022 21:41:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 34/50] lasi: move parallel port initialisation to
 machine.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-35-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-35-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
>   hw/hppa/lasi.c    | 6 ------
>   hw/hppa/machine.c | 6 ++++++
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

