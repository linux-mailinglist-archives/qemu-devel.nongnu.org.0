Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910C4A398D
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 21:54:45 +0100 (CET)
Received: from localhost ([::1]:37366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEHDg-00030j-5t
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 15:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHCJ-0001zP-3u
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:53:20 -0500
Received: from [2607:f8b0:4864:20::42c] (port=45949
 helo=mail-pf1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nEHCG-00048z-VI
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 15:53:18 -0500
Received: by mail-pf1-x42c.google.com with SMTP id 128so11093206pfe.12
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 12:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XkRaFQgBsLayBezrtWck6FvXtxWXnm7O5f9dwkWkAGQ=;
 b=U2iX/pmlN6Hync8AqCeOMqWFKlAkA6T9/f0Bl2x4iIMugeBxAJlDqNGwKXBQx6KemQ
 NSNylryGgEbrhXTEpIvsdqd29hjgRf6U/rLThx6ZsWln8vxfw+klL2GonndUJpztPHbc
 k97QwUdhU2l4MdYSeTGxupvPT2fNdBN/CoX1fzIxqsqpjsn0s0R+4IGovKGKcOj556zW
 Y8Ji7UV/f0MRPB55P7Ky3Ynko0lIb5hRilBfFB+07X8bqh1sNHZzWFtCqsxIHttk/5B8
 ijIdp3OXGjPi+PM7WibPukpnvgIRzLFVXfD6gR+geuaU3tOsqDJP2i9s5pdSbCiG/flc
 bTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkRaFQgBsLayBezrtWck6FvXtxWXnm7O5f9dwkWkAGQ=;
 b=1LcrY0ImSetwmjQvFOx/tSYOTAb+06LbQfG5sZNUfZiBxYT0+ac6pT8VZtZQWwizYA
 2w0nUT2sAKazrNQgJuNq0jWrLDBkJ+ReF7J61bZ3LbXTf6DIEQAk9VqEPBBFtxIj26A5
 ykpw7WZ8X0SctFLiIaaudLpInMsXUucfR6ZNWX07tah791I/f3M+ZZODziOHkXC7Kj5x
 HoQPXw8kMZ9xCk3NdBi4zS+/aOiFb961Ld12Vfs3VIAI8o7fn4ogCpoaVrs2fqCRF7gi
 t/D+oKNSliMOmB70ty062AP8lL/ocxZ8u0Jw8FKIuCWxZAx+uLaN+bx1CC5A3ytCETrd
 AeYQ==
X-Gm-Message-State: AOAM530LJsZ8dSoDgUbw0K55Gj/f3txg1P/r1d/mAzBiYh0qWfAg7YfB
 6abVp8CVhjezlk04YfEH2gp4jg==
X-Google-Smtp-Source: ABdhPJxU3Yc4LDialJLRHF0RKn2U+haWFEtwiHjftvqXohMEqoTi8ArD0icmtWsK8FvhR8yxXnMlSw==
X-Received: by 2002:a63:501e:: with SMTP id e30mr14517421pgb.198.1643575995606; 
 Sun, 30 Jan 2022 12:53:15 -0800 (PST)
Received: from [192.168.2.37] (240.194.168.125.sta.wbroadband.net.au.
 [125.168.194.240])
 by smtp.gmail.com with ESMTPSA id i127sm224479pfg.142.2022.01.30.12.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 12:53:14 -0800 (PST)
Message-ID: <cf924b8a-3914-8068-5a55-46801c5a57f5@linaro.org>
Date: Mon, 31 Jan 2022 07:53:08 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] target/riscv: riscv_tr_init_disas_context: copy
 pointer-to-cfg into cfg_ptr
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>, qemu-devel@nongnu.org
References: <20220128145642.1305416-1-philipp.tomsich@vrull.eu>
 <20220128145642.1305416-3-philipp.tomsich@vrull.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220128145642.1305416-3-philipp.tomsich@vrull.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: Greg Favor <gfavor@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/22 01:56, Philipp Tomsich wrote:
> As the number of extensions is growing, copying them individiually
> into the DisasContext will scale less and less... instead we populate
> a pointer to the RISCVCPUConfig structure in the DisasContext.
> 
> This adds an extra indirection when checking for the availability of
> an extension (compared to copying the fields into DisasContext).
> While not a performance problem today, we can always (shallow) copy
> the entire structure into the DisasContext (instead of putting a
> pointer to it) if this is ever deemed necessary.
> 
> Signed-off-by: Philipp Tomsich<philipp.tomsich@vrull.eu>
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> 
> ---
> 
> Changes in v3:
> - (new patch) copy pointer to element cfg into DisasContext
> 
>   target/riscv/translate.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

