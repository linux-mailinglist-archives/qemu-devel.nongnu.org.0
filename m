Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE2A6481F6
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:53:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bw9-00049M-FL; Fri, 09 Dec 2022 06:53:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bvw-00047q-Tg
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:52:54 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bvv-0007rV-2R
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:52:52 -0500
Received: by mail-pg1-x52a.google.com with SMTP id q71so3370948pgq.8
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WIQRXvPKlz2NVNnDGSso8LyzrG2DkiK69GrTNp8+VKU=;
 b=hWWG5hXjOBGfIDrJxpiuu1Jlxwge6dy3iUpMrbtqDr8MRkP6uDd+Wf/gZRDuYErMGY
 2Ic4WuVIt5eqIHF+Xij35WmkPGODwdn0fIseOO0oVV3sf9xOCRHCZvSPHo78mN4+02iS
 VklEzd9r3InGpdUQe6Jis1+fEslPJoShImVT8usQ0mxnuUU36Rvy5s1F6Z7xi7a2s929
 uzMx797Dqqnj3YteFk81qCjFcOqMsE/wQCIq/qoS2Jp4YZ2AdGZ5/tdNDmS8/cLZrv+S
 VbWGlh6AQeNX50xZtiM4xxCR4WOIrDhzVN7SJHpXzROGGzfv9lpqU9HXdPjnhjZGJgKw
 FKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WIQRXvPKlz2NVNnDGSso8LyzrG2DkiK69GrTNp8+VKU=;
 b=i6hwqKcyGIxHZNcFh9xHTiaRjxnjxjc2QVqr3J2uYz9TpioB7hID7VxaB7s1//g8ev
 AfZ0cxZMl/g++fFO+N2K8y3ph3mHabR6hTq2kQqGYjrVYH8NNsqi6GcWTdPEtvE9WvzD
 bflCDgvRg8IrQrlNxwCl2c7PnJkD2bpOlaPDPPXApq+SDUkraM7W2JSM4KZRKhWcpaX0
 Xc5tFV4D8UEwXX1mMpP+YUXtLKsziKojpW+Pm1vFqzFZ36dfn489/u2/CVTPmgm96viR
 qBFAheVn0/O9SMJG9oiyKB74bhVZbSX2JaG9wceaIMIYFVlbfYBZFpJEkmLI1LsJJimJ
 VB8g==
X-Gm-Message-State: ANoB5pnNe/cgyndRwUXGyX1fBNEHW1SRvOV19k0tMEaC1xCzoH0LI/Xg
 um1cFqxliPuM6XdFW079Ob6UVBxDEbRlnGdigAvwNw==
X-Google-Smtp-Source: AA0mqf4rrJ+cTcLAJ3IZcHxRU+zkrTRQooCIkWzxpX2dT6vcKjc01YQ1eTCOtns7e31yC8++MuDqne/9zog8+srlYIk=
X-Received: by 2002:a62:5f81:0:b0:56b:bb06:7dd5 with SMTP id
 t123-20020a625f81000000b0056bbb067dd5mr78875906pfb.3.1670586767360; Fri, 09
 Dec 2022 03:52:47 -0800 (PST)
MIME-Version: 1.0
References: <20221209112409.184703-1-pbonzini@redhat.com>
 <20221209112409.184703-28-pbonzini@redhat.com>
In-Reply-To: <20221209112409.184703-28-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:52:36 +0000
Message-ID: <CAFEAcA_9wJy47nUpfkuonB_Fcu74MoC-14dj8dwi8i9HggWQKg@mail.gmail.com>
Subject: Re: [PATCH 27/30] build: move compiler version check to meson
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 9 Dec 2022 at 11:40, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Instead of checking with preprocessor defines, use the Meson compiler object.
> Because of the mess Apple does with its versioning scheme, check for an
> option that was added in clang 6.0 instead of looking at the version number.

> -# Check whether the compiler matches our minimum requirements:
> -cat > $TMPC << EOF
> -#if defined(__clang_major__) && defined(__clang_minor__)
> -# ifdef __apple_build_version__
> -#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
> -#   error You need at least XCode Clang v10.0 to compile QEMU
> -#  endif
> -# else
> -#  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
> -#   error You need at least Clang v6.0 to compile QEMU
> -#  endif
> -# endif
> -#elif defined(__GNUC__) && defined(__GNUC_MINOR__)
> -# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
> -#  error You need at least GCC v7.4.0 to compile QEMU
> -# endif
> -#else
> -# error You either need GCC or Clang to compiler QEMU
> -#endif
> -int main (void) { return 0; }
> -EOF
> -if ! compile_prog "" "" ; then
> -    error_exit "You need at least GCC v7.4 or Clang v6.0 (or XCode Clang v10.0)"
> -fi
>
> +foreach lang : all_languages
> +  compiler = meson.get_compiler(lang)
> +  if compiler.get_id() == 'gcc' and compiler.version().version_compare('>=7.4')
> +    # ok
> +  elif compiler.get_id() == 'clang' and compiler.has_argument('-Wpragma-pack')
> +    # ok
> +  else
> +    error('You either need GCC v7.4 or Clang v6.0 (or XCode Clang v10.0) to compile QEMU')
> +  endif
> +endforeach

The new code makes it much harder to move our compiler version
requirements forward in future, because there's no longer a simple
"check for normal clang X or apple clang Y" test where we can
bump up X and Y based on what's provided in the various host
platforms we have to support. Doesn't meson provide a way to do
the version check on the version number the way we were doing
previously?

thanks
-- PMM

