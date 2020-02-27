Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7890F17165F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Feb 2020 12:51:21 +0100 (CET)
Received: from localhost ([::1]:57948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7HhI-0003pY-Gq
	for lists+qemu-devel@lfdr.de; Thu, 27 Feb 2020 06:51:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48744)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HgJ-0003GP-Fl
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7HgI-0000nU-HY
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:50:19 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:32903)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7HgI-0000is-BP
 for qemu-devel@nongnu.org; Thu, 27 Feb 2020 06:50:18 -0500
Received: by mail-oi1-x242.google.com with SMTP id q81so3029608oig.0
 for <qemu-devel@nongnu.org>; Thu, 27 Feb 2020 03:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZW6RD1VGJvJZEzDKuw20fOPhvnKp9AOdNxDid5Jjb5s=;
 b=WhRF3tjkq3L1GpcjD9NVji1VK5Lej5V0itXaMwQoNRVitDGSDpvD5cp6NYbM1pOqsn
 WlCT5QDugEDSVLUP0ImfW76y0zkhnc3U1YvlbQutNdskWeNnTFZWAbnq7uBjr5ufz16D
 u56RnGrrNjleCFA5dQbDEh0Db0j5W05/h2bwP+j4tk9VQWT3FMWV1ZRv9yUQvHiRLowE
 S3q2cFw4peIKZsqzhWdEsz1z35wtWnMW+TnLkIYJiZWLvJ9a8Dy0Zr7fi0a1vjBYCBq2
 PbHIQQXjk5mIulKIenf8y/1VtuVOqJTW/cfb2FPbAa+kLFTfVh1R2AmM9tq4A2ufP/IH
 nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZW6RD1VGJvJZEzDKuw20fOPhvnKp9AOdNxDid5Jjb5s=;
 b=ebj7js1TrfHDsn2solAlcBB61BP+cJaJxbLMm7ZYH+aZm3PN3nBXeC29MoSqWdC+Xu
 ykpVdArVZDhMeIX3FeVS2HbK/DNvM7xLqyzXuvhvP3GH2EqBs3VMZLSDO6abSX6/cNAr
 Myngx/uxe0+9EcaIxfHQXmvBgpdT/j8q7nPOVuH6WroK+OA66/vu+yESS85U7w2ie6D0
 xunX+lNzsjh5Daeuwal5kDN261kp4Of9zrVTHK7cNatZMkZGaiimKUNu7KKgzCXBhO6D
 GfIKqwRFfKSj2Vs9BAb7xCIDhFGl/XYUQZQL+jEuA2yrJrDEb2S8CwTg5KXkl8t7Db8d
 tmoA==
X-Gm-Message-State: APjAAAXbUmHGt2zgakv5z/wQ0vQlouugxIzEASyxSgPW1gv09WhJld6z
 Lwk30NZjLfs0CL5AWvV4FYVR/+2f2jjp/anBPQ1WDA==
X-Google-Smtp-Source: APXvYqxaL8sUc6iRWAG/M3hhExCOKlYnLKt2p6qx9QOLNCTXJtSCXvIveBtG0GlXseYr5t19tcvCFtOZcuGxA2uiW1Y=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr2993391oid.98.1582804214508;
 Thu, 27 Feb 2020 03:50:14 -0800 (PST)
MIME-Version: 1.0
References: <20200226113034.6741-1-pbonzini@redhat.com>
 <20200226113034.6741-12-pbonzini@redhat.com>
In-Reply-To: <20200226113034.6741-12-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 11:50:03 +0000
Message-ID: <CAFEAcA_DgJqsALXYxWSFgCjhDg6wLV3516CJ7AJXsbxrVhGnwQ@mail.gmail.com>
Subject: Re: [PATCH 11/18] qemu-doc: move included files to docs/system
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 26 Feb 2020 at 11:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Since qemu-doc.texi is mostly including files from docs/system,
> move the existing include files there for consistency.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS                                               | 3 ++-
>  Makefile                                                  | 8 ++++----
>  qemu-deprecated.texi => docs/system/deprecated.texi       | 0
>  .../system/qemu-option-trace.texi                         | 0
>  docs/{ => system}/security.texi                           | 0
>  qemu-doc.texi                                             | 4 ++--
>  qemu-options.hx                                           | 2 +-
>  7 files changed, 9 insertions(+), 8 deletions(-)
>  rename qemu-deprecated.texi => docs/system/deprecated.texi (100%)
>  rename qemu-option-trace.texi => docs/system/qemu-option-trace.texi (100%)
>  rename docs/{ => system}/security.texi (100%)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 574b80498c..0d3ee8bdc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2796,7 +2796,8 @@ F: contrib/gitdm/*
>
>  Incompatible changes
>  R: libvir-list@redhat.com
> -F: qemu-deprecated.texi
> +F: docs/system/deprecated.texi
> +F: docs/system/deprecated.rst
>

There's also an F: line for qemu-option-trace.texi that needs updating.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

