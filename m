Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE8F320DDA
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 22:19:45 +0100 (CET)
Received: from localhost ([::1]:38648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDw8k-0005qy-Ls
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 16:19:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDw74-0005NX-Mg
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 16:17:58 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:42693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDw6z-0007HP-Vb
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 16:17:58 -0500
Received: by mail-ed1-x52e.google.com with SMTP id z22so19413366edb.9
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I0C7hw242vZllLknOJh1CpHgCoo8y6Lh3XKKh6Y9tEA=;
 b=PuVOEmmgp0YupYw/2GZkXM57o1seV8b5FtLEnXIQ0e89gYUj4HrMeK0cGjUFrxThCT
 tI53UzbKE8itDQO1p6RH4Rz5twtX5/22fK2Ve7Ec6wi8eLp7Bp//x9ZlI8+r8u8IP6Mc
 BAQjDTjLckA67bSd2QMpLQvqQ+ULgQoZ4hRmPzeUGp/sZJn6sDqtjLiqoZbgOoFIUGxY
 1Ij9gO+CWuzLyL0BbV2kwnRVb0iekqTo8IGqnZxsdX3zbSawo6eJESd8LjrPdeJyC+8J
 Js2t/fGDb3WfbDlc+F3uRNPhLUdblbxbnA10mGbuxDHnhLQo6mbb3VQhweiK1FFJ7ADu
 mp4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I0C7hw242vZllLknOJh1CpHgCoo8y6Lh3XKKh6Y9tEA=;
 b=Ws14rIJ3m2AXoBMgoeThG/U+bAEnyeVmnmetHTt8X8hMjHyPyqD51cRQoRbt2ZCaP9
 GeC8ftn5mQM8KcXfbrVofnkymqdxFuME1Vi7tt8+MylspkdvFAj6C+C+eE2G9WUTLV4F
 Vv8uePlt8ZN/bMmjbwOaOJkHSKBqO8uBPf+whOctn0D/+EmWW6fRJA2hABXUT7D+0/D9
 CccL9vEXT01JjZOrFk3Zrn6cqnDw+q9jtKKlSYJwZ8pbIJoBcZP1YtkRJJthxJprhhbA
 LR2X68+9C6REqX51xh/PDCmutZHvIzDTh1gAehV4HoJk59QPJOiHnf8UwzCw3D+c6zbm
 UEyA==
X-Gm-Message-State: AOAM5330doU1CuyRjy1ZCSCBGEmE5PPtY2ZgTaFolCSU95qJmQykBQxf
 nPhk7BnU+KLrXBnHq+Ona1LX130Rl8U9BNRHaJFcFw==
X-Google-Smtp-Source: ABdhPJxs1ydx2ytHYjpTUf5nGoi9VHF7+0LinG2KlyCB5xU3PHWUbafNMKabw5NKT4gEqTvjde1jiA9nbr60TwxRCBo=
X-Received: by 2002:aa7:dac7:: with SMTP id x7mr3036743eds.44.1613942271907;
 Sun, 21 Feb 2021 13:17:51 -0800 (PST)
MIME-Version: 1.0
References: <20210221193851.2528045-1-f4bug@amsat.org>
In-Reply-To: <20210221193851.2528045-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 21:17:40 +0000
Message-ID: <CAFEAcA-GL-_-DUJTvFjkHCtEjMGBMHOH1pTMZuPvXCAkeqbHYw@mail.gmail.com>
Subject: Re: [PULL v2 00/43] MIPS patches for 2021-02-21
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
 Bin Meng <bin.meng@windriver.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 19:44, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit a528b8c4c638d60cc474c2f80952ff0f2e6052=
1a:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/sdmmc-20210220=
' into staging (2021-02-20 19:28:27 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/mips-20210221
>
> for you to fetch changes up to cc2b4550115baf77d556341f17eb464d18953cee:
>
>   vt82c686: Fix superio_cfg_{read,write}() functions (2021-02-21 19:42:34=
 +0100)
>
> Since v1: Add missing license in include/hw/mips/bootloader.h.
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Drop redundant struct MemmapEntry (Bin)
> - Fix for Coverity CID 1438965 and 1438967 (Jiaxun)
> - Add MIPS bootloader API (Jiaxun)
> - Use MIPS bootloader API on fuloong2e and boston machines (Jiaxun)
> - Add PMON test for Loongson-3A1000 CPU (Jiaxun)
> - Convert to translator API (Philippe)
> - MMU cleanups (Philippe)
> - Promote 128-bit multimedia registers as global ones (Philippe)
> - Various cleanups/fixes on the VT82C686B southbridge (Zoltan)
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

