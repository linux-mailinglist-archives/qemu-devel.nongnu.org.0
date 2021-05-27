Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F82393506
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:41:49 +0200 (CEST)
Received: from localhost ([::1]:37794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmK0y-0002LD-Iv
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:41:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJyA-00011L-55
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:38:54 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lmJy4-0008U9-SL
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:38:53 -0400
Received: by mail-pg1-x533.google.com with SMTP id t193so477180pgb.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 10:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eDpcNWLmpVvZz70gkRVgc6oOqtXcl2mPuZfgLc9Gwo4=;
 b=ZhV3SznGK3CQW0TUZWWOYKUI67q5oA5aJVNyjFSzeRtJ2/9LeX2Ndpq71jBgl8kXiP
 lV3vsWKeO+5bsZx6BbvLZQvTQFBrQ6LYCE/35PwTntCheJOKxUDydCie4+X8ffFmlPLA
 /XLBFlx40Ze9Hkscl7Uaj1+nAXuG+hEOYsXtjx1t9ZjJ8QbJiFiPIqxJKk0ikYEQpRKJ
 i3+pD+o4cvNTOgTRakdPxngJK3DsEcAn00G7a8PtsTLwwODByh9FeSNNrnQhGZIgcVvg
 ssHiAtPxy6SLEy/7M5tWCGroKehfM+H9lDRkQlb4RZYT5pyJseyq3MgXsjPbCrguYKY7
 xl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eDpcNWLmpVvZz70gkRVgc6oOqtXcl2mPuZfgLc9Gwo4=;
 b=M++3JRXKipMi1nTBNhq14pDYx1P+GYzGBNxgF+mXDN1giYlX5BpfQ+SxnRblOZbNL5
 WxExPfR/4b7n6Abo7FozY+CPmlzL6++q+nw8OKHo7jDJpPxCebEtmShAZX9KfRMGe0MO
 xZ5DVOZMETyE0xR9Qn4rUgbM/UQGw796GuNOKPM2cbH1UbVp2u+JOIIhffCRAiAEZ/xz
 WpmqpCY1LwwAhb/TCJv2dZhgVL3sT1El9hIQa+hPz0SY1VVLLMpdpFt6cRl10Zr1j9ga
 TbFruaTejvw2DjCptJKbsha0Tud9cE8sMR99/F/AUugxucF+Cqr8QGUHH0NjwcN8Bash
 AW1A==
X-Gm-Message-State: AOAM532FzPv0wr+pnzV8kI2abdzWfW5peuqpwRxqGMdQnpfqzIRBjKgn
 sBsgW9AZ/k+x4cwkBSAbR0B8YQ==
X-Google-Smtp-Source: ABdhPJyvpRscExVdjPu4la03c8iATze/AO9La9rhdt1Ku3KcmDVH4jmwi77kf605WfLOgUQ2hrbSDA==
X-Received: by 2002:a63:4b18:: with SMTP id y24mr4731814pga.438.1622137125823; 
 Thu, 27 May 2021 10:38:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 v15sm2321460pfm.187.2021.05.27.10.38.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 10:38:45 -0700 (PDT)
Subject: Re: [PATCH v1 2/6] meson.build: fix cosmetics of compiler display
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210527160319.19834-1-alex.bennee@linaro.org>
 <20210527160319.19834-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cf8e4be-44d3-da33-6e6f-321827e51f14@linaro.org>
Date: Thu, 27 May 2021 10:38:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160319.19834-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/27/21 9:03 AM, Alex Bennée wrote:
> If you specify something like --cc="ccache gcc" on your configure line
> the summary output misses the rest of the cmd_array. Do some string
> joining to make it complete.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Tested-by: Thomas Huth<thuth@redhat.com>
> ---
>   meson.build | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

