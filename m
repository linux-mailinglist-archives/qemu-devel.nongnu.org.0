Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBE8698DBB
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 08:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSYd9-0002h6-Lr; Thu, 16 Feb 2023 02:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYd7-0002gb-3U
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:24:33 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSYd4-0000AF-Kn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 02:24:31 -0500
Received: by mail-wr1-x433.google.com with SMTP id m14so860052wrg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 23:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Phe2LQlCqaP8FJhR9Uv31P4FviZfuKElnLJVtUKvxXo=;
 b=R7HyVeY6exMmQyS8jMzSlrkyyUzxJ90KB4BIbgbdXZKHdKuTZ5xNsUvgq9ptofKMgD
 TNMQYurLxR5dwluX3tQtwqoNyC5fFusm2lFrWPRJykS4IcJtyOLZJkTbCj3qdJdIbLgM
 lEUbH3SWLwYvjP+KQJujieMq0uOstmmiGNvFCwUB3FCEemR2crzZvfP8D96KVjbPSUVn
 K+uFpM1WgYeBr/gKl8llE7WjHGnQo558pSfTM8pGWbxT4FGRGyW6C585l95zHn2wb8aW
 iTnz7KubSslpC/qic9MW0jV4m9x1GO77dBfw27MMeLNIG1w+6Qotq4njaunhqtARncoM
 L+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Phe2LQlCqaP8FJhR9Uv31P4FviZfuKElnLJVtUKvxXo=;
 b=rePvE9YzBCyStGubEHxmAprI+2vGEVixH14z247tGLt7OaIxs/dY2/ZOuAXDX/SqxD
 ZP6dSFz6WbAa+zM7KO3mqMj7JDl/UumtX8e0VwnVDDMZJrnsC3Vl0+ttgIYhblXyFUBU
 AfeY/BAwrKrnFGWgM/OTIDyQ7vpLgAiYJO8zTLe6rrPDSINJqZ1DoegZFF2tXzcTJ6D5
 ycvbwg22ZKaEjUiNE9moH/cpw+ByXbXnzyx0dy/flC5RviX0w8HxW6EuRdPlCG86+9Pa
 03lOGt61+EkPT0K2sV83lcgBtNwUFK9MLnZ8IIuNPWIs+mAGd+lY4mIIExHs42Yn9I4x
 rnJA==
X-Gm-Message-State: AO0yUKXevF9xsNa0rcZrBOtaLVOAZXWZoyVSywXYBiBW7jhzRwcuQZYZ
 yodfaMuRpJjLwLyuS8FJMzBIVQ==
X-Google-Smtp-Source: AK7set9bgQmp+LR8EMbvQzAdNO89Mv1grS0yqxk+WDLPPVp7qiOPbPqW07PzfAwjIqRY0OQF+ETszw==
X-Received: by 2002:a05:6000:16c5:b0:2c5:5ee9:6b27 with SMTP id
 h5-20020a05600016c500b002c55ee96b27mr910908wrf.13.1676532269129; 
 Wed, 15 Feb 2023 23:24:29 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 z12-20020a056000110c00b002c563b124basm709881wrw.103.2023.02.15.23.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 23:24:28 -0800 (PST)
Message-ID: <774ed4da-2afa-dc6c-7890-18acd5dea10d@linaro.org>
Date: Thu, 16 Feb 2023 08:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 02/27] accel/tcg: Pass max_insn to gen_intermediate_code
 by pointer
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, cota@braap.org
References: <20230130205935.1157347-1-richard.henderson@linaro.org>
 <20230130205935.1157347-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230130205935.1157347-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/1/23 21:59, Richard Henderson wrote:
> In preparation for returning the number of insns generated
> via the same pointer.  Adjust only the prototypes so far.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/exec/translator.h     | 4 ++--
>   accel/tcg/translate-all.c     | 2 +-
>   accel/tcg/translator.c        | 4 ++--
>   target/alpha/translate.c      | 2 +-
>   target/arm/translate.c        | 2 +-
>   target/avr/translate.c        | 2 +-
>   target/cris/translate.c       | 2 +-
>   target/hexagon/translate.c    | 2 +-
>   target/hppa/translate.c       | 2 +-
>   target/i386/tcg/translate.c   | 2 +-
>   target/loongarch/translate.c  | 2 +-
>   target/m68k/translate.c       | 2 +-
>   target/microblaze/translate.c | 2 +-
>   target/mips/tcg/translate.c   | 2 +-
>   target/nios2/translate.c      | 2 +-
>   target/openrisc/translate.c   | 2 +-
>   target/ppc/translate.c        | 2 +-
>   target/riscv/translate.c      | 2 +-
>   target/rx/translate.c         | 2 +-
>   target/s390x/tcg/translate.c  | 2 +-
>   target/sh4/translate.c        | 2 +-
>   target/sparc/translate.c      | 2 +-
>   target/tricore/translate.c    | 2 +-
>   target/xtensa/translate.c     | 2 +-
>   24 files changed, 26 insertions(+), 26 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


