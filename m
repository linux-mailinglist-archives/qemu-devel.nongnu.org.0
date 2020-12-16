Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E85842DC324
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:32:40 +0100 (CET)
Received: from localhost ([::1]:59296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYnA-0002Tg-0J
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:32:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYRu-0006hB-HJ
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:10:45 -0500
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:34021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpYRq-0001mW-0a
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:10:42 -0500
Received: by mail-ot1-x335.google.com with SMTP id a109so23190508otc.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y/obwHZpU3lXQejQpnEmtxY50QnTluMFjZboNRU7a1g=;
 b=IFY4CxXBXUrg0p6egNp4gUaxT8USY9WnjZuiABaEAwwOegcqREsqNp8BsaT78bXZf8
 q0uvMwq8VKX9/textBkzQ9BLXX0eZO0WwW1w/40yeQVu3fhYGa1K+v45zhfnb7TdXrYi
 JxNLkNi2rIQuySY3m7/qoXzwnBR+jl6fA1HeVXrTq/ewg8LpbNsYv6gL08TuL9jeEZ5m
 mURyQUrYlEHNlYxlluOPUFLH41OLKS/hQh/q2zFDsEOGqp6jgWF8jyXgj5eS5xu7gjMY
 WwoGqSY6ehCPhwM6BK5a89nezOKBwTPyjHiR53cSiFVEcSgwteo1mncFNUJwjWuBhlEh
 jRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y/obwHZpU3lXQejQpnEmtxY50QnTluMFjZboNRU7a1g=;
 b=VRIYVhRD5vrRKBQRqhMvRmajYQtuuFdMBuoLBlnOdVCF7AJPb0RxDxqCLe8t3j6r88
 4GcMYYLqKTHTHXmRgYnZYrfycfxyzg7/rOTqvCq2Juzjko72UNO9To4gwPm/bgIR3NlM
 0yIiBumsIphAhHY/XjJErlveuZa4otgK7LxMNsDUzTooLbQ6ZltEsUTumMHq7fbb8vwO
 GhwWLP0xMk4sOCN7Tc2Pjwi0WGamZC6/VPp4Xv87v3qWscmVncjuaGBCgSEPczkPHTRw
 8qKnYOLu1vZsFG9m/vbDaG0YegeLEOjg3exlj9XCiraexMdvD8n7+VOvtm4hs0TLgISZ
 rXdQ==
X-Gm-Message-State: AOAM532sPoeK0hCscgigY+jPPUL0OAEdPw4KrptU9Sg+/e6QbIC7QPKR
 tmZzMa45CMJwXO6MpQGiJnpQzQ==
X-Google-Smtp-Source: ABdhPJwEI8nIZUG0FaOGe1VkWvtiFVR9szlfIeaWtjz5arFM86/Ecm8+GZTqVldc2UwRZQsgPqkV+A==
X-Received: by 2002:a9d:5c04:: with SMTP id o4mr25629452otk.372.1608131434543; 
 Wed, 16 Dec 2020 07:10:34 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t186sm452968oif.1.2020.12.16.07.10.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 07:10:33 -0800 (PST)
Subject: Re: [PATCH 1/3] remove TCG includes from common code
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20201216135529.265165-1-pbonzini@redhat.com>
 <20201216135529.265165-2-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b9136780-5c90-7e0b-8786-465736313169@linaro.org>
Date: Wed, 16 Dec 2020 09:10:31 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216135529.265165-2-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
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
Cc: philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/16/20 7:55 AM, Paolo Bonzini wrote:
> Enable removing tcg/$tcg_arch from the include path when TCG is disabled.
> Move translate-all.h to include/exec, since stubs exist for the functions
> defined therein.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  accel/stubs/tcg-stub.c                      | 1 -
>  accel/tcg/cputlb.c                          | 2 +-
>  accel/tcg/translate-all.c                   | 2 +-
>  accel/tcg/user-exec.c                       | 2 +-
>  cpu.c                                       | 2 +-
>  hw/i386/kvmvapic.c                          | 1 -
>  {accel/tcg => include/exec}/translate-all.h | 0
>  monitor/misc.c                              | 1 -
>  softmmu/physmem.c                           | 3 +--
>  9 files changed, 5 insertions(+), 9 deletions(-)
>  rename {accel/tcg => include/exec}/translate-all.h (100%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

