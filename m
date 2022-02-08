Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 640714AE483
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 23:36:43 +0100 (CET)
Received: from localhost ([::1]:59824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHZ6I-0006Yy-1b
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 17:36:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYza-0004I7-Br
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:29:46 -0500
Received: from [2607:f8b0:4864:20::1033] (port=36860
 helo=mail-pj1-x1033.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nHYzY-0003UA-86
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 17:29:45 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 c5-20020a17090a1d0500b001b904a7046dso1762153pjd.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 14:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iHBWzZ9UooOleZxd336u+21HphYzZLBPeIeCYqREcto=;
 b=zOHAwG2xeY6rwsHB9HYxNzX8JsC08Ev7LCAO/cwVqXygiPR7VTWpvamRmt6LCLJLJI
 tnXc9jaySYCOjEXapsJQ35GxxBAqVdSYlynESdCAg59jNwl01kr4k2zdj33TcLUIwJA5
 RKOJp4j+dgcf+lV4WccNbQj28UBSmKurRlgpTVAS2YdWk006AJ63uOTEItkDpNuX8GQx
 FeuDool5qcTURySpTFXnWvX6Reel0r86o+2G6Qgy0w43b5QpIvRp1bjVkQ8z7TR2qPhD
 JvUi8strmM/JSkt0Gwpx6FaBhvjJjfBzK0AY6YfqO71DAkKCQoSlRx/g3sSBtuoakqUC
 ft5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iHBWzZ9UooOleZxd336u+21HphYzZLBPeIeCYqREcto=;
 b=CZh5AAHSsId3xmEBHaZ1nswu8qLz2Ox1Kn1dT+z+/3oDD61QoMfR59PuLawxqDjdyJ
 r6+rGrZT67fMXrNWQZbxDi7Jlh5d8LkrF8/ch7W5GuxZ7L1IGD4yfGsfQIdRpVBI7GIP
 pu3JJcvoRioVHeOj2D03jLths5pt25itdjAYwB12bsv8MtXIQNTdn8GnyOuMeH/6eLcS
 avb5cxOy1tJoq7eb9u7JPEYi8D01irpJtBqyMxse/F5fBOgekcpObqFUS0khNMMenivp
 T2akpnYB4c45gNnLird+HPBxx2PHRQeGZeeVyZhmQwumrJFWEMcAbFGQ/OWcgMcdprzY
 RA8w==
X-Gm-Message-State: AOAM533H4GXhTlxCvU4OB9sHwwYDbec8DBQPof7JIYY9jWEmxPmiPzu3
 5fRPQbAOuq6C/W7yO6EJIQgzjQ==
X-Google-Smtp-Source: ABdhPJx8x7aGui0evsKsvD3KBC/lKMz7IbmeiuUEJF0EQCs7ac5SN0/StQPl2z/z6lI1nJI1fO6lrg==
X-Received: by 2002:a17:902:cacb:: with SMTP id
 y11mr6652552pld.96.1644359382607; 
 Tue, 08 Feb 2022 14:29:42 -0800 (PST)
Received: from [192.168.1.118] (121-45-127-8.tpgi.com.au. [121.45.127.8])
 by smtp.gmail.com with ESMTPSA id f12sm12460384pgg.35.2022.02.08.14.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 14:29:42 -0800 (PST)
Message-ID: <b7861183-7aa4-d0bd-ec1e-ab662fc15683@linaro.org>
Date: Wed, 9 Feb 2022 09:29:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/13] cpu: Move common code to cpu-common
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220208152243.16452-1-f4bug@amsat.org>
 <20220208152243.16452-8-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220208152243.16452-8-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1033
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/22 02:22, Philippe Mathieu-Daudé wrote:
> -void cpu_abort(CPUState *cpu, const char *fmt, ...)
> -{
> -    va_list ap;
> -    va_list ap2;
> -
> -    va_start(ap, fmt);
> -    va_copy(ap2, ap);
> -    fprintf(stderr, "qemu: fatal: ");
> -    vfprintf(stderr, fmt, ap);
> -    fprintf(stderr, "\n");
> -    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> -    if (qemu_log_separate()) {
> -        FILE *logfile = qemu_log_lock();
> -        qemu_log("qemu: fatal: ");
> -        qemu_log_vprintf(fmt, ap2);
> -        qemu_log("\n");
> -        log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
> -        qemu_log_flush();
> -        qemu_log_unlock(logfile);
> -        qemu_log_close();
> -    }
> -    va_end(ap2);
> -    va_end(ap);
> -    replay_finish();
> -#if defined(CONFIG_USER_ONLY)
> -    {
> -        struct sigaction act;
> -        sigfillset(&act.sa_mask);
> -        act.sa_handler = SIG_DFL;
> -        act.sa_flags = 0;
> -        sigaction(SIGABRT, &act, NULL);
> -    }
> -#endif
> -    abort();
> -}

This ifdef won't work moved to cpus-common.c.

Coincidentally, Alex and I were a bit stumped early this morning about a 
g_assert_not_reached() failing to kill a plugin example, and I had totally forgotten about 
this.

We should probably rearrange user-only to *not* trap SIGABRT in general; only SIGABRT that 
can be raised by the guest.  Perhaps the signal number should be remapped in the guest, to 
one of the host rt signals?  Then if the signal makes its way to the SIG_DFL handler, we 
remap to a host abort().


r~

