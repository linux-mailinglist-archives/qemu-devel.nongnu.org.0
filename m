Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA1C4EC6C1
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 16:39:17 +0200 (CEST)
Received: from localhost ([::1]:32884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZZTg-0002Gp-Hd
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 10:39:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nZZRx-0001VZ-1u; Wed, 30 Mar 2022 10:37:29 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nZZRv-0003ne-8y; Wed, 30 Mar 2022 10:37:28 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MXHBo-1nWjFS19UU-00YjQt; Wed, 30 Mar 2022 16:37:16 +0200
Message-ID: <9ec8f48b-1108-5bb8-cdb5-58257def3fc9@vivier.eu>
Date: Wed, 30 Mar 2022 16:37:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] linux-user/sh4/termbits: Silence warning about
 TIOCSER_TEMT double definition
Content-Language: fr
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20220330134302.979686-1-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220330134302.979686-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:18YEMcJTp1RnOgvMgWOcOFXRECRxO/Blc8N6pNI2ZcL7YnIQvLM
 h8pOcgbzdNMFHhiwjTINMLAJVzbES+Gmd3L2kd40juBA9rODMznhL5KgqvZKqrY362d46UM
 6kUBAjFT20KfD1knyg+ZWmOlP2eKCF6JX3SN3qbHNcwGpfnyI+x8lE7Qu30ucCBbMeWGzsq
 SylVERz9THaTeitXe9/Tw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gq6hWYTFtDc=:ey/Ou/3VahFU0HOqHaQW2G
 FE+ICzB03ph+WhPrcrPtjRZu07c9VfuuLs0kwHzvyVDjJ+lGdmbYnOT9p3WcqzVC02NWFhkRP
 J/H39GX5xZ5v0VIM8i9QjtDKYc4KRdkA49kp2Bwhv82KD1E8s1ExNBsCe3MGJYWz9Eha4wofP
 PdyY2U8Bgaz9PYkDhPC0kfKdqRkUCVTl5ynbtKRdwezdl3ZDWwXFzHVfjzkNmpj6VdUWOE0gl
 4uzgYsAanX8ZIQaSN/UcNnyp4QX0QzGaMEyfCzzIuF2OgHwApsDEcuYW4zHEOa4+ttL6WqndP
 RTjggl0FSSskOV3wJnQhisyivfGu9orqbEmgfYvAmIypDNlqWsQwjSkw9Td6oN+vDxWttzMmf
 +74RhmlvAxcm549/XG+IniELNaJ0RMDbkbXrygvpS7xwALNixk3BTxLMggk2H/2INj8pI0ZGd
 bs64kmF34Wr8W24aGOCIhwntwoBZR9p1ige6eGNgZELnOLYQ+chw+imbumOsE7d0boPOUPGE/
 +MoCxFbZqZTgnEORBIvsiE5B/IMtWxKyQoFbbTP9GGmwdMPJFiJQIh5d5vBVpg016wBPWO2KP
 EeSCzrUfAfEib0ko8Ia0/UE0OHuqTzcS2Gzm/8i0HfNTI2A+AePeYQyECAsDz3w2WTrG5F395
 +eI6eZ+By5Hb6oKqrKoyhJJTYUpHYzimav23nSzXG4FoWhi8ICqOmC7A4Uu313wltDrE=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/03/2022 à 15:43, Thomas Huth a écrit :
> Seen while compiling on Alpine:
> 
>   In file included from ../linux-user/strace.c:17:
>   In file included from ../linux-user/qemu.h:11:
>   In file included from ../linux-user/syscall_defs.h:1247:
>   ../linux-user/sh4/termbits.h:276:10: warning: 'TIOCSER_TEMT' macro redefined
>    [-Wmacro-redefined]
>   # define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
>            ^
>   /usr/include/sys/ioctl.h:50:9: note: previous definition is here
>   #define TIOCSER_TEMT 1
>           ^
>   1 warning generated.
> 
> Add the TARGET_ prefix here, too, like we do it on the other architectures.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   linux-user/sh4/termbits.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/sh4/termbits.h b/linux-user/sh4/termbits.h
> index f91b5c51cf..eeabd2d7a9 100644
> --- a/linux-user/sh4/termbits.h
> +++ b/linux-user/sh4/termbits.h
> @@ -273,7 +273,7 @@ ebugging only */
>   #define TARGET_TIOCSERGETLSR   TARGET_IOR('T', 89, unsigned int) /* 0x5459 */ /* Get line sta
>   tus register */
>     /* ioctl (fd, TIOCSERGETLSR, &result) where result may be as below */
> -# define TIOCSER_TEMT    0x01   /* Transmitter physically empty */
> +# define TARGET_TIOCSER_TEMT   0x01   /* Transmitter physically empty */
>   #define TARGET_TIOCSERGETMULTI TARGET_IOR('T', 90, int) /* 0x545A
>   */ /* Get multiport config  */
>   #define TARGET_TIOCSERSETMULTI TARGET_IOW('T', 91, int) /* 0x545B

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

