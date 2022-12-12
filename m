Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA36499F7
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 09:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4e2B-0004s3-8V; Mon, 12 Dec 2022 03:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4e1l-0004lk-BH
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:19:13 -0500
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1p4e1j-0000KO-FS
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 03:19:09 -0500
Received: by mail-lj1-x231.google.com with SMTP id v11so2009899ljk.12
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 00:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEi4Hcm6GS43MsQZ0z6r512uMyVXFbxKNWTFAOqm8Pk=;
 b=ClByYPaSqcfsunaBEf+jRslH+3BhOWgS5Q6lppcU7L+QhArDHxFnt0qugkMy3Jh40A
 lA40X8deUhmYyChhPAeldjsQJIVVA2MyfLbOv4rm/WmZ9/e+bRS6jxQAxfBegV4lUFz5
 wcdRGx5QfW+lrd2CL+/CCXgZdY3l5LMPTpM7wn4LWHoFHgSeKJPzZzP6Q9JoAeNUqGAG
 YHqFI2X3BoUaXzfE8chygI6TLPFFb21s9+cjp2WU+gEqo54F9qosfVWgr0aZRZWKH17Y
 ZqnBoRC5Ek2Cokg7SX0Qf2NupeSGxMkOU5675Qw8ecxwAfpzGWgb/LnxmpvjHgRRHdER
 7ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JEi4Hcm6GS43MsQZ0z6r512uMyVXFbxKNWTFAOqm8Pk=;
 b=lPe6WVtM9vj7t4TeqiJlx75y3oKTStQxYciF2YMnN9h+dQouI34PtCFiClgbV7vVCT
 COFF09DTGOj38Si9Jl38KyoV8bQQucMWT9pus5QAeb7359EKll4LN1sOl5z7VTfrSoqA
 FFxroe6FD7GI9k7IQ7QA+FgmFpPIuuMLsURLWl+DcKkrsa4cZgHXiEHXRjidf3ek7Kod
 q644Qb/YFZZjO1p6PyfDXcRAnvMFhxQ7ofDo1KkuOXOk3iKlsAB8kZ6uHIMmt2PD36lk
 FxzSXafybxja+FvWzh8M9a63MC0Tb5B7n5YNUs8CiitxtHKLTxvc+dJViP4v5uZqzKO2
 3hZQ==
X-Gm-Message-State: ANoB5pkK+3QpXVYkJvScx2oIWzTHiveGB4XcYIVIeCGXj6nBsaACrrU8
 taiVDHrAUAnBP+v1v5hfInSGLB0xxuRph+tpgsE=
X-Google-Smtp-Source: AA0mqf5kMFPcTPGNI+VDMuPKrVV1hO4bdwtxNDYNfb0f/Eyl6ZoF8RhkibqtYpi0Rfpik2dz9i/KJGxTLhOvnqJbUtc=
X-Received: by 2002:a2e:583:0:b0:27a:51d:274c with SMTP id
 125-20020a2e0583000000b0027a051d274cmr4646345ljf.94.1670833145421; 
 Mon, 12 Dec 2022 00:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-7-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-7-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 12 Dec 2022 12:18:53 +0400
Message-ID: <CAJ+F1CKL9RGT=L=B5E0T6XU1CYEooifThcyUDzJby++fWaBLkQ@mail.gmail.com>
Subject: Re: [PATCH 06/30] meson: tweak hardening options for Windows
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi

On Fri, Dec 9, 2022 at 3:36 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> -Wl,--dynamicbase has been enabled for DLLs upstream for roughly 2
> years (https://sourceware.org/bugzilla/show_bug.cgi?id=3D19011), and
> also by some distros including Debian for 6 years even
> (https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D836365), so
> just enable it unconditionally.
>
> Also add -Wl,--high-entropy-va.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 5c6b5a1c757f..d61c7a82f112 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -193,10 +193,7 @@ qemu_ldflags +=3D cc.get_supported_link_arguments('-=
Wl,-z,relro', '-Wl,-z,now')
>
>  if targetos =3D=3D 'windows'
>    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--no-seh', '-Wl=
,--nxcompat')
> -  # Disable ASLR for debug builds to allow debugging with gdb
> -  if get_option('optimization') =3D=3D '0'
> -    qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--dynamicbase=
')
> -  endif
> +  qemu_ldflags +=3D cc.get_supported_link_arguments('-Wl,--dynamicbase',=
 '-Wl,--high-entropy-va')

What about the comment for disabling ASLR on debug builds?

I wonder if we really have to add those flags ourself. Imho, we can
leave them to the compiler default or distrib.. I bet most of the deps
don't use those flags explicitly either.

--=20
Marc-Andr=C3=A9 Lureau

