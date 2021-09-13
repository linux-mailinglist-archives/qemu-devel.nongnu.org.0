Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D12409E12
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 22:21:16 +0200 (CEST)
Received: from localhost ([::1]:38508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPsS3-0005Qf-Rw
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 16:21:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPsQK-00041j-UG
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:19:28 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPsQI-0007CS-UK
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 16:19:28 -0400
Received: by mail-wm1-x32e.google.com with SMTP id y132so7526904wmc.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 13:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GnZI76rL+4ttaCCO6nfyf2tgY2DsJ++ywsUDkfln4CY=;
 b=l1CcCvk+kPWcTzT3u0S0pjOE8iMWlvA5ZqTgLnXPf5FzVOBuQTOv4naOa0r74tFd62
 KTcp/PJB+UN0xOYFmSBoVm7CKi32gUAnindvNT3Ce5cBIgP7c3WPXoAgTh7kWev8DJ+a
 lG/L7ZjMs/pn3fQTCd1cP3pwcfBGUNJCR8XDvVtmmyLS+09uOn3nXO0WGxFwXi18rYCr
 iuzkOX6LsWME747/WGbuj/hBkGMimstgEaxUFi141C0Z83I5IbsAWpmzBmG82Y0JGKDW
 6cgd2u2RTeHG6M/n09b1dE72TTsGWVvzFon8dKoF2G019rEa58Gh6ON1hmi+aH/aatYQ
 NglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GnZI76rL+4ttaCCO6nfyf2tgY2DsJ++ywsUDkfln4CY=;
 b=vdQW0zVkGr6Cp6AKM3kT3BeJucbFCRcEMIiqdlJtZS3X5woenooXK7cT3Pt9axSXWI
 kpNAT4ujscviBSKx7CyXpJenVQqbERPPt6dmrDW6IcYh5nDLyF1sauD/XVacpFRucuPg
 Jyb6KqZFxk6Mkk/eOmeZSV48LeFQnPA7q7jIlv1hnHgBBENgLF+XsPAVpNtlrf1GteHP
 KkhHYlNdXr97NbZ2vQXtkhmKzWLYIWiCfWn1fwCGtN4RWwmcPMUvLpLusYO0gYZaHCJR
 NeMm7+1RuqCe/FM9I7Tf+3r/lKwH6pvPsDpv4v5UROZ4R0eUigti3GldfVJ9Q9ZPZ0pi
 +GOw==
X-Gm-Message-State: AOAM530CqVFIlZs68XdJFYymET4vOcgCPKj4tvDVCYpAK9wYVf81WH+i
 mmeVmUWqlh0T/ByOvylL4Do=
X-Google-Smtp-Source: ABdhPJynN+RfKQfGxPrWMEvm4ii+OAiXrHUymdmMuc7Uws06FWN1G/yqal1lgcYsC+HvbsqtivEQnA==
X-Received: by 2002:a1c:149:: with SMTP id 70mr12973342wmb.187.1631564365275; 
 Mon, 13 Sep 2021 13:19:25 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id p21sm4464040wmi.30.2021.09.13.13.19.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 13:19:24 -0700 (PDT)
Subject: Re: [qemu-hexagon] Error mapping file: Invalid argument
To: "Waksmanski, Lukasz" <Lukasz.Waksmanski@dolby.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <BY3PR06MB7922F6CE4B3A9CE21294B359E0D99@BY3PR06MB7922.namprd06.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2a203934-a688-f879-17ca-2c59ec40fab0@amsat.org>
Date: Mon, 13 Sep 2021 22:19:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BY3PR06MB7922F6CE4B3A9CE21294B359E0D99@BY3PR06MB7922.namprd06.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
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
Cc: Brian Cain <bcain@quicinc.com>, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Hexagon team.

On 9/13/21 8:38 PM, Waksmanski, Lukasz wrote:
> Hello,
> 
>  
> 
> I’m trying to run Hexagon executables in qemu-hexagon. I’m using
> official stable version v6.1. Here’s my rather simple program:
> 
> ➜  ~ cat test.c
> 
> #include<stdio.h>
> 
> int main()
> 
> {  printf("Hello Hexagon!");
> 
>   return 0;
> 
> }
> 
>  
> 
> I’m using  Hexagon SDK 4.0.2 toolchain:
> 
> ➜  ~ ~/tools/Hexagon4/tools/HEXAGON_Tools/8.4.09/Tools/bin/hexagon-clang
> -mv67 -o test test.c
> 
>  
> 
> Running in qemu produces error somewhere in mmap
> 
> ➜  ~ qemu-hexagon
> ./test                                                                    
> 
> qemu-hexagon: ./test: Error mapping file: Invalid argument
> 
>  
> 
> Am I doing something naively wrong here?
> 
>  
> 
> Here’s  are the some details about the executable
> 
> ➜  ~
> ~/tools/Hexagon4/tools/HEXAGON_Tools/8.4.09/Tools/bin/hexagon-llvm-readelf
> -h ./test   
> 
> ELF Header:
> 
>   Magic:   7f 45 4c 46 01 01 01 00 00 00 00 00 00 00 00 00
> 
>   Class:                             ELF32
> 
>   Data:                              2's complement, little endian
> 
>   Version:                           1 (current)
> 
>   OS/ABI:                            UNIX - System V
> 
>   ABI Version:                       0x0
> 
>   Type:                              EXEC (Executable file)
> 
>   Machine:                           Qualcomm Hexagon
> 
>   Version:                           0x1
> 
>   Entry point address:               0x0
> 
>   Start of program headers:          52 (bytes into file)
> 
>   Start of section headers:          78848 (bytes into file)
> 
>   Flags:                             0x67, V67
> 
>   Size of this header:               52 (bytes)
> 
>   Size of program headers:           32 (bytes)
> 
>   Number of program headers:         3
> 
>   Size of section headers:           40 (bytes)
> 
>   Number of section headers:         16
> 
>   Section header string table index: 13
> 
>  
> 
> Section Headers:
> 
>   [Nr] Name              Type            Address  Off    Size   ES Flg
> Lk Inf Al
> 
>   [ 0]                   NULL            00000000 000000 000000 00     
> 0   0  0
> 
>   [ 1] .start            PROGBITS        00000000 001000 004680 00 WAX 
> 0   0 64
> 
>   [ 2] .init             PROGBITS        00005000 006000 000064 00  AX 
> 0   0 32
> 
>   [ 3] .text             PROGBITS        00006000 007000 005a88 00  AX 
> 0   0 4096
> 
>   [ 4] .fini             PROGBITS        0000baa0 00caa0 000030 00  AX 
> 0   0 32
> 
>   [ 5] .rodata           PROGBITS        0000bad0 00cad0 000678 00   A 
> 0   0  8
> 
>   [ 6] .eh_frame         PROGBITS        0000c160 00d160 000004 00   A 
> 0   0 32
> 
>   [ 7] .data             PROGBITS        0000d000 00e000 000708 00  WA 
> 0   0  8
> 
>   [ 8] .ctors            PROGBITS        0000d708 00e708 000010 00  WA 
> 0   0  4
> 
>   [ 9] .dtors            PROGBITS        0000d718 00e718 000014 00  WA 
> 0   0  4
> 
>   [10] .sdata            PROGBITS        0000e000 00f000 0000a8 00 WAp 
> 0   0 4096
> 
>   [11] .bss              NOBITS          0000e0a8 00f0a8 000e5c 00  WA 
> 0   0  8
> 
>   [12] .comment          PROGBITS        00000000 00f0a8 0000d4 00  MS 
> 0   0  1
> 
>   [13] .shstrtab         STRTAB          00000000 00f17c 00006f 00     
> 0   0  1
> 
>   [14] .symtab           SYMTAB          00000000 00f1ec 0024e0 10    
> 15 248  4
> 
>   [15] .strtab           STRTAB          00000000 0116cc 001d19 00     
> 0   0  1
> 
>  
> 
>  
> 
> Could you tell me where the problem is? Is it because I’m compiling for
> QuRT, and qemu uses is linux-user? Or is something else?
> 
>  
> 
> Best regards,
> 
> *Łukasz Waksmański***
> 
> M +48 668 282 017
> 
> www.dolby.com <http://www.dolby.com/>__ |  Lukasz.Waksmanski@dolby.com
> <mailto:Lukasz.Waksmanski@dolby.com>__
> 
>  
> 


