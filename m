Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0C23397F5
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 21:06:28 +0100 (CET)
Received: from localhost ([::1]:43318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKo3G-0003oX-S3
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 15:06:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <macro@orcam.me.uk>) id 1lKo1S-0007fb-TX
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:04:34 -0500
Received: from angie.orcam.me.uk ([2001:4190:8020::4]:40434)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <macro@orcam.me.uk>) id 1lKo1Q-0003PD-Ej
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 15:04:34 -0500
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 49EB192009D; Fri, 12 Mar 2021 21:04:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 44C2B92009B;
 Fri, 12 Mar 2021 21:04:28 +0100 (CET)
Date: Fri, 12 Mar 2021 21:04:28 +0100 (CET)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
In-Reply-To: <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
Message-ID: <alpine.DEB.2.21.2103122053200.33195@angie.orcam.me.uk>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
 <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
 <21217ef4-91d8-6877-5d78-bb78e00773d8@amsat.org>
 <alpine.DEB.2.21.2103121741460.33195@angie.orcam.me.uk>
 <d0401476-0b3c-d7ce-8d0f-aa9b348da4fe@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Received-SPF: none client-ip=2001:4190:8020::4; envelope-from=macro@orcam.me.uk;
 helo=angie.orcam.me.uk
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 12 Mar 2021, Philippe Mathieu-Daudé wrote:

> > but your two options to 
> > choose from are:
> > 
> > 1. Build for the soft-float ABI (`-msoft-float') where any FP calculations 
> >    are compiled such as to be made by the CPU using integer arithmetic.
> 
> With the Debian toolchain I get:
> 
> /usr/include/stdio.h:27:10: fatal error: bits/libc-header-start.h: No
> such file or directory
>  #include <bits/libc-header-start.h>
>           ^~~~~~~~~~~~~~~~~~~~~~~~~~

 You need to have a soft-float multilib available.  You can use:

$ gcc -print-multi-lib

to see what multilibs are available.  You'd have to have one that includes 
`-msoft-float' and `-mabi=n32' both at a time.  If there's no such one, 
then you'll have to build your own cross-compiler (including soft-float 
libc).

> > 2. Build for a generic MIPS ISA, for the R5900/n32 that would be MIPS III
> >    (`-march=mips3'), and rely on the kernel FPU emulation.
> 
> Shouldn't -march=r5900 imply -march=mips3?

 It does:

MIPS_CPU ("r5900", PROCESSOR_R5900, 3, 0)

however it is a distinct architecture owing to the differences from plain 
MIPS III ISA, and obviously the compiler and the assembler both know that.

  Maciej

