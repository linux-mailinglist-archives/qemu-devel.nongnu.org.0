Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E9043E900
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:30:59 +0200 (CEST)
Received: from localhost ([::1]:43580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgB75-0003pn-4A
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:30:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgB5L-0002dz-D3
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:29:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:44948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgB5J-0007ke-Hx
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:29:11 -0400
Received: by mail-pf1-x435.google.com with SMTP id a26so6894045pfr.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sCxsV/UKaQetWmHuV3ISOa7WL0CJqLGSWpbSxal8xVg=;
 b=uosWLLbHlOKHexL317kmdbmf1XUN8CTJB+faXpR+5eK/bsSYEnSp97FJ9V37MWB4mt
 qg5hkkm7X6FbLPIzM7pVqL/kJuqPdBPuMsAu1RsdfIzl00N47gvtKaUr3abLYjbSM5eI
 LqgaXAanaomYGp7yR5s42QeleP8JlH3GUfPxk8QnUwa/Ty74IsC6/H7Y5xtC/JTm20Vu
 2+uonQpK7v1FL/0h+K7hbpItn4SNw41bAe1EJEx1ougetQfdVay77vTeJotPNMWA3wTw
 lusJQ3bHLJHVjczQTxwTOSXFwXGfXTdnhQsxpa8LLOZ9NanS/MFAGlhNBB0Qs4d5NQbg
 fe9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sCxsV/UKaQetWmHuV3ISOa7WL0CJqLGSWpbSxal8xVg=;
 b=nqICRKRdMGWzp9SlpzD+cxXExz+dIFz0/BvDzTgeEzpe2OniTHiM1noUAIiBZ4DXGT
 idLnwSECSXvfQwE5r0UU0ecOrgCvK/SBfZAL2E133UpGpSvgyy4fdAGkiGdiHxSgDEfT
 PWmUvKr/g80phYLCfAqJ2lKz4Fp6JteQFgS4vW+YZJGFmHEibCuhWjzjCecdqiuoS/n6
 Jib+AtZOpen4vVTi81CkJjwl/wEpf/vnQR2laHlbMika/iUUlqu+TMtWz3VdchmM5/HY
 9Txz5l38komLVTF3u9DKX6XYRM/52orNv2gxOeW9qQn9bjrmMUE15oq8n5MxXDJRiLQj
 Po9w==
X-Gm-Message-State: AOAM531ZsJbqD2ALHltgoVCrbYg28SALNsMmDwI5vmiU0A0rIy53tD2d
 pb41eipqIgkP9YKsQ2Goeoc+LQ==
X-Google-Smtp-Source: ABdhPJyLtPrVFnvbCT3bX5ajbQX5mZYlouhv5YlIH2bj0J0XZ/fHIXM0EBJrRBKO4D9oQH24BigvBA==
X-Received: by 2002:a63:9245:: with SMTP id s5mr4702142pgn.4.1635449347806;
 Thu, 28 Oct 2021 12:29:07 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id mz24sm3654464pjb.42.2021.10.28.12.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:29:07 -0700 (PDT)
Subject: Re: [PATCH 0/4] Some watchpoint-related patches
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02158ca9-a1d9-4743-cf2a-1e9ce2563999@linaro.org>
Date: Thu, 28 Oct 2021 12:29:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:47 AM, Pavel Dovgalyuk wrote:
> 
> Pavel Dovgalyuk (4):
>        softmmu: fix watchpoint processing in icount mode
>        softmmu: remove useless condition in watchpoint check
>        softmmu: fix for "after access" watchpoints
>        icount: preserve cflags when custom tb is about to execute

I'm going to queue the first 3 patches to tcg-next.


r~

