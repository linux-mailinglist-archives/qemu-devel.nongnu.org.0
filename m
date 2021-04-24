Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 996A936A2A1
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 20:32:59 +0200 (CEST)
Received: from localhost ([::1]:40020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laN5O-0006uQ-OS
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 14:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMvJ-0007qj-GV
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:22:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMvH-0005ro-Cv
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 14:22:33 -0400
Received: by mail-pg1-x529.google.com with SMTP id s22so16284474pgk.6
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 11:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OCYgSJifU1yU0j8wXKvSoS2fiRxZX/ko9IjYFKXuWWE=;
 b=qaqKkUZmAknx1PviasclgmOgwunYAU0Q9/0ozAq5uDG8BdjPHPXgoScv5GaG4Z+gbl
 NBbHSvYoZ9ImCxJHeZDgwud/nTCTrFlpmzUJZFExoKCgMT/lGHuqYbXayiHFzt7W9660
 20lD+BiiEWS+fg8FEKtC/rgytOU0Anq0zIJM3IWdel5QxX39Tgx1ENovlvZ2CPk7nycw
 N3S3yH5UWz4uKsQO0pFPTxQJfF7Z0cB6i7Q58fKSVNVBn4pFGshOCH5r2rPmxeQJnKLA
 /yhUZpx/nO7EaMLCFSe5o9hrpUb4lWJqA/jG2zVvqdDnAGDlzUfbUeI/1ssi9Dz6yBFg
 Slaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OCYgSJifU1yU0j8wXKvSoS2fiRxZX/ko9IjYFKXuWWE=;
 b=joGmICrTgkulCGLKPZ46PHGeG/prK8zrj16LhzdUqEUyyELV3VaQRngkxMEccybeqT
 H/ss+PMZOswLTYYK/ISrrFn0pXDzcCo7NMCf2JBsc0V3+5xKN6+LYSmlDOvqZDZIx9se
 fCj+FgAFrv4GkEbg+ChpG2k6oZTcgQd8H7cgpJWr4ioGe9LzbkoAzlT8/PiQU/67sRXh
 JN4vsgUR/R7ZJljcF5HvSaaYEoK1pwmhnjn4t96RIAy0Jsjy/M9YyI2QlEf10XrlUtT0
 ngNQVZMGf/nx7JlNxjCM4p68COM3krL47BqvhAEI15d5tDWFIrHXq9r1XaYWGP/3svvX
 7IzQ==
X-Gm-Message-State: AOAM531TsYxNsQQOZAArpCUnAuckDDdPUs66Z8KuZtOS3FohYVxsN6oH
 niLTHipvjGllQVnvirgkNYKxTg==
X-Google-Smtp-Source: ABdhPJyrWJa9Tzbp9t0u7buGArZ2EopLFSUNM6D536L/311VFe3wl2F9RC46qHSUw8Wk1zQ6Ug8Ikg==
X-Received: by 2002:a65:56cc:: with SMTP id w12mr9460004pgs.334.1619288549343; 
 Sat, 24 Apr 2021 11:22:29 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id b3sm10145575pjo.37.2021.04.24.11.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 11:22:29 -0700 (PDT)
Subject: Re: [PATCH v2 48/48] bsd-user: put back a break; that had gone
 missing...
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-49-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d30ee8cd-072e-df69-ed3e-7a5ab11ec35b@linaro.org>
Date: Sat, 24 Apr 2021 11:22:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-49-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
>   bsd-user/syscall.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


