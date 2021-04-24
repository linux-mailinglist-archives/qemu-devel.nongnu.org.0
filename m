Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 805B336A28F
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:23:49 +0200 (CEST)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMwW-00084k-Ia
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMqC-0003UF-Oy
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:17:17 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMq8-0002ro-N8
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:17:16 -0400
Received: by mail-pg1-x532.google.com with SMTP id 31so5456054pgn.13
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=UlOwL6yjraEQBzu8QeFbi3FANNjse0vY8p13o8DyzRE=;
 b=fXpa/O51hLZ9bxUYoerMjJA+N2kQTbdR6d+aIk70n110A+yED19v7c8QvivwXwrtzi
 nZzsYKrGeNsuuafhE/FX6P+jPVfCtRxd478jT2EHbhM0K0e0cDkg5FOEMMej/c+Ku7dj
 PMFWlUZProOAb0Q/Tb6/8GyGkuhxBC1mRwitPQLY9X691Q1DR1rXFBlbHFmtoa2wnDNU
 O8SIlSZqozEDXmRxpOTL62DLdx7A5pjJs0/uPfGC30FUt7qE0TTJ8JVQqN8nMGmE6wW6
 SEFLuw+7p5sFt64K6azlCq70MmAbDkWa5qY8YdbhMp88mQQARcPtrp5blW3IKFdONx6r
 SysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UlOwL6yjraEQBzu8QeFbi3FANNjse0vY8p13o8DyzRE=;
 b=DcvijbyBvE+X4ACgxUbIWQ5K13/JcHpxmt4LqkEQ/o3gurKJZ7Rd0bYFAgsAABEzg8
 qHtYsXDrLObawek8Ml1aV/09YO3Lqtcthj3YmyCLQ3IgQ9wFpTPa76lAsc9pNS6W47mr
 d9Kb4et7PZPJ3h0vU9InybvPj986Qx/27XpNIlX3+VpeX3JyJLdJvod1Vfh5gS1qm5NE
 cs0EcxJhntf9Cka+E6IPdnBUW/qRY3BJAU8YN3xbNb0vasoRrKa8KMsVp9CaPOou1Xqo
 emQtkpE0K3ymxoGH2A0tiRPXiDSxoNIcKEkOAI/a5G9DgsEvuD634a3fqUOdVNLmHS1x
 5nqA==
X-Gm-Message-State: AOAM532t/KifdFTC3ay++xuAnjxDPS1jxfBmbNOLnKY6dwWQjypKyc77
 HxpgCwrubFGdUyryWw7DoxyRVA==
X-Google-Smtp-Source: ABdhPJzkTexqfq2uaD7VYfrs3oS+G8TZIZhp3xhrQ+tYIGShwSlJ104bMHNqXK/2/0XIHUaJXQWTpg==
X-Received: by 2002:a63:b59:: with SMTP id a25mr9389612pgl.235.1619288231073; 
 Sat, 24 Apr 2021 11:17:11 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i62sm7826704pfc.162.2021.04.24.11.17.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:17:10 -0700 (PDT)
Subject: Re: [PATCH v2 41/48] bsd-user: style tweak: don't assign in if
 statements
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-42-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4c9dc437-d6de-4d90-a455-fddc1b254796@linaro.org>
Date: Sat, 24 Apr 2021 11:17:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-42-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 9:00 AM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/strace.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


