Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521AD3BAD95
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 17:04:21 +0200 (CEST)
Received: from localhost ([::1]:54858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m03fP-0001Bb-Dd
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 11:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m03e0-0000VK-M4
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:02:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39638)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m03dy-00038Y-BV
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 11:02:52 -0400
Received: by mail-ed1-x536.google.com with SMTP id j11so20251010edq.6
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mhwnxbABkYmuicnkqBwjItQg0TfSCc+AThxfH5nR9AM=;
 b=tYIlVursRXzuNe1tfqaQB4z5YZnivxjlq0xjdXvuIpm+VOXVB3vSNd1VRG6nHVQSq/
 sAmqFBTRkQxZp7SXSjfEwLR+jSTaUx7x9PLjWQoR16Vio+h39t8xYjC9AXUx0Mi9aeIB
 Qh8xc4CyxXDGUe7ETnvM8aCsP/CJV1WaeqLaPFFfB/O8NsGboB2M16T6lm43UC7ES367
 OtjkCc8k9/s3OJX9ssM0UEtG24iRquHrZeowf+RkPXO8bFxtANFX4Ppkz7uoAaOYtl8h
 F3H9KVR23XM73xbhVENmerXLKMYgClBtDgryZveRLQr7QUwctJ4Jvlnc/udOTCJzXymb
 Ocbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mhwnxbABkYmuicnkqBwjItQg0TfSCc+AThxfH5nR9AM=;
 b=sSG7WvfHZ5JJWjrfaWSn9XZv+Ne5zEarA2fDeW4CH5N1bwS6OEcR8Ew3xwJDIozwKh
 LxQIA+QxeyHG0zyAuJPZEDCziHyZz4Nj3LxA+FZunTuM0ifVOMhe+X/R0+4usAbjLNE/
 aOYmorXOJM/ocBLpQJFlS5mbF/eemArwCrAqb6N97uCWCXxy+yvtKPDPxTf+dbjMhX2d
 GEWNLP+yrES/1RK1jwTPr4z2p7doJv5e3LAI7laK53+NlZsKemjtHpP5aG2sxjoY6Lpc
 NJfVoWj1Y/jHg3eB43/ZTnazTODI818OtLCWzShQr4QXcZ4lduhZbKegf82jy09wTcR8
 pr7g==
X-Gm-Message-State: AOAM533Rh69cCsEUkx//Ae8FyXL271QG+8yr/4rqzIho5WSTrfGe8y8j
 5wjsRS5xDPBhk6wyFc2Svp0tSDXjOcG7KlsR9pbqTg==
X-Google-Smtp-Source: ABdhPJw8ZNHDUjYQsW7rzUHb9IqObA1uBjbfYxqo/wVp/nryAAdEMuezVYWfL9EMQuwWnMjmlwF+Xao46dheNzaCBxs=
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr10932247edz.44.1625410968471; 
 Sun, 04 Jul 2021 08:02:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210702133557.60317-1-f4bug@amsat.org>
In-Reply-To: <20210702133557.60317-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Jul 2021 16:02:09 +0100
Message-ID: <CAFEAcA-dw5VHb+6t+VCg7bF8-AgUtNv9cO3upHqmk-nfMHDYsg@mail.gmail.com>
Subject: Re: [PULL 00/18] MIPS patches for 2021-07-02
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Jul 2021 at 14:38, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The following changes since commit 67e25eed977cb60e723b918207f0a3469bacee=
f4:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210629=
' into staging (2021-07-01 20:29:33 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210702
>
> for you to fetch changes up to db0725d54983be3b8d5729dd5692db71da4cc05b:
>
>   hw/mips/jazz: Map the UART devices unconditionally (2021-07-02 10:41:16=
 +0200)
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Extract nanoMIPS, microMIPS, Code Compaction from translate.c
> - Allow PCI config accesses smaller than 32-bit on Bonito64 device
> - Fix migration of g364fb device on Jazz Magnum
> - Fix dp8393x PROM checksum on Jazz Magnum and Quadra 800
> - Map the UART devices unconditionally on Jazz Magnum
> - Add functional test booting Linux on the Fuloong 2E
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

