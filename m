Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A21BD771
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Apr 2020 10:42:33 +0200 (CEST)
Received: from localhost ([::1]:34854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTiIZ-0003sJ-Pw
	for lists+qemu-devel@lfdr.de; Wed, 29 Apr 2020 04:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jTiHT-0002cm-9c
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:41:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <zltjiangshi@gmail.com>) id 1jTiGm-0007II-SJ
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:41:23 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:35268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1jTiGm-0007Hb-FZ
 for qemu-devel@nongnu.org; Wed, 29 Apr 2020 04:40:40 -0400
Received: by mail-lf1-x143.google.com with SMTP id r17so958222lff.2
 for <qemu-devel@nongnu.org>; Wed, 29 Apr 2020 01:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=B2NgeWWOeliBEjTQ/Jt1BYYwrZptCmWauQnrBKJMdZQ=;
 b=Pw4eV43TuOJfMeOmwUFEuyTGkdUyifVksydMWe7PJSycLxpAjhyNeZkH0Ig1EDb7jW
 ZCCEasbceMVi/Qx/JPNq6vUN3bX0FjWAFNpl72jR/NIocXTdVmZGN0UUQ9ytMQtObDdR
 PcGxBAWpThwIyI3u0rsSVb6D41WI5ClIMD5a/MVa0yhYrFmbevhHyEFUM1gWGjF4c4yw
 1THhOs4nTYQ7jGjmP6szq900hrWrPiDTfnjYRI4mbCJs5hHG5zfXaY2tRwp+f6RORV8V
 xjVJNCvgUHi15Y0ne+fmqelNtagKGYLmF9QdGhOZZLaFgztNpjGWUhfLiOV/xhLSuDZq
 VxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=B2NgeWWOeliBEjTQ/Jt1BYYwrZptCmWauQnrBKJMdZQ=;
 b=f2qoGNNRd3UzJN0OJC4RjoWlBdMz3S5aAW9bd4qOzZ0XMlS0Y1tL/t3NK+0+TZhKbH
 D5YpC/abEeSZSX42fKsjv/uA0fCXUV9CW9+tf7QjAuXvDjOGxZBIMQuUg+7/GWl1CHQi
 6BvGDyMnPhpSAYjCYzqjn22WjxDEt5bQ+WVSpEhuet6+WTyCDFP6zA/75rykcBPSLUV2
 2zH2W6JJZgleAVcpjpX6QkHO8hX3i8ks11UIpe6kQU6yoSgCAFANIOd14aNdm36mrWkw
 qCRG2Oy2J/hcP3qJek5B259AWzjAzZmBWF6p9K0LV37VW2YePmPLRz6jdmQY24ijoAZf
 v2CA==
X-Gm-Message-State: AGi0PuYyMA0VadZfkN6jEEvCZ+7Yi4w7AHa22dUEYRJBabNreFWDs77M
 p6RkCNBPAAQZBDABVjyhh7hTakqyBW4/dDqtnes=
X-Google-Smtp-Source: APiQypLjBNdRZEsaPq48Nqoh9x74DG5PssihBC5hSCEGJSJ8nDiPInStC835Oo6V1ZE4sH4wKhUcQ7TBr70mIXYQ0I0=
X-Received: by 2002:ac2:58f6:: with SMTP id v22mr21341927lfo.146.1588149638252; 
 Wed, 29 Apr 2020 01:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200429082916.10669-1-f4bug@amsat.org>
 <20200429082916.10669-2-f4bug@amsat.org>
In-Reply-To: <20200429082916.10669-2-f4bug@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Wed, 29 Apr 2020 16:48:08 +0800
Message-ID: <CABDp7VoyvX2vD6awEC-GwnEu8SW=pMPPR7mrfKCSzamrnomPKg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/mips/mips_int: De-duplicate KVM interrupt delivery
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::143
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
Cc: Huacai Chen <chenhuacai@gmail.com>, qemu-level <qemu-devel@nongnu.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Wed, Apr 29, 2020 at 4:30 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Refactor duplicated code in a single place.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/mips/mips_int.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/hw/mips/mips_int.c b/hw/mips/mips_int.c
> index 796730b11d..4a1bf846da 100644
> --- a/hw/mips/mips_int.c
> +++ b/hw/mips/mips_int.c
> @@ -47,17 +47,12 @@ static void cpu_mips_irq_request(void *opaque, int ir=
q, int level)
>
>      if (level) {
>          env->CP0_Cause |=3D 1 << (irq + CP0Ca_IP);
> -
> -        if (kvm_enabled() && irq =3D=3D 2) {
> -            kvm_mips_set_interrupt(cpu, irq, level);
> -        }
> -
>      } else {
>          env->CP0_Cause &=3D ~(1 << (irq + CP0Ca_IP));
> +    }
Since the if-else has become one line, so can we remove { and } here?

>
> -        if (kvm_enabled() && irq =3D=3D 2) {
> -            kvm_mips_set_interrupt(cpu, irq, level);
> -        }
> +    if (kvm_enabled() && irq =3D=3D 2) {
> +        kvm_mips_set_interrupt(cpu, irq, level);
>      }
>
>      if (env->CP0_Cause & CP0Ca_IP_mask) {
> --
> 2.21.1
>
>


--=20
Huacai Chen

