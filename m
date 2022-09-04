Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F4D5AC49F
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 16:03:47 +0200 (CEST)
Received: from localhost ([::1]:41878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUqDz-000181-1W
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 10:03:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqBu-0007fJ-2K
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:01:39 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUqBr-0001V9-3M
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 10:01:36 -0400
Received: by mail-wr1-x432.google.com with SMTP id bp20so7687929wrb.9
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=dntN8Ne0CKdm6geqgeKgAtRetxO/BKYvdvPtGe1yRPw=;
 b=K6qFPuGdQLRfr4fVjrU+ynV/3SXWWzEQkHYOzWkgfXcrGjyfy8o4kFkxiydtT184AW
 GO86FVo/dZVPRgBDu67+gz5ie2z14NS08mFBoHY6LuKmdsom1umDM6CzVjJhUrp5t2Py
 qCByLsoQsLVUT1BdfYOzJjqi5mpLW+54pMD6aPCVh+KV+OWFOy3hRAnjxcuYOJqJvObY
 OUesXm0Myajycl38KvU+SDGNwmfdkgxKGG52Kt0BYGmAOCa19VRisqLKkPBGyqmf0Yzn
 ux+/unGFHblEt+QWv5Eiwqu+f3JgAsAkYbuyMtER1DHNkUsbV0yqKS+JjO8CktXf2qZI
 dWgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=dntN8Ne0CKdm6geqgeKgAtRetxO/BKYvdvPtGe1yRPw=;
 b=qLI5v/7nGKmlOeORgVk6UePwpPXbzbj/w6ZBQn6l4RaDCuKw1NbE/SyxEulN+TGLdi
 KApn43f8xiDudZ58WVEhJ31G6caI46b0xMjJOaD96hIpXNEbXW21/kCFRuLD9x+9r5yh
 Rm1dHTwWX784f7J85RMUZzCRV/RPOv8J/A5n1B5anXN+14091qsCmUuqvnC3itdIpHOi
 XkXaNKIf7zBqPWsPvycdQ0xnIm80KA2gmVacE+g3oVGWyHVPiPNRrIdh5dfdoXl0QqtD
 txUxP0ODcZ5nbKBQxHtzCupISMM79wg8Gq2klBeSfv4Xhdzl+5SbnsnbZ7qZAzEDXOnz
 iYyQ==
X-Gm-Message-State: ACgBeo0fD84zTSzNUolG8n1CWVEcLxebGlWdLu/kZSp8Xeq/RsNFgvPn
 8zDs/kdPuoP+7Meq0WKkNVc=
X-Google-Smtp-Source: AA6agR6RgIIHnl9LuEHG88bun9eeVjA8gK1yOXinrUzrD8f+hup7tWh0RW4ApRb31YjxC6fQB03i7Q==
X-Received: by 2002:adf:d1ea:0:b0:226:f421:79b5 with SMTP id
 g10-20020adfd1ea000000b00226f42179b5mr9897165wrd.173.1662300093609; 
 Sun, 04 Sep 2022 07:01:33 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003a84375d0d1sm15817297wmq.44.2022.09.04.07.01.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 07:01:33 -0700 (PDT)
Message-ID: <ef04e507-777d-beeb-39fa-0b79b7f89e8d@amsat.org>
Date: Sun, 4 Sep 2022 16:01:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 4/8] tests: Only run intel-hda-tests if machine type is
 compiled in
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Bandan Das <bsd@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Gerd Hoffmann <kraxel@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20220902173452.1904-1-quintela@redhat.com>
 <20220902173452.1904-5-quintela@redhat.com>
In-Reply-To: <20220902173452.1904-5-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 2/9/22 19:34, Juan Quintela wrote:
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> ---
>   tests/qtest/intel-hda-test.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
> index a58c98e4d1..d4a8db6fd6 100644
> --- a/tests/qtest/intel-hda-test.c
> +++ b/tests/qtest/intel-hda-test.c
> @@ -18,7 +18,7 @@
>   /* Tests only initialization so far. TODO: Replace with functional tests */
>   static void ich6_test(void)
>   {
> -    qtest_start("-device intel-hda,id=" HDA_ID CODEC_DEVICES);
> +    qtest_start("-machine pc -device intel-hda,id=" HDA_ID CODEC_DEVICES);
>       qtest_end();
>   }
>   
> @@ -65,9 +65,12 @@ static void test_issue542_ich6(void)
>   int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
> -    qtest_add_func("/intel-hda/ich6", ich6_test);
> -    qtest_add_func("/intel-hda/ich9", ich9_test);
> -    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
> -
> +    if (qtest_has_machine("pc")) {
> +        qtest_add_func("/intel-hda/ich6", ich6_test);
> +    }
> +    if (qtest_has_machine("q35")) {
> +        qtest_add_func("/intel-hda/ich9", ich9_test);
> +        qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
> +    }
>       return g_test_run();
>   }

Generically, we should really test for available devices, not particular 
machines... As new machines using tested devices could be added.

Could qtest_has_device(TYPE_INTEL_HDA_GENERIC) work here?

