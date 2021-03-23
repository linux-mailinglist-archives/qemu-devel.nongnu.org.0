Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69408346DBC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 00:11:46 +0100 (CET)
Received: from localhost ([::1]:50890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOqBc-0004bq-KY
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 19:11:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lOq9k-00039S-KU
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:09:48 -0400
Received: from mout.gmx.net ([212.227.17.21]:48187)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1lOq9i-0002pr-Jm
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 19:09:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1616540972;
 bh=5AISB54FGW2nVXCs7TdnTmWRlYQB5CHsZ+vEMhK/HSQ=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=fIfpMdaADHo246zNdduzD8njcfJIFIU5vBNcgAuvrEH8xLA8twUq3Li+tL41oJdaj
 BxbLahigFenn4028LeXsaQXK3ItjR4mBm3zJsy5ukPDCPUCCKAy4WbMJ0z7vHRkcdW
 ptoGY8ZkdcfqTXGY3QKAN0lXsXqxWFNhl9aFmoOg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.140.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtwYu-1lfPf60IZA-00uIr5; Wed, 24
 Mar 2021 00:09:32 +0100
Subject: Re: [RFC PATCH 06/13] blobs: Only install PA-RISC SeaBIOS if hppa
 system target is built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-7-f4bug@amsat.org>
From: Helge Deller <deller@gmx.de>
Message-ID: <9f08db93-99ee-3a27-0290-395c3f729474@gmx.de>
Date: Wed, 24 Mar 2021 00:09:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+veHqi/nYmoVXXW+kpbQ8kbUOPPp0tdYt7wXNjtW6emNjb/AxuQ
 sYuXfL2c/d716jgyIlnzyEIa4y3i5sm4olX4xk5tjuF8cr6bSb0d/QQ4c3wlgojDCWxW3YN
 Nb1TGaYQ7J+q5A0ecz03hl1PS1Dk7fuC09c+m1O7YM8hKPFUf1BDx5Q3DU9q35ib/iunsp0
 09s39LaKBhU8S9s+M+jcg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qdwRihCsWwI=:Lq/4B26G1Erqg5pCg9aSyT
 ZkbIUyu7KVT1XkH7w1ObjNAl+Cna3wsLcpUwt/ad3tTn0mn+Pw9hqgt2CZWdjXf8gFh7oi9E9
 oBE7uWYaSQOFtROXocq4tsl5Y4BuyBpTjgw4cg2iXkcMlANGP4o2LOPvHteU8ElWmTP3f5wI/
 0ygLdcCwb5BUfYOUsrVLOjmWjFAjhbS0YS06oEMkvJfhFxYGCaL09oYahGHaRXUbFrRjNEmTW
 vDHidZ+HJ4cJv6clRLNiBehEfNPtuuwcq8Na/BL7gBlDuGP+2xXKQMR7w8L4Behcnyqc4i4jK
 n9wuOlX8KkWNXyNEnHRaxxVC1JN5DK5eOqAHOh4yyPlGkY+DkMcFuttn4c0mswaTlrSyE36OQ
 hltOA2PsWSaefEmhnnihzqSGMsu42vAkX0fxsvTXm/0jUwGzn4JIfJG29DifsFG7YdecgRUN9
 01JxFbiF0hhl9H34T7euPDnIVEzEyl8wXlBUMtz0akRSTJmTYeckjIbIhTXxbXdgGoAaM0Ev9
 KCHwgdbwb8MZgBtwHiiAcQ7umatPNlwjyhLeUshmarzc79IJJWjMZoxzNalO7SoMDXxbph2QS
 46fB9Mk86LPoeEcpKAZ7II5xjY6sM2ZltOZt508Z9F322/39cWP2sloqLQOZQMAphT/pUPhbC
 5cW4DBBzLnP/KFPzDqfsLVy55nleNu9ABDw0JZufOxKO/LihrUKCEbY10m903HgrfmOne7nYE
 5qRS6YqrysZJV76v9nQqaVnqUEzHtJUg2TjSkLLHdOYZvy7zofPpfX9TCdF3xEETkOP5hAeYi
 Y6l76Ycv9LJkVqLrS+oZhT7rS8R/Xjen4mpqYrTuCU8ledgb6JHfxiNu7mxlq6KWlpqlOIpEg
 QDYHp1f9oYM1YpGoC1bg==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 4:51 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Helge Deller <deller@gmx.de>

Acked-by: Helge Deller <deller@gmx.de>


> ---
>   meson.build         | 2 ++
>   pc-bios/meson.build | 7 ++++++-
>   2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meson.build b/meson.build
> index 10c21ef52af..a7f3b60d08e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -95,11 +95,13 @@
>   install_edk2_blobs =3D false
>   install_blobs_alpha =3D false
>   install_blobs_arm =3D false
> +install_blobs_hppa =3D false
>   if get_option('install_blobs')
>     foreach target : target_dirs
>       install_edk2_blobs =3D install_edk2_blobs or target in edk2_target=
s
>       install_blobs_alpha =3D install_blobs_alpha or target in ['alpha-s=
oftmmu']
>       install_blobs_arm =3D install_blobs_hppa or target in ['arm-softmm=
u', 'aarch64-softmmu']
> +    install_blobs_hppa =3D install_blobs_hppa or target in ['hppa-softm=
mu']
>     endforeach
>   endif
>
> diff --git a/pc-bios/meson.build b/pc-bios/meson.build
> index 635485931b9..c494c334e26 100644
> --- a/pc-bios/meson.build
> +++ b/pc-bios/meson.build
> @@ -76,7 +76,6 @@
>     'u-boot.e500',
>     'u-boot-sam460-20100605.bin',
>     'qemu_vga.ndrv',
> -  'hppa-firmware.img',
>     'opensbi-riscv32-generic-fw_dynamic.bin',
>     'opensbi-riscv64-generic-fw_dynamic.bin',
>     'opensbi-riscv32-generic-fw_dynamic.elf',
> @@ -101,6 +100,12 @@
>     ))
>   endif
>
> +if install_blobs_hppa
> +  blobs_ss.add(files(
> +    'hppa-firmware.img',
> +  ))
> +endif
> +
>   blobs_ss =3D blobs_ss.apply(config_host, strict: false)
>
>   if get_option('install_blobs')
>


