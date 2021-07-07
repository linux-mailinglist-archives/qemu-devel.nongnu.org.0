Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01953BE47B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:34:26 +0200 (CEST)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m130k-0001Yr-04
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12ze-0000NV-1P
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:18 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:38731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m12zc-0005fG-BS
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:33:17 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so3547181wmb.3
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Cy31A7gSdgaereGa/PIqFqGOflIXPGVSfPkpmalJg3A=;
 b=Q78y3oK+WBizbA6OcvwtvDorGrodhWMGdT3pmwdHOk/2UhYxdJeNXWIMXy8FHs35Se
 puDnA3DTIbd63OUESrCwqsxtPkEVfPHekDtIjkaYtKnnqV2bdLo/RYId7h8kn4nV2CGQ
 fPda9Jn7jEMF6LoBuX9Lr+HE4L9p2Sjpn7mCpGkISXYM0JuUKYkclXwJFa6BO1p37QWW
 0uaL8n6relHzoNuUfB0hfLpMNH6lIxjxtAFuzcBNYElmcLO6M+rGMu6wvTIIlcDhlnMO
 Ln76hX6vHp+uNkZsA0iwSJQYJqmHhRDcH/O+tvf8Ip9sUmr1XKHWsUruOSvhGWoehlXp
 eKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Cy31A7gSdgaereGa/PIqFqGOflIXPGVSfPkpmalJg3A=;
 b=JJa1A5QvI4xsXYk6+lhxxLsnlF35y0Spqa9wntqo7zu3gMoapM3eGbM10MEyMgrI20
 MVt+tU2JQibVoRzD+FcKfA47AwnQX8YJ/qnKV5xX7pieKM4MbfJt9Mk6QzD7olOpMiFv
 MnB5eze56FwprzZusySUrfQ1HGPO560KjJP1JA1o+4vygakBGo3/Y96b7qXBwih1mhgj
 4jUJ0FSwl6lQOiDjLeAS3copDiJ/acS1/kHdllGMON4MW+YMJXz/zPlcfENHGH9Hb8FO
 mLqYR701z5VNBbZMpqgkkO1NbYgcF57ca4wAHCZV4reBMNBERS8ux7MmADw+E3ptV/FG
 1veg==
X-Gm-Message-State: AOAM531OPjrrKb3NubREaPCj3ikO38lm8tdxWL0Ag3/ZK1JWH4ahf9jE
 pAaBDS5Fp+lTlfAC0aZgaII=
X-Google-Smtp-Source: ABdhPJwohU/qQDIiZoNZdM1X3earJIRrMFe3eJvajEQpJ7rVxnMXeLY1Uoyso1sKGdM8mXUchnAV6w==
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr5450232wme.188.1625646794651; 
 Wed, 07 Jul 2021 01:33:14 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id l15sm14041578wrv.11.2021.07.07.01.33.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:33:14 -0700 (PDT)
Subject: Re: [PATCH v1 00/39] final pre-PR for 6.1 (testing and plugins)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210706145817.24109-1-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bcc45751-a309-4e10-5376-d944d73edb29@amsat.org>
Date: Wed, 7 Jul 2021 10:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706145817.24109-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, berrange@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/6/21 4:57 PM, Alex Bennée wrote:
> Hi,
> 
> This is a roll-up of a number of testing series:
> 
>   - Cleber's ansible playbooks for installing runners
>   - Daniel's Cirrus cleanups
>   - Most of Daniels' docker clean-ups (but without lcitool)
>   - Disable signals test for all arches

Two other candidates:

"tests/migration: fix unix socket migration"
ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn
https://www.mail-archive.com/qemu-devel@nongnu.org/msg789348.html

"tests/acceptance: Tag NetBSD tests as 'os:netbsd'"
20210623180021.898286-4-f4bug@amsat.org
https://www.mail-archive.com/qemu-devel@nongnu.org/msg818429.html

> 
> I've also included the latest submissions for TCG plugins. One big
> change however is we now enable TCG plugins by default for TCG builds.
> When no plugins are selected on the command line the performance hit
> is so low I couldn't really measure it. I've dropped the previous tags
> though as I needed to re-factor the configure a bit to handle some
> additional corner cases.
> 
> The following still need some review:
> 
>  - contrib/plugins: enable -Wall for building plugins
>  - tcg/plugins: enable by default for TCG builds
>  - configure: stop user enabling plugins on Windows for now
>  - configure: don't allow plugins to be enabled for a non-TCG build
>  - meson.build: move TCG plugin summary output
>  - plugins: fix-up handling of internal hostaddr for 32 bit
>  - tests/tcg: make test-mmap a little less aggressive
>  - tests/tcg: generalise the disabling of the signals test

Sounds like Richard's area but I'll have a look.

