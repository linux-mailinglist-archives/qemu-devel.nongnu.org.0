Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8054EE1BC
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:31:42 +0200 (CEST)
Received: from localhost ([::1]:43042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0WD-00086B-V6
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:31:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0UU-00066D-Bu; Thu, 31 Mar 2022 15:29:54 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:48759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0US-0008JS-BL; Thu, 31 Mar 2022 15:29:54 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MJEMt-1nKPZc2yMN-00KfLi; Thu, 31 Mar 2022 21:29:35 +0200
Message-ID: <6f149cc9-9946-c4c4-7310-ca8168a781af@vivier.eu>
Date: Thu, 31 Mar 2022 21:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/sh4: Remove old README.sh4 file
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220329151955.472306-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220329151955.472306-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:jJ0W2hrROYDL6JzRxfhSAaUq75ZYHXTgEHXerH9X2TvC7Ye2sH/
 of9l2W0VVk4kzElInXa8T467QIbWVwcuLvYQZ+1oPL7h3qEK9S8ogvfaLlF/R8Kl/WF90H/
 ir7xMKeDl1fsnNAAhc//A9vBD+7E/S+7tmzPxm6D9CW+lmjYRWasg3leNu/XMHN4hzCUVkc
 OZXeLQ3qnrZme4xWA6WwQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:funR6D2YmYU=:Ow+rijRHYJrCMQHvtWl7u3
 tmdEt7ZfK/o3dzB4QSzxjj2FXdYgra+OtMYPSohpZnLeXEPXTXVkeD6m1aAJN/ec24vfY21WZ
 leXUv3UCZShUTB50OZG9weg+0+C/8ee5Arepl4NAjGVd3GIz6fRx9XvnUg5LgQ7Os2wlYaAZo
 9t8QCMYHVg04Qd9uOf5hchSUVsMVg0ADlF2phst8XmCWuTk0mqQtcjNkFel/QriRACLTQFAc1
 qTkdB4nGejn3O5k0C3KO9cayQSnN2wGFwbQiIrDeSrJsKRiI+Ls2/0HYaJ3gB9UFD7nsX+IiR
 A3UYAm2fr5nbGrwaC0kVUK84aLIabargPFCHnOmGeMhJ1RzMV5/VbwrXGBIMzlTGtZryiDFFr
 R5stYBw7Imf3nm9M9ZXhnH9VW0F5Di1iioSxeMMuYvxV3sZgR5D2CVL6ATfi3hw5aImI98EQt
 6iC7UmbtoOFOBXMk49G2NOETHmK+59EJK6YC8Tg79soxSY+8hBamtCbAgZYAaRw3nBNiWWeJK
 tQzJrHP39bwLWktP4pUFKfL55+ix6LNVSe7XAp+wNse2FAPRkrdSdypcdU/lnOUxN2ZZwAxpP
 fUkKTyIsZEkM5b/TU2lkksDMeyUOVfLdw5fqs4TG52jIlVPAzPAGR9A2um9l8dFEKuwiXQiMw
 KjTc/S5l7LMP7aTbwXuL6Xo8mKpSgxzzpBUEYzbA62Odbzq0cGM6GF1BSaujKbpbfHv0=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 29/03/2022 à 17:19, Thomas Huth a écrit :
> This file didn't have any non-trivial update since it was initially
> added in 2006, and looking at the content, it seems incredibly outdated,
> saying e.g. "The sh4 target is not ready at all yet for integration in
> qemu" or "A sh4 user-mode has also somewhat started but will be worked
> on afterwards"... Sounds like nobody is interested in this README file
> anymore, so let's simply remove it now.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   target/sh4/README.sh4 | 150 ------------------------------------------
>   1 file changed, 150 deletions(-)
>   delete mode 100644 target/sh4/README.sh4
> 
> diff --git a/target/sh4/README.sh4 b/target/sh4/README.sh4
> deleted file mode 100644
> index a192ca7540..0000000000
> --- a/target/sh4/README.sh4
> +++ /dev/null
> @@ -1,150 +0,0 @@
> -qemu target:   sh4
> -author:        Samuel Tardieu <sam@rfc1149.net>
> -last modified: Tue Dec  6 07:22:44 CET 2005
> -
> -The sh4 target is not ready at all yet for integration in qemu. This
> -file describes the current state of implementation.
> -
> -Most places requiring attention and/or modification can be detected by
> -looking for "XXXXX" or "abort()".
> -
> -The sh4 core is located in target/sh4/*, while the 7750 peripheral
> -features (IO ports for example) are located in hw/sh7750.[ch]. The
> -main board description is in hw/shix.c, and the NAND flash in
> -hw/tc58128.[ch].
> -
> -All the shortcomings indicated here will eventually be resolved. This
> -is a work in progress. Features are added in a semi-random order: if a
> -point is blocking to progress on booting the Linux kernel for the shix
> -board, it is addressed first; if feedback is necessary and no progress
> -can be made on blocking points until it is received, a random feature
> -is worked on.
> -
> -Goals
> ------
> -
> -The primary model being worked on is the soft MMU target to be able to
> -emulate the Shix 2.0 board by Alexis Polti, described at
> -https://web.archive.org/web/20070917001736/http://perso.enst.fr/~polti/realisations/shix20/
> -
> -Ultimately, qemu will be coupled with a system C or a verilog
> -simulator to simulate the whole board functionalities.
> -
> -A sh4 user-mode has also somewhat started but will be worked on
> -afterwards. The goal is to automate tests for GNAT (GNU Ada) compiler
> -that I ported recently to the sh4-linux target.
> -
> -Registers
> ----------
> -
> -16 general purpose registers are available at any time. The first 8
> -registers are banked and the non-directly visible ones can be accessed
> -by privileged instructions. In qemu, we define 24 general purpose
> -registers and the code generation use either [0-7]+[8-15] or
> -[16-23]+[8-15] depending on the MD and RB flags in the sr
> -configuration register.
> -
> -Instructions
> -------------
> -
> -Most sh4 instructions have been implemented. The missing ones at this
> -time are:
> -  - FPU related instructions
> -  - LDTLB to load a new MMU entry
> -  - SLEEP to put the processor in sleep mode
> -
> -Most instructions could be optimized a lot. This will be worked on
> -after the current model is fully functional unless debugging
> -convenience requires that it is done early.
> -
> -Many instructions did not have a chance to be tested yet. The plan is
> -to implement unit and regression testing of those in the future.
> -
> -MMU
> ----
> -
> -The MMU is implemented in the sh4 core. MMU management has not been
> -tested at all yet. In the sh7750, it can be manipulated through memory
> -mapped registers and this part has not yet been implemented.
> -
> -Exceptions
> -----------
> -
> -Exceptions are implemented as described in the sh4 reference manual
> -but have not been tested yet. They do not use qemu EXCP_ features
> -yet.
> -
> -IRQ
> ----
> -
> -IRQ are not implemented yet.
> -
> -Peripheral features
> --------------------
> -
> -  + Serial ports
> -
> -Configuration and use of the first serial port (SCI) without
> -interrupts is supported. Input has not yet been tested.
> -
> -Configuration of the second serial port (SCIF) is supported. FIFO
> -handling infrastructure has been started but is not completed yet.
> -
> -  + GPIO ports
> -
> -GPIO ports have been implemented. A registration function allows
> -external modules to register interest in some port changes (see
> -hw/tc58128.[ch] for an example) and will be called back. Interrupt
> -generation is not yet supported but some infrastructure is in place
> -for this purpose. Note that in the current model a peripheral module
> -cannot directly simulate a H->L->H input port transition and have an
> -interrupt generated on the low level.
> -
> -  + TC58128 NAND flash
> -
> -TC58128 NAND flash is partially implemented through GPIO ports. It
> -supports reading from flash.
> -
> -GDB
> ----
> -
> -GDB remote target support has been implemented and lightly tested.
> -
> -Files
> ------
> -
> -File names are hardcoded at this time. The bootloader must be stored in
> -shix_bios.bin in the current directory. The initial Linux image must
> -be stored in shix_linux_nand.bin in the current directory in NAND
> -format. Test files can be obtained from
> -http://perso.enst.fr/~polti/robot/ as well as the various datasheets I
> -use.
> -
> -qemu disk parameter on the command line is unused. You can supply any
> -existing image and it will be ignored. As the goal is to simulate an
> -embedded target, it is not clear how this parameter will be handled in
> -the future.
> -
> -To build an ELF kernel image from the NAND image, 16 bytes have to be
> -stripped off the end of every 528 bytes, keeping only 512 of them. The
> -following Python code snippet does it:
> -
> -#! /usr/bin/python
> -
> -def denand (infd, outfd):
> -    while True:
> -        d = infd.read (528)
> -        if not d: return
> -        outfd.write (d[:512])
> -
> -if __name__ == '__main__':
> -    import sys
> -    denand (open (sys.argv[1], 'rb'),
> -            open (sys.argv[2], 'wb'))
> -
> -Style isssues
> --------------
> -
> -There is currently a mix between my style (space before opening
> -parenthesis) and qemu style. This will be resolved before final
> -integration is proposed.

Applied to my trivial-patches branch.

Thanks,
Laurent


