Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDBC3A7734
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 08:39:54 +0200 (CEST)
Received: from localhost ([::1]:36300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt2jp-0003mI-LC
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 02:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2iv-00034J-Uc
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:38:57 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:57363)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lt2ip-0002wp-Pk
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 02:38:57 -0400
Received: from [192.168.100.1] ([82.142.19.46]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N3bjH-1lByJO0tGd-010bmT; Tue, 15 Jun 2021 08:38:49 +0200
Subject: Re: [PATCH] linux-user: Remove unnecessary static assert involving
 __SIGRTMAX
To: Michael Forney <mforney@mforney.org>
References: <20210526043928.9586-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <f9c68a31-f619-1233-3d85-09e31c8bb0ec@vivier.eu>
Date: Tue, 15 Jun 2021 08:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210526043928.9586-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Nx+LARjrd58yBglwMTtTsFIw4WszM81U+QIpeCtMSzopSrGen4Z
 lZglVjKIOmPsVN010bPHMvRGH24Fv8uex0nx++JVHucH3v3BjRNTkDA3nNlQXXJSZ9FoiZ0
 NtuQRkMQGccMu+6APUPeQj9iAarNPQ6N4JfQgBBlrUmIVB3I9xJ9KJoqpWvDOkJ/nMj9AQe
 cvk4yHTrVFHVNmsvPirag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7fh8m7wsN88=:9clto6A19xUHIyPm+mVyg/
 NZJo9Gy5sY7ABfQoOoDREVkaygHsRLQOvXG13Xs1tToplU966HIeAY6vqQJ4MKl9WwldxoXSJ
 /b9i+e6BYwGT7Mdc5kfcNx081rVVqO/oIHb3+Y6lAFfBr3MWaNynYkVTVYFPmy83DAQnlbsHd
 d4qtiYPrdNNg0EUixIWur/HjGAktEfGG1w8XMFM5Fj3gmGjaAopbAh32k4sJKOg5ooMxSJoHA
 Jy9jgKnnT1oN1M+MZQtlKLj05yHeREIg0ufT8hYo/vgeqWr+8Ji/1+6g4kEnekuBbx/YcvHT/
 f06Ii4cdBl0sswlSP6kKAzvaC6lR1YdV+lN9eTU286TFpSPagUvg9lbjhdegBW8fEptWY/gM1
 gyvxTblqJgqu103vaMzP8DCclcJ0cD6sPdc+GL8UhFDx2iniuo/tmrB3l4l4VQalZiZYmyB9W
 4DK/xMwINAbSeOKYFajLwNFNCK/zvWpzVrCpdw8JWyZl7aKCAFn3jrMNJsLfI14SdkQ3FjL1E
 wULbDiJqHDD+eSofs/6EnQ=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.489,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 26/05/2021 à 06:39, Michael Forney a écrit :
> Since "linux-user: fix use of SIGRTMIN" (6bc024e7), qemu removed
> use of __SIGRTMAX except for in this QEMU_BUILD_BUG_ON assert.
> Presumably, this check is to ensure that the loop in signal_table_init
> from SIGRTMIN to SIGRTMAX falls within the bounds of
> host_to_target_signal_table (_NSIG).
> 
> However, _NSIG is already defined to be the one larger than the
> largest signal supported by the system (as specified in the upcoming
> POSIX revision[0]), so the check is unnecessary.
> 
> musl libc does not define __SIGRTMAX, so removing this check fixes
> one of the last remaining errors when building qemu.
> 
> [0] https://www.austingroupbugs.net/view.php?id=741
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
> If you prefer, I can send an alternate patch to leave the
> QEMU_BUILD_BUG_ON, but guard it by #ifdef __SIGRTMAX.
> 
>  linux-user/signal.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9016896dcd..6f62f2b528 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -38,7 +38,6 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
>   * Signal number 0 is reserved for use as kill(pid, 0), to test whether
>   * a process exists without sending it a signal.
>   */
> -QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
>  static uint8_t host_to_target_signal_table[_NSIG] = {
>      [SIGHUP] = TARGET_SIGHUP,
>      [SIGINT] = TARGET_SIGINT,
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent



