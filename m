Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B144AAD5A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 02:18:13 +0100 (CET)
Received: from localhost ([::1]:41946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGWBw-0001Bq-7M
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 20:18:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGWAF-0008Ly-JP
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 20:16:27 -0500
Received: from [2607:f8b0:4864:20::530] (port=39655
 helo=mail-pg1-x530.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGWAC-0000EV-0E
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 20:16:25 -0500
Received: by mail-pg1-x530.google.com with SMTP id j10so8403511pgc.6
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 17:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Mf9YwNCkOUOfRoDpJcuYnrldV83zv5zP4vlR0Udfb9w=;
 b=INZ9soH8q6RfEWS7zTJvnR7ouvTMrV7jo77AMpEAZsXVQ/2fY8jnHRk/5mYNTUI/b5
 W0dJ6FCFbcO5fgcOeW5ocFLX/vAZeAdqbxSn3BfkhGxyrgU5rmctLMVjb7DoUtTM3lRC
 p5/Whl/DGh8RWa+0m9YTJeEg/aaMR+1199kBVum0SycxDBQNGALFU01dT0JuloKOw62O
 WTU6roq0JW9SymrkI8OL6H1xF+tRueU+IEI0zDzKpkmEWkuPKHD81y9Yi9SCp/JEuBun
 qw0hzF58cg5f7jKEVXsL+DuyTlkVnHNmiK7PjOuP2v4Ef8C7dd39lqBhiOEgdO4N9VFe
 q6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Mf9YwNCkOUOfRoDpJcuYnrldV83zv5zP4vlR0Udfb9w=;
 b=VKOGbPcIM1ylyNZJXFuHh+6n+qp0920hgQXPR3i7CL3dYebCZuvGfQ1wgoTXX7fu8/
 9rU4w9N2tMazRxTnuoKZABoJL5Jm6Vu7jHiMBirCFxX4bC/3Zt4MyKoz2aP4+MmkqlCw
 cFO2evEZJXruYRxHr4W/C3ET4WFHZ+RWIpjugckCoIi5xIfzjjkC+fI3N1hQgvUchf/b
 1boeBomTP0V+E8xdAO+vSx6vh02tiCr9keIZmo8FsPevUjg5AROmIQvBt71Ma0LBRuM6
 bpL01AGOcogmrhO1A1MJEqzw4ADRtWOFrTC57asuj0Ivmm1+VqxVQp4jjt5zRUcCsGiV
 5AVw==
X-Gm-Message-State: AOAM533fRMtU2LpPh+Vf+PqVHl+yCuNuWoNCYXjb9CjFVZGg4GsZ4gLx
 4zEgehw1/Hld9o/ECgxbTC7TLg==
X-Google-Smtp-Source: ABdhPJw7GD+WIH3Z5RNyH+w+vaHpiGvjlS13laL9tNImM8JQlitQTJd+MxOLrUlvLG6GlGMqFtxCZw==
X-Received: by 2002:a65:550a:: with SMTP id f10mr4685736pgr.204.1644110182438; 
 Sat, 05 Feb 2022 17:16:22 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id 198sm4775837pgg.4.2022.02.05.17.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 17:16:22 -0800 (PST)
Message-ID: <8e26c47d-bbba-808d-9caa-f794786d1622@linaro.org>
Date: Sun, 6 Feb 2022 12:16:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 26/26] plugins: move reset of plugin data to tb_start
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20220204204335.1689602-1-alex.bennee@linaro.org>
 <20220204204335.1689602-27-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220204204335.1689602-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::530
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Luke.Craig@ll.mit.edu,
 kuhn.chenqun@huawei.com, f4bug@amsat.org, robhenry@microsoft.com,
 aaron@os.amperecomputing.com, mahmoudabdalghany@outlook.com, minyihh@uci.edu,
 cota@braap.org, stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/22 07:43, Alex Bennée wrote:
> We can't always guarantee we get to the end of a translator loop.
> Although this can happen for a variety of reasons it does happen more
> often on x86 system emulation when an instruction spans across to an
> un-faulted page. This caused confusion of the instruction tracking
> data resulting in apparent reverse execution (at least from the
> plugins point of view).
> 
> Fix this by moving the reset code to plugin_gen_tb_start so we always
> start with a clean slate.
> 
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/824
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20220124201608.604599-23-alex.bennee@linaro.org>
> ---
>   accel/tcg/plugin-gen.c | 29 ++++++++++++++++++-----------
>   1 file changed, 18 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

