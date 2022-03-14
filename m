Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 897BD4D7FD8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 11:29:05 +0100 (CET)
Received: from localhost ([::1]:50746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nThwm-0006Hm-1N
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 06:29:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nThuL-0004x7-8g
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:26:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25214)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nThuG-0000bm-FR
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 06:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647253586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z9n07yRnc79k+cnObPJtAk/bCrdYTGtfAIoNHOrfww4=;
 b=I9Pkl2sKTM2ag2fr9vt1yM7Csv5KEKtw/wDLZG/oLa+F3cbIplNoGBqsfRmfzH1wYo+ijn
 K5Hb32qWHqTya5/eLSqodDjT5ub1f+N+mowcTIBAn1YuKw4tkmul8evjl4LPn9UECMpo6Y
 kzlj9bGAw2Se3ZjpEOjLzReEaMsLab8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-kiNmppoHPRmSIInYojLXmw-1; Mon, 14 Mar 2022 06:26:25 -0400
X-MC-Unique: kiNmppoHPRmSIInYojLXmw-1
Received: by mail-wm1-f71.google.com with SMTP id
 84-20020a1c0257000000b00389a203e5adso5237125wmc.2
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 03:26:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=z9n07yRnc79k+cnObPJtAk/bCrdYTGtfAIoNHOrfww4=;
 b=hdPcnMbdcRnNsZMxJXx42MF9cOy3a7XMkE6xxWy9EJG8b78JRq7Qyf5m2OZY2Q3jCY
 pCCo/Vk1yNKU28ShMECmrTBQCTMJJStfQmkYX6A3KR74o0wbEsTjqWi1ddGwcHsdrngA
 aW1bKuvETrvjz938Bvx7/z4gyTvXZUtUwod66aCUa6+eY5kG0EsSGdzRkmjLOAjKlbSZ
 LWjBAsdIDQWmFqcDkpWVQXsvIKOfAe0whcK1DA93sdYY3VfRIiFTGZybDHYY9olMps1/
 NGMgyi9HvCuIEKG0Nz619RCIleVP7GQN6jiv81qbqt7Nae51ty+Z33eKzQgA8KkyHTo2
 si9A==
X-Gm-Message-State: AOAM530dxZURcvkWGGEFkAkN0IjYQWs2cmKAkJdhoUoL7sCgPcKGaM8v
 DnsVzg2+z2XlsvvzPMcPaH7fFrUihMm0Ukp/KhfchRVN1ErWRIpDcvdI3y34HpuzhNHd7ivkHZD
 tQuL27n/1z2E6zNY=
X-Received: by 2002:a05:600c:4408:b0:388:a042:344f with SMTP id
 u8-20020a05600c440800b00388a042344fmr16898039wmn.52.1647253584566; 
 Mon, 14 Mar 2022 03:26:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvcOz0oifWVrXqWTyz1f+WPLu5LLyDLv8QA5rG/sirf7NnggXC35JUtyOPfVNYdkDp/rhedA==
X-Received: by 2002:a05:600c:4408:b0:388:a042:344f with SMTP id
 u8-20020a05600c440800b00388a042344fmr16898025wmn.52.1647253584317; 
 Mon, 14 Mar 2022 03:26:24 -0700 (PDT)
Received: from ?IPV6:2003:cb:c704:9a00:b2c1:8682:b807:e870?
 (p200300cbc7049a00b2c18682b807e870.dip0.t-ipconnect.de.
 [2003:cb:c704:9a00:b2c1:8682:b807:e870])
 by smtp.gmail.com with ESMTPSA id
 r5-20020a5d4945000000b001f06372fa9fsm20806628wrs.54.2022.03.14.03.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 03:26:23 -0700 (PDT)
Message-ID: <e5ff9bfa-8c51-988a-78e0-1fb9dfbfcb4e@redhat.com>
Date: Mon, 14 Mar 2022 11:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v2 3/3] tests/tcg/s390x: Test BRASL and BRCL with large
 negative offsets
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220312092541.585282-1-iii@linux.ibm.com>
 <20220312092541.585282-4-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220312092541.585282-4-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12.03.22 10:25, Ilya Leoshkevich wrote:
> Add a small test in order to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.target        |  1 +
>  tests/tcg/s390x/branch-relative-long.c | 60 ++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
>  create mode 100644 tests/tcg/s390x/branch-relative-long.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 257c568c58..fd34b130f7 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -15,6 +15,7 @@ TESTS+=mvc
>  TESTS+=shift
>  TESTS+=trap
>  TESTS+=signals-s390x
> +TESTS+=branch-relative-long
>  
>  ifneq ($(HAVE_GDB_BIN),)
>  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
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
> +    unsigned char *buf;
> +    void (*code)(void);
> +    size_t i;
> +
> +    buf = mmap(NULL, length, PROT_READ | PROT_WRITE | PROT_EXEC,
> +               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

With MAP_NORESERVE

Reviewed-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Thanks,

David / dhildenb


