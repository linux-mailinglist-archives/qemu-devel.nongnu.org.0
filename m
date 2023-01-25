Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1867C0BD
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 00:22:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKp5B-0008Tt-TU; Wed, 25 Jan 2023 18:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp59-0008T6-OV
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:21:31 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pKp57-0007nz-KV
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 18:21:31 -0500
Received: by mail-wr1-x429.google.com with SMTP id n7so142528wrx.5
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 15:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HftnaraMrzMu2NCyDy8hZZSwOEARFdrJ7zUueT2gBQ4=;
 b=uHmNkl17V9+XCIazx4KSiwXxkt2jFww6TVm2+RRj9MUwzsF66JkIKgtDXy2Iulbtib
 57f20+IZ/0FkvYc+XDl77Nb3jgpbfSdbTlaWAduhgP13v4TJEozNRGn6P/wPZrUck9Aq
 Zl0muIMiuLYxMQqJs5sdEevHgn45ScfCD50ZWdUAfTmuPG+2Y7cHp9eIW6OfcVbPgnY4
 DySdnp8heERUYrQGX+CukajVF3jgd3SVG7RmhnyP5sp8eJV9wCEISWUBZ2bENJt1IxZc
 C6pO4J5inC6YEesl6MHn0XQIrLi+bk793AFuSSd5W/9WOYK2zkC+puXaVri9PlpKUslP
 Wftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HftnaraMrzMu2NCyDy8hZZSwOEARFdrJ7zUueT2gBQ4=;
 b=dIG5OTgDPVxGVO4NRzyvBojfVsZ+eCZMWOo1LhmvXMWF60bbwPfoI0aGGadGCncZSo
 QsTlPGGzl7Zsp0AaYdDXe3zCpxLYOQqK/IM4aJg9BiYI/klF3pqt+Z3jk2TD4vHoOHn2
 M38Gq9ufmBEybT3UU9bGOC7JK78n7ZYW4uB8gop9ibLRyZqZOt8qwq1axerkoELRSXVt
 tHAapjsajtTUlTKLixYHDtFKKb4I9UtsncknhSA8j1ANH7Bh2RMZtql/DY6d5JIC309C
 yeujgsR9sxhNOP6JTJ2LvEhKP04WZ4r0CfF7jrP19vmqocCmV0exXUgkeov4JdWBhjMx
 1T8A==
X-Gm-Message-State: AFqh2kqojqS1HU4D++V+MxoU8fVa9H+C4bx7IN+kbliOf9G6nfus6rvb
 JPv4VB/wQkhCJEwdy0InoDn9Uw==
X-Google-Smtp-Source: AMrXdXuOSXkBNGbtoNq3ID6gLMxrs4HfyfU6oD9mLP2yUiBNH43OAQ0eS0ohSP6WxikhDWT9Zon62w==
X-Received: by 2002:a5d:6f15:0:b0:2b9:28ef:24c9 with SMTP id
 ay21-20020a5d6f15000000b002b928ef24c9mr33806198wrb.39.1674688888058; 
 Wed, 25 Jan 2023 15:21:28 -0800 (PST)
Received: from [192.168.0.114] ([196.77.22.181])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d650f000000b002bdda9856b5sm5438042wru.50.2023.01.25.15.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jan 2023 15:21:27 -0800 (PST)
Message-ID: <ac49a96c-449d-ce00-3ec9-6d949300a6f6@linaro.org>
Date: Thu, 26 Jan 2023 00:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 23/35] semihosting: Write back semihosting data before
 completion callback
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Bandan Das <bsd@redhat.com>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Michael Roth <michael.roth@amd.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-arm@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Li-Wen Hsu
 <lwhsu@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Keith Packard <keithp@keithp.com>
References: <20230124180127.1881110-1-alex.bennee@linaro.org>
 <20230124180127.1881110-24-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230124180127.1881110-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 24/1/23 19:01, Alex Bennée wrote:
> From: Keith Packard <keithp@keithp.com>
> 
> 'lock_user' allocates a host buffer to shadow a target buffer,
> 'unlock_user' copies that host buffer back to the target and frees the
> host memory. If the completion function uses the target buffer, it
> must be called after unlock_user to ensure the data are present.
> 
> This caused the arm-compatible TARGET_SYS_READC to fail as the
> completion function, common_semi_readc_cb, pulled data from the target
> buffer which would not have been gotten the console data.
> 
> I decided to fix all instances of this pattern instead of just the
> console_read function to make things consistent and potentially fix
> bugs in other cases.
> 
> Signed-off-by: Keith Packard <keithp@keithp.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20221012014822.1242170-1-keithp@keithp.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   semihosting/syscalls.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


