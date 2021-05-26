Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC739214D
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 22:13:25 +0200 (CEST)
Received: from localhost ([::1]:33974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzu8-0007CO-0K
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 16:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzkI-0002S8-G2
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:03:14 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1llzk5-0000nO-Pk
 for qemu-devel@nongnu.org; Wed, 26 May 2021 16:03:14 -0400
Received: from [192.168.100.1] ([82.142.6.50]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M58vU-1lktoS24Sy-001Ayj; Wed, 26 May 2021 22:02:56 +0200
Subject: Re: [PATCH v2] linux-user: Disable static assert involving __SIGRTMAX
 if it is missing
To: Michael Forney <mforney@mforney.org>
References: <20210526043928.9586-1-mforney@mforney.org>
 <20210526190203.4255-1-mforney@mforney.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <d5d79757-0f16-c540-cdcd-76628c079a41@vivier.eu>
Date: Wed, 26 May 2021 22:02:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526190203.4255-1-mforney@mforney.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RV63fiHC/OYTyLkjWad9RDwvZ0Am8nZ++Favtz/Xd/uJVxsGIk9
 qo+ZduELquJm5d0xn8Fkd+YsvMJ2W3ly9ywoZnSVMQS6tV0weSPiHgLc83f25QY/Q6I/CYo
 DtwoturXcUY20ieoDT25akRzj5h24B6DERyocYw29wCMMVwJ6EU/sWlIu5Vulht/Vzxdk0S
 oqIOGJRzL7pLFQj3Btu6A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QzW2wbHG5QM=:TQUUcnQ8JMraXSvJ59r3/U
 3IHGlw4PJTanqe2HQkxKYRYjV03Xy/uzxpuITvzBRaehpE3p1NqIKTlXdtsSAN4/JA8GY3Bj2
 HqdG5uGfTCgRv8RddTf3K/1GM6YYhpYcsjHAjZQjYWUg4EM7bP2Eh8022M5gyScVu/EzrC8nz
 lxajE94WayGpkIvCsoD2bO/zU9Y0HcTpALlk6T8NkZbK4MTx8pZHWpZgnITl1YEOv21X6oIj9
 i10rqp+vJ97VkQN8ZtPFqpxZQjQHJQe5jhbTSmLbY0tOXiabKe4yHApOzplY8ChcFqY7c48Xt
 HKtzyqZI4OKs8ZIvz8Sfco8mIUZU83aTkwSbBlwBl3jsdc43Z5N6TcD3y2ZwMUJr9EqtDlmzv
 pYngttcxX28c7tjRgnnrIf0K//R2zL3tyXfEn5svsrX3b9m1NArPraFh6oZUhAizp7K8UaIK6
 z2rok+p7ElMBAb4iCH2I58a8/Tu1Ofofub6qiqkDaWjiD3kN3eFKQp28jsHdjm8k47WXyTzYK
 +/Iia8BZpRdSX2WCahEZvM=
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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

Le 26/05/2021 à 21:02, Michael Forney a écrit :
> This check is to ensure that the loop in signal_table_init() from
> SIGRTMIN to SIGRTMAX falls within the bounds of host_to_target_signal_table
> (_NSIG). However, it is not critical, since _NSIG is already defined
> to be the one larger than the largest signal supported by the system
> (as specified in the upcoming POSIX revision[0]).
> 
> musl libc does not define __SIGRTMAX, so disabling this check when
> it is missing fixes one of the last remaining errors when building
> qemu.
> 
> [0] https://www.austingroupbugs.net/view.php?id=741
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
> Changes since v2:
> * Guard check by #ifdef __SIGRTMAX instead of removing it.
> 
>  linux-user/signal.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 9016896dcd..0f19c59dee 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -38,7 +38,9 @@ static void host_signal_handler(int host_signum, siginfo_t *info,
>   * Signal number 0 is reserved for use as kill(pid, 0), to test whether
>   * a process exists without sending it a signal.
>   */
> +#ifdef __SIGRTMAX
>  QEMU_BUILD_BUG_ON(__SIGRTMAX + 1 != _NSIG);
> +#endif
>  static uint8_t host_to_target_signal_table[_NSIG] = {
>      [SIGHUP] = TARGET_SIGHUP,
>      [SIGINT] = TARGET_SIGINT,
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

