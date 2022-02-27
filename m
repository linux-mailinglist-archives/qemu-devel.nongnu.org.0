Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB864C5F71
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 23:34:03 +0100 (CET)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOS78-0004RH-BE
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 17:34:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOS63-0003h4-L1
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:32:55 -0500
Received: from [2607:f8b0:4864:20::62a] (port=43554
 helo=mail-pl1-x62a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOS62-0002aY-6J
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 17:32:55 -0500
Received: by mail-pl1-x62a.google.com with SMTP id u2so1588418ple.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 14:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=V8Co7ZaowyOqNHgraNjQuwCOYWvVT4qgGGJR3uqy7Hg=;
 b=Nvn1O562mrB03FDGavWSvmb2MLmWT+VvtxGUDoW+jyZ1Ee1VoQYURxgCBXxr1lyORO
 xMTjJpFe4xbFj6ztKkWleYt4o3JhyZXsY/F+FIhkZjed55UnNj9s8pxCy3+E7eDfAoTh
 1iwhYZ762kiwY8rN3W/YFfpEnYYC/od7sB59BtRc2emXXoOulfRg0ZmwV09IOQb6wXV3
 EQwiSTRngpEbyWj4W6ksVx6Ose6GNnlfnhJdc0iZgeD+OIYPEycdHeEM40l0C+jQrm8L
 44DBtZwGvnSEBpBI3h1bH6PWpmYaFgVWpdDJgwVeym2ZXjBK+Zg5gpOKxmnJGmVfZPJA
 xRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V8Co7ZaowyOqNHgraNjQuwCOYWvVT4qgGGJR3uqy7Hg=;
 b=TVTLk2eWuR7i14j6iyArqvVI1Owdfygtho6FhTVLbyKIXNe4WgjC9yH6XQSVsT5geG
 32+H5JM4El4F7Mye0FimOSRRPipu2mPLSnjl/Qi4B8Cv0UPJ1q1iQ+BePySYwLdDd0rr
 PduXRGjArl9N/SJXmBFBqyghjmCGBj3zs5JQIty4YksPU97ZcD4tp6xKeTHJOq8Ta4de
 bof3vEmjd093fYvl+XFTQnMI8WYpzojA/Y7aB6/tSTRzHKqYn42QM+Wq2qQ3LlSaMkCJ
 HEJcCyvurszKFRA0GIA6c86ohAnD8Lx24AcZXJdH3O2vRfDOJjnuhmY18kLoaL0AN51I
 4M7w==
X-Gm-Message-State: AOAM533/5pkUyT+mv4kUPWD7XgHv0uppkc+dgRa6NyH0KBwX3d3bTo7q
 FcKPE/WnyafOfzuzeWgGrfk=
X-Google-Smtp-Source: ABdhPJzFo3Tf1U0j5oEBK2gUQz/XgG+uxQxTd/TmipR1kYG9A6/ld5rOCYg0V8uK/CaHzXwoxmEWFg==
X-Received: by 2002:a17:903:2406:b0:14d:6447:990c with SMTP id
 e6-20020a170903240600b0014d6447990cmr17815879plo.22.1646001171804; 
 Sun, 27 Feb 2022 14:32:51 -0800 (PST)
Received: from [192.168.1.115] (32.red-88-28-25.dynamicip.rima-tde.net.
 [88.28.25.32]) by smtp.gmail.com with ESMTPSA id
 k17-20020aa788d1000000b004f359a0a896sm10539599pff.169.2022.02.27.14.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Feb 2022 14:32:51 -0800 (PST)
Message-ID: <02291ebd-a1e1-a670-0ba4-8e3d98c42b83@gmail.com>
Date: Sun, 27 Feb 2022 23:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 3/9] accel/tcg: Support TCG_TARGET_SIGNED_ADDR32 for
 softmmu
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220227020413.11741-1-richard.henderson@linaro.org>
 <20220227020413.11741-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220227020413.11741-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/2/22 03:04, Richard Henderson wrote:
> When TCG_TARGET_SIGNED_ADDR32 is set, adjust the tlb addend to
> allow the 32-bit guest address to be sign extended within the
> 64-bit host register instead of zero extended.
> 
> This will simplify tcg hosts like MIPS, RISC-V, and LoongArch,
> which naturally sign-extend 32-bit values, in contrast to x86_64
> and AArch64 which zero-extend them.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   accel/tcg/cputlb.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

