Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13EB43D14E
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:55:26 +0200 (CEST)
Received: from localhost ([::1]:54832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfo57-0005Pn-OL
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:55:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnPq-0008Qc-80
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:12:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnPn-0005W2-Cu
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:12:45 -0400
Received: by mail-wr1-x436.google.com with SMTP id b12so1178851wrh.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sonJcgWebtQVPABZyks2rskt+37kQ+JuaPRgHHFOrlo=;
 b=ki4ck6YVaq0zjHcDv6QoI5Xzp1m1ddj83MZYWfJGCBqBa3R39T1Qk0qYegwrqWsxHn
 JBBd0Gj2vXJm9BLC6VS5VVeF7uFGPg0o051QN+IUwbJ+okCu6sYEV+PCTUc+en3IUi46
 Ueti1n4CrS/V2TR65SrPIBlhQx4dVc4WqSYV7/WYWKN5xBANRsVJTimqkkVHIIpUjkb6
 gSZ3DstKtZX64/c53jJMXy1Id3ntGY+q9WXbz0QRzC0CR33Y4EPZZBO8eVANathglvK9
 PC5ytFBKlVLJPUSYb+TypOAOGvBOLyQ/6I+yMuSXnQdJtqd6q87DIn1IvqR8P03KjWin
 u+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sonJcgWebtQVPABZyks2rskt+37kQ+JuaPRgHHFOrlo=;
 b=6J1SL5/zURrzMj4PrDb1MZMBG63O4mqI5IC2lI6XPqGA7I6koYdClY6MpwpFBePsoQ
 TGBwfb3E1sB1QIkNc4/TQq5MCq+4ftviE94bMVFw29LeQvi/kJRNjkuL5i/ZuCVIplKH
 aoCzVmmOpiyzac9t5xQ/rZe1cg79tY71uXeVhU5KXpqT/g/4XalPbu0KUFHwhKw4OGWA
 yoA99/p/EzuH5TxtLHI/L2LvnMCrlXT7UT0ikjdoJOSPTkRi6Xc8lvPp49kC53yrLVey
 4YEC4OKdm3Hdg7vJh3ZtXihybNS/6cmehdhny8im0I9sVYJpt7GDcdxz51H+NqyLfHx9
 GF/A==
X-Gm-Message-State: AOAM532UpZUyxvIB68k2VZ84mRWrUVwQaFNI1faVuBSUoTOZWVgVqgLq
 lMc0V06IC/1N6iZwa20J8fudqLveIfA=
X-Google-Smtp-Source: ABdhPJz5Kp4LSXBCgeQH9BNB0kukRQ6uu+HuKKUUCF+I73fSTxkC7KdxER8rA9QVSrQc3aCCcewXjg==
X-Received: by 2002:adf:eb4f:: with SMTP id u15mr42326531wrn.215.1635358361797; 
 Wed, 27 Oct 2021 11:12:41 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j10sm553743wrx.94.2021.10.27.11.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 11:12:41 -0700 (PDT)
Message-ID: <3015b2b3-5379-9dd5-0cf1-83471f28453e@amsat.org>
Date: Wed, 27 Oct 2021 20:12:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 00/32] target/mips: Fully convert MSA opcodes to
 decodetree
Content-Language: en-US
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Forgot to Cc Richard...

On 10/27/21 20:06, Philippe Mathieu-Daudé wrote:
> Since v1:
> - Addressed Richard comments (thanks, I learned a lot doing so!
>   Although I consider this series 'boring' I enjoyed working on
>   your review comments).
> - Included Jiaxun R-b tags, but they are conditional on Richard
>   ones.
> 
> v1 unchanged cover:
> 
> Hi,
> 
> This series converts 2000+ lines of switch() code to decodetree
> description, so this hard-to-review/modify switch is auto generated
> by the decodetree script. This is a big win for maintenance (and
> indeed the convertion revealed 2 bugs).
> 
> Massive convertions are - beside being often boring - bug-prone.
> In this series we re-start running the MSA tests (the tests are
> run automagically in the 'build-user-static' job on gitlab CI).
> 
> Although boring, the conversion is very clean, so I hope it will
> be easy enough to review. The TRANS*() macros are heavily used.
> 
> When possible, constant fields are hold with tcg_constant().
> 
> Note, various opcodes can be optimized using TCG host vectors.
> We won't address that in this series, as it makes the resulting
> review harder. We will post that in a following series. Here we
> simply dummy-convert.
> 
> The resulting msa.decode file is quite pleasant to look at, and
> the diff-stat is encouraging: number of LoC halved.
> 
> Regards,
> 
> Phil.
> 
> git: https://gitlab.com/philmd/qemu.git tree/mips-msa-decodetree
> Based-on: <20211023164329.328137-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (32):
>   target/mips: Fix MSA MADDV.B opcode
>   target/mips: Fix MSA MSUBV.B opcode
>   tests/tcg/mips: Run MSA opcodes tests on user-mode emulation
>   target/mips: Use dup_const() to simplify
>   target/mips: Have check_msa_access() return a boolean
>   target/mips: Use enum definitions from CPUMIPSMSADataFormat enum
>   target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
>   target/mips: Convert MSA LDI opcode to decodetree
>   target/mips: Convert MSA I5 instruction format to decodetree
>   target/mips: Convert MSA BIT instruction format to decodetree
>   target/mips: Convert MSA SHF opcode to decodetree
>   target/mips: Convert MSA I8 instruction format to decodetree
>   target/mips: Convert MSA load/store instruction format to decodetree
>   target/mips: Convert MSA 2RF instruction format to decodetree
>   target/mips: Convert MSA FILL opcode to decodetree
>   target/mips: Convert MSA 2R instruction format to decodetree
>   target/mips: Convert MSA VEC instruction format to decodetree
>   target/mips: Convert MSA 3RF instruction format to decodetree
>     (DF_HALF)
>   target/mips: Convert MSA 3RF instruction format to decodetree
>     (DF_WORD)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     1/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     2/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     3/4)
>   target/mips: Convert MSA 3R instruction format to decodetree (part
>     4/4)
>   target/mips: Convert MSA ELM instruction format to decodetree
>   target/mips: Convert MSA COPY_U opcode to decodetree
>   target/mips: Convert MSA COPY_S and INSERT opcodes to decodetree
>   target/mips: Convert MSA MOVE.V opcode to decodetree
>   target/mips: Convert CFCMSA opcode to decodetree
>   target/mips: Convert CTCMSA opcode to decodetree
>   target/mips: Remove generic MSA opcode
>   target/mips: Remove one MSA unnecessary decodetree overlap group
>   target/mips: Adjust style in msa_translate_init()
> 
>  tests/tcg/mips/ase-msa.mak         |   30 +
>  target/mips/tcg/msa.decode         |  241 ++-
>  target/mips/tcg/msa_helper.c       |   64 +-
>  target/mips/tcg/msa_translate.c    | 2746 +++++++---------------------
>  MAINTAINERS                        |    1 +
>  tests/tcg/mips/Makefile.target     |    5 +
>  tests/tcg/mips64/Makefile.target   |    9 +
>  tests/tcg/mips64el/Makefile.target |   12 +
>  tests/tcg/mipsel/Makefile.target   |    9 +
>  9 files changed, 969 insertions(+), 2148 deletions(-)

