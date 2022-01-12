Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1510248C0CC
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:15:00 +0100 (CET)
Received: from localhost ([::1]:55518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Zid-0005mf-6K
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Zbk-000171-AI
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:07:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n7Zbh-0007y2-HE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641978468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IYH2uWOyJ8krDqjucIdoPdKSIN6PrLfR9OXL4/wab00=;
 b=Ag2pILIjxzony7+yqTDLUcTa+hq9K2qKRIpOm8gAijSQaY0aWIeyb9wc7h2OS7+cSU9MGg
 3gJd28WGrt8u02UBUfSrgmlekMfabbf3MQJYcCAxEa64r6iVI/zBUZ5PjkO/5a+GOOlQnQ
 v6+Gd2SMtD9PFYguWvHD+sefKav9sOY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-dPRs1HGkNoCkOhV_P-aiYA-1; Wed, 12 Jan 2022 04:07:47 -0500
X-MC-Unique: dPRs1HGkNoCkOhV_P-aiYA-1
Received: by mail-ed1-f71.google.com with SMTP id
 b8-20020a056402350800b003f8f42a883dso1666990edd.16
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:07:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=IYH2uWOyJ8krDqjucIdoPdKSIN6PrLfR9OXL4/wab00=;
 b=Zdk/W/rDVL8QijDOV5ZTPOZwGMODBJP1JeRz6qNrk7lzpGoo0YzPQLAY8zv9Fi4NG6
 dFw71vnFPQ1ytpda5p8iR434cB/2vK3+oR3RK8aq9yK6XV6goYvqlsyEcaFXvk2P2TGZ
 RAuqzNOkr8fta/sToeQOxydRYIWbhnCmIk4v7EdhqUrgLrL04rVk/ox6CmkrqAi3mxgm
 NvPBcTOhjSs66yHn7pkN4Xrq3bfSKqm+U8xxnkvE2UeOqVPkjsqwWYM0IUzQE3IXbh3K
 1OmW8vl35xLANs16d/hPZdX4qRPAHyyTHOraGX6yDPN3Rt6/2IOU0ckDIUGzskS8YigA
 zKsQ==
X-Gm-Message-State: AOAM532lXW1G2C9+Wl5Be6bqEJlinIU80kZaVRPathBN0n6SutM6bZ7x
 Rb8kFZZVgJkD6wL8Ei/3ds40/MgUMDTMmedMYD4Mu2H96d0RpOF/Z8tbCrHYnUKsV08NM7u58KJ
 td9YTcWrszR62RkM=
X-Received: by 2002:a05:6402:4316:: with SMTP id
 m22mr4511258edc.326.1641978466217; 
 Wed, 12 Jan 2022 01:07:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2j6kYIzLvSpzwdTFGtNFmysgf9XAMXZi+AtanwdKEiQZeKzq+XNT07ILhK+ZK3dviukavrw==
X-Received: by 2002:a05:6402:4316:: with SMTP id
 m22mr4511233edc.326.1641978465857; 
 Wed, 12 Jan 2022 01:07:45 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id j13sm5958231edw.89.2022.01.12.01.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 01:07:45 -0800 (PST)
Message-ID: <8b6c5218-a03f-40a3-12cf-19363f76fcf0@redhat.com>
Date: Wed, 12 Jan 2022 10:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20220112043948.224405-1-iii@linux.ibm.com>
 <20220112043948.224405-6-iii@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2 5/5] tests/tcg/s390x: Test shift instructions
In-Reply-To: <20220112043948.224405-6-iii@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 12.01.22 05:39, Ilya Leoshkevich wrote:
> Add a test for each shift instruction in order to to prevent
> regressions.
> 
> Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
> ---
>  tests/tcg/s390x/Makefile.target |   1 +
>  tests/tcg/s390x/shift.c         | 258 ++++++++++++++++++++++++++++++++
>  2 files changed, 259 insertions(+)
>  create mode 100644 tests/tcg/s390x/shift.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index cc64dd32d2..1a7238b4eb 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -9,6 +9,7 @@ TESTS+=exrl-trtr
>  TESTS+=pack
>  TESTS+=mvo
>  TESTS+=mvc
> +TESTS+=shift
>  TESTS+=trap
>  TESTS+=signals-s390x
>  
> diff --git a/tests/tcg/s390x/shift.c b/tests/tcg/s390x/shift.c
> new file mode 100644
> index 0000000000..73bac9d255
> --- /dev/null
> +++ b/tests/tcg/s390x/shift.c
> @@ -0,0 +1,258 @@
> +#include <inttypes.h>
> +#include <stdint.h>
> +#include <stdio.h>
> +
> +#define DEFINE_SHIFT_SINGLE_COMMON(name, insn_str) \
> +    static uint64_t name(uint64_t op1, uint64_t op2, uint64_t *cc) \
> +    { \
> +        asm("    spm %[cc]\n" \
> +            "    " insn_str "\n" \
> +            "    ipm %[cc]" \
> +            : [op1] "+&r" (op1), \
> +              [cc] "+r" (*cc) \
> +            : [op2] "r" (op2) \
> +            : "cc"); \
> +        return op1; \
> +    }

It might help to highlight the macro parameter like

s/name/NAME/ or s/name/_name/


> +#define DEFINE_SHIFT_SINGLE_2(insn, offset) \
> +    DEFINE_SHIFT_SINGLE_COMMON(insn ## _ ## offset, \
> +                               #insn " %[op1]," #offset "(%[op2])")
> +#define DEFINE_SHIFT_SINGLE_3(insn, offset) \
> +    DEFINE_SHIFT_SINGLE_COMMON(insn ## _ ## offset, \
> +                               #insn " %[op1],%[op1]," #offset "(%[op2])")
> +#define DEFINE_SHIFT_DOUBLE(insn, offset) \
> +    static uint64_t insn ## _ ## offset(uint64_t op1, uint64_t op2, \
> +                                        uint64_t *cc) \
> +    { \
> +        uint32_t op1h = op1 >> 32; \
> +        uint32_t op1l = op1 & 0xffffffff; \
> +        register uint32_t r2 asm("2") = op1h; \
> +        register uint32_t r3 asm("3") = op1l; \
> +        \
> +        asm("    spm %[cc]\n" \
> +            "    " #insn " %[r2]," #offset "(%[op2])\n" \
> +            "    ipm %[cc]" \
> +            : [r2] "+&r" (r2), \
> +              [r3] "+&r" (r3), \
> +              [cc] "+r" (*cc) \
> +            : [op2] "r" (op2) \
> +            : "cc"); \
> +        op1h = r2; \
> +        op1l = r3; \
> +        return (((uint64_t)op1h) << 32) | op1l; \
> +    }
> +
> +DEFINE_SHIFT_SINGLE_3(rll, 0x4cf3b);
> +DEFINE_SHIFT_SINGLE_3(rllg, 0x697c9);
> +DEFINE_SHIFT_SINGLE_2(sla, 0x4b0);
> +DEFINE_SHIFT_SINGLE_2(sla, 0xd54);
> +DEFINE_SHIFT_SINGLE_3(slak, 0x2832c);
> +DEFINE_SHIFT_SINGLE_3(slag, 0x66cc4);
> +DEFINE_SHIFT_SINGLE_2(sll, 0xd04);
> +DEFINE_SHIFT_SINGLE_3(sllk, 0x2699f);
> +DEFINE_SHIFT_SINGLE_3(sllg, 0x59df9);
> +DEFINE_SHIFT_SINGLE_2(sra, 0x67e);
> +DEFINE_SHIFT_SINGLE_3(srak, 0x60943);
> +DEFINE_SHIFT_SINGLE_3(srag, 0x6b048);
> +DEFINE_SHIFT_SINGLE_2(srl, 0x035);
> +DEFINE_SHIFT_SINGLE_3(srlk, 0x43dfc);
> +DEFINE_SHIFT_SINGLE_3(srlg, 0x27227);
> +DEFINE_SHIFT_DOUBLE(slda, 0x38b);
> +DEFINE_SHIFT_DOUBLE(sldl, 0x031);
> +DEFINE_SHIFT_DOUBLE(srda, 0x36f);
> +DEFINE_SHIFT_DOUBLE(srdl, 0x99a);
> +
> +struct shift_test {
> +    const char *name;
> +    uint64_t (*insn)(uint64_t, uint64_t, uint64_t *);
> +    uint64_t op1;
> +    uint64_t op2;
> +    uint64_t exp_result;
> +    uint64_t exp_cc;
> +};
> +
> +static const struct shift_test tests[] = {
> +    {
> +        .name = "rll",
> +        .insn = rll_0x4cf3b,
> +        .op1 = 0xecbd589a45c248f5ull,
> +        .op2 = 0x62e5508ccb4c99fdull,
> +        .exp_result = 0xecbd589af545c248ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "rllg",
> +        .insn = rllg_0x697c9,
> +        .op1 = 0xaa2d54c1b729f7f4ull,
> +        .op2 = 0x5ffcf7465f5cd71full,
> +        .exp_result = 0x29f7f4aa2d54c1b7ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "sla-1",
> +        .insn = sla_0x4b0,
> +        .op1 = 0x8bf21fb67cca0e96ull,
> +        .op2 = 0x3ddf2f53347d3030ull,
> +        .exp_result = 0x8bf21fb600000000ull,
> +        .exp_cc = 3,
> +    },
> +    {
> +        .name = "sla-2",
> +        .insn = sla_0xd54,
> +        .op1 = 0xe4faaed5def0e926ull,
> +        .op2 = 0x18d586fab239cbeeull,
> +        .exp_result = 0xe4faaed5fbc3a498ull,
> +        .exp_cc = 3,
> +    },
> +    {
> +        .name = "slak",
> +        .insn = slak_0x2832c,
> +        .op1 = 0x7300bf78707f09f9ull,
> +        .op2 = 0x4d193b85bb5cb39bull,
> +        .exp_result = 0x7300bf783f84fc80ull,
> +        .exp_cc = 3,
> +    },
> +    {
> +        .name = "slag",
> +        .insn = slag_0x66cc4,
> +        .op1 = 0xe805966de1a77762ull,
> +        .op2 = 0x0e92953f6aa91c6bull,
> +        .exp_result = 0xbbb1000000000000ull,
> +        .exp_cc = 3,
> +    },
> +    {
> +        .name = "sll",
> +        .insn = sll_0xd04,
> +        .op1 = 0xb90281a3105939dfull,
> +        .op2 = 0xb5e4df7e082e4c5eull,
> +        .exp_result = 0xb90281a300000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "sllk",
> +        .insn = sllk_0x2699f,
> +        .op1 = 0x777c6cf116f99557ull,
> +        .op2 = 0xe0556cf112e5a458ull,
> +        .exp_result = 0x777c6cf100000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "sllg",
> +        .insn = sllg_0x59df9,
> +        .op1 = 0xcdf86cbfbc0f3557ull,
> +        .op2 = 0x325a45acf99c6d3dull,
> +        .exp_result = 0x55c0000000000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "sra",
> +        .insn = sra_0x67e,
> +        .op1 = 0xb878f048d5354183ull,
> +        .op2 = 0x9e27d13195931f79ull,
> +        .exp_result = 0xb878f048ffffffffull,
> +        .exp_cc = 1,
> +    },
> +    {
> +        .name = "srak",
> +        .insn = srak_0x60943,
> +        .op1 = 0xb6ceb5a429cedb35ull,
> +        .op2 = 0x352354900ae34d7aull,
> +        .exp_result = 0xb6ceb5a400000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "srag",
> +        .insn = srag_0x6b048,
> +        .op1 = 0xd54dd4468676c63bull,
> +        .op2 = 0x84d026db7b4dca28ull,
> +        .exp_result = 0xffffffffffffd54dull,
> +        .exp_cc = 1,
> +    },
> +    {
> +        .name = "srl",
> +        .insn = srl_0x035,
> +        .op1 = 0x09be503ef826815full,
> +        .op2 = 0xbba8d1a0e542d5c1ull,
> +        .exp_result = 0x9be503e00000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "srlk",
> +        .insn = srlk_0x43dfc,
> +        .op1 = 0x540d6c8de71aee2aull,
> +        .op2 = 0x0000000000000000ull,
> +        .exp_result = 0x540d6c8d00000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "srlg",
> +        .insn = srlg_0x27227,
> +        .op1 = 0x26f7123c1c447a34ull,
> +        .op2 = 0x0000000000000000ull,
> +        .exp_result = 0x00000000004dee24ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "slda",
> +        .insn = slda_0x38b,
> +        .op1 = 0x7988f722dd5bbe7cull,
> +        .op2 = 0x9aed3f95b4d78cc2ull,
> +        .exp_result = 0x1ee45bab77cf8000ull,
> +        .exp_cc = 3,
> +    },
> +    {
> +        .name = "sldl",
> +        .insn = sldl_0x031,
> +        .op1 = 0xaae2918dce2b049aull,
> +        .op2 = 0x0000000000000000ull,
> +        .exp_result = 0x0934000000000000ull,
> +        .exp_cc = 0,
> +    },
> +    {
> +        .name = "srda",
> +        .insn = srda_0x36f,
> +        .op1 = 0x0cd4ed9228a50978ull,
> +        .op2 = 0x72b046f0848b8cc9ull,
> +        .exp_result = 0x000000000000000cull,
> +        .exp_cc = 2,
> +    },
> +    {
> +        .name = "srdl",
> +        .insn = srdl_0x99a,
> +        .op1 = 0x1018611c41689a1dull,
> +        .op2 = 0x2907e150c50ba319ull,
> +        .exp_result = 0x0000000000000203ull,
> +        .exp_cc = 0,
> +    },
> +};
> +
> +int main(void)
> +{
> +    int ret = 0;
> +    size_t i;
> +
> +    for (i = 0; i < sizeof(tests) / sizeof(tests[0]); i++) {
> +        uint64_t result;
> +        uint64_t cc = 0xffffffff00ffffffull;

Instead of doing this cc magic here, maybe just do the shift directly in
the ASM, just as we often do in the Linux code I'm aware of like (random
example)

arch/s390/pci/pci_insn.c:__mpcifc()

u8 cc;

asm volatile (...
	"ipm %[cc]\n"
	"srl %[cc],28\n"
        : [cc] "=d" (cc) ...);

Then you can directly test for proper CC values without the need to
manually shift or have this cc mask above.


> +
> +        result = tests[i].insn(tests[i].op1, tests[i].op2, &cc);
> +        cc = (cc >> 28) & 3;
> +        if (result != tests[i].exp_result) {
> +            fprintf(stderr,
> +                    "bad %s result:\n"
> +                    "actual   = 0x%" PRIx64 "\n"
> +                    "expected = 0x%" PRIx64 "\n",
> +                    tests[i].name, result, tests[i].exp_result);
> +            ret = 1;
> +        }
> +        if (cc != tests[i].exp_cc) {
> +            fprintf(stderr,
> +                    "bad %s cc:\n"
> +                    "actual   = %" PRIu64 "\n"
> +                    "expected = %" PRIu64 "\n",
> +                    tests[i].name, cc, tests[i].exp_cc);
> +            ret = 1;
> +        }
> +    }
> +    return ret;
> +}


-- 
Thanks,

David / dhildenb


