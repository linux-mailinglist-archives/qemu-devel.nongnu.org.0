Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E01F4A9D83
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:15:05 +0100 (CET)
Received: from localhost ([::1]:58172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2Aq-0004Q7-5h
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:15:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1wh-0007nu-1b
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:00:27 -0500
Received: from [2a00:1450:4864:20::431] (port=35811
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nG1we-00040d-OK
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:00:26 -0500
Received: by mail-wr1-x431.google.com with SMTP id j25so11806963wrb.2
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RSBHeYy7MVr6UkfA5hQKrknrFCZuYtm6vu+j87EErIM=;
 b=gKUWtA2zorst8pNe3ITuWKpQudfF2EsoBuZSp9WkjzOx3E9MiVulMHC4B9NKYw3j0s
 3AMqtFg95J5u6pAvr1P9k/BPKxuvhWebt4An8d1V09RZ8Wy3HTtkKJyY4WZSoKxDdk5A
 E6iTO9+bqhJnkDg+HhcYgj2/jK3Gb5bCksfmY2sk2aJMOsTvQAMY0G7TRHmYIDbPuUof
 w1GQuvml5eNoUYKCR+9Iu05dV/OuD51066eG3f3i9Wu+8x1mtK6arRoDMTfZ0B5c//uq
 dH/63aZrphBc3ExWVZpLmHrKBiPoNdlBrDszaDnJB58t6iRy4Ia6N+Z6f147f8yfQfG9
 fERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RSBHeYy7MVr6UkfA5hQKrknrFCZuYtm6vu+j87EErIM=;
 b=Snm8c38FEZj22FyN+QF3xYf/1fumiJdQisrFVy9tkQZegHNiMUdJX1Sb+70vVSjzpj
 XrQcxliVZ5bRiHaBd2xxVoz1gHexPKumO4zFyFiLS4TvWUf/gs7uDYdsqq8eSQYOqI7s
 HI6EaBtXaOL3EV7k0RdOYdJP+FFSN2X/W+njs55rad18n0feWmyzQ95L4Yl9m8Xf75MW
 WsnggRPvzqxxrk4eivyHnc5f6WmcuZWXkL2mVhwBKrUwAbegQCEL3t2zd8mS+BaSxRTL
 gzAi8pa5FjW/4LDzHW6IO3VKBjZkrKnwXWup/QtZcNyjCKxZfLyw8XW8q3gAfTk/LRZk
 ayhw==
X-Gm-Message-State: AOAM5325+xPwInFjl/tNGg+FqLQx09mJAE1cNrNBzfPxbHLSEjUT57/q
 cqnYTbxLno/ARJQSuG7ElCw=
X-Google-Smtp-Source: ABdhPJx86o+CAfP0U+psVoryJebgSnLQaVKkKEb19t2cU868obPn9uN/aoqQYS6bAq+43ANwY8P3AA==
X-Received: by 2002:adf:f141:: with SMTP id y1mr3161763wro.104.1643994015536; 
 Fri, 04 Feb 2022 09:00:15 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id r2sm8322002wmq.0.2022.02.04.09.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 09:00:15 -0800 (PST)
Message-ID: <13f62b30-49b5-4635-4b9d-4eb5a3e8e7a6@redhat.com>
Date: Fri, 4 Feb 2022 18:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 4/4] qapi/meson: Restrict machine-specific objects to
 sysemu
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220204152924.6253-1-f4bug@amsat.org>
 <20220204152924.6253-5-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220204152924.6253-5-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 16:29, Philippe Mathieu-Daudé via wrote:
> machine/ and net/ are only useful to machines;
> block/ and migration/ to machine or tools.
> 
> Note we need to keep building machine.json generated sources
> on all targets because some want to access X86CPUFeatureWordInfo
> from any architecture ¯\_(ツ)_/¯ Otherwise we get on all but
> x86 targets:
> 
>    /usr/bin/ld: libqemu-i386-linux-user.fa.p/target_i386_cpu.c.o: in function `x86_cpu_get_feature_words':
>    ../target/i386/cpu.c:4587: undefined reference to `visit_type_X86CPUFeatureWordInfoList'
>    collect2: error: ld returned 1 exit status

I suppose you mean "on all but x86 hosts", since it links 
libqemu-i386-linux-user.fa.p?  But I don't understand how that happens. 
  Is it related to

{ 'struct': 'DummyForceArrays',
   'data': { 'unused': ['X86CPUFeatureWordInfo'] } }

and if so can DummyForceArrays be moved to machine-target.json together 
with X86CPUFeatureWordInfo, and under 'if': 'TARGET_I386'?

Thanks,

Paolo

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   qapi/meson.build | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/qapi/meson.build b/qapi/meson.build
> index 656ef0e039..38b01f3083 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -23,10 +23,6 @@ endif
>   
>   qapi_all_modules = [
>     'authz',
> -  'block',
> -  'block-core',
> -  'block-export',
> -  'char',
>     'common',
>     'compat',
>     'control',
> @@ -35,26 +31,23 @@ qapi_all_modules = [
>     'error',
>     'introspect',
>     'job',
> -  'machine',
> -  'machine-target',
> +  'machine', # x86 is considered multiarch by some
>     'migration',
>     'misc',
>     'misc-target',
> -  'net',
>     'pragma',
> -  'qom',
>     'replay',
>     'run-state',
>     'sockets',
>     'trace',
> -  'transaction',
> -  'yank',
>   ]
>   if have_system
>     qapi_all_modules += [
>       'acpi',
>       'audio',
>       'qdev',
> +    'machine-target',
> +    'net',
>       'pci',
>       'rdma',
>       'rocker',
> @@ -63,7 +56,14 @@ if have_system
>   endif
>   if have_system or have_tools
>     qapi_all_modules += [
> +    'block',
> +    'block-core',
> +    'block-export',
> +    'char',
> +    'qom',
>       'ui',
> +    'transaction',
> +    'yank',
>     ]
>   endif
>   


