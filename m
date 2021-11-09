Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6163744B012
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 16:09:39 +0100 (CET)
Received: from localhost ([::1]:38460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkSkj-0008So-TU
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 10:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkSjB-0007C4-Kh
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:08:02 -0500
Received: from [2a00:1450:4864:20::42f] (port=39935
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkSj9-0000fO-Vx
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 10:08:01 -0500
Received: by mail-wr1-x42f.google.com with SMTP id d27so33553157wrb.6
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 07:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=UeUsQSZLaENhZCnfsTDbNbZ3BylBVqBomR716vTe3Z0=;
 b=c77M3twTWLHD0qe4/pQ8Ubk+HJq1D9uvXH3kemRU7a7BL6KApBHkHVFLn7Uzb82sDs
 XYQ3xQZuS4aXPdanjFAWxPIJgV4bE6OBOHhsvhtgzoKgmpClU2WiZ3QOambogSMSO6MO
 wXK8wB50lHS2dCN6d9//dT/9ka3N6ibqurecxkuTUqbDqowoncJaqv/sEo59IhY7HmHT
 xN0GhHOsI0gw6CedDbCLPyYHrNFaPpBpQ2LSQuY3CPZjKf7s4aqtDVTD2G6QIlqTGgSV
 ENdSEOE8TvjuHk+yuZlTy66CTfG9/p2VphPtVWjhLNC1Pfb/LzhzKcI1YeKCmqeeojWr
 0ITA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UeUsQSZLaENhZCnfsTDbNbZ3BylBVqBomR716vTe3Z0=;
 b=CyQ6RMvBL5oJo6sRNUjb3x/bSW3L7UoYaFsUFRQLYyxzSOKmENBCqllrwGAsjH1gHk
 7FbqYvbIYvn8XCEd+NS/BoZIIE0X59yjpNQPmIk4qyv+B8cy3vxSosJa4kGWQynTcpMl
 hNhvnoe1e8jBXie9Vargaew1fgv8tvWbjnvPUCTCGCsIAbVfaJZ2KkIStmngeABRaio1
 gHLLSHiXpdZhBMhFC/C4a5EnGIau6I7risRNaz1ScARLU9IzhuGq0j6rjwdexQe7z27z
 +gobOsg/KbqIwx2PIgalZVBgwKmH6BrS5jR8iVLuR2swm80HzKnM1FS4LAoSw/3v3Fjq
 ltlQ==
X-Gm-Message-State: AOAM530ewfmB6uPa5zT/Ss4ggq3JpHP8mUZRutDRUnljcpdZCy1Lv/bs
 bWmRD2mZR9ozNdFXZEcHd5ggw0VrB+0/LB63
X-Google-Smtp-Source: ABdhPJyQQmtMnK74vDk9KIqBvCv2ZxhBXuBKmwFX+UCE29dDGAYJe1T0l9bPrPwxpsahAHVdSYNMZg==
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr10568760wrx.329.1636470476747; 
 Tue, 09 Nov 2021 07:07:56 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id r1sm2944916wmr.36.2021.11.09.07.07.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 07:07:56 -0800 (PST)
Subject: Re: [PULL 0/2] M68k for 6.2 patches
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20211109111517.996104-1-laurent@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <224b6c22-016f-8428-f1e4-0803d5b6e5ba@linaro.org>
Date: Tue, 9 Nov 2021 16:07:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211109111517.996104-1-laurent@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 11/9/21 12:15 PM, Laurent Vivier wrote:
> The following changes since commit 85549204552b624fe254831537e7a0f6450228b8:
> 
>    Merge remote-tracking branch 'remotes/juanquintela/tags/migration-20211109-pull-request' into staging (2021-11-09 09:41:31 +0100)
> 
> are available in the Git repository at:
> 
>    git://github.com/vivier/qemu-m68k.git tags/m68k-for-6.2-pull-request
> 
> for you to fetch changes up to 6ed25621f2890d8f1c3b9e6f7a0e91c841aea1f8:
> 
>    hw: m68k: virt: Add compat machine for 6.2 (2021-11-09 12:14:18 +0100)
> 
> ----------------------------------------------------------------
> m68k pull request 20211109
> 
> Add virt machine types for 6.1 and 6.2
> 
> ----------------------------------------------------------------
> 
> Laurent Vivier (2):
>    hw: m68k: virt: Add compat machine for 6.1
>    hw: m68k: virt: Add compat machine for 6.2
> 
>   hw/m68k/virt.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)

Applied, thanks.

r~


