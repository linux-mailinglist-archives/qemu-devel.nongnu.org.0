Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 142A34E50FE
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 12:06:45 +0100 (CET)
Received: from localhost ([::1]:41054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWypA-0004Sz-6S
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 07:06:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyjH-0002fF-6p
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:00:40 -0400
Received: from [2a00:1450:4864:20::433] (port=41600
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWyjE-0004D3-Em
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 07:00:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id h23so1537476wrb.8
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 04:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=T8mLM5uJ8lNAmS2ycK+0epu3RF+hMf8rkTHhgeuDlnQ=;
 b=X9hJ6V4jYL4Xgl4Gyzs2mN4wJ9WLmBiZ6vLy8NVAx/t3WdKF5FAzVn/8m+8DawR3VK
 YI9ZWtLZjjfCBf5TOCoFiVC9l7PIUw/Ot2rHLU87otf72NCOwLfTi+xZyKxH//Y5/Ay7
 7kUzZLZ/hz3Uoz4Y2XreW/Vh0gPwFWAe0PhM1/04Ce7n4sJ8H0DQDM6nRnpSIQni4iEg
 tSZOkxcpTiqPGe2lEVUjdsjG6R8mlPBWciiU6PXGSdpAoUmk6G+A31EyT42za5UC/i1F
 4iZH+5Bfkxra+PLCMvXxPvJwIbAaFiERYEzqPQfFpySUYMWWhiyx8XyLKHye/n+Z8k5W
 4UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=T8mLM5uJ8lNAmS2ycK+0epu3RF+hMf8rkTHhgeuDlnQ=;
 b=t2MIBuq4oRijtSWcvrs9Vcp86+aB1Kw6yI4Y1zEiKe091qbzqOrRYBGKFa5afdFAVP
 mF8UWescxFReShMjicPlWBaj5SZjsW/TOQ3Yf184uKUQUysedBh1+4J/WArptUZocd0x
 P6RXWvlhHJq1ggMTV06a0wWQST0fmIz5EjnpdXiKWl5WKliD6cJveI/PefonLWbNz6g7
 SNpTPhpkJbz/yqB25MsmjLkHRWBkUgUc5JrhdDnS1U08wbuZZVOzXZqiNYKlsAdMv6es
 5vxjjKnusyGxgGGpVagYNqmh1/zSvdIfvbyPO/uWqBCWOZZdmS/Mt4aPR+99orWMO5vz
 q7hQ==
X-Gm-Message-State: AOAM533g4gCdi0m9vwej7y6cfdy9GuvpGhs9JbFecOvqLz8gkxqeKhyA
 upSl7oO0AC64ShFG9fl+iZI=
X-Google-Smtp-Source: ABdhPJxt6rMfO3iyps7xyTr7qwDpaS+j42U74yzisHZAon7iowuMwvsfmAA4l9ej2ooXjFf6QeDmGg==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr25559359wrr.626.1648033232497; 
 Wed, 23 Mar 2022 04:00:32 -0700 (PDT)
Received: from [192.168.1.33] (198.red-83-50-65.dynamicip.rima-tde.net.
 [83.50.65.198]) by smtp.gmail.com with ESMTPSA id
 k40-20020a05600c1ca800b0038c6c8b7fa8sm3835686wms.25.2022.03.23.04.00.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 04:00:32 -0700 (PDT)
Message-ID: <2a40e9f8-dc2a-070c-216a-4a830ea0dd65@gmail.com>
Date: Wed, 23 Mar 2022 12:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.0 v3 1/2] qemu-binfmt-conf.sh: allow elf
 EI_ABIVERSION=1 for mips
Content-Language: en-US
To: laurent@vivier.eu, =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?=
 <dilfridge@gentoo.org>, qemu-devel@nongnu.org
References: <20220305000624.1498181-1-dilfridge@gentoo.org>
 <20220314213355.2477-1-dilfridge@gentoo.org>
 <20220314213355.2477-2-dilfridge@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220314213355.2477-2-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/3/22 22:33, Andreas K. Hüttel wrote:
> With the command line flag -mplt and a recent toolchain, ELF binaries
> generated by gcc can obtain EI_ABIVERSION=1, see below, which makes, e.g.,
> gcc three-stage bootstrap in a mips-unknown-linux-gnu qemu-user chroot
> fail since the binfmt-misc magic does not match anymore.
> 
> qemu executes these binaries just fine, so relax the mask slightly.
> 
> CHOST=mips-unknown-linux-gnu (and also mipsel-unknown-linux-gnu)
> CFLAGS="-O2 -march=mips32 -mabi=32 -mplt -pipe"
> gcc-11.2, binutils-2.37, glibc-2.34
> 
> |  /*
> | - * ELF dump of './prev-gcc/build/gengenrtl'
> | - *     29608 (0x73A8) bytes
> | + * ELF dump of './gcc/build/gengenrtl'
> | + *     54532 (0xD504) bytes
> |   */
> |
> |  Elf32_Dyn dumpedelf_dyn_0[];
> |  struct {
> |         Elf32_Ehdr ehdr;
> |         Elf32_Phdr phdrs[12];
> | -       Elf32_Shdr shdrs[33];
> | +       Elf32_Shdr shdrs[44];
> |         Elf32_Dyn *dyns;
> |  } dumpedelf_0 = {
> |
> |  .ehdr = {
> |         .e_ident = { /* (EI_NIDENT bytes) */
> |                 /* [0] EI_MAG:        */ 0x7F,'E','L','F',
> |                 /* [4] EI_CLASS:      */ 1 , /* (ELFCLASS32) */
> |                 /* [5] EI_DATA:       */ 2 , /* (ELFDATA2MSB) */
> |                 /* [6] EI_VERSION:    */ 1 , /* (EV_CURRENT) */
> |                 /* [7] EI_OSABI:      */ 0 , /* (ELFOSABI_NONE) */
> | -               /* [8] EI_ABIVERSION: */ 0 ,
> | +               /* [8] EI_ABIVERSION: */ 1 ,
> |                 /* [9-15] EI_PAD:     */ 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0,
> |         },
> |         .e_type      = 2          , /* (ET_EXEC) */
> |         .e_machine   = 8          , /* (EM_MIPS) */
> |         .e_version   = 1          , /* (EV_CURRENT) */
> | (...)
> 
> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
>   scripts/qemu-binfmt-conf.sh | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
> index e9bfeb94d3..fc2f856800 100755
> --- a/scripts/qemu-binfmt-conf.sh
> +++ b/scripts/qemu-binfmt-conf.sh
> @@ -61,11 +61,11 @@ m68k_family=m68k
>   # FIXME: We could use the other endianness on a MIPS host.
>   
>   mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'
> -mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
> +mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff'
>   mips_family=mips
>   
>   mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00'
> -mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
> +mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff'
>   mipsel_family=mips
>   
>   mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08'

It seems this series got lost because you posted iterations as reply to
v1, so v2/v3 ended burried in the thread. Could you repost as v4 in a
new thread?

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Laurent, what do you think about getting this patch for 7.0?

Thanks,

Phil.

