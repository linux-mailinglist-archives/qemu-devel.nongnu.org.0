Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3483320497
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 10:09:26 +0100 (CET)
Received: from localhost ([::1]:34150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDOGT-0007JR-RU
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 04:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lDOF0-0006RL-Az; Sat, 20 Feb 2021 04:07:54 -0500
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:42237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lDOEx-000345-4e; Sat, 20 Feb 2021 04:07:54 -0500
Received: by mail-oo1-xc35.google.com with SMTP id g46so1850211ooi.9;
 Sat, 20 Feb 2021 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gnEhJuiDzchCSxyLCQiXs2xfJSD11O4aCEE7Y+To6o0=;
 b=sZsWB0mKBvn0twwLV1xfAd2eoZhUjkNk/BxmRZv1ye7AhI+kPacJarsDnlXG667SUy
 UHrBsIahG7JNmsZkI+MnOGJPQnEOaCPWRr7kCDf3XRtA32w3CHR6Rn/hIpCrl1zbWBWd
 XGu5un3sHhGUvozY3mZjDw9zFqvElqnCRo4JzsjzaoFZybnusX5+9BDSJXaOM5GGC2yW
 3Hh7YIqGR/1CpmwEgLUhZo+Z/LM0DTLfZKzwwpKvZUaGh+uzzDTd8DAN96+VN34w+r79
 EwKMTIP2RGVVa27Fi47PfzUCuilTgQWfmMI9CkxnJ5hunkJBGv2OM//QHr2LhokPfrxH
 Yosg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gnEhJuiDzchCSxyLCQiXs2xfJSD11O4aCEE7Y+To6o0=;
 b=NRVd4rJB6qVQErcz+H/v7c9f5UfqMXBeH7r02XsMm1eZu80G+OmEhlBIms4r4CgnPc
 po0BQtM5uoQmVdNPtJgnGSCUFlJuJKLj6f+//IhqdqCd2hKsMBx53P35y07m/Lyk1H9M
 twjTSLk/W9FfwF1WE56+9TvX0zi28/8Tn1/YsBnKFPWMhUWCshrIZVkrNc+jk0QKfJvC
 FtY3U0fw+TjXxvS/hJgq6TAEo+TeGXmmO0tMIdaue85p5wScyVfy82rkeYzV4/zdYnD3
 rNwFET4fSk+zi9pXdsr82rOQ6O4CHfpOaT7ZTpE6T8JGgWAjDnVIP3P0ffU/Q1pQ5422
 VgaA==
X-Gm-Message-State: AOAM533J42piTjKvprO0qWCOAink49snQ52i+bKah7Lmlxylhbb7iXLm
 +B/yoSrSSpWF4qVnRAtDBInr4Mublw2qdlXrPh8=
X-Google-Smtp-Source: ABdhPJyGe5LQsdi8/CEwLIppXc03mG3bnYsTkFLVBRyK2+VPskgNIIl34a4ZnotM/XzKPl7y21xfIfQovDiaPfZV+/s=
X-Received: by 2002:a4a:dd10:: with SMTP id m16mr601936oou.73.1613812069490;
 Sat, 20 Feb 2021 01:07:49 -0800 (PST)
MIME-Version: 1.0
References: <05BD61C1-9771-4EF9-AD1B-8DAB8DFD127A@hxcore.ol>
 <CAFEAcA8Xuf3WfPiNPqSVLz+tMgvO+6OzKTRQpJ_9Z7MqeO6pCw@mail.gmail.com>
 <b0bb2b4e-4ebe-f4c4-d8ef-191c19c876bb@amsat.org>
 <1025252d-41cd-9d30-983f-1db6c770b063@weilnetz.de>
In-Reply-To: <1025252d-41cd-9d30-983f-1db6c770b063@weilnetz.de>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Sat, 20 Feb 2021 10:07:38 +0100
Message-ID: <CABLmASFMUbvOj7s0yLZ-DyibCXvwQ3CikvxEgGQhxnMWCP1hNA@mail.gmail.com>
Subject: Re: problema compilation
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-discuss <qemu-discuss@nongnu.org>, Yonggang Luo <luoyonggang@gmail.com>,
 nerus <fhuvu30@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Ottavio Caruso <ottavio2006-usenet2012@yahoo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Feb 20, 2021 at 9:42 AM Stefan Weil <sw@weilnetz.de> wrote:
>
> Am 20.02.21 um 00:07 schrieb Philippe Mathieu-Daud=C3=A9:
>
> > Cc'ing Stefan / Yonggang / Paolo.
> >
> > On 2/20/21 12:03 AM, Peter Maydell wrote:
> >> On Fri, 19 Feb 2021 at 22:54, nerus <fhuvu30@gmail.com> wrote:
> >>> Good evening, I turn to you because I have a problem that does not ap=
pear in the official documentation, nor in the different blogs or irc chann=
els.
> >>>
> >>> I need to do a cross compilation but it is impossible from version 5.=
2, when I use msys2 an error occurs indicating that symbolic links cannot b=
e created even though the windows user has permissions to create symbolic l=
inks, I configured this through gpedit.msc.
> >>>
> >>> when I use cygwin with the mingw64-w64 tool chain an error occurs whe=
reby meson says that it cannot find any compiler even though the compiler p=
ath is specified in the configuration script, mingw cannot be used from lin=
ux either due to There are many missing components that cannot be compiled =
by hand because the proper versions are no longer available, how could you =
solve these problems without using already compiled binaries? Thank you
>
>
> The only tested build settings for producing 5.2 and newer Windows
> binaries use Mingw-w64 cross tools on Linux. Up to now I did not try
> building 5.2 on Windows.
>
> Depending on the Linux distribution there are more or less missing
> components.
>
> As far as I know Fedora provides a rather complete list of cross
> packages which not only covers the cross tools but also the required
> other components (libraries).
>
> Debian based distributions only provide the cross tools (compiler,
> linker, nsis). It should be possible to compile all required libraries
> by hand, but of course that is a lot of work. I recently did that for
> the braille library, and it took me about a day to get 32 and 64 bit
> binaries. Therefore I use Debian with the Mingw-w64 library cross
> packages from Cygwin. My GitHub repository includes a GitHub action
> which runs the cross builds:
> https://github.com/stweil/qemu/blob/master/.github/workflows/build.sh.
> That should also work on Windows with the Windows Subsystem for Linux (WS=
L).
>
> Recently (with bullseye and later) Debian changed the exception handling
> for the 64 bit C++ cross compiler. Therefore Debian bullseye and similar
> distributions can no longer be used with the Cygwin libraries. I still
> have no solution for that.
>
> Stefan
>
>
> >> Cross compilation works in general -- our CI testing setup
> >> includes various cross-compile configurations, including
> >> building Windows executables from a Linux host
> >> (eg https://gitlab.com/qemu-project/qemu/-/jobs/1042844159).
> >>
> >> You'll need to be more specific about exactly what you're
> >> trying to do and failing (eg quoting exact commands,
> >> setups, error messages).

Hi,

I still use: https://wiki.qemu.org/Hosts/W32#Native_builds_with_MSYS2
And it works without allowing symbolic links. I used to need to set
that right to allowed, but it seems that is no longer the case and so
I retracted it. Note that I do get a single warning about symlinks:
ln: failed to create symbolic link 'ppc-softmmu/qemu-system-ppc': No
such file or directory. But that does not prevent a successful build.

If you set the symbolic link right, you should also uncomment
#MSYS=3Dwinsymlinks:nativestrict in both msys2.ini and mingw64.ini

Best,
Howard

