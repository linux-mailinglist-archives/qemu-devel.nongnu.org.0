Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CAD04D6F8E
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Mar 2022 15:28:37 +0100 (CET)
Received: from localhost ([::1]:44084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nT2jT-00041n-Td
	for lists+qemu-devel@lfdr.de; Sat, 12 Mar 2022 09:28:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT2iR-0003MA-Ck
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:27:31 -0500
Received: from [2607:f8b0:4864:20::533] (port=37422
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nT2iP-0005Rb-O6
 for qemu-devel@nongnu.org; Sat, 12 Mar 2022 09:27:31 -0500
Received: by mail-pg1-x533.google.com with SMTP id bc27so9899609pgb.4
 for <qemu-devel@nongnu.org>; Sat, 12 Mar 2022 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T+Cv/vepttp6+EHP9/UyHJsXzWoVb19ATU0sMo9fAtM=;
 b=FbUXyKww9U9nQ3C6/M5Z7K2u5MeQ3Bh+jGfDG+Sk2fz7uV4NjXndN4VqvOGVGI5QtP
 6gJUE5/ELisKMJMu8+8BHZtsqMo7gTP/O+Y+Z5NoyGIQ9pmnpeza3RMfadUs1oNOnmK3
 FGXl39JSW2Kp9o3RKe23UWE3bGSNEMx63oj09w8izqpIcDLZkFqRM3Q8mheNObBcPmAd
 wgapjktDFWaovMgcvnaTk1G6k/y6a6SgHQbZbd3GcmYnmVny+4AL0znRveAZqCyiK5+7
 gT/xYYrMBgmAbjy3KL+d1dIadrWdUM2XxbF6I51GTA4ILg19MLIbcMS9cogsujOgIb8k
 BoxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T+Cv/vepttp6+EHP9/UyHJsXzWoVb19ATU0sMo9fAtM=;
 b=HaE5XYixeToCbpChdCHsLVnHbRdZOI5S9fj5padHW43OvQ3EzT8GdYej1qnhh7RDy5
 PZTazPbIA84jFfFCkRMiv9+rkatdqoKYfBFD7WDbLZlLRqVlqt3wMJsNvujUmEmyv3ue
 PysL0OePss/qDQfcuie9d+HgUtib21uJEPQ/CBGakXv2iQjeevJN9d4fkDHel/2eIewW
 8BGioS8xqHX14+/tBOIC/qJOnE/1ioPp+8cg8QCjKsObFmbKnw8ODDJC20Zd4RLuTdjT
 4jZKH1i4sJCqSs9BA2HEnn9vulnCYyHZtsScTA6qgSE0qqpHawkAtPavOOtVGfKFxtTD
 gonw==
X-Gm-Message-State: AOAM532pjIScezy90AlAqwXmMSRfZovEUE7h9wtpNygBgrP+9/Z9EoGM
 DOIfOpHlvH2Afjni7sZWbbP2Wg==
X-Google-Smtp-Source: ABdhPJx3iwjOAzGAo5N9ZtM3qw0MNwb4aQP8FP7K8f5sG9K3meipuM4n8iKLaINscjpREQGV2Mn1Pw==
X-Received: by 2002:a63:84c2:0:b0:380:5d6f:6b97 with SMTP id
 k185-20020a6384c2000000b003805d6f6b97mr12755896pgd.73.1647095247971; 
 Sat, 12 Mar 2022 06:27:27 -0800 (PST)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f4-20020aa782c4000000b004f6f0334a51sm13448055pfn.126.2022.03.12.06.27.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Mar 2022 06:27:27 -0800 (PST)
Message-ID: <15bda42b-03dd-85d3-e357-06d199d4ac81@linaro.org>
Date: Sat, 12 Mar 2022 06:27:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20220312092541.585282-1-iii@linux.ibm.com>
 <20220312092541.585282-4-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220312092541.585282-4-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/22 01:25, Ilya Leoshkevich wrote:
> Add a small test in order to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target        |  1 +
>   tests/tcg/s390x/branch-relative-long.c | 60 ++++++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 tests/tcg/s390x/branch-relative-long.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 257c568c58..fd34b130f7 100644
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
> index 0000000000..c6f3f2db6d
> --- /dev/null
> +++ b/tests/tcg/s390x/branch-relative-long.c
> @@ -0,0 +1,60 @@
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
> +
> +struct test {
> +    const char *code;
> +    const char *code_end;
> +};
> +
> +static const struct test tests[] = {
> +    {
> +        .code = brasl_r0,
> +        .code_end = brasl_r0_end,
> +    },
> +    {
> +        .code = brcl_0xf,
> +        .code_end = brcl_0xf_end,
> +    },
> +};
> +
> +int main(void)
> +{
> +    size_t length = 0x100000006;

This length is a little specific, given the apparent open-endedness of "code_end".  Though 
of course we know that we'll get an entire page allocated for these 6 bytes so there's no 
real problem.

I'm not actually sure what to suggest to improve this though.

For the series:
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

> +    unsigned char *buf;
> +    void (*code)(void);
> +    size_t i;
> +
> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +    if (buf == MAP_FAILED) {
> +        perror("SKIP: mmap() failed");
> +        return 0;
> +    }
> +
> +    memcpy(buf, br_r14, br_r14_end - br_r14);
> +    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
> +        code = (void *)(buf + 0x100000000);
> +        memcpy(code, tests[i].code, tests[i].code_end - tests[i].code);
> +        code();
> +        memset(code, 0, tests[i].code_end - tests[i].code);
> +    }
> +
> +    munmap(buf, length);
> +
> +    return 0;
> +}


