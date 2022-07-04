Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83D2564CEC
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 07:22:46 +0200 (CEST)
Received: from localhost ([::1]:39356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8EXl-0003WZ-Rz
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 01:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EUr-0001Qc-Bq
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:19:46 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8EUp-0001iH-Cd
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 01:19:44 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 x18-20020a17090a8a9200b001ef83b332f5so2182029pjn.0
 for <qemu-devel@nongnu.org>; Sun, 03 Jul 2022 22:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2LneHX0RM0mE0/vsRdGcRgX+bCow3PxyidXcHiJCI+Y=;
 b=ZcJPnYEfD/VcJW6r3EohVLX5UHwbYY4cPdUM2jQU5vziGkzRHMcrQdsnGkvxgWz93x
 5ufRKrGPHm6G2CSMzhhpPqghGHUBdZBrSNXTafspzcxu47j5MSpEMihTRn6BKbvVzcqS
 wgI2GrTmuB2WofvUdj3HEVrvq3aK64UVQO40s104Rp8k4tRLOqFEewQBEVWZ6K/WrF+I
 uKGfVYHbwOm2xyZ9TZujr8dLxTaybuQ+pcQSbBIdRUXZxBR6b7cIrResGNZNW8guk9t1
 Uhhya6nH5c+4Yi9JUn2zjGCRMCJkF7cpueI9TFyAPZcJPsM2pDa78O0KsREW/vaC6WiH
 58fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2LneHX0RM0mE0/vsRdGcRgX+bCow3PxyidXcHiJCI+Y=;
 b=wwpxp8pAbPDif9EKVtxOWcuu+ezLHMVNjIu1VwI9RKK0jR74AmMW3HtAR4Wu79l1xd
 60xO47h1FkbupjYTO6ZNc7SQs27hNk75k2MWvaC/mBVuGAiNgT136cWb+tMJgdwopmyr
 6mc/mMReP7NIw5FD6jKNOd0VGPCNWPLk7pfgbPIMCKgxYKndjg5r66hRNpsBd3hzQtPX
 fcPWLTEafDgT5TiIOJXehCcXm0l55hs6NInDCvlBBvuSCXHlI2hTgEw7MDmi5fAAJAVE
 vtFmvRoHokN7eaZ+6fduAUka+7cSBZ2Wo2kXz9Ypy6ENTfmR8vdfcnC5Z/xV/dFQd+6v
 NDWw==
X-Gm-Message-State: AJIora8V7usnVik/qVVxk38LLfJ5/YZrvVOJrmhFvkv6WqzrUXFrh3cY
 ibhyaTvc2JJyBXosBBrlw3c3hQ==
X-Google-Smtp-Source: AGRyM1vl/xoTICsEe5OfgY0NnMNo6Yef8wxrSfjSX42JAKl8VQj83GVZkt95vUbchexj2LASCPkw/g==
X-Received: by 2002:a17:90b:2341:b0:1ef:819f:dfc4 with SMTP id
 ms1-20020a17090b234100b001ef819fdfc4mr7235606pjb.206.1656911982129; 
 Sun, 03 Jul 2022 22:19:42 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 e17-20020aa798d1000000b00525496442ccsm19988606pfm.216.2022.07.03.22.19.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jul 2022 22:19:41 -0700 (PDT)
Message-ID: <83a2b7d9-55eb-582b-b5f2-6e6d98bf57db@linaro.org>
Date: Mon, 4 Jul 2022 10:49:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 09/11] target/loongarch: Add lock when writing timer clear
 reg
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220701093407.2150607-1-yangxiaojuan@loongson.cn>
 <20220701093407.2150607-10-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220701093407.2150607-10-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/1/22 15:04, Xiaojuan Yang wrote:
> There is such error info when running linux kernel:
>      tcg_handle_interrupt: assertion failed: (qemu_mutex_iothread_locked()).
>      calling stack:
>      #0 in raise () at /lib64/libc.so.6
>      #1 in abort () at /lib64/libc.so.6
>      #2 in g_assertion_message_expr.cold () at /lib64/libglib-2.0.so.0
>      #3 in g_assertion_message_expr () at /lib64/libglib-2.0.so.0
>      #4 in tcg_handle_interrupt (cpu=0x632000030800, mask=2) at ../accel/tcg/tcg-accel-ops.c:79
>      #5 in cpu_interrupt (cpu=0x632000030800, mask=2) at ../softmmu/cpus.c:248
>      #6 in loongarch_cpu_set_irq (opaque=0x632000030800, irq=11, level=0)
>         at ../target/loongarch/cpu.c:100
>      #7 in helper_csrwr_ticlr (env=0x632000039440, val=1) at ../target/loongarch/csr_helper.c:85
>      #8 in code_gen_buffer ()
>      #9 in cpu_tb_exec (cpu=0x632000030800, itb=0x7fff946ac280, tb_exit=0x7ffe4fcb6c30)
>         at ../accel/tcg/cpu-exec.c:358
> 
> Add mutex iothread lock around loongarch_cpu_set_irq in csrwr_ticlr() to
> fix the bug.
> 
> Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

