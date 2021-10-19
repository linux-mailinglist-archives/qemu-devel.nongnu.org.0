Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E804A433066
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 10:04:28 +0200 (CEST)
Received: from localhost ([::1]:43246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mck6m-0005JB-1Y
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 04:04:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjmu-0000VO-8I; Tue, 19 Oct 2021 03:43:56 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:37893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mcjmr-0006dZ-GG; Tue, 19 Oct 2021 03:43:55 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MWhxY-1mEQZ03kFs-00X31z; Tue, 19 Oct 2021 09:43:39 +0200
Subject: Re: [PATCH-for-6.2 0/2] disas/nios2: Simplify endianess conversion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210807110939.95853-1-f4bug@amsat.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <de933f9c-c3df-b5db-1107-15aa3e3c7213@vivier.eu>
Date: Tue, 19 Oct 2021 09:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807110939.95853-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:abHWmoeFV0Aae/u0KhZN6v9gFhzs+7bc2HEdTYxUmIf4bjqyqtk
 ocIlmJcRtcSe3ML2edi2rf24+1RMMhmvXUNlt9eslNgCA9wb1I3OwFJ3uRzp3RfKbbXlt1b
 XNfFC3lFgrmLHl/QP/3OKphaby3Pbny4uXV/tCJF1fg+aAQ7XoqPJDG0hD2NxbsagyHsyaf
 /P3AWgtP0je3MKalEjWAg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7GTKhKgfD6o=:agtrVfo+ngy6M/MdG1s+zk
 4fLGwAU9UKBZ0tTcfz3tBz7do98xAxvc+epUvtGPgWe/sXp6KtcqHDY1+kf4i4cKTZ4rf6tNK
 nbBz5QgGRit5GwIOA4UnC2vOpQMwG9KsbKTOAcfusbuOx0eVe44DfzS3RrVJKDF7EUKJrhClE
 Ja6PbUEAuZZOM6xN3l8ELkuezVDQaJPKUER9p2Zz3XZO1yqtBSpFffXd9MBPxekaS8PEECXMV
 tNMkkD6QD5SKvMKrsNs/2s8j1SGSEG4j5x/So0gQhDDHoG3k/k3vCtuy+nsxso257+XSBUQD5
 OuwC5C8X0wkmtZW+fXPozQlXyjI/ryJOUyGtG84pMI8RGBGuDs2SOqbBRYhYtjgUKlkQzXA9o
 MraIR/I9sXHvVkj0LaoD0W78gZlmAp/jvW3N6F0tlixc1wE5F/U+90W9C+QN4itdBNcFX+h4b
 3z2glSomNxXtKoiDm8rGkZZcHSvM95an5Fo7y0eiKRjHaXK3BToUZzvHV6v6JY/tuw5UjBYTr
 JGY2/r6LnYMVnngchk1G7JiUY5OyhsA5xyo/T+tIEAOfNsX96HWBAgQfnpD++ODN48kFjRaRF
 kbrHqjR7mm3I8FjHWOQf2On3UBiEwO3nJyU90kzYCFolEiPzytlr5nrMkfnscdIPasgVG4wEv
 NUSnHyVCWAO/pLtdc8sqbaL2C9hF+CmdtrJ2Sb5dnWoQEmSTS445DK0jc6EgnE/wfkilq1dEP
 7p/6TMeegrT5WQl+twcwDSVbB10j2OEiHXXQFg==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 07/08/2021 à 13:09, Philippe Mathieu-Daudé a écrit :
> After chatting with Richard Henderson and Paolo Bonzini, we
> concluded the load/store API is mature enough to have target
> code endianess-agnostic.
> Thus we could remove the TARGET_WORDS_BIGENDIAN definition from
> target-specific code (restricting it to the binary format loaders).
> 
> While experimenting, I noticed the Nios2 disassembler is an easy
> win. MIPS will follow shortly.
> 
> Philippe Mathieu-Daudé (2):
>   disas/nios2: Fix style in print_insn_nios2()
>   disas/nios2: Simplify endianess conversion
> 
>  include/disas/dis-asm.h |  3 +-
>  disas/nios2.c           | 71 ++++++++++++++++-------------------------
>  target/nios2/cpu.c      |  6 +---
>  3 files changed, 29 insertions(+), 51 deletions(-)
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

