Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BCF4CEED7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 00:56:13 +0100 (CET)
Received: from localhost ([::1]:49748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR0jU-0005rC-M1
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 18:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0iF-0005Az-RS
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:54:55 -0500
Received: from [2a00:1450:4864:20::32b] (port=37771
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nR0iE-0004Uo-8I
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 18:54:55 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so9854213wmj.2
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 15:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=qe7Ga+z25p9VxXOvwD4mTjO5lfLWJw9o5XsqHitXpKs=;
 b=IaYkePIdorj6z8Mt+dQ6Ddfs5TvtO301yrbIQ+9YNcXl6WWNn2ECRz917yq4RT4h4r
 M8xiPynle2L8Q0DQF0O8Zj8agXH0TzDd7EPNx2/Lf+yo6dhKRbZeeteuNrRyl5oNSsDN
 nUhOca1aki7V8tJkqADcW9lFJ9okCDbUVSA7g74Xe1ps2TG1lYssRndWy0jcecSwjn7O
 c/BPyWBPVGCXQN82Kt5W0c876mEYoXiPzqvWgDywvmnO9SeAa5GAFxgHYkP2E8ZRQN7P
 TOXgB7ZldevHSDSfbDAS1nFDr2Ko43QdUk1CETtsFrr3VHuRcmWDauHWfBNYEaiFZQlV
 iUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=qe7Ga+z25p9VxXOvwD4mTjO5lfLWJw9o5XsqHitXpKs=;
 b=GsbfDN66ApKJ5PtXka5+HwnymM4J1riN3r1al5z0IzCyBFrPOXEZwY2wf/vZoNWefF
 u/d4JI8gTQA2zck9OlbHIF/h94UbYwaxHhvOsNYGkFhi+4J39v0nL22TSNRsSKVokt27
 rZAEZTGjTzZ/vHgwP4gYPrLbizYLQp3yngI16rhOZIk3Ql66uaxGaXMq3T9WTcIU1aYl
 PV9JOIVYsZ0W8523tyWg/9ST6F++1zmusFDaiVHXkmN5sDgYabGOF5zP/iC/Prhum/ZI
 tDmD6hCILCHmlxwLJojmxOFeu8aXe1DaFYClCWg4GOYytWpx+I+OStQWUNNgz+o/IzFi
 t4Ow==
X-Gm-Message-State: AOAM533sISJbw2EIMu/ytvm4lRB7+sMeCU/YzC7YpjI9qJApYyCisE3+
 XkneVPOO09sOuU0tLZ5InaU=
X-Google-Smtp-Source: ABdhPJwaKQjczUYWtyujGWyHV6M5XmkxOCx5yMnKyNvC1YEqlTA9lcwcOVcgvO1GdD473BJOYn3P1Q==
X-Received: by 2002:a05:600c:1e85:b0:381:2d3f:d620 with SMTP id
 be5-20020a05600c1e8500b003812d3fd620mr7028477wmb.11.1646610886293; 
 Sun, 06 Mar 2022 15:54:46 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 v8-20020a1cf708000000b0034d7b5f2da0sm11417408wmh.33.2022.03.06.15.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 15:54:45 -0800 (PST)
Message-ID: <28ad3f08-6b08-1a92-a71b-4019e4c662a1@gmail.com>
Date: Mon, 7 Mar 2022 00:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2] qemu-binfmt-conf.sh: allow elf EI_ABIVERSION=1 for mips
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 qemu-devel@nongnu.org
References: <20220303101750.55833-1-dilfridge@gentoo.org>
 <20220305000624.1498181-1-dilfridge@gentoo.org>
 <b54bb834-84e9-6342-ecac-643cbd11549b@gmail.com>
In-Reply-To: <b54bb834-84e9-6342-ecac-643cbd11549b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Cc'ing Richard)

On 5/3/22 01:18, Philippe Mathieu-Daudé wrote:
> Cc'ing Laurent:
> 
> $ ./scripts/get_maintainer.pl -f scripts/qemu-binfmt-conf.sh
> Laurent Vivier <laurent@vivier.eu> (maintainer:Linux user)
> qemu-devel@nongnu.org (open list:All patches CC here)
> 
> On 5/3/22 01:06, Andreas K. Hüttel wrote:
>> With the command line flag -mplt and a recent toolchain, ELF binaries
>> generated by gcc can obtain EI_ABIVERSION=1, see below, which makes, 
>> e.g.,
>> gcc three-stage bootstrap in a mips-unknown-linux-gnu qemu-user chroot
>> fail since the binfmt-misc magic does not match anymore.
>>
>> qemu executes these binaries just fine, so relax the mask slightly.
>>
>> CHOST=mips-unknown-linux-gnu (and also mipsel-unknown-linux-gnu)
>> CFLAGS="-O2 -march=mips32 -mabi=32 -mplt -pipe"
>> gcc-11.2, binutils-2.37, glibc-2.34
>>
>> |  /*
>> | - * ELF dump of './prev-gcc/build/gengenrtl'
>> | - *     29608 (0x73A8) bytes
>> | + * ELF dump of './gcc/build/gengenrtl'
>> | + *     54532 (0xD504) bytes
>> |   */
>> |
>> |  Elf32_Dyn dumpedelf_dyn_0[];
>> |  struct {
>> |         Elf32_Ehdr ehdr;
>> |         Elf32_Phdr phdrs[12];
>> | -       Elf32_Shdr shdrs[33];
>> | +       Elf32_Shdr shdrs[44];
>> |         Elf32_Dyn *dyns;
>> |  } dumpedelf_0 = {
>> |
>> |  .ehdr = {
>> |         .e_ident = { /* (EI_NIDENT bytes) */
>> |                 /* [0] EI_MAG:        */ 0x7F,'E','L','F',
>> |                 /* [4] EI_CLASS:      */ 1 , /* (ELFCLASS32) */
>> |                 /* [5] EI_DATA:       */ 2 , /* (ELFDATA2MSB) */
>> |                 /* [6] EI_VERSION:    */ 1 , /* (EV_CURRENT) */
>> |                 /* [7] EI_OSABI:      */ 0 , /* (ELFOSABI_NONE) */
>> | -               /* [8] EI_ABIVERSION: */ 0 ,
>> | +               /* [8] EI_ABIVERSION: */ 1 ,
>> |                 /* [9-15] EI_PAD:     */ 0x0, 0x0, 0x0, 0x0, 0x0, 
>> 0x0, 0x0,
>> |         },
>> |         .e_type      = 2          , /* (ET_EXEC) */
>> |         .e_machine   = 8          , /* (EM_MIPS) */
>> |         .e_version   = 1          , /* (EV_CURRENT) */
>> | (...)
>>
>> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
>> ---
>>
>> v2: Add the same fix for little endian as for big endian
>>
>>   scripts/qemu-binfmt-conf.sh | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
>> index e9bfeb94d3..fc2f856800 100755
>> --- a/scripts/qemu-binfmt-conf.sh
>> +++ b/scripts/qemu-binfmt-conf.sh
>> @@ -61,11 +61,11 @@ m68k_family=m68k
>>   # FIXME: We could use the other endianness on a MIPS host.
>>   
>> mips_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08' 
>>
>> -mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff' 
>>
>> +mips_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff' 
>>
>>   mips_family=mips
>>   
>> mipsel_magic='\x7fELF\x01\x01\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08\x00' 
>>
>> -mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xff\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff' 
>>
>> +mipsel_mask='\xff\xff\xff\xff\xff\xff\xff\x00\xfe\xff\xff\xff\xff\xff\xff\xff\xfe\xff\xff\xff' 
>>
>>   mipsel_family=mips
>>   
>> mipsn32_magic='\x7fELF\x01\x02\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x08' 
>>
> 


