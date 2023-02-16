Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0218699717
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:21:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf8S-0004ca-1J; Thu, 16 Feb 2023 09:21:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSf8P-0004Y1-Do
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:21:17 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pSf8N-0004qN-IY
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:21:17 -0500
Received: by mail-pf1-x42d.google.com with SMTP id 16so1542360pfo.8
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P2+d1Z6n5RFdBbBkyIK5nyZWw1JqO9ErXvyVU6Et+gc=;
 b=RhuOHeDwdm7/SnhCLU80LQsKmrpXN8+cRVYBlB4pgO0q+qIhg+ytj0U6V9OREkqZQU
 FNBgZN07ncm0HcMy6CpmEfB6AuGqXSO+EBpJn8KVM+v6uZ3ewaIWLn2C/LP5bjKyEsxM
 hIhYAK2iEZChi0bZwIolWGhSlRPt2EwTIUzBU+DZ4fnEcqORQJ6cxuWdEk8WKLXiUQQX
 hGT8DERe5CEekv9xrV2YoWPcTIFNJ6mQxHdeXcOtSZ+7OkdWGAYXNyA5WrEPPt/oKAxk
 fGgtKRwwF9eQwOkIyZJqVxsvNfIq/kIzSy+Iv7MN07R5eZZBkNm+m9CPsL4Zrt9Tojz6
 uPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P2+d1Z6n5RFdBbBkyIK5nyZWw1JqO9ErXvyVU6Et+gc=;
 b=j50aBD15PU/tBhbEhgZ5nT0oLd/yTF7YT7fgOajycIsWIwZsWVqdUnFh6TQJ3KEeld
 WJfcPhSweMrhjr6+RcmIe0xjBra39XTgJIGdr+CxSErJnoitz2h9fJBJA4rqAVFKVOV+
 SnLuTa9X42lFnPUB0RMHGlBOXMgJdNI/QL2sS6bjJUb5kcpC1rnzIg/g9kknQjDLwHNc
 Q41LXwarqJJz0GB4Cqf/nUV5PgsSJ2djQyqT79Dsuq/d03NS7VGOLaJUwFTqwS3taYrk
 GspBnw6jD6MJf92wKm4RYUQ1HWXjLkHXZvqV1goMt0As90lHbEVuAo71VxTgg4E6Xa6E
 OcHQ==
X-Gm-Message-State: AO0yUKX6XYVsyqJTZrf/QQkWN5bc9zbHkFo+URmyABJeGnMqQppvATKT
 wpUYC0HyAiuT6bgk/O4iCll1XvqEom4Xn+VRKAKODw==
X-Google-Smtp-Source: AK7set9hEsNd9ylRfMkI+OevWxqdYf2JaQbLzHEPJ0BndNLXP8WH/41o/IKnNrYf8YOw5eEmxp8eebW6lr1ivMCIvBs=
X-Received: by 2002:a63:3e02:0:b0:4fb:918a:e9a9 with SMTP id
 l2-20020a633e02000000b004fb918ae9a9mr911950pga.6.1676557273789; Thu, 16 Feb
 2023 06:21:13 -0800 (PST)
MIME-Version: 1.0
References: <20230208233111.398577-1-dinahbaum123@gmail.com>
 <20230208233111.398577-2-dinahbaum123@gmail.com>
In-Reply-To: <20230208233111.398577-2-dinahbaum123@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2023 14:21:02 +0000
Message-ID: <CAFEAcA9ztCW54WyMT9efwJ2Hcv+O1qnz8hHVasJ1HR4QbE6BVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] configure: Add 'mkdir build' check
To: Dinah Baum <dinahbaum123@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Wed, 8 Feb 2023 at 23:32, Dinah Baum <dinahbaum123@gmail.com> wrote:
>
> QEMU configure script goes into an infinite error printing loop
> when in read only directory due to 'build' dir never being created.
>
> Checking if 'mkdir dir' succeeds prevents this error.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/321

This commit message needs your Signed-off-by: line on it. This is how
you say that you're legally OK to put the change into QEMU and that
you're happy for it to happen; the details are at
https://www.qemu.org/docs/master/devel/submitting-a-patch.html#patch-emails-must-include-a-signed-off-by-line

It's just a line
Signed-off-by: Your Name <your@email>

> ---
>  configure | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
>
> diff --git a/configure b/configure
> index 64960c6000..3b384914ce 100755
> --- a/configure
> +++ b/configure
> @@ -31,10 +31,11 @@ then
>          fi
>      fi
>
> -    mkdir build
> -    touch $MARKER
> +    if mkdir build
> +    then
> +        touch $MARKER
>
> -    cat > GNUmakefile <<'EOF'
> +        cat > GNUmakefile <<'EOF'
>  # This file is auto-generated by configure to support in-source tree
>  # 'make' command invocation
>
> @@ -56,8 +57,12 @@ force: ;
>  GNUmakefile: ;
>
>  EOF
> -    cd build
> -    exec "$source_path/configure" "$@"
> +        cd build
> +        exec "$source_path/configure" "$@"
> +    else
> +        echo "ERROR: Unable to use ./build dir, try using a ../qemu/configure build"
> +        exit 1
> +    fi
>  fi

Hi; I think that because the "happy path" inside this if..then is
quite large, we can make the code more readable by reversing the
sense of the condition and putting the error exit early, like this:

    if ! mkdir build || ! touch $MARKER ; then
       echo "ERROR ..."
       exit 1
    fi

    cat > GNUmakefile <<'EOF'
    etc etc as before

I'm also going to suggest a tweak to the error text:

   "ERROR: Could not create ./build directory. Check the permissions on
    your source directory, or try doing an out-of-tree build."

thanks
-- PMM

