Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C215442E5D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:40:51 +0100 (CET)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mht5s-0003g0-Ke
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:40:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhsIU-0007O5-AS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:49:47 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhsIS-0000BP-TL
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:49:46 -0400
Received: by mail-wm1-x329.google.com with SMTP id 71so13075946wma.4
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OsXU0UZD0k9N1BZjlDPQWKSq15/NBNSov4JOl3qUfaU=;
 b=R4PV5SvGS/saur8ytSkogCmpmKdY+mbWj3H/FQ59I1e41ginYQeT7jvH/+vmVQSEJp
 UcuIm83sDbPxuXj/uuK23AeVl2Y58QrPeGhnc8nidAsQFuXiGGl+wjdSujUZ10F2wIMA
 8gTs3+rvsOP4jJLiBGI83DqsUpBAYGIduNXZ4kH9rtqdYsVQlR39bfunnv9hsTpX1LG8
 yWZLmFmLauubDuCVBdeB0Y4U6YNt4N8FPGGUi6rQJ3B2bnQwYN8prfR67p2i/pXQgRTS
 6353bZF0q4DSM6p4FrrO60njU/evsFduciNx8i9mTgw7ewXUi938FSoxsrsx1w5uYCS0
 I7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsXU0UZD0k9N1BZjlDPQWKSq15/NBNSov4JOl3qUfaU=;
 b=jh5OgUl3HZgmqWTld0E6fIj+N+eESq9sH9++brhwkSuANU0TqznJ4ezMCPptsXxloH
 c/hgoRJSD1vHXBIOlDCYfn0V7G0FZrBzBvVm2ijMX6wkLCBzTwUnwKC2skJdk1Ve6fVp
 Eup2RSh6eqvTXp825LXBfrGjs2IfCg1/s+qE358Ij2OVkzaVjla6jlzX/3RqndRXAiOu
 kZvqpJRU2OCDAgfA6ZsQGMU8hIQAp7cOlPSvWy52Uq6ir4yk+hWVA0lIQZq5l+VtGG5x
 SlaD45VQIy7QrUFKK73Pz4OiUA7LvYUFRT/O0Nh40ejSklcDNsxXRb1lIByOrwJttohE
 FPew==
X-Gm-Message-State: AOAM533WGwRe1ifk2SBu6ywSjmh3CreOfYLMYmNvSW6nNiwvumwiuBZq
 rb0EHbt7VUvDVm7pTGYYM6ejQLi+Pdus+lcCPhjWdg==
X-Google-Smtp-Source: ABdhPJzN6WAXiit1EOz6dKH0c4OWUo0ePzDPXcmR4zu3rUrb3vPWIuKxgphtXSalkNZXNJQLrXvoRlGOAjXEZ261jsE=
X-Received: by 2002:a1c:a344:: with SMTP id m65mr6181045wme.32.1635853782543; 
 Tue, 02 Nov 2021 04:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20211102113044.204344-2-pbonzini@redhat.com>
In-Reply-To: <20211102113044.204344-2-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Nov 2021 11:49:31 +0000
Message-ID: <CAFEAcA9VO0w6fYuOFh+H-raQigOkms8Bv=LrMkkgc1BVzaredw@mail.gmail.com>
Subject: Re: [PATCH] meson: remove unnecessary coreaudio test program
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Nov 2021 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> AudioGetCurrentHostTime has been present forever, so the test is not
> enforcing a specific version of macOS.  In fact the test was broken
> since it was not linking against the coreaudio dependency; just remove it.
>
> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson", 2021-10-14)
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  meson.build | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 3dadb245a8..d800b9c5fb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -944,22 +944,6 @@ coreaudio = not_found
>  if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
>    coreaudio = dependency('appleframeworks', modules: 'CoreAudio',
>                           required: get_option('coreaudio'))
> -  if coreaudio.found() and not cc.links('''
> -    #include <CoreAudio/CoreAudio.h>
> -    int main(void)
> -    {
> -      return (int)AudioGetCurrentHostTime();
> -    }''')
> -    coreaudio = not_found
> -  endif
> -
> -  if not coreaudio.found()
> -    if get_option('coreaudio').enabled()
> -      error('CoreAudio not found')
> -    else
> -      warning('CoreAudio not found, disabling')
> -    endif
> -  endif
>  endif

Don't we still want

  if not coreaudio.found()
    if get_option('coreaudio').enabled()
      error('CoreAudio not found')
    endif
  endif

?

-- PMM

