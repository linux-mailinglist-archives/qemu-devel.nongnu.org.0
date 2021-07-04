Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 913F93BADF6
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 19:12:23 +0200 (CEST)
Received: from localhost ([::1]:50068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m05fK-00010s-LO
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 13:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05eZ-0000KN-S6
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:11:35 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m05eX-0000vZ-Mp
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 13:11:35 -0400
Received: by mail-ed1-x533.google.com with SMTP id m1so20526283edq.8
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 10:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V0EQj4dw1QneHKEi2nSBX33HxvqsCO0u1UrFqzjNYg8=;
 b=Px6KERAB6DfI5FC1zKhyMSYBg03oHRaMbrtQ9cKeyJxq6SaYe2bn22ZX/BxcL/D3Co
 tnDSU8u50oaZ1g2mVYoTXiXyAzdYP7fn52SKxmvwrBPlpAtHa/SYSRJQRKAk27dgiqWE
 mNWQpAr3b35qxvLRCazDnSkUril+DXUGihk1rtAb1fPEdQytwTyDYtlr2wch/A+lYmlP
 K29oV7NuQ5Wxpngk5PUpeixAMc6hO2vAw9TVgsXyN4o4kjyAAx+5IjHJtoxM41Fn8k2o
 /i8l0t2evDSzjFNT/no6B4nhSDiJ3cTIu+cZuK3G+TvP8RPwW2UvbwElSPFlbAEgdquU
 t8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V0EQj4dw1QneHKEi2nSBX33HxvqsCO0u1UrFqzjNYg8=;
 b=Iq5AYUe8zeFfQgB7n1o1uv9GpPfHEYdFwHLtw8D+csMktbFU46Ons5IvtWQIvpwtmV
 rujy4dGlnImDzGJFYk3IaOCSosOXmNacmm5I0APDoKI9gNSYKvUhNNjCsXJfmHaAaf1a
 4LNg5YdlCgjLojAAny3efvadR8y5p5vDTHT6DW6dEMhu8nN/M5tyLW9WAe7CB6ZVzXOE
 w4MzP/gqPFO5yD5FdbS/NkolWX62+wdakwCr5g+UfvXiJmEhoCAuzzfjl4GarW4y+XYP
 bU843DZuzdZou5Qqk5cB0IeaK2XZW+RqQBg2C0GfBieCokNl01F3p7TGoEnfnlXWZm+q
 BQ2w==
X-Gm-Message-State: AOAM531nUE2vdfX19Q5QEEt1GmrT87bvnjs9Ij0sA7RMTKlN8eRDtk9V
 L/qdkIsbFlZ9sTXuXdI2ZdsLvGKTohRsxkBLV1jpehT0j96pbA==
X-Google-Smtp-Source: ABdhPJx1XLj5jOC+nEHb8+16/MbGDWpmsEcaOErRicEKgmI/vn1mCVwAx1xBUjhEXg//5KBDx3WrCm/pPUzwF/sXR9s=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr11179222edt.100.1625418691996; 
 Sun, 04 Jul 2021 10:11:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
In-Reply-To: <CAOakUfO=C+pgcwopdTCrsH3vtFuFWo8QQBU8kEjnE=_3q-mMYg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 18:10:54 +0100
Message-ID: <CAFEAcA9rAAuzCh3MVSnfrBWZSvHVrmMqgqJ8OX0=nQKDXoVPpg@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] Configure script for Haiku
To: Richard Zak <richard.j.zak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Jul 2021 at 17:44, Richard Zak <richard.j.zak@gmail.com> wrote:
>
> Use system capstone, for which a port is maintained by Haiku. Disable TPM which isn't supported.
>
> Signed-off-by: Richard Zak <richard.j.zak@gmail.com>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/configure b/configure
> index e799d908a3..c928071f69 100755
> --- a/configure
> +++ b/configure
> @@ -358,6 +358,7 @@ oss_lib=""
>  bsd="no"
>  linux="no"
>  solaris="no"
> +haiku="no"
>  profiler="no"
>  cocoa="auto"
>  softmmu="yes"
> @@ -769,6 +770,8 @@ SunOS)
>  ;;
>  Haiku)
>    haiku="yes"
> +  tpm="no"

If the autodetect for tpm doesn't get this right, we should fix
the autodetect.

As a general principle we prefer to avoid "do this specific thing
for this specific host OS" whenever we can, in favour of "test
whether we have whatever feature/function/library is required".

thanks
-- PMM

