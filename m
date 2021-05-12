Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C06E37BB6E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 13:05:49 +0200 (CEST)
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgmgV-0001x5-Ii
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 07:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgmem-0001I2-T6
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:04:00 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:37416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgmel-0003oG-6A
 for qemu-devel@nongnu.org; Wed, 12 May 2021 07:04:00 -0400
Received: by mail-ed1-x529.google.com with SMTP id f1so4316273edt.4
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9I2zVvj2ZUli44kwo48oTtEn/c62YhcW49XVDqHrlU=;
 b=mmGx8JgHuBkjvKwTp+BZcMyYcXfCQnKJn6UDx2eEq6VDyVcfS6b5Lq94FcDgkJLsHk
 d3QUw4GFqwGGMzRVzRSShmNY5gBqDHiZA2XRS8N5UYxsQZ/puZnaQnAGT1t+C+FAadAI
 0JcIW3e8AOZJ43QJP7/sKrgNuxiC4i4ylN7XTV6e/+d+6owgQA8jrp3fVqvDKqEXKG9o
 vdouENIDG3ZKSUQXA11MwSJlBQlgSpH7mhwAdnJXYjsfpjBs+SAMnO2prPByfMk21jzn
 haM73lyrLNCLPGWhmOnza9P5bDLyotXFZp1MHjgBb6sfKo13fZGN/4ImepdTUbkuJkXl
 wk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9I2zVvj2ZUli44kwo48oTtEn/c62YhcW49XVDqHrlU=;
 b=rU/jmRhpnPXLg0RVaKGMMQE5S587+6JhT7mPvRtAFn5nKYSAHhOwKztsNdcE4cZU5C
 IZJQg6Onfn9SojI64NCXI9irYOCMjQE3j9hIW6i/TXEK23rVG1WjmfzsT8grEQjb+iEB
 qF5zeKb6iORlQYnUjDFrjArOqo8e9jGBwjOnSDzSb0DUQ4O/Tujec7zXfZb8MyMdNvbp
 eBf3kzwJeTuMStaVRE7mMFM4dI7TEbwD9whdib5GVU92JFKIwA+wokPgr3p0KIM6WZl2
 9b7kH3ES8BZbOt/JO4XNto9RirOjYDZiQlZRqbWTzlkd4dnECGA3eL6mYJRcn10skkpP
 9UmA==
X-Gm-Message-State: AOAM5332ureQZxseUP11/PnhDpvBr5FkOzyfU/ZeWJ+uuqmxOqlcctsd
 gj39qaIhF0HntHHjcufCs6sgP3l4gHZ38ojf45SMSA==
X-Google-Smtp-Source: ABdhPJwQNX2VNcAygLEJCMSG1eFcqnWq8pJ40ZBHoAbxHz55WmLD8JX/sV6k305+ODxkXTu28/T2E6eJ6tbJAcV2u+U=
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr42028853edd.251.1620817437668; 
 Wed, 12 May 2021 04:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210512100906.621504-1-pbonzini@redhat.com>
In-Reply-To: <20210512100906.621504-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 12:02:44 +0100
Message-ID: <CAFEAcA-Vy3uG=PjKnDfaX0BoCLUDS=Za=aZ7BgG6iHc0wRYopw@mail.gmail.com>
Subject: Re: [PATCH] add Visual Studio Code configuration
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 11:10, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Add configurations to build files with Visual Studio Code and
> to retrieve the search path for headers from the compile_commands.json
> file.
>
> Using this configuration requires installing the Meson extension and
> using a build subdirectory that matches the one configured in the
> Meson extension itself.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>> diff --git a/scripts/rebuild.py b/scripts/rebuild.py
> new file mode 100755
> index 0000000000..e35e08f42d
> --- /dev/null
> +++ b/scripts/rebuild.py
> @@ -0,0 +1,22 @@
> +#! /usr/bin/env python3
> +#
> +# Author: Paolo Bonzini <pbonzini@redhat.com>
> +#
> +# This program compiles the input files using commands from the
> +# compile_commands.json file.  (Unlike Make/ninja, the _source_
> +# file is passed to the program rather than the targe).  It is
> +# mostly intended to be called from editors.

This seems weird. I don't think we should try to support multiple
ways of building QEMU -- editors should just run make the same
way everybody else does...

-- PMM

