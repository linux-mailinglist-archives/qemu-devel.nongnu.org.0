Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB05467976
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:32:26 +0100 (CET)
Received: from localhost ([::1]:37144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9bu-0003n3-11
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:32:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt9XU-0006kM-Ov
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:27:52 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:60261)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt9XT-0004vA-4G
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 09:27:52 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M8QBa-1mxZOG1igy-004R4l; Fri, 03 Dec 2021 15:27:48 +0100
Message-ID: <0286cb5b-0aee-be3b-7343-e6c606b1eadc@vivier.eu>
Date: Fri, 3 Dec 2021 15:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-7-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH v2 06/15] target/m68k: Fix address argument for EXCP_CHK
In-Reply-To: <20211202204900.50973-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7tG886MLTkhfQkMyFsPW2VPc/RkrprQVKPxdVfPxNn2JuL38pfR
 Wl7TfRgOAZLl4OSbIRuh2q484Ln9RP7XJa+ZaJoBNBKlCAFekhjgfoSwbsdkCPzm2oo7uJo
 vL3lCUqV225+8PZqTTAn6jPDoCj2G1kVV3kchSV0oDeU3sGwhh+xE6/P72yI8voe8W8h+/v
 cWLFxYWgiy5a2m2s564yg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7PRY0ZNtM0w=:QYVRt4o4ZvQWJjKGfFuNGs
 sdEwcrpLThm5+CX+PvuEslXVrSypKWL+3bQzxRTcQpnWOprkfr+VeKp2AXPGOCA98INDDCFru
 L/tAoJttL0hJcx0cwnTJ8089madGr5ghUT/ggvlsplzltHbP6sgglicRTE0qmdQ8T71YBpJnF
 VzW10qp206MxZ9WCLmK0HlKoYVoN0uYzdEDnwG7+tNQGE9ctd4Zi4oyNxPA1coWWEBbAO/ZFr
 dyjZe6WgOfk8T4pyouOoq9259nRHXgN6scQjnQU+XI/n/mX33Qz1V8ifkg1imsL9GuskjBUkj
 upxNPhfuYtJCiw65iSAuQO00I+xBTP3YIC1jYIGy56rH0GRVPB9RXZKclMR7xp/QLu8IOoGWQ
 s+peYBETaR50vYnKfc+S/uMsaKC58BH7Gx9CwcgWdO4jpIDWO9ZdjVfac7C/aUuEY78jHYhef
 06SeSNyyshQM8lhoPG23gKntTqd5DUBsB5g8qG05KBX7Kq/qvl9H3i1gAv8dUEMs6Av7HWOAm
 o48P5JKXyajvLb8ijzdyN62NGTs1xGJEsJ/9AdzCzI44FyUxwMGFRo1yCQTYwSh4yQfsZnSFU
 Zam01Ww/yc/88xOM3/cjJwen7TX+HUS/LMqDWmexgRFOA+BX3nrJF92vtuTRiu2p33HJ+2z3N
 za26Tpnru4TVpV4lanMn/vMZhmfQP0xHJ+gMwLABOM+Rz33OSeALHUKBvQymYjExrE3M=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/12/2021 à 21:48, Richard Henderson a écrit :
> According to the M68040 Users Manual, section 8.4.3,
> Six word stack frame (format 2), CHK, CHK2 (and others)
> are supposed to record the next insn in PC and the
> address of the trapping instruction in ADDRESS.
> 
> Create a raise_exception_format2 function to centralize recording
> of the trapping pc in mmu.ar, plus advancing to the next insn.

It's weird to use mmu.ar as the field is used for MMU exceptions.

> Update m68k_interrupt_all to pass mmu.ar to do_stack_frame.
> Update cpu_loop to pass mmu.ar to siginfo.si_addr, as the
> kernel does in trap_c().
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/m68k/cpu_loop.c |  2 +-
>   target/m68k/op_helper.c    | 54 ++++++++++++++++++++------------------
>   2 files changed, 30 insertions(+), 26 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

