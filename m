Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE7B160665
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Feb 2020 21:50:34 +0100 (CET)
Received: from localhost ([::1]:36262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3Qs5-0001Bk-E2
	for lists+qemu-devel@lfdr.de; Sun, 16 Feb 2020 15:50:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41810)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j3QrC-0000ax-RJ
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 15:49:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j3QrB-0002SK-Lo
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 15:49:38 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45003)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j3QrB-0002RA-G0
 for qemu-devel@nongnu.org; Sun, 16 Feb 2020 15:49:37 -0500
Received: by mail-ot1-x341.google.com with SMTP id h9so14115961otj.11
 for <qemu-devel@nongnu.org>; Sun, 16 Feb 2020 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=14QYsuapzbDaPwF+vtYMIhYK6HSjTpn5v3qbb5kuPmQ=;
 b=lUYcd7tKHnMnPkYv3KqcIs65fQvfwi/24hctUKwYjo4C7flZw9FDmOQoiUvLJLLVoq
 YIGIjpA+fPt8CsKIUZ1joe34kSqYlvcsYq/HbtgIZ8cLF5nR4O5dNiCXbuiyGmWJmbGx
 sRpjNdQoYsTpiDB95iTSgQl75UENCEHwEmJc7X+fFkiqGTSUXUubICGVIdgk5842WUMs
 cJSoVGe61wHK+OkuozKZ5Fg7As6Jl2v/G69yyMEnVRoRfjEMudjL9A6QvnU67idKtGyB
 EtRaeh23tIgWxaZ6IW7EPtamIFjdaYaSDTTCgT6JscCDhHlfl8gj84T9nAkilKWRsG90
 0XLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=14QYsuapzbDaPwF+vtYMIhYK6HSjTpn5v3qbb5kuPmQ=;
 b=q6G8ShAEYdoFoT4zYzlpde78JD6fMrw/ApqNhdcUaP2siw7prS0DmOLYbT2GT+orws
 jXWI6gT3KEGm6wRENrLZAR0T3kkpbksRqxtZMqpa4VKozybaDBzhbNfAYQA/meSMQQIA
 v1eyISGg4YhuqTjhh0SsFJkEHaN86bBlKQsjnbDjvA5vYX6tipVbTanrGodpWINzO6oC
 pC8qkf1eMcAoKjFizmY1Za3AwhinxGvXrOm6PESPvBnKW9QgLH7aqwD4w6XLgjzgrUz8
 K/oFYyDgsF+sUU8s46uUC/Up/c0FhywcGARIW6s/s+Mbowaws5uJxQEczPtviKBzWQt0
 rmow==
X-Gm-Message-State: APjAAAV5MC+dffb4w06+m7OlaCZCYWkLDPtNI02E22Pou0k/MjyMwlji
 RlXlqMj4KE/Aqs2S05VDujIyMCrqW+6SszYhVNwpcA==
X-Google-Smtp-Source: APXvYqzB+7qqC2aCzWXE0MNmgGfNbDf4t9nEuO8FhoLsEmYQhfGRk3dkiZsOwJwuQBjWulbCrvlKx10C1GHKJFrSm/I=
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr10032085ota.232.1581886176266; 
 Sun, 16 Feb 2020 12:49:36 -0800 (PST)
MIME-Version: 1.0
References: <20200216194343.21331-1-richard.henderson@linaro.org>
 <20200216194343.21331-2-richard.henderson@linaro.org>
In-Reply-To: <20200216194343.21331-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 16 Feb 2020 20:49:25 +0000
Message-ID: <CAFEAcA9zuhhUa5YFn=TKX45H60x664xs4gjkFsPOk50MaSnnZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] target/arm: Use bit 55 explicitly for pauth
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 16 Feb 2020 at 19:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The psuedocode in aarch64/functions/pac/auth/Auth and
> aarch64/functions/pac/strip/Strip always uses bit 55 for
> extfield and do not consider if the current regime has 2 ranges.
>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/pauth_helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

('pseudocode', but I'll fix the typo when I apply it if
it doesn't need a respin for some other reason)

thanks
-- PMM

