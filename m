Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4BFF1683
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Nov 2019 14:04:26 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iSKz2-0001Yx-Tn
	for lists+qemu-devel@lfdr.de; Wed, 06 Nov 2019 08:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35371)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iSKw6-0000Lp-5c
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:01:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iSKw1-0007jI-4g
 for qemu-devel@nongnu.org; Wed, 06 Nov 2019 08:01:22 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:57071)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iSKvu-0007by-Ky; Wed, 06 Nov 2019 08:01:10 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPowd-1iEoYF0jND-00Mx6Q; Wed, 06 Nov 2019 14:01:04 +0100
Subject: Re: [PATCH] numa: Add missing \n to error message
To: Greg Kurz <groug@kaod.org>, Eduardo Habkost <ehabkost@redhat.com>
References: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <bb828956-28b3-9fe7-1d57-ceb723a32997@vivier.eu>
Date: Wed, 6 Nov 2019 14:01:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157304440026.351774.14607704217028190097.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f49asRd2rdKLoop1vdsABknx0ts/pAorcyywRcbvvbXnBYOYssx
 /bt0doE4+UovSfXTQZwjFsi2fksdAcvk3J8CmjhZjZD1LSc2eDJA+LjdO6FbASbqyvxCSA5
 v8He9Fps8IkNe9EN/pZ2GyEb8YJcVyM9WQVe+cT5u4DFUp0xQ7/OHPlILFRgat2rljrsO9R
 7zBMhAgit2uSNi83Axp3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zh71xb3d3xU=:36VmWCoG9xzr5hO4SrXwqu
 galuOdu1XSrkwJl2DAi2RS8AV0uEkc59RUM/q+Zxk0S6pG245aaejgnuTlPRa1c8UuSsEDwbX
 B1xIYrbP9kTPRTlyAHJHv6VfefUsbWI7zTDcsmpQPDP4HAGohkFd1yIqkWtMek8qIohSYVPFP
 7VWM2GDw8MCHae290nf5x51NRKsWOq/gzOgVdg6Jk6sLcULCY3GDgGWwWUp+cX3X+nDkHcAnN
 wuG/9IOt6oxGz3s1Cp7NLwRHlmrR2j7gPDKPRWZdk6Vmx/b7azatwZAsixkHx3cEkpVPS5OLJ
 DiHw2uZPPuWkFAvsXY5sQi/+IRjGr8s5hBpE4echkLe9TREfZljKbsKeTzMT2VpnovbY21ppv
 2S7iTnFbAelP7FcijYXs/s8ZwsGFD6xLFlaePl7HYn2fzx+yXokQMX0AyfQNbRwwAJtGOPdmP
 3tBZxve8XmrJDRLCT1t7yKEM4TgNh9zKuEuLHP9sjcIF10JejSxu/6zC93v7vqBaTwchPdhpA
 uD+O3qJBqLMpMeG1pySzdMbn/Yn8L/KUB4UtxWv09YP2oKC5JtDyHjluVP4gei12YAgd1za8D
 jugwnRViEIsQWJdAJer8sQ77N4uRAsch2K4V4IHBYomMUV7VBX1R59UEhkgwn33Pjn7YdhhfV
 udf8qzoUxYtirKYWZ8wfFtgOEeqWip15KQg02rrDwu6n4LHx2Qt4HP1Dc7UqIrh+0kKKHxL8o
 HbHhx9Uc+5Zo/182dpxH4EWNqCAoecYQR6G4PhyUYtWeLlBa9encQu8ulv7P+cFnYU+b3za9y
 kCpDm92i3djYfrzB1y2Bkg77mozmVU78w5lLw65TaW8l+ggx9KZOvSC6EsiwXAGuGU+cgu9Uc
 +iebwEdes7iJGm9Pc6cMhEYEvWPwP43fBzHCNzNmE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: Marcel Apfelbaum <marcel@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 06/11/2019 à 13:46, Greg Kurz a écrit :
> If memory allocation fails when using -mem-path, QEMU is supposed to print
> out a message to indicate that fallback to anonymous RAM is deprecated. This
> is done with error_printf() which does output buffering. As a consequence,
> the message is only printed at the next flush, eg. when quiting QEMU, and
> it also lacks a trailing newline:
> 
> qemu-system-ppc64: unable to map backing store for guest RAM: Cannot allocate memory
> qemu-system-ppc64: warning: falling back to regular RAM allocation
> QEMU 4.1.50 monitor - type 'help' for more information
> (qemu) q
> This is deprecated. Make sure that -mem-path  specified path has sufficient resources to allocate -m specified RAM amountgreg@boss02:~/Work/qemu/qemu-spapr$
> 
> Add the missing \n to fix both issues.
> 
> Fixes: cb79224b7e4b "deprecate -mem-path fallback to anonymous RAM"
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  hw/core/numa.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/numa.c b/hw/core/numa.c
> index 038c96d4abc6..e3332a984f7c 100644
> --- a/hw/core/numa.c
> +++ b/hw/core/numa.c
> @@ -503,7 +503,7 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
>              warn_report("falling back to regular RAM allocation");
>              error_printf("This is deprecated. Make sure that -mem-path "
>                           " specified path has sufficient resources to allocate"
> -                         " -m specified RAM amount");
> +                         " -m specified RAM amount\n");
>              /* Legacy behavior: if allocation failed, fall back to
>               * regular RAM allocation.
>               */
> 
> 

Why is this an error_printf() and not an error_report()?

Thanks,
Laurent


