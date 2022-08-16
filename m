Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F02594BAE
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 02:50:56 +0200 (CEST)
Received: from localhost ([::1]:44928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNknH-0000Um-Kw
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 20:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkjK-0005OC-Pr
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:46:51 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oNkjJ-0005rS-7m
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 20:46:50 -0400
Received: by mail-wm1-x333.google.com with SMTP id h1so4530511wmd.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 17:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=ZAZYFkQNV1Aj9fnisrWG8Jx9VnO7LIym7Ls24ERj0ZA=;
 b=dFHLmuCCpIqwCwxYbYv053V4TZS7vhqBFoDvKDJY6Zwq4MxJhO35Bs6v78zsuwO12H
 ZaW7k3Ylokj2eknUrP7Agjhjj1zxd5bd7VAcl9bhtrIHxS2KhmeYM+ZJF9I/6pbY4JA/
 QvtW7H7Jysq4bkbUsFPMc9MQ9RCEFtLAb1RMiEijrl67+4K899bQHCSL96aHb7GKIrtj
 7PJomGlwt2GhKzbQJ/uXb8rKctPqsfEDHvmOoTfOvjcybTUUjljdSPwLfqrnqlD2BLtq
 xPz034NYXEcDYM8hDSqlnlzpNr63HkrYe9k0yPEodYIJl93rvrSwvjjmw6PWAd2T97IC
 Mpyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=ZAZYFkQNV1Aj9fnisrWG8Jx9VnO7LIym7Ls24ERj0ZA=;
 b=yjegfK/48YD/F9xyzYw8+2tXv6RKJhpAQIR5uhcaJdXQ+cwOWA69hJhSwB7Vr6FZbA
 Xjqi8f68AkRsoaGzFsJDdPqHWpad5wTjI04Hv3tgqH2kcFLtm/BCefeM+yMrEQA6S1DE
 WBDiX2x+4xgdJIQ01VVB2Xo8qNEVsm14cc/9SGKy6RVS935NselxCzEk7yz6TaKKJ9Lt
 7Qwswtx4384dSYAgvjknfufrP+5u6oug7aQOPkHExLZjbJhXJ7DnaXFuNu/NTHL4q3Yp
 hH2K6QUEz6wHke6hbW/bWpQYHCql6WWxA6QHtmErsoQHoCgDPg5WtL3IAZHKzFdyTQ4a
 A4hQ==
X-Gm-Message-State: ACgBeo1nApc8yra3ssb8F75TVnl+BvnIWBTG5pKiAiHmGAmu3J0EWiXE
 2Zj7kwdJi20zVcO9+aZsQnw=
X-Google-Smtp-Source: AA6agR4KwBrnCB1wqhk7Y8xj1l+cMAbATQueOl7lLeNdtga/+fsMPRuoBkrDFslPPeHEFVHm2lxXQQ==
X-Received: by 2002:a05:600c:a03:b0:39e:4f0c:938c with SMTP id
 z3-20020a05600c0a0300b0039e4f0c938cmr11521876wmp.145.1660610807166; 
 Mon, 15 Aug 2022 17:46:47 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a5d68d1000000b00222c96d8656sm8481478wrw.114.2022.08.15.17.46.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Aug 2022 17:46:46 -0700 (PDT)
Message-ID: <9135204c-cf67-b334-cc25-1c3148dc8769@amsat.org>
Date: Tue, 16 Aug 2022 02:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH] meson: be strict for boolean options
Content-Language: en-US
To: Anton Kochkov <anton.kochkov@proton.me>, qemu-devel@nongnu.org
References: <20220813121400.1995447-1-anton.kochkov@proton.me>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
In-Reply-To: <20220813121400.1995447-1-anton.kochkov@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 13/8/22 14:15, Anton Kochkov wrote:
> While Meson buildsystem accepts the 'false' as a value
> for boolean options, it's not covered by the specification
> and in general invalid. Some alternative Meson implementations,
> like Muon, do not accept 'false' or 'true' as a valid value
> for the boolean options.
> 
> See https://mesonbuild.com/Build-options.html
> 
> Signed-off-by: Anton Kochkov <anton.kochkov@proton.me>
> ---
>   meson_options.txt | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meson_options.txt b/meson_options.txt
> index e58e158396..63f0725174 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -82,9 +82,9 @@ option('tcg', type: 'feature', value: 'enabled',
>          description: 'TCG support')
>   option('tcg_interpreter', type: 'boolean', value: false,
>          description: 'TCG with bytecode interpreter (slow)')
> -option('cfi', type: 'boolean', value: 'false',
> +option('cfi', type: 'boolean', value: false,
>          description: 'Control-Flow Integrity (CFI)')
> -option('cfi_debug', type: 'boolean', value: 'false',
> +option('cfi_debug', type: 'boolean', value: false,
>          description: 'Verbose errors in case of CFI violation')
>   option('multiprocess', type: 'feature', value: 'auto',
>          description: 'Out of process device emulation support')
> --
> 2.37.1
> 
> 
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

