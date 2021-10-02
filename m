Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC741FC7F
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 16:24:39 +0200 (CEST)
Received: from localhost ([::1]:46048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWfwM-0001Xj-5x
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 10:24:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWftl-0005pc-FT
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:21:57 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWfti-0007qd-Ji
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 10:21:57 -0400
Received: by mail-wr1-x42e.google.com with SMTP id r7so4867994wrc.10
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 07:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2F6ng91tB9cdORBVlU8j+uXc9BPdr6y+C8rh6/GDsY=;
 b=DVIemK3Rq/jJ2mWe+rsAmTzqd6aSQdIfW9R6TbYPInB1U3DOqiWwrFi4IhMu8VkOqO
 2N173w+azaw5yYv4BirHNwAWzc+96A8T9f5OTNBacz4FPrz7UzJ9qAv4uQOwxFdTW+pR
 VU4jNvhxIsz4XeZnu6cPm7WaFqOjQm+0H1PsaJSddqVJukBF7pjeDYJNDfqr4//SEREG
 c9yP4gNvsu/uBiH/CrCCQ3BDUUtRll7yn+A5KoaGMXIWOkIEsYu/GYRRDbB2BBz51qgd
 Eujd0bWI4j1ncxAXK/UHab+/OOOFxLfCgPo1Fvrzd/ZOETdiBo3LCC+Cz3OFszeKyFl/
 tHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+2F6ng91tB9cdORBVlU8j+uXc9BPdr6y+C8rh6/GDsY=;
 b=6Jh8OzoAJmOXQO7u05aN3vY8yIotEYYd6kLBcxhbQ+UUW5dDdL7vAt+dvBF2/B+Psa
 J1LmdiK4I8S97CMWMfGAOdX3xb3GaH3IfrwN0Hj/uQrbPW7oRWJGdgH6iVos87nGnECG
 8giuYNb2xVdz2n90TqsQbX/q9FwaLfwhPBJiUlVHCWf23YslPn3dHsjk2RwiFd4zIiOn
 2RppMOgy1OVZImDHTn/pyoy695yYrjzCLhDnXjuxblA3A7Daa7DJ+k9dfQl4pJpIZhot
 alSsmun2XqScnTzIMZ/lyLWj/0IpKjF5wbO9mnDkFgP3jGN0Xw66OKn14Y/BBQo86L9N
 CX5A==
X-Gm-Message-State: AOAM5336I3k5wtxc0FoEHqLlRjtvrntH3Ucr/8r/6YINP8bpM4W0aE8R
 csuOvtWGw6LX9yMWc4PX0Rg=
X-Google-Smtp-Source: ABdhPJwBFyHL05Wtpd2MlsU51q4areakJeeP26qhSYtfm/xFFJnOAHEGpHrxoGGvt5R8WnEc4VsFPA==
X-Received: by 2002:adf:a2c4:: with SMTP id t4mr3785106wra.296.1633184512226; 
 Sat, 02 Oct 2021 07:21:52 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c132sm11008275wma.22.2021.10.02.07.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Oct 2021 07:21:51 -0700 (PDT)
Message-ID: <306f5f67-8e3e-77f4-cda6-dde60d5890b7@amsat.org>
Date: Sat, 2 Oct 2021 16:21:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 28/41] target/m68k: Make m68k_cpu_tlb_fill sysemu only
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
 <20211001171151.1739472-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211001171151.1739472-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
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
> The fallback code in raise_sigsegv is sufficient for m68k-linux-user.
> Remove the code from cpu_loop that handled EXCP_ACCESS.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  linux-user/m68k/cpu_loop.c | 10 ----------
>  target/m68k/cpu.c          |  2 +-
>  target/m68k/helper.c       |  6 +-----
>  3 files changed, 2 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

