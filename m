Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B74EE1B7
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 21:29:49 +0200 (CEST)
Received: from localhost ([::1]:39440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na0UO-0005XA-2v
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 15:29:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0TB-0004ej-8C; Thu, 31 Mar 2022 15:28:33 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na0T9-000872-17; Thu, 31 Mar 2022 15:28:33 -0400
Received: from [192.168.100.1] ([82.142.13.234]) by mrelayeu.kundenserver.de
 (mreue010 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M6UuX-1nguLs39jd-0070ZL; Thu, 31 Mar 2022 21:28:21 +0200
Message-ID: <efeca15c-ccdc-c52a-97d8-3d0d1abcb03c@vivier.eu>
Date: Thu, 31 Mar 2022 21:28:20 +0200
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
X-Provags-ID: V03:K1:EAdQ5j1we4jwGmFcAxar/q5VJ6PUEL/j8Coi+vl0Fw5Vt4pCmAJ
 6gQeiQFhRpkfJiWCSNYDHNPmrC20Zg4imm430ilLEDDv0nD1VRVOwmeN2I9Jfp8/R+K0eW+
 a33WxgFJPffGZxh+8W6760sYlZGdPfr90M68aeO5Ncnxz5atLIt3A8SpBj0ZGIqXrUQsLPv
 z/84gSvlwQ1m2Y+CA0zqQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ACu7x4mxi6k=:kl5hpYKguiA6EKsUplGvrp
 GVTgH47bEH42rPfptNg8Mv1dT4IKiwpn5Iwb6gQhXpksw97TMMsdfIqa5tXubyOfmJBW2F4Dy
 9Od6Xk+OD3Z5ljEVT7uviT0vHPwJnH7fjxjRX8x3bBhhsUkdVC1fCn7FjblrTYUHivEPEh6rp
 psaE/5XQr4c++Zx8yb3K64JPdPmHEXOqXTmpv5ez26vpBIHG1BdWSPQDcNUPLJ8twvYvwqJFy
 0j7tK/jAeanCbLf3nu6FT14Pa4+ethFnc+6QQnjDczkYnBZ8Ds1EUKd2gedHMhfA3iRGgAdCc
 QjlZt8vjHi6/OMl832vlUH81LUdImyvpB2Dz+zfMD8FH2ICl4TXWmvfnJf/GbZlpxH6SRe3lf
 klDN7OUug579YdIO0Pk7HHqofbSsUTGDIdrU+0LRiE/3xT5KHluernN5YhXHR8YRsnnJt/pa8
 iX8SM4memzsQaWQ+sbUzsehoc41gi2tavOya0Bn8ogPpjYzHIYVQhloc8IxgPhhH5lyhrJ/3z
 grKVJ0nNzQGuEezsQO1jI8S17E8sMgHD2uWA6BwdeWPvRRgqp2OGf3S1sl+fAF+FL481UwnnS
 ju90yxcU2yX54v8Y6icyHoLMy26twYippNZEZ8DNNMvfRdKSsYHiTX78yZ5NLosuQnMVpM1vx
 8Fh4ACKnB6QmqptGrRLsVbL2+/S2H9CCyNN1P0NGaCrjJptNkTh041IqoWXCU/Bkeo2I=
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

Applied to my trivial-patches branch.

Thanks,
Laurent


