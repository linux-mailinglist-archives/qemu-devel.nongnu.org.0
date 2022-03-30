Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F284EC2FD
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 14:07:25 +0200 (CEST)
Received: from localhost ([::1]:44716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZX6h-00083c-UP
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 08:07:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZX4o-0007G7-Mt; Wed, 30 Mar 2022 08:05:26 -0400
Received: from [2607:f8b0:4864:20::42a] (port=34808
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZX4n-00012j-1D; Wed, 30 Mar 2022 08:05:26 -0400
Received: by mail-pf1-x42a.google.com with SMTP id h19so17520365pfv.1;
 Wed, 30 Mar 2022 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8azjdoji9UrUjYha/ynVzgf1WuWK5uGCtl7ClwEabAM=;
 b=Hr+GzaLsCMs8mS0QtD2doKISszpEyzBetXmgvDfpJZntcHYZv5LzvDZcXbccziVaEF
 eQyIVZEvpXfS8zmW4kEN8zd28M9hnpON9odNX5DGALb1CtMw/UIDP5LMACyYiCScAedO
 ys942/N2Tm66ewEYJlGu426rFbxnXzFQk3OowbJSI52CJ2zktrdwLTO+suh0bA7bBeEl
 dAkzN/8FiMArOyJNkrWHYcsRiLxGbFxhCAPQMyQngwgCwzGbBwXziIMqQgbcSyrjhUNv
 SbCs9W07V8ePDRttBREPPNjb/nzDUeh+D44i4zdZaIR5327Mab/3ZkGjtSNKorLQ0+0q
 hWDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8azjdoji9UrUjYha/ynVzgf1WuWK5uGCtl7ClwEabAM=;
 b=oppuMD3LzOaoRC0ngHhmijBFZoB6QtmWkdauZzFniflOJa3hr3SNu4A99Xqgw/RAJc
 aGisYF9o7t5hN5VEYB75xsKGNkkvEEXAlCip8EhALYgm7H+ny6hWCDm/It8LGYdDipyv
 k9g9crUMNOqANJGYDLCpYpb5z8w85WvM7xKo0PWShANWep5poFcy9d7IhFZoIpcz+9wP
 ELAOxKGslSshgZiWs6s4n231dfhQMhVMSjQ0L6zKafoFRp3RaP2xlfr48ogGQq5ilY3G
 8nlbF+Vj16SHtuNNU2BrjpC6E+qaLO4LidxcU2BLNIqNMsNQD3SBrsaUgDy275l7eiQ7
 6j0A==
X-Gm-Message-State: AOAM531qP80vekvkv6UwQikGLsTYCXPYutuhK6pNWsa2rK/4IdScTySj
 Inn8HtcsM9MfLrzOMlYCMz8=
X-Google-Smtp-Source: ABdhPJxmZMtf8jMRFGhBdB9+BtencmfP4Cc4MstK775BDaAZdhwN78Utd7AZ6KLXcXUV8ufirmPmOg==
X-Received: by 2002:a63:7056:0:b0:398:68c:c214 with SMTP id
 a22-20020a637056000000b00398068cc214mr5779443pgn.45.1648641923244; 
 Wed, 30 Mar 2022 05:05:23 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 o1-20020a637e41000000b003804d0e2c9esm18836309pgn.35.2022.03.30.05.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 05:05:22 -0700 (PDT)
Message-ID: <e4de3f54-e812-9393-0b13-504fb78063e2@gmail.com>
Date: Wed, 30 Mar 2022 14:05:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] meson.build: Fix dependency of page-vary-common.c
 to config-poison.h
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
References: <20220330114808.942933-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330114808.942933-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 30/3/22 13:48, Thomas Huth wrote:
> Before compiling page-vary-common.c, we have to make sure that
> config-poison.h has been generated (which is in the "genh" list).

I am a bit confused, "config-poison.h" is include by "exec/poison.h"
which is included by "qemu/osdep.h" for all non-softmmu code (tools,
common and -user).

Why is pagevary specific? Shouldn't add genh to all common_ss[]?

Maybe the problem is how common_all[] is created?

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/948
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index aef724ad3c..04ce33fef1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2881,7 +2881,7 @@ if get_option('b_lto')
>     if get_option('cfi')
>       pagevary_flags += '-fno-sanitize=cfi-icall'
>     endif
> -  pagevary = static_library('page-vary-common', sources: pagevary,
> +  pagevary = static_library('page-vary-common', sources: pagevary + genh,
>                               c_args: pagevary_flags)
>     pagevary = declare_dependency(link_with: pagevary)
>   endif


