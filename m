Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E522C53A1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:12:52 +0100 (CET)
Received: from localhost ([::1]:47518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiG8p-0003VD-3K
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:12:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG2h-00017c-SS
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:31 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:33598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG2g-0001tj-61
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:06:31 -0500
Received: by mail-ej1-x644.google.com with SMTP id 7so2637498ejm.0
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kpjf8Y8HCgAUQxxZ53cX0oE55KrvZllXNp+tnC8WQVE=;
 b=lgrXxBCiDNIgWUBEvGpXzcupX1dHtGdh5puewSDV7hec3/6s2f+erOkoxksSZwpDb+
 OmJxzqJ+7BvOd7wfomcmJNAn6VFyE+ST1e+xYgzU9ciFKMZgzRUhGBqH5SYo999muvf0
 JgkOw3clkS6OP8IfUKqvcQMgZ8o12Lnuf2OWfP5Cda5JLtuxk7cu4Szp/0Ok+ygOAEQi
 /9Ck08SiAEMhBuPPLDK8WerqK50u7flKo1t4beRDjyWleY32KcloGj82spBMvBJ9XT/F
 lEXPWUA6YjgrNwm07+IHuNf8z9TnGuX6bVH2JxDHMk71DNfIrOmYoV1H/lcibRjWGYh3
 UElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kpjf8Y8HCgAUQxxZ53cX0oE55KrvZllXNp+tnC8WQVE=;
 b=Jc6lOknczIXII53F3EeDUZXZyeDLvHfyLskSMbrQE7rgRZZVSbMgol0Am/DdllfJ5K
 sz1FggQiI4IyNh6bYrLFttf+TNAbxEHPfUZlDk2TIUtmpJNvEB66G0NtXIyR8fXMPaae
 udLf56Hhxtz0c1Qp68zV2evX/jenLVjrnuVOXp8rwx0PZZTN2Gmj9x48wMnSky1c1kAx
 Q1ceVfGqbkKP/Ta/eaIbjE6y4+9XxLWpD3huJKyJcheBOR0vls5AKbJ7aTlY5j79cpWW
 7NX01Bf7Wb9hWYIBNPR73T8SxIpqoeIm97i1f9Ta+yU8n79mk6XX4KtYtLi1fnRAoeJq
 MmPw==
X-Gm-Message-State: AOAM530XjQD9JGgEC3GtXW0umsqeX4r8w0ZNg/otWkn5zyx0LKwkFRkq
 zQrfFkG+Ub8M+TVlnE5TkCfapwxvV+MsjigBcAqSxg==
X-Google-Smtp-Source: ABdhPJw646vi87iOoZVBdMZgFzmCwKlZc1FZP/mw0ppnu9nXPQuPvXYbgAbkg2Snc+ANqAiqZTLZSFWpfwAAd1P8RXc=
X-Received: by 2002:a17:906:d8a9:: with SMTP id
 qc9mr2361040ejb.482.1606392388678; 
 Thu, 26 Nov 2020 04:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-10-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-10-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:06:17 +0000
Message-ID: <CAFEAcA9tcduAw1vEjWoOvmiJGS-S6zUx3t_nmssSNxbgPXpyOQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] audio: remove GNUC & MSVC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:30, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires either GCC or Clang, which both advertize __GNUC__.
> Drop MSVC fallback path.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  audio/audio.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 46578e4a58..d7a00294de 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -122,13 +122,7 @@ int audio_bug (const char *funcname, int cond)
>
>  #if defined AUDIO_BREAKPOINT_ON_BUG
>  #  if defined HOST_I386
> -#    if defined __GNUC__
> -        __asm__ ("int3");
> -#    elif defined _MSC_VER
> -        _asm _emit 0xcc;
> -#    else
> -        abort ();
> -#    endif
> +      __asm__ ("int3");
>  #  else
>          abort ();
>  #  endif
> --
> 2.29.0

I would prefer to just drop this attempt to emit an inline
breakpoint insn (which won't work on non-x86 hosts and seems
to me to have no benefit over just calling abort(), which will
also drop you into the debugger) and simply make it abort() if
AUDIO_BREAKPOINT_ON_BUG is defined. Gerd, do you have an
opinion ?

thanks
-- PMM

