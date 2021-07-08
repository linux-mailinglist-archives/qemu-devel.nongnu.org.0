Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F373A3C16AE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 17:56:00 +0200 (CEST)
Received: from localhost ([::1]:54200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1WNb-0002qT-Us
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 11:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W2z-00027Q-Cx
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:34:41 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:45779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1W2t-0004hM-2x
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 11:34:39 -0400
Received: by mail-pg1-x52a.google.com with SMTP id y17so6361686pgf.12
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 08:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sb4BVgwZ721Bxe11PifJl6p0ddpowy2V4o0afx0fBDI=;
 b=Pzrnn7gOsZrEE0Ts7XOioYBE1Dar/8wMBh53mt39fcaw44hk8S7AR6ft4NNwv0GTmN
 NqoU2dgiHE3xf4QjLsGpsU7YVGjy52i5YFNjpsw4Xj5V+yyrooPu2qHBFqt0BBJEmHGO
 RYz40dITXiUJJXyJtak0LyFklg7K1HUljxk5wAKLw1zOl5kBjOy2rbdsJ1m5Cx3zkNxC
 lhXc5lUpwtv80wgPIL+yUIysWbkmKB5/kAacUk48eNZhveePDiRSe2ulejjYBMRQz4+1
 9n+LeVSNIzts014gDpeWsqc965VvJpMldYWPh8DpMlPAoykkgfEzMtafBstcKG8PQ5hH
 /j5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sb4BVgwZ721Bxe11PifJl6p0ddpowy2V4o0afx0fBDI=;
 b=fUTNpIZ4PQIbh/RnMBrQxKE8wbXwAeRELNMF//fvssdyVW2Q7AWY4BufXl7hPMm0SN
 4nP7H5WYM2SDteYSQKY2Gn2q2hrhGvZb1Ic0Gc84LX+Mx7WeZh99coMnAAkawI8THxt1
 1saus+6oNLCJ1Q5SU1iYQXKRHGHxU+Im13jLfOY370vfLuQ48sy9t19rJ8QZbJHwfnrq
 6tG7b/1nPjmfjopfLs7AE83J+Mr7MAU/+Y6S/fo3AEyJ1QIOfhOkJp7wRhjM+8o87nxK
 q0TYfoS9YLrr2djs4UVVooN0+CI2Kg+U3lIh+DXxhSTPL5RDCwRdLhFx85g5W1QCa8xD
 /YOA==
X-Gm-Message-State: AOAM531lyZNUqJj0XoontKG9rsls3iVWgIOqyFH4VsI0W/oxuaDR8bA1
 28aR68z1l7Lu2efHsZKj4x1QaA==
X-Google-Smtp-Source: ABdhPJwVZcfVj15MIqkPTgqJqzUSEW4SGnvoIYOSGiIfyLUEqm1eYXaxpppL+qcuLNhXuZ5/qX2ikQ==
X-Received: by 2002:aa7:9216:0:b029:2e5:6989:4f1a with SMTP id
 22-20020aa792160000b02902e569894f1amr31511488pfo.50.1625758472889; 
 Thu, 08 Jul 2021 08:34:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id s15sm3345084pfu.97.2021.07.08.08.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 08:34:32 -0700 (PDT)
Subject: Re: [PATCH v2 4/8] linux-user/alpha: Move errno definitions to
 'target_errno_defs.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210708141121.1731691-1-f4bug@amsat.org>
 <20210708141121.1731691-5-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <85d6332b-7729-ad30-90e6-36f32118f85f@linaro.org>
Date: Thu, 8 Jul 2021 08:34:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708141121.1731691-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: Taylor Simpson <tsimpson@quicinc.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 7:11 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   linux-user/alpha/target_errno_defs.h | 194 +++++++++++++++++++++++++++
>   linux-user/alpha/target_syscall.h    | 194 ---------------------------
>   2 files changed, 194 insertions(+), 194 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

