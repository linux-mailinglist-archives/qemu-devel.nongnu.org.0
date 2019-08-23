Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D9E9AB7F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:53334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i163W-0003W4-D1
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i161u-0002FB-Md
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:38:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i161q-00084A-MK
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 05:38:46 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i161m-00082k-IT; Fri, 23 Aug 2019 05:38:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id k18so8223433otr.3;
 Fri, 23 Aug 2019 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CNoosYKunD/uXniu/uAfvouJoCQrHWMfwEVoJp+inf0=;
 b=BN6/W99yzYeRgp/UmEIK0yRpD6AQ6IAayDoMbFeujXje8wr70VKgnpaWTh+1LrUFqR
 G6vIWrI9kBQcg7UPNFnT7dF3U7k/KVgRMCNXlI8kOCqZOa7nTkjj5Fd0Kwu19yeZiu18
 +j8G6P9jg19UDPrPaYN7/CqLWvyiULAb2ez2ctAbCUmJ/P78c81LyLutqTe8yoI0ywxU
 yXC+1ls9dP+iP1kb0tTlwNB9n0FRH52J/rRapEZPPXtDI/Yel1tcWxnD9evF+aqPQCeo
 g2xOrlLcEGZJ5YyIVFmsMaRev/niuV/C6KJ5sAbmWZ1CJLBYyXy919WSE6PuEcihcNJ6
 johQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CNoosYKunD/uXniu/uAfvouJoCQrHWMfwEVoJp+inf0=;
 b=JG8lPgSeyACoao9BH0GF+ABXJZUsAguB8bMb9IipqW9/jS3i2V2iK/RerLVIUYfn19
 wkWY82foxURwwE9B/c8fESbwfJD3amyTLlGqNr5SR30dFFPrYaA+5hopJyZrS5KRT1Cb
 46QH6WL/FeIQLVNygh8gLDw1f5InXx8veeGdZzxvlwjkeGbNCpGNou23vT9R3HqhpNUZ
 jGNAJjBP37KXZ61XgFPP+0uT2INvXid40xpJeGZUA9Sg26IUeXIkTs6mlS/KenkjSSDs
 YBb8zDiUjfwF06m97qnJcoDDq/LFNgaUW1QpMNptamgifcNrN9wCcbzKjyPlqENHN3i8
 dV8Q==
X-Gm-Message-State: APjAAAWKjjM0xYjvj8cDfaZ8vv4aoa7g0EgqhnZ5XBAdTtWw8anDt6ET
 0zjW/QWqFXi68hHwqm7f11t3z+OoUiZEQD57dkSaVg==
X-Google-Smtp-Source: APXvYqzzou9Tq6Iw4BR3PzEB2sz08Brm04pmGz0DshLjU1ano+U03+xMp/r7afI0EU5BLvjwS3i83tJL8V6YqJMnxME=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr3308993otr.64.1566553116406; 
 Fri, 23 Aug 2019 02:38:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:38:35
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:38:35
 -0700 (PDT)
In-Reply-To: <20190822230916.576-3-philmd@redhat.com>
References: <20190822230916.576-1-philmd@redhat.com>
 <20190822230916.576-3-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 23 Aug 2019 11:38:35 +0200
Message-ID: <CAL1e-=hTG7eG1eKW1qm03MUxMPvufLKYtubeZ8V2tyCMNKtmsA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: Re: [Qemu-devel] [PATCH 2/3] mailmap: Update philmd email address
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
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

23.08.2019. 01.10, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Use the email address where I spend most of my time.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.mailmap b/.mailmap
> index e1fdc88d25..e68ddd26e6 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -32,6 +32,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> +Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> <f4bug@amsat.org>
>  Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>
>  # Also list preferred name forms where people have changed their
> --
> 2.20.1
>
>
