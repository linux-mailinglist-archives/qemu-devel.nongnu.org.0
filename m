Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0F64EC650
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:16:03 +0200 (CEST)
Received: from localhost ([::1]:46220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZ7C-00073F-S8
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:16:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZZ5L-0005hs-Bf; Wed, 30 Mar 2022 10:14:07 -0400
Received: from [2607:f8b0:4864:20::1032] (port=54222
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZZ5J-000364-Ta; Wed, 30 Mar 2022 10:14:07 -0400
Received: by mail-pj1-x1032.google.com with SMTP id bx5so20755672pjb.3;
 Wed, 30 Mar 2022 07:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+7E753YMu27NUjKY+Go/0Az30mgO6l32QL4BFW9sOqM=;
 b=AuCEoI2jA8rbZWiVWIdXpIhMG2u7Oe5XeHpb8EHpZ0vWuFFFsn/9+OtfEg7S3N5iMF
 Via1Ma8xfFMF3bpeGwXOq7l9CGZUq/w0BoxbvWwYv7XWVOTVWF3xWwpabGtG7Nf7eqvg
 zBbwMZNTM70t/9kw8btq+jQMfUUifWqvoQWODpEX28Fn37lZIDbsd8P/YpwHMhj/0FGC
 BRuEsut9J+FmCk5sn8/SbKE77VIhJ/ED0eb9TFlCOu+sf8k8H2p8dy7qso1x2R5cb3U9
 S3jqPw34dd4Qd5LkU4LoTBQ1qifkKjnQe6QL6DVXNlpQ7hyEYg3IYzA3U7ywR+L0WFoq
 I7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+7E753YMu27NUjKY+Go/0Az30mgO6l32QL4BFW9sOqM=;
 b=QxM/jJV2x1/efxLKzJPXwpD4+3geA/1QEur0nojFIywPM0CP5PxS12Htzab2g1uayR
 pxZQ8qFcnadHXRHPB9cXVu/z6RmqRK3x++jB8lMajRpLoSm8j2GYOjPc+9de2qSg0mwM
 LMpzaeZ1xE2/fafo8ImNJktT+dOLUHQdRA0jwCzK+qFWeIgqHbRASDAiwgoN6J36RqJA
 F2Qbo3MuG9MUm2/JgWicZuMCxskdNS+BumKqEXwJYb159yw9qh8mSx3ZFN5uEyxh+4HT
 MP2H044lD9qsFKpd2yujAWKPfKOW36v/Qc0poxdKYLcVQtiMMibjDH8+BdlwaL39QAs0
 fu+g==
X-Gm-Message-State: AOAM532F9kveW96Fdggh5RvCqQ7FS/PkcV1zuWj/74Ae1AZ5B1rLjF4R
 XbUjMDL4W74aIDINDE0JKcs=
X-Google-Smtp-Source: ABdhPJz2x+wfYcdBs2Caes50pgFZx6Z+uEpU+USd7wtlP4JMe7V2yrAGju7ZSnh0OHrb/jRRW1iIZw==
X-Received: by 2002:a17:902:b7cb:b0:154:57eb:c754 with SMTP id
 v11-20020a170902b7cb00b0015457ebc754mr34882609plz.2.1648649643921; 
 Wed, 30 Mar 2022 07:14:03 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:403e:ab57:ee68:20ea?
 ([2600:70ff:f07f:0:403e:ab57:ee68:20ea])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a056a001a0300b004fa65cbbf4esm24504730pfv.63.2022.03.30.07.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 07:14:03 -0700 (PDT)
Message-ID: <f4e8764d-291d-51d5-19be-08f5a40f1646@gmail.com>
Date: Wed, 30 Mar 2022 16:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
References: <20220330134302.979686-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220330134302.979686-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 30/3/22 15:43, Thomas Huth wrote:
> Seen while compiling on Alpine:
> 
>   In file included from ../linux-user/strace.c:17:
>   In file included from ../linux-user/qemu.h:11:
>   In file included from ../linux-user/syscall_defs.h:1247:
>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>    [-Wmacro-redefined]
>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>            ^
>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>   #define TIOCSER_TEMT 1
>           ^
>   1 warning generated.
> 
> Add the TARGET_ prefix here, too, like we do it on the other architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/sh4/termbits.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

