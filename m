Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FE4489786
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 12:32:52 +0100 (CET)
Received: from localhost ([::1]:48034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6sux-0002V8-7Z
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 06:32:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ssy-0000Gh-H8
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:30:48 -0500
Received: from [2a00:1450:4864:20::336] (port=56269
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n6ssw-0006gE-P5
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 06:30:48 -0500
Received: by mail-wm1-x336.google.com with SMTP id c66so8490537wma.5
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 03:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VdWP8uqFQbfRGwdVvvbabfQfCePNYpAbY6eCp5/Dmow=;
 b=GGzEQ13x5FejHHE4750U1DerL6NFmAXtLGJGtbz0TNmO/sDgUlZzkO6NFvChyL2+9O
 amuX7Y/P25tiKGGQOjTSdGn3GqCBoTIcO0ya0f7UOI9xNP1oSQV2IcYrX1Qti569U4Fg
 LaluoD8XMYDtH2tNgHp4wc0lK+yybsARGgGh6ezl4PaKcGrSRECtHeoTeo0UK7g4grdt
 tyP3fEThWQ37nJADwWm4G3YSW1PIS0D1et08wLmjm9pMPHee1O88Yl4iQnusilF06Fwn
 lj/ukrZzot+/Vua0DXBJiyddNtIF5Go9HFw2v2l1VYqnG8oy5xD8BOSfzTB/rTDjQuxn
 RJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VdWP8uqFQbfRGwdVvvbabfQfCePNYpAbY6eCp5/Dmow=;
 b=XLpovSbE7SeGoouNJ6UueVOdWgBg1H8Vk6dKgZRcua7Ym/QCZunR5GqI/8S8afhHRa
 /YUClVurpvxP+i3YyP5QV3TV32e+WaDy1cLUv6b22HEKxQyjdKyfZiC5YdlaO9kxJu6t
 Q4a/p49pLZhJerVEq4lBt5QXl/yWjq1FzZh+04R6G8Fd36C0GFPBJ8Zih8RrrguMbsGN
 0Q5iU8mVLBwM1MB3DTJCag9EC47mHTQ6pieuEEY0PvQTt/o6vLsKkN9hYkdidMzEDJj8
 nUKUJrU//lbyqobrgwPkZ+RtKVmgVri/maXdJMb4Ydn/lKe4Gl9ec5JnbxCQfAX8SsGM
 NsHA==
X-Gm-Message-State: AOAM531ZskEOvEEbTZBgi2x+yB8LRlcKYtzL6DysDv+AVETVLHMSYXKF
 +Obdxp0CjUi09TE1xRGOeBw=
X-Google-Smtp-Source: ABdhPJyifkmVYvRz0KUZpdcIUy9hWpHRVZTN8JxMsDGNAn8TIaxxbngDn4xlbbABDrxdExT3qZO0Hw==
X-Received: by 2002:a05:600c:1e8b:: with SMTP id
 be11mr22038242wmb.51.1641814245540; 
 Mon, 10 Jan 2022 03:30:45 -0800 (PST)
Received: from [192.168.1.40] (83.red-83-50-87.dynamicip.rima-tde.net.
 [83.50.87.83])
 by smtp.gmail.com with ESMTPSA id az1sm6525423wrb.104.2022.01.10.03.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 03:30:45 -0800 (PST)
Message-ID: <8715f643-7057-8997-d77d-1b55d4ddebc8@amsat.org>
Date: Mon, 10 Jan 2022 12:30:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] decodetree: Add an optional predicate-function for
 decoding
Content-Language: en-US
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
References: <20220109205640.4126817-1-philipp.tomsich@vrull.eu>
 <05100e8f-ce11-9da1-8afe-6010d9bbebb5@amsat.org>
 <CAAeLtUAZ41bkq_UEKd8=-kO52wtTxv3rxYrzSHfp_sTd3K4+aw@mail.gmail.com>
 <91394f9d-aa65-a4f9-f54f-3ecc5aac9e70@amsat.org>
 <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAAeLtUCy+Yib4D9-WMDRvTqVH-dP+sJT=h1pa1eYKEaYuNZrtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Luis Pires <luis.pires@eldorado.org.br>,
 Alistair Francis <Alistair.Francis@wdc.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kito Cheng <kito.cheng@sifive.com>,
 Greg Favor <gfavor@ventanamicro.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/10/22 12:11, Philipp Tomsich wrote:
> On Mon, 10 Jan 2022 at 11:03, Philippe Mathieu-Daudé <f4bug@amsat.org
> <mailto:f4bug@amsat.org>> wrote:
> 
>     On 1/10/22 10:52, Philipp Tomsich wrote:
>     > For RISC-V the opcode decode will change between different vendor
>     > implementations of RISC-V (emulated by the same qemu binary).
>     > Any two vendors may reuse the same opcode space, e.g., we may end
>     up with:
>     >
>     > # *** RV64 Custom-3 Extension ***
>     > {
>     >   vt_maskc   0000000  ..... ..... 110 ..... 1111011 @r
>     |has_xventanacondops_p
>     >   vt_maskcn  0000000  ..... ..... 111 ..... 1111011 @r
>     |has_xventanacondops_p
>     >   someone_something  ............ ..... 000 ..... 1100111 @i
>     > |has_xsomeonesomething_p
>     > }
>     >
>     > With extensions being enabled either from the commandline
>     >     -cpu any,xventanacondops=true
>     > or possibly even having a AMP in one emulation setup (e.g. application
>     > cores having one extension and power-mangement cores having a
>     > different one — or even a conflicting one).
> 
>     I understand, I think this is what MIPS does, see commit 9d005392390:
>     ("target/mips: Introduce decodetree structure for NEC Vr54xx extension")
> 
> 
> The MIPS implementation is functionally equivalent, and I could see us
> doing something similar for RISC-V (although I would strongly prefer to
> make everything explicit via the .decode-file instead of relying on
> people being aware of the logic in decode_op).
> 
> With the growing number of optional extensions (as of today, at least
> the Zb[abcs] and vector comes to mind), we would end up with a large
> number of decode-files that will then need to be sequentially called
> from decode_op(). The predicates can then move up into decode_op,
> predicting the auto-generated decoders from being invoked.
> 
> As of today, we have predicates for at least the following:
> 
>   * Zb[abcs]
>   * Vectors
> 
> As long as we are in greenfield territory (i.e. not dealing with
> HINT-instructions that overlap existing opcode space), this will be fine
> and provide proper isolation between the .decode-tables.
> However, as soon as we need to implement something along the lines (I
> know this is a bad example, as prefetching will be a no-op on qemu) of:
> 
>     {
>       {
>         # *** RV32 Zicbop Sandard Extension (hints in the ori-space) ***
>         prefetch_i  ....... 00000 ..... 110 00000 0010011 @cbo_pref
>         prefetch_r  ....... 00001 ..... 110 00000 0010011 @cbo_pref
>         prefetch_w  ....... 00011 ..... 110 00000 0010011 @cbo_pref
>       }
>       ori      ............     ..... 110 ..... 0010011 @i
>     }
> 
> we'd need to make sure that the generated decoders are called in the
> appropriate order (i.e. the decoder for the specialized instructions
> will need to be called first), which would not be apparent from looking
> at the individual .decode files.
> 
> Let me know what direction we want to take (of course, I have a bias
> towards the one in the patch).

I can't say for RISCV performance, I am myself biased toward maintenance
where having one compilation unit per (vendor) extension.
ARM and MIPS seems to go in this direction, while PPC and RISCV in the
other one.

