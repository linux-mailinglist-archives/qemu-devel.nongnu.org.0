Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E9181C5F
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 16:34:20 +0100 (CET)
Received: from localhost ([::1]:54292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC3ND-00030x-BP
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 11:34:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58163)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jC3Le-0001U5-Kx
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jC3Ld-0006nJ-8h
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:32:42 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jC3Ld-0006me-2Q
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 11:32:41 -0400
Received: by mail-ot1-x342.google.com with SMTP id v22so2373683otq.11
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 08:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kxw0LmNh2xNz9o+W5twudVi1Obwwuoqixm+EYG+B/zk=;
 b=Mq48xHGjaWbU/2StZc0J8pxU108cDgfpnO9qlQBN+A/H3Oe7OdokYurVfqjt/VMA4/
 z7M/1rcFBA5nVpOs9SXibBM48tyWB3VbmJdy7O8W1fDY8vsvZpr1f6pnd26PPF8kWGPE
 HLgB+GGYRPmxUdACbHVRKULNa8qtvQH5lCxx0sI5V4MzNt05BAZnJt+nDpS988RRmdgJ
 f2VnFUiqsaV0Z7/trBsDlsf6k2jsyu0onT0ShnV/WfeeVqxxK+2YW7O5axD6kesqlr+7
 bHMZQLSOgqxsPMnOeIT7bSKj5ICp8l9PsVwj0HLtjht2xBq9wItbTwNCMGMm0oMVObqv
 gWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kxw0LmNh2xNz9o+W5twudVi1Obwwuoqixm+EYG+B/zk=;
 b=f+8UT+aOa6YUmDSgkPwY6kHNyZqMR4sQci4m9AORmaXdsmW7+BD0WIXIAd7dGIbdMY
 X9kNdojHdxSVjylMmriHfhll8oN4vjvX6pxh82ysTHOvQHhnzr07EOOXWUxjsBxxPolg
 hC/8Ql55oB+RnaXCwalpluHLCMszJANB5r4coZ5fchzYYf8Eo2GjuFDCuzwDWK8EEvU7
 wvGd1+Z2KnWSpH/RkluP35YaYPC3eHKZQ5IRC23cYXReEASar7c3rGVF6AwSS8RO50bv
 AzgjO30Z2MfyRkPDB6GpULoCIdKbN7ZbEKen6CkCXveZJwHupPil66eA9oXyxJQtzlZS
 rHLw==
X-Gm-Message-State: ANhLgQ1jDyJZLsHylxCMNaLwgut00eFtglsN5cdLRl8h7SitwFsox0mE
 aERwq4BJ0M2xNSWu/adpKGqqFG60ka9h9Nvf/gLHnQ==
X-Google-Smtp-Source: ADFU+vs0SdnS04zBQdrsUu7z92JkGOzxzCFJomHSSHgOzCT81s1wKLK7NlOiWUMtuucFebdJS0UjDWG93RzJwN+T4l8=
X-Received: by 2002:a9d:6f88:: with SMTP id h8mr2834587otq.91.1583940759363;
 Wed, 11 Mar 2020 08:32:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200228153619.9906-1-peter.maydell@linaro.org>
 <20200228153619.9906-32-peter.maydell@linaro.org>
 <87blp3x7rr.fsf@dusky.pond.sub.org>
 <CAFEAcA9EEuAeKm8kXtSJUtm6F3=VfyMxOkESvrZzoVt87HwKpw@mail.gmail.com>
 <CABgObfY1zeUEb3pKFX7YEtAHRuaMDtXJHPpNxz-0Fzhtqdy++w@mail.gmail.com>
In-Reply-To: <CABgObfY1zeUEb3pKFX7YEtAHRuaMDtXJHPpNxz-0Fzhtqdy++w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Mar 2020 15:32:28 +0000
Message-ID: <CAFEAcA8JA6N-YD0SdD83t3FzEBKaDufuntc3qGJika-PVH2w5Q@mail.gmail.com>
Subject: Re: [PATCH v3 31/33] docs: Stop building qemu-doc
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Mar 2020 at 15:22, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Also, man to text is obviously doable with groff if we're content with the man page content.

The manpages are a small subset of the full HTML manual, though
(as was also the case for the texinfo generation process).

thanks
-- PMM

