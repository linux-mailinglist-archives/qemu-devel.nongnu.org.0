Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F227C4E1E1E
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 23:10:49 +0100 (CET)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nW3lB-0002Cy-3r
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 18:10:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3jO-0000vM-0Z
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:08:58 -0400
Received: from [2a00:1450:4864:20::429] (port=33703
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nW3jM-0005IX-CH
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 18:08:57 -0400
Received: by mail-wr1-x429.google.com with SMTP id q8so7121374wrc.0
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 15:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=DByvY6ORMPldl5SLlDjbfVRV32v77jXuUcp4lm4oIH8=;
 b=i3pdpHwPznsMtulb4u9Xl+x+Nln8+eodjPRduAMcu/04A45TZnin/XTxhOitffuLiK
 ANBOSehtsMwH5Seio4fDUTLSr9fCSDLVhutxvUAWcGwVh1limqbonz3QhMldgpPpJyRo
 m84BPvkrcYfsXMAXSuUbYQtnsHF/H1CP7HOJP4O1ych3ajxwKJj9Ru6HIcazhRO27Xuv
 P0WOLHvZ9owlqnR+BP3dqG81zEerzrLaCHT+7S2qaQCW9iZjzQdIPxliCgAI02UF/4a6
 9/8VydpTuuBVZ3DXBplRaWUyKTGmtMGRlxeIxLigHtofyf32WWwS1pKSy83FR5vLmgXZ
 EI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DByvY6ORMPldl5SLlDjbfVRV32v77jXuUcp4lm4oIH8=;
 b=pt4Y4iONTkzaGRz/MCWEBLyXTki74YcgF7nSyOCZxfVYY+WZxyQDz62Vy77sgG4Y/0
 VCQoxHH3PRjo4FTk9/xmvo5sSuIIzTWjhxR4EzNaVdEKSHrEWOKofztaS7By9o9ANR+5
 rCbhMc3Hc5EadKsfxYQEO6QqLcu1VaUdYq+ThRNHJaAAPhy0KxbTsIwp+pqJMeMUPVjr
 TTNqocG5M22ipcpAT6LgnesP3LhAob/gk0hwgxfiiBdL4VTwy0jv5wL63xiD1sPYqUpy
 a+yR8nZx9vbwgJP2ODJPmF/ZPAmM0IUmSdww5eRx5BR2+BO0efkkIB/AGU08sSQrLzBl
 hr7A==
X-Gm-Message-State: AOAM5312cG9S3ICNtW0H0Z0WMFll2nsyKieWJBG6TXTj2CvpZqIhCovH
 nkaTezlOcJuJT192XfpdYDU=
X-Google-Smtp-Source: ABdhPJx7Y8JMc3rO6FCDBBSDZbA4C7bcDnTRTMV8Z0f0K6MJqJw1yVcHCha9H056Z+mYUOFyBIhenQ==
X-Received: by 2002:a05:6000:1184:b0:203:ff46:1d72 with SMTP id
 g4-20020a056000118400b00203ff461d72mr7471726wrx.165.1647814134876; 
 Sun, 20 Mar 2022 15:08:54 -0700 (PDT)
Received: from [192.168.1.34] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71]) by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c19d100b0038c75ea4902sm11204121wmq.27.2022.03.20.15.08.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Mar 2022 15:08:54 -0700 (PDT)
Message-ID: <c86aa778-4423-bef4-3303-2c62568cd9d4@gmail.com>
Date: Sun, 20 Mar 2022 23:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.0] linux-user: Fix syscall parameter handling for
 MIPS n32
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
References: <20220320052259.1610883-1-xen0n@gentoo.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220320052259.1610883-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
Cc: =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/3/22 06:22, WANG Xuerui wrote:
> The MIPS n32 ABI is basically n64 with the address space (i.e. pointer
> width) shrinked to 32 bits. Meanwhile the current code treats it as
> o32-like based on TARGET_ABI_BITS, which causes problems with n32
> syscalls utilizing 64-bit offsets, like pread64, affecting most (if not
> all) recently built n32 binaries.
> 
> This partially solves issue #909 ("qemu-mipsn32(el) user mode emulator
> fails to execute any recently built n32 binaries"); with this change
> applied, the built qemu-mipsn32el is able to progress beyond the
> pread64, and finish _dl_start_user for the "getting ld.so load libc.so"
> case. The program later dies with SIGBUS, though, due to _dl_start_user
> not maintaining stack alignment after removing ld.so itself from argv,
> and qemu-user starting to enforce alignment recently, but that is
> orthogonal to the issue here; the more common case of chrooting is
> working, verified with my own-built Gentoo n32 sysroot. (Depending on
> the exact ISA used, one may have to explicitly specify QEMU_CPU, which
> is the case for my chroot.)
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/909

Very nice analysis there!

"Buglink" doesn't seem to match GitLab autoclose regexp:
https://docs.gitlab.com/ee/administration/issue_closing_pattern.html#change-the-issue-closing-pattern

> Signed-off-by: WANG Xuerui <xen0n@gentoo.org>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Cc: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
> 
> P.S. This patch is done with my Gentoo hat on, so I'm not using my
> usual xen0n.name address. I'd like to add a mailmap entry for correct
> shortlog display though, but it seems there's no category for "merely
> preference" mappings yet. What should I do in this case?

The last section seems to match your case:

   # Also list preferred name forms where people have changed their
   # git author config, or had utf8/latin1 encoding issues.

>   linux-user/user-internals.h | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

