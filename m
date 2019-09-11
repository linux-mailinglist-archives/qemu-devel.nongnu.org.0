Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B02BAFF3E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Sep 2019 16:54:53 +0200 (CEST)
Received: from localhost ([::1]:51978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i841D-0002Cx-Rv
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 10:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47034)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i83xu-0007kw-Pb
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:51:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i83xt-00087u-3M
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:51:26 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:45153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i83xs-00087C-Uv
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 10:51:25 -0400
Received: by mail-io1-xd44.google.com with SMTP id f12so46361038iog.12
 for <qemu-devel@nongnu.org>; Wed, 11 Sep 2019 07:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DKg/pSa5KC6awsuIG5WpCszhbi2ykvLdh1jfm7RlOCU=;
 b=frtVqm702iDRzV8joEeyIpQ9Pi1rDX+RygW3q+YfAQuJFhRn1nNM3JAZeJyaswBki1
 aMAU3Q+jUeM+FQf1Nk90G2M5hjUlH88tZDjT/XuJYUdjRLpipXJJQRbCdw4aWXfr/e9f
 AeNiKgY+8vIeVf20AT7zwXLK0U6vITabDzzdDDPLj0C+UJ8PNnVkrwP2ILrZieAHjEGH
 xKW3kGJ3A9h7vIlLUyhsXuUYF/iqIdRFYpoGTj++Qm1/m9bgEeCnNTfJJ+G+9R1XeVPm
 PZ9nxFXQ/kWIz6VtDFvzhSYGKffMl3nD/vRRlqJeKlmPSbLrMMh37AhIiNWiEHLBND9Q
 e9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DKg/pSa5KC6awsuIG5WpCszhbi2ykvLdh1jfm7RlOCU=;
 b=Jki/9Lhp+zEf4ErD8MlE8U+1XHxKRcuWS1T2S9bFfURtbd2bPuKMmnlS5PsgKDGLoV
 xGFAXaj+UV/yJa3cjK+us8R49o+dxI0NE4lQ2a3w9Xj9Vo/QpyuJOD7It/cM9sbiKQnB
 e0fmFvR3jbjiMr00NHkcg66in0RQT//F8gkS4sRh4utZVkg0U1jAB8IuGe6ydxKdFkQP
 Bcn4K2dEShKAhukLMcOoq6siLp+JfZQMPkxWAcrY6P8SGW3R1f32eERbdrJM1nRZ4emB
 txxXI8PIiDBW4traMGkvTrXBqpuYTSZmUpd2LI/2PGpyx188xQWfH5ReDHsQBe58JCCY
 bd0A==
X-Gm-Message-State: APjAAAVwOWdp94+ZGyZcxGdSF1Q9AwjlMgEgQ6f27BrYczA4xiDtb3Zz
 BA/HPimDfKpAvVj0Z2LhMsj89UiZZCP3V7/+9aRypEVbUoc=
X-Google-Smtp-Source: APXvYqwri+DYLseY2oPTtom1S3OAAdSW6dcHn0TjPIFLGUqPSESwd9knfGxQAXag8H3drs2ZDdzwiAFuoVSYEjv8u9A=
X-Received: by 2002:a05:6602:2516:: with SMTP id
 i22mr2906275ioe.129.1568213483487; 
 Wed, 11 Sep 2019 07:51:23 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
In-Reply-To: <1568183141-67641-2-git-send-email-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 11 Sep 2019 22:51:12 +0800
Message-ID: <CAEiOBXUveMJGpavU7_zK0UTdNniQvnXnw5MvE-hu7yHCSw8MPQ@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH v2 01/17] RISC-V: add vfp field in
 CPURISCVState
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
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, wxy194768@alibaba-inc.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wenmeng_zhang@c-sky.com, Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 11, 2019 at 2:35 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 0adb307..c992b1d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -93,9 +93,37 @@ typedef struct CPURISCVState CPURISCVState;
>
>  #include "pmp.h"
>
> +#define VLEN 128
> +#define VUNIT(x) (VLEN / x)
> +
>  struct CPURISCVState {
>      target_ulong gpr[32];
>      uint64_t fpr[32]; /* assume both F and D extensions */
> +
> +    /* vector coprocessor state.  */
> +    struct {
> +        union VECTOR {
> +            float64  f64[VUNIT(64)];
> +            float32  f32[VUNIT(32)];
> +            float16  f16[VUNIT(16)];
> +            uint64_t u64[VUNIT(64)];
> +            int64_t  s64[VUNIT(64)];
> +            uint32_t u32[VUNIT(32)];
> +            int32_t  s32[VUNIT(32)];
> +            uint16_t u16[VUNIT(16)];
> +            int16_t  s16[VUNIT(16)];
> +            uint8_t  u8[VUNIT(8)];
> +            int8_t   s8[VUNIT(8)];
> +        } vreg[32];
> +        target_ulong vxrm;
> +        target_ulong vxsat;
> +        target_ulong vl;
> +        target_ulong vstart;
> +        target_ulong vtype;
> +        float_status fp_status;
> +    } vfp;
> +
> +    bool         foflag;
>      target_ulong pc;
>      target_ulong load_res;
>      target_ulong load_val;
> --
> 2.7.4
>
>
Could  the VLEN be configurable in cpu initialization but not fixed in
compilation phase ?
Take the integer element as example  and the difference should be the
stride of vfp.vreg[x] isn't continuous

    struct {
        union VECTOR {
            uint64_t *u64;
            uint16_t *u16;
            uint8_t  *u8;
        } vreg[32];
    } vfp;

   initialization

    int vlen = 256;  //parameter from cpu command line option
    int elem = vlen / 8;
    int size = elem * 32;

    uint8_t *mem = malloc(size)
    for (int idx = 0; idx < 32; ++idx) {
        vfp.vreg[idx].u64 = (void *)&mem[idx * elem];
        vfp.vreg[idx].u32 = (void *)&mem[idx * elem];
        vfp.vreg[idx].u16 = (void *)&mem[idx * elem];
   }

  chihmin
