Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E617135E333
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:53:39 +0200 (CEST)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLMB-0008Dl-2e
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLK8-0007Kw-Vh
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:51:38 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lWLK5-0006CY-0C
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:51:32 -0400
Received: by mail-ej1-x62e.google.com with SMTP id u21so26712429ejo.13
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 08:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sWHuUM+t6ty1+MYtmPw5s+/V8ltHPHFWLUQK3+/NmOA=;
 b=zFuBxReEfTYQpglHaHpcrha72lbFUX5JUEPJNR8w1oZd9grGygsIIEBn2s7K7V6Zty
 D2NvnJnjjztk96+2z57+uRNVp3kmkwo7O3D8XZrp+StPXkvPoRsD2P8OogMiogNwJelA
 4jfWZkbqQJYK0Nua2j8YNGyoA3mEBQjAS9qhgI56kQlzbCbiF0x5nkxC0DBu8POTTn05
 OSYWMVkietl0pw+mMuTshVgLJZ906FcdHD2xHmrmtf0o0mKLDOlQlxVVLcSRiwHngqqy
 vYkTeaKJNpq0XyHUw01MC50TL1hs4kVB2zaWV/wZkgiI8PCavANIoatwDAMHKq3pARLv
 oUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sWHuUM+t6ty1+MYtmPw5s+/V8ltHPHFWLUQK3+/NmOA=;
 b=BFuz5GxhvoUuRuUZHgLQKLnIyV9HEba5BHDtHxnZPuit9cpm0e67aorxpydb79Q286
 qNR6j6GbV8cqVxXh9fo8WLXSL899BeAdvnerL3zC3pP4SUqfqbbsQIoC2KlSpoxIwv7r
 AzPBakDEIMSBt0K49ANi9QrSN+xbE+EOmDPYkMh2Z8F6etsRJDqM21QWUX298j0bfGl0
 otVOJgxO7u6f0EEm5upMBKHQrCszbLNAYSdDXV1bd4a6ztAW4A+lXUpopN/85ASyHeNC
 r9Q0fMIcok1u+HbjWAetnTI5/viqgRpib86AT/wNPwG0dUK0YqUz4mzcFuungPV0nutQ
 3QuA==
X-Gm-Message-State: AOAM533GLqEAvUAlpg6IFyq35DrpOxivq2QNT9f5SK5MYjuJvB5jfaYf
 ldXP4BzVvYf0BEFOtKpfwzz7aICrYxDkxWzUAQ661g==
X-Google-Smtp-Source: ABdhPJz1t79TfNpl1xOPauM+R2dM3LUR9UrsxCds2Mi0JOnlBvz3UKlvEuVYQ2P/hJ+5zUtROcD2UNaMa6BLgqLVpEg=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr32142274ejz.382.1618329086636; 
 Tue, 13 Apr 2021 08:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210413101131.3480173-1-f4bug@amsat.org>
In-Reply-To: <20210413101131.3480173-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Apr 2021 16:50:41 +0100
Message-ID: <CAFEAcA8KBocHPPArkZEjJ2UyocGVzzg9EOc9mBRFBdB+J=A5vw@mail.gmail.com>
Subject: Re: [PULL 0/3] MIPS patches for 2021-04-13
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 13 Apr 2021 at 11:13, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit c1e90def01bdb8fcbdbebd9d1eaa8e4827ece6=
20:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-202=
10412' into staging (2021-04-12 12:12:09 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210413
>
> for you to fetch changes up to f4349ba966abfe39f5d98694abd7c7551d5c8c02:
>
>   target/mips: Fix TCG temporary leak in gen_cache_operation() (2021-04-1=
3 12:07:00 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Fix invalid Kconfig dependency
> - Fix missing migrated value
> - Fix TCG temporary leak


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

