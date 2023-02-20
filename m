Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFF69D3D8
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:09:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBWr-0005rF-Hl; Mon, 20 Feb 2023 14:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBWn-0005qv-BQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:08:45 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBWl-0001HT-NR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:08:44 -0500
Received: by mail-pl1-x630.google.com with SMTP id q11so2897949plx.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=orhrJctSFi+3aS9JyIH3BrDFaJa+RwyugnPbEBLfljQ=;
 b=gaO06fJZne4zpYpEfO+dEkWsh6nyeb3adp1zUfcRwg20i0EuiHAfFOiJOB2CK9gshn
 YqGoE50SHB+0hfK0mYHRT6hXfVH3u+OGFdKXjeYr8mIyoxsvRNZHdd3Tfq+824qJ21hU
 yTaizLfnG2voytMtvILffrPvd17Qzq1J+ngxv/2+dCSgWhFRovJLpNLXNxaT25jItp/N
 L5y//BT00cdRgB2UrUZEPNX+pm+a05tXo2BgpfgvnFSa4qDwmlfGO2qW8mGBISlToD4U
 2yDgTfWYDlSzdgPJVoX3JzBQszvU8EjaFFqxLbeYne2JgbFzVxnnUkgxQ/8NCKgmoG21
 bKxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=orhrJctSFi+3aS9JyIH3BrDFaJa+RwyugnPbEBLfljQ=;
 b=VNE0srRGEBp8Rfk/vFzch1Xk+D60LPJdbF27pw8nCYsUdQ4nGIPQNbMPq2F+rsCIDr
 CIypgmgvtCqa3Te7ef2ZGWBkIWKam9+wiRpeds+YMVsAng2t/wRJ2ySCv1DTwGPbjU+/
 UNG3JTokNn7BUZR3NJhhW/tsSEDDLMX+xwXZjkoGlYLHXIDuufipcZDsErpdtTuv/tEw
 awFEK9AftaLrVyzCcorQQWqT/4qF391kVDqb1bPK33T2u2T4L1PycHEVbh6PiXAlYkr/
 jSDrj3daGJLySieVaRwurSNOuR52xqqBIWEv0+Qi4iacwIqu9irtgbBRUx5Eys/KMAuM
 I6eA==
X-Gm-Message-State: AO0yUKWatLYznyZ6ZVwnvgukIU8i28QAS/5gE+U2mqr8gob6kIxm5RHm
 +1teZOaBrrL7rKpVQflr571Ltw==
X-Google-Smtp-Source: AK7set8CDQYcEYBMxdwbzr+GBFXttpOon0CeY6J0oNWI+MeK+WKClSsQ1Cekl6ndu4vbEdbnvhDaPg==
X-Received: by 2002:a05:6a20:6a0c:b0:c7:499:3fff with SMTP id
 p12-20020a056a206a0c00b000c704993fffmr2084709pzk.11.1676920121852; 
 Mon, 20 Feb 2023 11:08:41 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 v10-20020a62ac0a000000b005afda149679sm4507526pfe.179.2023.02.20.11.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:08:41 -0800 (PST)
Message-ID: <13c79f3e-47c8-3f88-f5e0-a0037c2d06a1@linaro.org>
Date: Mon, 20 Feb 2023 09:08:38 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/9] hw/usb/dev-smartcard-reader: Avoid forward-declaring
 CCIDBus
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20230220150515.32549-1-philmd@linaro.org>
 <20230220150515.32549-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220150515.32549-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 05:05, Philippe Mathieu-Daudé wrote:
> To avoid forward-declaring CCIDBus, declare CCID_BUS QOM
> definitions before its use in the USBCCIDState structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/dev-smartcard-reader.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

