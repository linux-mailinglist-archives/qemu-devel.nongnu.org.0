Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB60F5170D9
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 15:45:47 +0200 (CEST)
Received: from localhost ([::1]:60298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlWN0-0000XE-NF
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 09:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlWLO-0008D8-I1
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:44:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nlWLM-0003Ke-5a
 for qemu-devel@nongnu.org; Mon, 02 May 2022 09:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651499042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WjEcno9BqL+6uoBo5PvZYe66tJ/hiOVZh/tCAdLyJcA=;
 b=WbkCS6dGslDZck0OKPncpIGeZ7xY5S78q2X6AIDXfe5y63koZAEtqgFneSyQWI2hI3Uu3Q
 KUJhMQu7mUr2BrhdThKOXh3TMkfzeCsuxJVFyLbpJe7fIAM/WPwxr8/87lCF24N3Xb4EBI
 mnqLi1UAIivITFx+NasKGOdgFkZdLTU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-afjFhZKxPRu5J8sOjcX1TQ-1; Mon, 02 May 2022 09:44:01 -0400
X-MC-Unique: afjFhZKxPRu5J8sOjcX1TQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 q128-20020a1c4386000000b003942fe15835so1769198wma.6
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 06:44:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=WjEcno9BqL+6uoBo5PvZYe66tJ/hiOVZh/tCAdLyJcA=;
 b=JaFvdNKjhNf7d5n2qQWag5qtW6jaBdU5H4F1Fk8NyF9Uu7s72aPMXFk872TqDagt1G
 1UlP7eVsrRdXdL7CE8UY0MuosbVt0E4AE5X/NLfY5zCRe651v3yQRZKLccJXbGLW6uSX
 X3F1p7stVXGtlQqxBdaniZK4L/7igj2vaomLpBZvguazexHBAkIrgIfKyGGDq2QFY56B
 w+boaeG1nr2GcM+DmavUr4s/OYuy5bW7lPaG5PvUruQsIkIVAaLU/1mPLBrbE5Cx41Gm
 21xeD+6JzYMOTmbZMq4s7QX/GJw0DXJguR88WODZtk4Yohgi8OrYIvwj+vPxcSM7dQkn
 xxaw==
X-Gm-Message-State: AOAM530IsnzEwfUsahS0/a9Kvs2cfR5GC7rEHNCIq3QeF5Np7f3n/c3D
 z/H2gyB/rPkPBcGLglmQbpomZQ6IF4+TNzsW6oifxcDG2aSklF9dsxSTjmu2qKCUXgyT5a0/bTs
 1/KYxbraSSdzUtHRo5eaDZLmCxydwbFvNDf4zSlNJlFT7hc+6wMpdz+33+1tKeaU=
X-Received: by 2002:a5d:5484:0:b0:20a:7ec0:9832 with SMTP id
 h4-20020a5d5484000000b0020a7ec09832mr9503968wrv.329.1651499040124; 
 Mon, 02 May 2022 06:44:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFk585gG2EoTh7yjUCHbGy4KCj20Cm+bbSil5wOPPSJwMOBfcViuwWjxS1uEP/xB1hiHf/rA==
X-Received: by 2002:a5d:5484:0:b0:20a:7ec0:9832 with SMTP id
 h4-20020a5d5484000000b0020a7ec09832mr9503948wrv.329.1651499039806; 
 Mon, 02 May 2022 06:43:59 -0700 (PDT)
Received: from [192.168.8.104] (tmo-082-126.customers.d1-online.com.
 [80.187.82.126]) by smtp.gmail.com with ESMTPSA id
 e6-20020adfc846000000b0020c5253d906sm7164884wrh.82.2022.05.02.06.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 May 2022 06:43:59 -0700 (PDT)
Message-ID: <ca60af14-baf0-be2d-1062-25de76c76c02@redhat.com>
Date: Mon, 2 May 2022 15:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 4/8] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Content-Language: en-US
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20220315112052.515467-1-thuth@redhat.com>
 <20220315112052.515467-5-thuth@redhat.com>
In-Reply-To: <20220315112052.515467-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2022 12.20, Thomas Huth wrote:
> From: Ilya Leoshkevich <iii@linux.ibm.com>
> 
> Add a small test in order to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Message-Id: <20220314104232.675863-4-iii@linux.ibm.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/tcg/s390x/Makefile.target        |  1 +
>   tests/tcg/s390x/branch-relative-long.c | 68 ++++++++++++++++++++++++++
>   2 files changed, 69 insertions(+)
>   create mode 100644 tests/tcg/s390x/branch-relative-long.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 7aa502a557..f0d474a245 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -15,6 +15,7 @@ TESTS+=mvc
>   TESTS+=shift
>   TESTS+=trap
>   TESTS+=signals-s390x
> +TESTS+=branch-relative-long
>   
>   ifneq ($(HAVE_GDB_BIN),)
>   GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
> diff --git a/tests/tcg/s390x/branch-relative-long.c b/tests/tcg/s390x/branch-relative-long.c
> new file mode 100644
> index 0000000000..94219afcad
> --- /dev/null
> +++ b/tests/tcg/s390x/branch-relative-long.c
> @@ -0,0 +1,68 @@
> +#include <stddef.h>
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/mman.h>
> +
> +#define DEFINE_ASM(_name, _code) \
> +    extern const char _name[]; \
> +    extern const char _name ## _end[]; \
> +    asm("    .globl " #_name "\n" \
> +        #_name ":\n" \
> +        "    " _code "\n" \
> +        "    .globl " #_name "_end\n" \
> +        #_name "_end:\n");
> +
> +DEFINE_ASM(br_r14, "br %r14");
> +DEFINE_ASM(brasl_r0, "brasl %r0,.-0x100000000");
> +DEFINE_ASM(brcl_0xf, "brcl 0xf,.-0x100000000");

  Hi Ilya,

I just noticed that this does not compile with Clang
(version 13.0.1):

<inline asm>:8:15: error: offset out of range
     brasl %r0,.-0x100000000
               ^
<inline asm>:13:14: error: offset out of range
     brcl 0xf,.-0x100000000
              ^
2 errors generated.

Any ideas how to fix this? Could we decrease the offset a little bit? Or 
maybe detect Clang and run with -no-integrated-as in that case?

  Thomas


