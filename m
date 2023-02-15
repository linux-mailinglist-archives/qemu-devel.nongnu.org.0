Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CE969863C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 21:48:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSOh1-0005il-Gj; Wed, 15 Feb 2023 15:47:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOgz-0005g0-8K
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:53 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSOgx-0001BJ-Dc
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 15:47:52 -0500
Received: by mail-wr1-x432.google.com with SMTP id m14so20455358wrg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 12:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XRuaB8/vPk6Sla2dXDUKLD2EFURy/RJZh1AC5WFlsT4=;
 b=coHp6VM2/PVem4s/WbbcYLOJ6o5TTbuB4K2euBJj9dd8B4dljL9Xzc6QdSq8S+X5mb
 gVVvDfARsAiO7yZw1Hoi0Wg6f1Di7XCK0FMfzpC+gx4Bb7BYp5oOzfpv8WbQ/SwZsZr4
 Ce//e8hdkKw/xZw8coD9JJaVUZEPn0ei2iPhZG1KiLRCjVESD9pFDeV3BOkdiJIHAIUK
 jcXhMzg/m7YRbQXtPD1q0apd64x9LYpDZ3Lde5QmAQK87JZ8Zp1mjqgiY5f/UcPE7bYe
 2s8+PSgP/vIytAodhAoNqrbIPLhmg7qSgerFRlei2G6vWtgAciISe9WBpxhwlG67rK/m
 U4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XRuaB8/vPk6Sla2dXDUKLD2EFURy/RJZh1AC5WFlsT4=;
 b=S7+ze93zYk55AjeU/FIibGsC1bSERy5taEtjulTdsAx69JOGICzhzC/R2i8s4XT0Pa
 mEknuMeGcsoK86jISm5CfLTMTO4y6uQqObnIfH7SQG8jNK+rZXazmcxe56AB3cVVzZHh
 ubdzgHAggV8B+MkIafJPQWc/VgyuUJX5OI5Qn3oEASrMngnH0PfyePpE0s2sDNeDQPsj
 r5frj3fWcWAD5y5BvHeQphk+reim4EYawfwsvEh48ilgGzYdfi3R4wIYav9ucXNh1M1S
 fbyQQ5c2ntRbvnbAjydicrp7/9SRSh7sLjMBnbIwL+qUYWRcJUCrFeVU+wqFkSOXZXQv
 enCA==
X-Gm-Message-State: AO0yUKV58aMnqD8Q9qpVczO+pnfNK/mf68T2nw8XR8cXu+lyg97g3qqJ
 HfAEMuNhjhw0b/8ilJnSY2Ba5w==
X-Google-Smtp-Source: AK7set/MS246tyonJIbJt9p/td7O+OIlC75gp5hM608FDqTVzU3VZlqteoKR/MXjrclRjfJZ4OArYg==
X-Received: by 2002:adf:e707:0:b0:2c5:550e:fad0 with SMTP id
 c7-20020adfe707000000b002c5550efad0mr2823553wrm.17.1676494070126; 
 Wed, 15 Feb 2023 12:47:50 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z17-20020adff751000000b002c57c555010sm70335wrp.28.2023.02.15.12.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 12:47:49 -0800 (PST)
Message-ID: <791c5a86-09e9-8208-6d71-93bb0eec4d52@linaro.org>
Date: Wed, 15 Feb 2023 21:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH 10/12] tests/docker: Use binaries for debian-tricore-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230215192530.299263-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 15/2/23 20:25, Alex Bennée wrote:
> From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> 
> since binutils is pretty old, it fails our CI repeatedly during the
> compilation of tricore-binutils. We created a precompiled version using
> the debian docker image and download it instead of building it ourself.
> 
> We also updated the package to include a newer version of binutils, gcc,
> and newlib. The default TriCore ISA version used by tricore-as changed
> from the old version, so we have to specify it now. If we don't
> 'test_fadd' fails with 'unknown opcode'.
> 
> The new assembler also picks a new encoding in ld.h which fails the
> 'test_ld_h' test. We fix that by using the newest TriCore CPU for QEMU.
> 
> The old assembler accepted an extra ')' in 'test_imask'. The new one
> does not, so lets remove it.
> 
> Signed-off-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Message-Id: <20230209145812.46730-1-kbastian@mail.uni-paderborn.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/tcg/tricore/macros.h                           |  2 +-
>   tests/docker/dockerfiles/debian-tricore-cross.docker | 10 +++-------
>   tests/tcg/tricore/Makefile.softmmu-target            |  6 +++---
>   3 files changed, 7 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


