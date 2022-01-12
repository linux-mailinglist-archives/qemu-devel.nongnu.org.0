Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2948BFA7
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 09:15:07 +0100 (CET)
Received: from localhost ([::1]:59218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Ymd-00049H-JN
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 03:15:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7Yir-0001RP-VO; Wed, 12 Jan 2022 03:11:10 -0500
Received: from [2607:f8b0:4864:20::22a] (port=34548
 helo=mail-oi1-x22a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leetroy@gmail.com>)
 id 1n7Yiq-0007x1-0F; Wed, 12 Jan 2022 03:11:09 -0500
Received: by mail-oi1-x22a.google.com with SMTP id r131so2431509oig.1;
 Wed, 12 Jan 2022 00:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7wBuI50kGgfv18Hvtq0N7Jvfc6AR3DTL0doq8LCZoxM=;
 b=OcCBY218Elgn8RMbMWfpKWztkwWsCxO/00Nr36osYWZ0vcdvo3eb7Gq6yqCE9IKo/b
 z4y3FftCRrdIfdU5frP8SM0sVi27AEKhGiqcTPd4tW3hcX3Xx0sdwka9o6XAKr97Q8Zl
 qhuDErQF3Lk75WY/mm6cgPUgIVMny5UwwGavhZvU4jIJ8S6wnwdhSHfVckVMnut2jdca
 +pAXomnqvTUgDJraarfgNiV7NJN4EsqA5HDTonM31jw80OX2Ti2i5tB9itrcul8GLYzF
 VaQEwyz2fDQ/ypUklM9Fuk586WdcUZvcyBt5vjdhmdknTLb4Gie6zbtzMk3prGpwYwfU
 De0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7wBuI50kGgfv18Hvtq0N7Jvfc6AR3DTL0doq8LCZoxM=;
 b=Tm+ZvTxeU0LNKUJf8u1J1wKaw5hs0JrE8nDbcnPutdJyjQsLZWUjc8u8kbpb2ZRPNR
 /gzogwmXzPsPwbRkSABr7Avw3N3xwlQ5NXTQSoBNQtUljynagbT2KG7aCUuMpfPM8gwe
 YBWf+8vtkOd89DrrwV7LhKPrsYD+pS+ed6jfKlClfjP3TmNCr8skFBNGb69hWBrG/+le
 7ay/WBG7mOeWsKYHOzrjlS4kHGwZVu7AiVu+s9pu/XTJ6JONQRLbXVXjboXFvu0ddcv0
 5R2rJc1p74vh16AFu8MrJjroJBqVUico+wHlJlqLh48HrscMkOOaPtewIXnP2PY17BpR
 0mHw==
X-Gm-Message-State: AOAM531KWqAcQ+LsZHMA85hx04QCEZ6krYRzxrqE4CHOxv1o+EDCClgt
 VFh8sMh1XmpSx2PixNPFOffmnaghbelpf0Qhatk=
X-Google-Smtp-Source: ABdhPJwN915mfRKfaBYDS1cOE/T4k5q8+KjDeS3n+0OfpoIoweTh/JCoW65+613Nqo0+nSUaWsXLmQ3yiKY3ju2DV7Q=
X-Received: by 2002:a05:6808:168b:: with SMTP id
 bb11mr4426999oib.40.1641975066130; 
 Wed, 12 Jan 2022 00:11:06 -0800 (PST)
MIME-Version: 1.0
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
 <20220112080937.366835-3-troy_lee@aspeedtech.com>
In-Reply-To: <20220112080937.366835-3-troy_lee@aspeedtech.com>
From: Troy Lee <leetroy@gmail.com>
Date: Wed, 12 Jan 2022 16:10:58 +0800
Message-ID: <CAN9Jwz0HL9RwHFEuGf1_UiRcogKVNHfTNXaMbBTMNrfHPHsmCw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests/qtest: Add test for Aspeed HACE accumulative
 mode
To: Troy Lee <troy_lee@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=leetroy@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-devel@nongnu.org,
 hailin.wu@aspeedtech.com, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Klaus Heinrich Kiwi <klaus@klauskiwi.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ Adding Klaus ]

On Wed, Jan 12, 2022 at 4:09 PM Troy Lee <troy_lee@aspeedtech.com> wrote:
>
> This add two addition test cases for accumulative mode under sg enabled.
>
> The input vector was manually craft with "abc" + bit 1 + padding zeros + L.
> The padding length depends on algorithm, i.e. SHA512 (1024 bit),
> SHA256 (512 bit).
>
> The result was calculated by command line sha512sum/sha256sum utilities
> without padding, i.e. only "abc" ascii text.
>
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> ---
>  tests/qtest/aspeed_hace-test.c | 145 +++++++++++++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>
> diff --git a/tests/qtest/aspeed_hace-test.c b/tests/qtest/aspeed_hace-test.c
> index 09ee31545e..6a2f404b93 100644
> --- a/tests/qtest/aspeed_hace-test.c
> +++ b/tests/qtest/aspeed_hace-test.c
> @@ -21,6 +21,7 @@
>  #define  HACE_ALGO_SHA512        (BIT(5) | BIT(6))
>  #define  HACE_ALGO_SHA384        (BIT(5) | BIT(6) | BIT(10))
>  #define  HACE_SG_EN              BIT(18)
> +#define  HACE_ACCUM_EN           BIT(8)
>
>  #define HACE_STS                 0x1c
>  #define  HACE_RSA_ISR            BIT(13)
> @@ -96,6 +97,57 @@ static const uint8_t test_result_sg_sha256[] = {
>      0x55, 0x1e, 0x1e, 0xc5, 0x80, 0xdd, 0x6d, 0x5a, 0x6e, 0xcd, 0xe9, 0xf3,
>      0xd3, 0x5e, 0x6e, 0x4a, 0x71, 0x7f, 0xbd, 0xe4};
>
> +/*
> + * The accumulative mode requires firmware to provide internal initial state
> + * and message padding (including length L at the end of padding).
> + *
> + * This test vector is a ascii text "abc" with padding message.
> + *
> + * Expected results were generated using command line utitiles:
> + *
> + *  echo -n -e 'abc' | dd of=/tmp/test
> + *  for hash in sha512sum sha256sum; do $hash /tmp/test; done
> + */
> +static const uint8_t test_vector_accum_512[] = {
> +    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
> +
> +static const uint8_t test_vector_accum_256[] = {
> +    0x61, 0x62, 0x63, 0x80, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x18};
> +
> +static const uint8_t test_result_accum_sha512[] = {
> +    0xdd, 0xaf, 0x35, 0xa1, 0x93, 0x61, 0x7a, 0xba, 0xcc, 0x41, 0x73, 0x49,
> +    0xae, 0x20, 0x41, 0x31, 0x12, 0xe6, 0xfa, 0x4e, 0x89, 0xa9, 0x7e, 0xa2,
> +    0x0a, 0x9e, 0xee, 0xe6, 0x4b, 0x55, 0xd3, 0x9a, 0x21, 0x92, 0x99, 0x2a,
> +    0x27, 0x4f, 0xc1, 0xa8, 0x36, 0xba, 0x3c, 0x23, 0xa3, 0xfe, 0xeb, 0xbd,
> +    0x45, 0x4d, 0x44, 0x23, 0x64, 0x3c, 0xe8, 0x0e, 0x2a, 0x9a, 0xc9, 0x4f,
> +    0xa5, 0x4c, 0xa4, 0x9f};
> +
> +static const uint8_t test_result_accum_sha256[] = {
> +    0xba, 0x78, 0x16, 0xbf, 0x8f, 0x01, 0xcf, 0xea, 0x41, 0x41, 0x40, 0xde,
> +    0x5d, 0xae, 0x22, 0x23, 0xb0, 0x03, 0x61, 0xa3, 0x96, 0x17, 0x7a, 0x9c,
> +    0xb4, 0x10, 0xff, 0x61, 0xf2, 0x00, 0x15, 0xad};
>
>  static void write_regs(QTestState *s, uint32_t base, uint32_t src,
>                         uint32_t length, uint32_t out, uint32_t method)
> @@ -308,6 +360,86 @@ static void test_sha512_sg(const char *machine, const uint32_t base,
>      qtest_quit(s);
>  }
>
> +static void test_sha256_accum(const char *machine, const uint32_t base,
> +                        const uint32_t src_addr)
> +{
> +    QTestState *s = qtest_init(machine);
> +
> +    const uint32_t buffer_addr = src_addr + 0x1000000;
> +    const uint32_t digest_addr = src_addr + 0x4000000;
> +    uint8_t digest[32] = {0};
> +    struct AspeedSgList array[] = {
> +        {  cpu_to_le32(sizeof(test_vector_accum_256) | SG_LIST_LEN_LAST),
> +           cpu_to_le32(buffer_addr) },
> +    };
> +
> +    /* Check engine is idle, no busy or irq bits set */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Write test vector into memory */
> +    qtest_memwrite(s, buffer_addr, test_vector_accum_256, sizeof(test_vector_accum_256));
> +    qtest_memwrite(s, src_addr, array, sizeof(array));
> +
> +    write_regs(s, base, src_addr, sizeof(test_vector_accum_256),
> +               digest_addr, HACE_ALGO_SHA256 | HACE_SG_EN | HACE_ACCUM_EN);
> +
> +    /* Check hash IRQ status is asserted */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
> +
> +    /* Clear IRQ status and check status is deasserted */
> +    qtest_writel(s, base + HACE_STS, 0x00000200);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Read computed digest from memory */
> +    qtest_memread(s, digest_addr, digest, sizeof(digest));
> +
> +    /* Check result of computation */
> +    g_assert_cmpmem(digest, sizeof(digest),
> +                    test_result_accum_sha256, sizeof(digest));
> +
> +    qtest_quit(s);
> +}
> +
> +static void test_sha512_accum(const char *machine, const uint32_t base,
> +                        const uint32_t src_addr)
> +{
> +    QTestState *s = qtest_init(machine);
> +
> +    const uint32_t buffer_addr = src_addr + 0x1000000;
> +    const uint32_t digest_addr = src_addr + 0x4000000;
> +    uint8_t digest[64] = {0};
> +    struct AspeedSgList array[] = {
> +        {  cpu_to_le32(sizeof(test_vector_accum_512) | SG_LIST_LEN_LAST),
> +           cpu_to_le32(buffer_addr) },
> +    };
> +
> +    /* Check engine is idle, no busy or irq bits set */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Write test vector into memory */
> +    qtest_memwrite(s, buffer_addr, test_vector_accum_512, sizeof(test_vector_accum_512));
> +    qtest_memwrite(s, src_addr, array, sizeof(array));
> +
> +    write_regs(s, base, src_addr, sizeof(test_vector_accum_512),
> +               digest_addr, HACE_ALGO_SHA512 | HACE_SG_EN | HACE_ACCUM_EN);
> +
> +    /* Check hash IRQ status is asserted */
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0x00000200);
> +
> +    /* Clear IRQ status and check status is deasserted */
> +    qtest_writel(s, base + HACE_STS, 0x00000200);
> +    g_assert_cmphex(qtest_readl(s, base + HACE_STS), ==, 0);
> +
> +    /* Read computed digest from memory */
> +    qtest_memread(s, digest_addr, digest, sizeof(digest));
> +
> +    /* Check result of computation */
> +    g_assert_cmpmem(digest, sizeof(digest),
> +                    test_result_accum_sha512, sizeof(digest));
> +
> +    qtest_quit(s);
> +}
> +
>  struct masks {
>      uint32_t src;
>      uint32_t dest;
> @@ -396,6 +528,16 @@ static void test_sha512_sg_ast2600(void)
>      test_sha512_sg("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
>  }
>
> +static void test_sha256_accum_ast2600(void)
> +{
> +    test_sha256_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
> +}
> +
> +static void test_sha512_accum_ast2600(void)
> +{
> +    test_sha512_accum("-machine ast2600-evb", 0x1e6d0000, 0x80000000);
> +}
> +
>  static void test_addresses_ast2600(void)
>  {
>      test_addresses("-machine ast2600-evb", 0x1e6d0000, &ast2600_masks);
> @@ -455,6 +597,9 @@ int main(int argc, char **argv)
>      qtest_add_func("ast2600/hace/sha512_sg", test_sha512_sg_ast2600);
>      qtest_add_func("ast2600/hace/sha256_sg", test_sha256_sg_ast2600);
>
> +    qtest_add_func("ast2600/hace/sha512_accum", test_sha512_accum_ast2600);
> +    qtest_add_func("ast2600/hace/sha256_accum", test_sha256_accum_ast2600);
> +
>      qtest_add_func("ast2500/hace/addresses", test_addresses_ast2500);
>      qtest_add_func("ast2500/hace/sha512", test_sha512_ast2500);
>      qtest_add_func("ast2500/hace/sha256", test_sha256_ast2500);
> --
> 2.25.1
>

