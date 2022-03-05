Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEFD4CE166
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:20:23 +0100 (CET)
Received: from localhost ([::1]:56256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQI9m-0006kB-G9
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:20:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI8H-0005jU-5Q
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 19:18:49 -0500
Received: from [2607:f8b0:4864:20::535] (port=39630
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQI8F-0006a7-Jw
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 19:18:48 -0500
Received: by mail-pg1-x535.google.com with SMTP id 195so8791635pgc.6
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 16:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:cc:from:in-reply-to:content-transfer-encoding;
 bh=p8BD7qnJVzyyy685ob7KbC0oNpjbNSJsED9T5ntBgnA=;
 b=OL1jRcxBpEpaNr2rJLk+9h5sf72GfhwgtKRaRd6xgus8ZySyUqfLPN9lkQHs8yBaoU
 Z1eDIscBftAsBQytLHIqJToH3BBLOirmwQ2/yWPzFRS5W+0+XYOJ8Xc30QMVgYlmJ+Xs
 82nxgwUewUpXwnic3SKcic6FJkrp+bcrm9QwCdTj2+TGDIKnMCwV5KDwB8yvl9z3glR8
 /CZy4b7trASt8DPfccmysYeqa1U0SqsMbx8pm1jxreSrqGiKH5cRBo0PhdfVXRnFFrfe
 WQLFnnnpa6eIJhkpLTMOZZLZBQazeZ+4uTYFfMKo531JDVX4od5WIKLs1+gC0OtNv5xX
 d+tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=p8BD7qnJVzyyy685ob7KbC0oNpjbNSJsED9T5ntBgnA=;
 b=xWw4aOAEnYtKl4Js8V3FYa8mAFKUfq9abG7NGNbXDAaPuC4Udj/1x5B3WEnSyVtOLS
 jZUmWUsuYcFkcW73YXyzLf4JwDy1r4flq017NhNSM+6KCtRoNIYySNfsvNwxzO07SQwe
 ZUM2Uxq5V/OCc9e6tlUAvo/pBtxgdSaOf3DDTMKjOt7+8vypv5XofqiXVQchV6yQemfe
 wRUdCduhgFnu/TMPqILi+FBfkczEzTDsKwdVJAUfWBpnpbhmv4KJjeHxai+/guzCamL1
 5or/FmdVPyO67o8ADjmEqSRvnj8ew0gUdXGFNFMYrfVFs3ipMLuJlEP0ansb7DIGu0kU
 CL4Q==
X-Gm-Message-State: AOAM531SIRIW9PLJY2hm6WSd7bsaJ1e2rOiNGX7UyFdKRtRooE69PB7i
 xRO9lhCYOZtfF/wvZzq7XdY=
X-Google-Smtp-Source: ABdhPJxpjUzQkHCAEfKDMjV3Vzv4HyHDA25TeZUfb4tMlg2T5Kv2XDzQk/zeNGUB4WKf3J8Dngh3fw==
X-Received: by 2002:a63:89c6:0:b0:37d:7ff8:6c0 with SMTP id
 v189-20020a6389c6000000b0037d7ff806c0mr751662pgd.196.1646439526174; 
 Fri, 04 Mar 2022 16:18:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bh11-20020a056a00308b00b004f40144cf76sm6304908pfb.142.2022.03.04.16.18.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:18:45 -0800 (PST)
Message-ID: <b54bb834-84e9-6342-ecac-643cbd11549b@gmail.com>
Date: Sat, 5 Mar 2022 01:18:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] qemu-binfmt-conf.sh: allow elf EI_ABIVERSION=1 for mips
Content-Language: en-US
To: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 qemu-devel@nongnu.org
References: <20220303101750.55833-1-dilfridge@gentoo.org>
 <20220305000624.1498181-1-dilfridge@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220305000624.1498181-1-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Laurent:

$ ./scripts/get_maintainer.pl -f scripts/qemu-binfmt-conf.sh
Laurent Vivier <laurent@vivier.eu> (maintainer:Linux user)
qemu-devel@nongnu.org (open list:All patches CC here)

On 5/3/22 01:06, Andreas K. Hüttel wrote:
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
> 
> v2: Add the same fix for little endian as for big endian
> 
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


