Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66A94DE1AA
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 20:17:15 +0100 (CET)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVI66-0004dX-NR
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 15:17:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVI4u-0003w0-P6
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:16:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nVI4s-0001Nn-PO
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 15:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647630958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvj9r8xJ99RexzAuhUc/gs5UQHXpEAbtUZ7/59OJYpE=;
 b=AwLda6wtPJDO8FvU0PzCUOpz3pQ4xtwwebFVlUQxN6Zbvdywy/h2seJ/gTt+BIxVC9fu8g
 04RQyrdBdmjtqjE4B50IxpvEUpcK2ICR9dCM6rJ/ZMn4lEeak6DKQG9sa5K1QFD11/oB8j
 /LzmpcbWzE/GZrWiD1x2UHhZttphazA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-DIjTs__KOeWjaeoD3Kv06Q-1; Fri, 18 Mar 2022 15:15:57 -0400
X-MC-Unique: DIjTs__KOeWjaeoD3Kv06Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 i65-20020a1c3b44000000b00385c3f3defaso1784538wma.3
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 12:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rvj9r8xJ99RexzAuhUc/gs5UQHXpEAbtUZ7/59OJYpE=;
 b=3Y+WVyWhViKqiVJyA9muLcB0PYUZ/Zw2CjUjdXGIRbAFJwnDH+6olqXjwW/hLtxfJ9
 FUv8+xMFOGP2yCIVa3YJTQQXUx3QZWfxd2GCpy8VJ05T0SJoqKr8xL+NOLEQvfrRjl9o
 YqhF97BM1FE00h1cJsiVsqBuCF4B/5fBePOsP2fysNonhSV7f1D1yXuu5OIHFsqOpPeG
 y/LnkS3AY8veGURrldU1cBv9KifsT+9W4xiI+lyvS9ZPRI/j5OUblKwWyo0cTEd8CGaM
 FCcsPeEIKEzRRfKTgQjkJrcahrs/mo2jYm2qRyLTHOpsGWp7H27OgHzq7T32Q1FZr7hH
 MrOA==
X-Gm-Message-State: AOAM532Sx9rgJxERFfr82cJeSEUjpifJhBmak41Adu1JZ6d1g6MJXMJP
 bEss7t+dM3xrne5b+DDXDg5oHpHLFiWPlSEucvOBMfjjkLc0UZTzh5d0f2tRLzC0z1k6/MOTITF
 v5Q/VrQFPOk0zoOE4AAgzEX/HAemlOmI3OwRmob1UEzmga2g6xm8nxyGQptYfqRE=
X-Received: by 2002:a05:600c:22c4:b0:38c:70f5:25a9 with SMTP id
 4-20020a05600c22c400b0038c70f525a9mr9308633wmg.119.1647630955987; 
 Fri, 18 Mar 2022 12:15:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfobQbecfKZgpqHiLmDCr0vKBSf2YhCw5BdMoJpgB4iq2tJNty0MzUkwzY7rhX4xePdKW3rA==
X-Received: by 2002:a05:600c:22c4:b0:38c:70f5:25a9 with SMTP id
 4-20020a05600c22c400b0038c70f525a9mr9308597wmg.119.1647630955577; 
 Fri, 18 Mar 2022 12:15:55 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 l18-20020adfe592000000b001f064ae9830sm6873610wrm.37.2022.03.18.12.15.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 12:15:54 -0700 (PDT)
Message-ID: <a868f5a0-aa11-766e-a739-04b693c271c5@redhat.com>
Date: Fri, 18 Mar 2022 20:15:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH 3/3] tests/qtest/intel-hda-test: Add reproducer for
 issue #542
To: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20211218160912.1591633-1-philmd@redhat.com>
 <20211218160912.1591633-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211218160912.1591633-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Martin Schrodt <martin@schrodt.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 Gianluca Gabruelli <gianluca.gabrielli@suse.com>,
 =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Jon Maloy <jmaloy@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Paolo Bonzini <pbonzini@redhat.com>, crazybyte@protonmail.com,
 Matt Parker <mtparkr@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/12/2021 17.09, Philippe Mathieu-Daudé wrote:
> Include the qtest reproducer provided by Alexander Bulekov
> in https://gitlab.com/qemu-project/qemu/-/issues/542.
> Without the previous commit, we get:
> 
>    $ make check-qtest-i386
>    ...
>    Running test tests/qtest/intel-hda-test
>    AddressSanitizer:DEADLYSIGNAL
>    =================================================================
>    ==1580408==ERROR: AddressSanitizer: stack-overflow on address 0x7ffc3d566fe0
>        #0 0x63d297cf in address_space_translate_internal softmmu/physmem.c:356
>        #1 0x63d27260 in flatview_do_translate softmmu/physmem.c:499:15
>        #2 0x63d27af5 in flatview_translate softmmu/physmem.c:565:15
>        #3 0x63d4ce84 in flatview_write softmmu/physmem.c:2850:10
>        #4 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
>        #5 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
>        #6 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>        #7 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
>        #8 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
>        #9 0x62ae5ec0 in stl_le_dma include/sysemu/dma.h:275:1
>        #10 0x62ae5ba2 in stl_le_pci_dma include/hw/pci/pci.h:871:1
>        #11 0x62ad59a6 in intel_hda_response hw/audio/intel-hda.c:372:12
>        #12 0x62ad2afb in hda_codec_response hw/audio/intel-hda.c:107:5
>        #13 0x62aec4e1 in hda_audio_command hw/audio/hda-codec.c:655:5
>        #14 0x62ae05d9 in intel_hda_send_command hw/audio/intel-hda.c:307:5
>        #15 0x62adff54 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
>        #16 0x62adc13b in intel_hda_set_corb_wp hw/audio/intel-hda.c:548:5
>        #17 0x62ae5942 in intel_hda_reg_write hw/audio/intel-hda.c:977:9
>        #18 0x62ada10a in intel_hda_mmio_write hw/audio/intel-hda.c:1054:5
>        #19 0x63d8f383 in memory_region_write_accessor softmmu/memory.c:492:5
>        #20 0x63d8ecc1 in access_with_adjusted_size softmmu/memory.c:554:18
>        #21 0x63d8d5d6 in memory_region_dispatch_write softmmu/memory.c:1504:16
>        #22 0x63d5e85e in flatview_write_continue softmmu/physmem.c:2812:23
>        #23 0x63d4d05b in flatview_write softmmu/physmem.c:2854:12
>        #24 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
>        #25 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
>        #26 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>        #27 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
>        #28 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
>        #29 0x62ae5ec0 in stl_le_dma include/sysemu/dma.h:275:1
>        #30 0x62ae5ba2 in stl_le_pci_dma include/hw/pci/pci.h:871:1
>        #31 0x62ad59a6 in intel_hda_response hw/audio/intel-hda.c:372:12
>        #32 0x62ad2afb in hda_codec_response hw/audio/intel-hda.c:107:5
>        #33 0x62aec4e1 in hda_audio_command hw/audio/hda-codec.c:655:5
>        #34 0x62ae05d9 in intel_hda_send_command hw/audio/intel-hda.c:307:5
>        #35 0x62adff54 in intel_hda_corb_run hw/audio/intel-hda.c:342:9
>        #36 0x62adc13b in intel_hda_set_corb_wp hw/audio/intel-hda.c:548:5
>        #37 0x62ae5942 in intel_hda_reg_write hw/audio/intel-hda.c:977:9
>        #38 0x62ada10a in intel_hda_mmio_write hw/audio/intel-hda.c:1054:5
>        #39 0x63d8f383 in memory_region_write_accessor softmmu/memory.c:492:5
>        #40 0x63d8ecc1 in access_with_adjusted_size softmmu/memory.c:554:18
>        #41 0x63d8d5d6 in memory_region_dispatch_write softmmu/memory.c:1504:16
>        #42 0x63d5e85e in flatview_write_continue softmmu/physmem.c:2812:23
>        #43 0x63d4d05b in flatview_write softmmu/physmem.c:2854:12
>        #44 0x63d4cb18 in address_space_write softmmu/physmem.c:2950:18
>        #45 0x63d4d387 in address_space_rw softmmu/physmem.c:2960:16
>        #46 0x62ae12f2 in dma_memory_rw_relaxed include/sysemu/dma.h:89:12
>        #47 0x62ae104a in dma_memory_rw include/sysemu/dma.h:132:12
>        #48 0x62ae6157 in dma_memory_write include/sysemu/dma.h:173:12
>        ...
>    SUMMARY: AddressSanitizer: stack-overflow softmmu/physmem.c:356 in address_space_translate_internal
>    ==1580408==ABORTING
>    Broken pipe
>    Aborted (core dumped)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/intel-hda-test.c | 34 ++++++++++++++++++++++++++++++++++
>   1 file changed, 34 insertions(+)
> 
> diff --git a/tests/qtest/intel-hda-test.c b/tests/qtest/intel-hda-test.c
> index fc25ccc33cc..a58c98e4d11 100644
> --- a/tests/qtest/intel-hda-test.c
> +++ b/tests/qtest/intel-hda-test.c
> @@ -29,11 +29,45 @@ static void ich9_test(void)
>       qtest_end();
>   }
>   
> +/*
> + * https://gitlab.com/qemu-project/qemu/-/issues/542
> + * Used to trigger:
> + *  AddressSanitizer: stack-overflow
> + */
> +static void test_issue542_ich6(void)
> +{
> +    QTestState *s;
> +
> +    s = qtest_init("-nographic -nodefaults -M pc-q35-6.2 "
> +                   "-device intel-hda,id=" HDA_ID CODEC_DEVICES);
> +
> +    qtest_outl(s, 0xcf8, 0x80000804);
> +    qtest_outw(s, 0xcfc, 0x06);
> +    qtest_bufwrite(s, 0xff0d060f, "\x03", 1);
> +    qtest_bufwrite(s, 0x0, "\x12", 1);
> +    qtest_bufwrite(s, 0x2, "\x2a", 1);
> +    qtest_writeb(s, 0x0, 0x12);
> +    qtest_writeb(s, 0x2, 0x2a);
> +    qtest_outl(s, 0xcf8, 0x80000811);
> +    qtest_outl(s, 0xcfc, 0x006a4400);
> +    qtest_bufwrite(s, 0x6a44005a, "\x01", 1);
> +    qtest_bufwrite(s, 0x6a44005c, "\x02", 1);
> +    qtest_bufwrite(s, 0x6a442050, "\x00\x00\x44\x6a", 4);
> +    qtest_bufwrite(s, 0x6a44204a, "\x01", 1);
> +    qtest_bufwrite(s, 0x6a44204c, "\x02", 1);
> +    qtest_bufwrite(s, 0x6a44005c, "\x02", 1);
> +    qtest_bufwrite(s, 0x6a442050, "\x00\x00\x44\x6a", 4);
> +    qtest_bufwrite(s, 0x6a44204a, "\x01", 1);
> +    qtest_bufwrite(s, 0x6a44204c, "\x02", 1);
> +    qtest_quit(s);
> +}
> +
>   int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
>       qtest_add_func("/intel-hda/ich6", ich6_test);
>       qtest_add_func("/intel-hda/ich9", ich9_test);
> +    qtest_add_func("/intel-hda/fuzz/issue542", test_issue542_ich6);
>   
>       return g_test_run();
>   }

Acked-by: Thomas Huth <thuth@redhat.com>


