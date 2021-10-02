Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCDE41FC80
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:24:48 +0200 (CEST)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfwV-0001t4-Pc
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:24:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfuz-00084n-BT
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:23:13 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfux-0000JN-Uw
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:23:13 -0400
Received: by mail-wr1-x432.google.com with SMTP id r7so4872157wrc.10
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l9svY+rHrRbqTGJKrU9zo0WGPJ233CvXWonbZSFuEsU=;
 b=DQiOHUPJsfARawLV6+NfsQPVjuEAtr5dbRt1yRnb2HHu+KcCv1RXpxDVBK8l/SKhT7
 AHvtVPYYifGJTdgd03IJT30m0counFeijCFK8CAEqhjB98zKPJaFlkBfy1MbHYHYD4D8
 7rrxhTdqnWWq1J1WfinXaXy16d4CILN6JELgkaXWh0nw85uDImX0VfsQErNtcJJihWzO
 B/Z0+gISqCyJLP36h+p3Pt+xR4EUD2FKZW7RhITFggVqa67+1F/WymAvpgc3Mw0iBQZc
 PCPl4688mGj5Y6puazRx8AXge1VptFxuzV72pzOWrB4QGlZqF1AdWSe+mo3n/7p3aeuE
 U6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l9svY+rHrRbqTGJKrU9zo0WGPJ233CvXWonbZSFuEsU=;
 b=215ePM4T+Z1P7floL2EC1dKRT2oiGcEJEGdnUs26uXV8Z5R7N9tpGhyokZLP/Vre5X
 j7/dVmKoeQpf8IlahoU1g0FJ8gf8PLwJnC94tN9PbVtjAxjLKQk2gzMipa+NyyVdTKgr
 WKupRWFAlhUng6Zh+lKYmvuFZi6WkHdfJks7/4hpwZJPDFA8acZFGQazLKC6w7i69lYN
 W8XZrSVYQ0Hcwn9SAeZiyioZ+DrKENQ4H4eLbLKg/0kHBGcpU7Qn0OvMKfzue7K84PoS
 W+Nxo+tS0e8KB+TBTrjrJcHPnGHzepNUdrPHW+aGPB7QVDmtgcb5P5T/e/HyNSWYbE80
 FReg==
X-Gm-Message-State: AOAM532JSQEeezOaI2Zmc7Y+WbAmeM2qmfEB/v2Wo5lxbQYDm7/V2Bbl
 wXL7bfv5rgLlOmOEM+6iGGo=
X-Google-Smtp-Source: ABdhPJx7dd7mC/FYYN3rnGymVxHgBUb0QVn4wYZmTT2xhp61HBk5JxPC4JPEbkQ6R29/7j7++S68KQ==
X-Received: by 2002:a5d:6545:: with SMTP id z5mr3678953wrv.51.1633184590592;
 Sat, 02 Oct 2021 07:23:10 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 1sm11930156wms.0.2021.10.02.07.23.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:23:09 -0700 (PDT)
Message-ID: <a08cf05c-9416-a402-223d-e3217c8a31f3@amsat.org>
Date: Sat, 2 Oct 2021 16:23:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 30/41] target/mips: Make mips_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-31-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-31-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.413,
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/1/21 19:11, Richard Henderson wrote:
> The fallback code in raise_sigsegv is sufficient for mips linux-user.
> This means we can remove tcg/user/tlb_helper.c entirely.
> Remove the code from cpu_loop that raised SIGSEGV.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/tcg/tcg-internal.h    |  7 ++--
>  linux-user/mips/cpu_loop.c        | 11 ------
>  target/mips/cpu.c                 |  2 +-
>  target/mips/tcg/user/tlb_helper.c | 59 -------------------------------
>  target/mips/tcg/meson.build       |  3 --
>  target/mips/tcg/user/meson.build  |  3 --
>  6 files changed, 5 insertions(+), 80 deletions(-)
>  delete mode 100644 target/mips/tcg/user/tlb_helper.c
>  delete mode 100644 target/mips/tcg/user/meson.build

Yay!

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

