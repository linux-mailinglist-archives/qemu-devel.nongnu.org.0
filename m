Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 520F12D70FF
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 08:36:14 +0100 (CET)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kncyK-0001oW-Qg
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 02:36:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kncwT-0001B1-MG
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:34:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1kncwR-0008Tw-53
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 02:34:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607672053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MNxZIVlqAwFmzUwtc2txcKJ6Lii2qXzkPn1++19vMPY=;
 b=WgX9qSjPeAf1QI5flx1zudC6vdutoVft9K6/iEKIRTu1kZ2sw9FqeGUAytAFOGvkMkxpH1
 l4XPO1tIV0qm58fpsuzdkOCKZKWgnGKBwz4F/z6TzeMbhv2AKLOFeZ0XdsRaYx4AHebRls
 22tC6tzwuxv9nbsyVXEIj1jpTvO2S8g=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-QGHeca0cPh6rlTK7_VQ8EA-1; Fri, 11 Dec 2020 02:34:10 -0500
X-MC-Unique: QGHeca0cPh6rlTK7_VQ8EA-1
Received: by mail-il1-f198.google.com with SMTP id r3so6461587ila.3
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 23:34:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MNxZIVlqAwFmzUwtc2txcKJ6Lii2qXzkPn1++19vMPY=;
 b=eeqWV1IdTWb8u7BOxKJk/h19fDH6UyuzjfbvDI/axzKjlY5vGK9KIPLS6EXmwc/Vri
 XaAwBjLvwAkV2WKBN4GCNLz5f5J8rV63kHoPC9zi1i8ZmESNvmIfBuP9L1FL8DZduZKL
 tTlCIz9/JPSNZ+okzfzQVV2uFKQZ6GTnuuVPdqqgqSgj3eVLh9MrmZpIaQ0e7Ha7bbQj
 Rvd9qv0nPWpwaz/+2xFzNiedckWUR3r6DUjELbs9GPpGAvCZqF5IkG64IRDlszCrlf5l
 xG/SfnY5jypwAENsnCQjge2beKxTJfbecXb3rhp+duZTMIQ1gfHXJC7A5GwMjJtiPzb3
 3gbw==
X-Gm-Message-State: AOAM5323datrSSZOX/vVBHczRVhKdr40rIAmCBrZMc8QV4dN21BTqSZd
 37HiCGMWRHXB+Rr0R3XcN+/oTsyh/5Jg05x04geuT8L1LHSBAqc8loQLX2GSzd/Oengx3rhtdQJ
 m9MnhM1Wk35oGAVxiSoEbCI72Vc66Wws=
X-Received: by 2002:a92:4101:: with SMTP id o1mr14179459ila.82.1607672049754; 
 Thu, 10 Dec 2020 23:34:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWi5OP/rHSsZWlZru6jp+OTU/Mv5sEqrUxzlYxRPTD7o4x34lImEF5N7i5rNRiYleaBxPJIzBctLrmphVcPN8=
X-Received: by 2002:a92:4101:: with SMTP id o1mr14179435ila.82.1607672049516; 
 Thu, 10 Dec 2020 23:34:09 -0800 (PST)
MIME-Version: 1.0
References: <20201210223506.263709-1-philmd@redhat.com>
In-Reply-To: <20201210223506.263709-1-philmd@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 11 Dec 2020 11:33:58 +0400
Message-ID: <CAMxuvaxd6aryvbkRoKynSy5VKP3UQWMr0OJ=dvLbfE4pkuHxMQ@mail.gmail.com>
Subject: Re: [PATCH] audio: Simplify audio_bug() removing old code
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <gerd@kraxel.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 11, 2020 at 2:35 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> This code (introduced in commit 1d14ffa97ea, Oct 2005)
> is likely unused since years. Time to remove it.  If
> the condition is true, simply call abort().
>
> Suggested-by: Gerd Hoffmann <gerd@kraxel.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

It is going to conflict with the patch from "[PATCH v2 00/13] Remove
GCC < 4.8 checks". I'll drop it if yours goes first.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  audio/audio.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/audio/audio.c b/audio/audio.c
> index 46578e4a583..b71ab8912c5 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -104,9 +104,6 @@ const struct mixeng_volume nominal_volume =3D {
>
>  static bool legacy_config =3D true;
>
> -#ifdef AUDIO_IS_FLAWLESS_AND_NO_CHECKS_ARE_REQURIED
> -#error No its not
> -#else
>  int audio_bug (const char *funcname, int cond)
>  {
>      if (cond) {
> @@ -119,25 +116,11 @@ int audio_bug (const char *funcname, int cond)
>              AUD_log (NULL, "I am sorry\n");
>          }
>          AUD_log (NULL, "Context:\n");
> -
> -#if defined AUDIO_BREAKPOINT_ON_BUG
> -#  if defined HOST_I386
> -#    if defined __GNUC__
> -        __asm__ ("int3");
> -#    elif defined _MSC_VER
> -        _asm _emit 0xcc;
> -#    else
> -        abort ();
> -#    endif
> -#  else
> -        abort ();
> -#  endif
> -#endif
> +        abort();
>      }
>
>      return cond;
>  }
> -#endif
>
>  static inline int audio_bits_to_index (int bits)
>  {
> --
> 2.26.2
>


