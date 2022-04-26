Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8EE50FB2A
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 12:41:42 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njIdZ-0003rS-DK
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 06:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIYj-0001DN-4H; Tue, 26 Apr 2022 06:36:41 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1njIYh-0008LN-B8; Tue, 26 Apr 2022 06:36:40 -0400
Received: from [192.168.100.1] ([82.142.9.138]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MCska-1naX713hEe-008ugp; Tue, 26 Apr 2022 12:36:24 +0200
Message-ID: <739db399-e95a-ea02-6c2a-d353e1236171@vivier.eu>
Date: Tue, 26 Apr 2022 12:36:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH for-7.1] target/mips: Remove stale TODO file
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20220412113824.297108-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220412113824.297108-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+ZPqBOn9W4bbBl2Fq/yyIabaxcXes/R1mcWiTt38jYkDFot7UgF
 nqZPTs8aTG6gn53oMLq5j1JCSiYYbuiHLH3dMmXqDknkMmOaR62SUPz1ifDZbQ9Vz3yEiMK
 cjjUhdjxsiKfr55HftKDloXeC+kzjjqkZEX5N+XeJxBg9hgI0+tKhvxJr+0lWuJf01ZXIyf
 NcVvsQjFxEESuI/Gs1dQg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AjAYF6x+aiU=:tGrVMVTw7qNwxVPFuSi/9p
 +cG2eSEtXFIaEAiUWxwH6R3pH/+W6ZGRSKgLnEDKMPE+CsyyOMqMc8kExvbBspajAFARdjmD5
 Hh8af/N97wU1mYRlKge9cihsFT3FiWFasNr2dP4tRWlw3VC5xdXZ1jx6pFwNx0/mNnRhn8Qor
 zx7QhuOx+NX7gVDMvpnP+/7acdAlf8nGHF0+kL+/UJSHfFbG2LJPRS4D9ch/KQy7hjE28Ef2J
 mAy8XFIt4WxUykXrjAzfBIselszfBuOZQwgJ+Ebcd3wRo3Lkkoh7XE9Txdg6jYktNrhYPCXy0
 uCwAsQn5LhJihYnHxEaGHgRfSjzCI5pWMMkw3HcY5iPoLPAz8EGj0LD7/sDN1uq8ZAQCOkIsQ
 NyZk9TB023++oky0LcoZUpuZeDunDPGpySbaCVO2x/hvtzG+kGaHbN+myG6IiJMIgutSqyF/5
 irdvqGRIS6CG1S4i7yzA1Ec7LyM6m8xczMU5tIyPpseQCfEU2ixPEsCGuZGIAdYwEWwUbLeFT
 eCUfR8Ts9HDlWKSnMTayrhmFGTTlI/WQRBFhp38V4zLFAWNSdsT8FaczKdgBv+AraPQ6HcLhL
 fBXalQXX3ZsU60H1B8hA67d2aOj5YP5nMPeUnJ333V2JFQmixDnc4/MtSZzQtqiWOpuxlVQuW
 QiEH+EiNGkxUJyucCSjuLwJSlp8OjZIF96B1EiPEk0T/whtWeUKYrpKPfIvx7zHdb+vg=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 12/04/2022 à 13:38, Thomas Huth a écrit :
> The last change to this file has been done in 2012, so it
> seems like this is not really used anymore, and the content
> is likely very out of date now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/mips/TODO | 51 ------------------------------------------------
>   1 file changed, 51 deletions(-)
>   delete mode 100644 target/mips/TODO
> 
> diff --git a/target/mips/TODO b/target/mips/TODO
> deleted file mode 100644
> index 1d782d8027..0000000000
> --- a/target/mips/TODO
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -Unsolved issues/bugs in the mips/mipsel backend
> ------------------------------------------------
> -
> -General
> --------
> -- Unimplemented ASEs:
> -  - MDMX
> -  - SmartMIPS
> -  - microMIPS DSP r1 & r2 encodings
> -- MT ASE only partially implemented and not functional
> -- Shadow register support only partially implemented,
> -  lacks set switching on interrupt/exception.
> -- 34K ITC not implemented.
> -- A general lack of documentation, especially for technical internals.
> -  Existing documentation is x86-centric.
> -- Reverse endianness bit not implemented
> -- The TLB emulation is very inefficient:
> -  QEMU's softmmu implements a x86-style MMU, with separate entries
> -  for read/write/execute, a TLB index which is just a modulo of the
> -  virtual address, and a set of TLBs for each user/kernel/supervisor
> -  MMU mode.
> -  MIPS has a single entry for read/write/execute and only one MMU mode.
> -  But it is fully associative with randomized entry indices, and uses
> -  up to 256 ASID tags as additional matching criterion (which roughly
> -  equates to 256 MMU modes). It also has a global flag which causes
> -  entries to match regardless of ASID.
> -  To cope with these differences, QEMU currently flushes the TLB at
> -  each ASID change. Using the MMU modes to implement ASIDs hinges on
> -  implementing the global bit efficiently.
> -- save/restore of the CPU state is not implemented (see machine.c).
> -
> -MIPS64
> -------
> -- Userland emulation (both n32 and n64) not functional.
> -
> -"Generic" 4Kc system emulation
> -------------------------------
> -- Doesn't correspond to any real hardware. Should be removed some day,
> -  U-Boot is the last remaining user.
> -
> -PICA 61 system emulation
> -------------------------
> -- No framebuffer support yet.
> -
> -MALTA system emulation
> -----------------------
> -- We fake firmware support instead of doing the real thing
> -- Real firmware (YAMON) falls over when trying to init RAM, presumably
> -  due to lacking system controller emulation.
> -- Bonito system controller not implemented
> -- MSC1 system controller not implemented

Applied to my trivial-patches branch.

Thanks,
Laurent


