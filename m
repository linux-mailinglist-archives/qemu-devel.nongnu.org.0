Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 527A82718CB
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 02:19:56 +0200 (CEST)
Received: from localhost ([::1]:55972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kK9Yh-0005jB-ED
	for lists+qemu-devel@lfdr.de; Sun, 20 Sep 2020 20:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9Wo-0004SN-Oy
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:17:58 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:41241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kK9Wn-00049e-7C
 for qemu-devel@nongnu.org; Sun, 20 Sep 2020 20:17:58 -0400
Received: by mail-pg1-x542.google.com with SMTP id y1so7392018pgk.8
 for <qemu-devel@nongnu.org>; Sun, 20 Sep 2020 17:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=KbQscvn4KMmUNmmr2vGphlEz+ltGO3hrk08931qsflU=;
 b=iATSbpTqDwJ/jfH2a2AlMIVZvN+Je+eMO6q2wAGKVdC/1zGxvr10Cgm0M2FIN1ahOk
 GA29fnPyA3aPz5VE0+UcpjjR8bI2/9y5PSkBNnO4YEJMT6EDEn+qD5cRaQpq5hH4VKh1
 dy0FOieBRgsV/8GY7msXJ49ioJ4JZtpDLegchsF5/GnaycEJLpf26R8e0l4VVuoojmoE
 GXU/yA8mNqS/VjWesnZ2lSB0HELpT/qiSlwLJhYJqOJ7Okx9TpFuqxB1CD/hLhuGLX1g
 oAwsizgEsjB5CPcCR0kg6Fv6NWEko3vd0fMJSs66UqX6Ebt9SuULnb3AdM72nxX0pCTa
 z+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KbQscvn4KMmUNmmr2vGphlEz+ltGO3hrk08931qsflU=;
 b=N/1l/Lm69eMsdfWGSkkVri4UtcjgoaeO6Wp59BhvsFgXCuGHL5U+2/e62RnJFbWcuB
 IR8a6e0gHTVGZyqANAhQkDNixjd9G+q32Rh23CGgtu78Fok2TZZwMPveQH9JPCPjB+fW
 7OD1FnPbp+7dE6PrlEugOsbQ1YwSuQJNOf/8UrgRmz0Gy3nS4KZqyd+3AdEosPuFWBFp
 OkPyoltKLctOopLH3uGtwBxz83txozUn9nJHE9+3squv0EHiVlCkXIIScXpIbYF3tEvQ
 yX16usKt3byMjgt7OfHs4uOzf2eijVnR66DdlSxl6ClMKH0mwoxdb+DyH7hRTv7LgcH0
 s2zg==
X-Gm-Message-State: AOAM533IswKSROmF3n6rOX9+R2MWuusv1GNOJSFn/b2rfThbKPzMbSTW
 bnC7m2KXPZ4nfL5gkKQJQ3ajuw+4cECxlw==
X-Google-Smtp-Source: ABdhPJyn4pEOiT5rCfM62tWgfyJ2QP8EvWquql4jR4T/xiKJLDSio2Dbyq4qrSW8PpUNvqbtQTCMlQ==
X-Received: by 2002:a63:d25:: with SMTP id c37mr34262105pgl.403.1600647475470; 
 Sun, 20 Sep 2020 17:17:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a13sm9863754pfl.184.2020.09.20.17.17.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 17:17:54 -0700 (PDT)
Subject: Re: [PATCH 5/9] configure: remove dead variable
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200920130708.1156310-1-pbonzini@redhat.com>
 <20200920130708.1156310-6-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <738de9f6-015d-feb3-7e5f-80c346154564@linaro.org>
Date: Sun, 20 Sep 2020 17:17:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200920130708.1156310-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/20/20 6:07 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 11 -----------
>  1 file changed, 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


