Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B342FA46B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:19:58 +0100 (CET)
Received: from localhost ([::1]:60820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1WJx-0005MH-K4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1WJB-0004up-SA
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:19:09 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1WJ9-0002v5-SH
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:19:09 -0500
Received: by mail-ed1-x536.google.com with SMTP id n6so2903047edt.10
 for <qemu-devel@nongnu.org>; Mon, 18 Jan 2021 07:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YWWrsbTNfv9FJorbw2DbkMZVAP9MSxQJbaGVNiuiDlg=;
 b=Pngu6e1yATe5afscLw+PI76lZ68nL3HcPaB9jH+tjZ5wGOa5dfFDWw2uOxXPZDnz6I
 hdkV0xsLvwo5aOzUmfrP7DPa+daWPaZPM503jOtlBf7C0Edyw7kWkSZhnuPaaRhC3Nf0
 aFJi8aQBgCsIwpGj1bT18O5nG7RFI2dknXNoC08tj4Nm36DAu32maWmtzm3CCyUtSF68
 3UT2/oOSI6uIqHyPHgz4xZZQNzrNlX5OY/hMKNKFZY/2iFazACTqvrihJnKRI2TjtQ20
 een0RRIoO41veBBGLU0dfTz6gjvn3lnorrepwIQgydmHQMa9Xgqi8Qnu7uvjLTbk+fTf
 B+0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YWWrsbTNfv9FJorbw2DbkMZVAP9MSxQJbaGVNiuiDlg=;
 b=kgayz/9PCTrVruKFdnTA3GuQUOa9CJjQ+tQvLS0IepUg9S4mXfwvHoeV3QoRNriSjG
 19wj24bOEaF2ou0HhUTw9VYyMIbiIpRZGeMZBG3tub0dGfXqQ8dk9DF94cONw6roJyPb
 +tMnXnGu72bLSiPAiCKNIjM8JfvjbwQyZyjvojrUjAfzIFHSF5j1cvSp41SqegP1h7Pc
 LaULbK2LlcP23N+Uolexb2RTcvdImJKITEo/8h65OSFjf78EBzVE9mlGBI3uLjYciOPR
 dFdrZKJF1hFMmEjNS/y1NAn+maUO4pXCxCsC6LqxjfUWtTIGtXI15NYGnNIaxaqKoZtb
 cMUw==
X-Gm-Message-State: AOAM531DOiFVCkoiMWyVQQ7DI1GYsx/8juIjcPP61ZE8Id8YG4nlqByC
 b/3ZmyBFM+0BDfDhNhOmWzyNNoZTJywD9jlImHviQg==
X-Google-Smtp-Source: ABdhPJyxHUVNrLnxoYSKsDsEk8iO97ecps5M90n2QnTUCCMs/5fCMUq2KECGju7SebR79w9OxTbZv21qYqq5XfP690E=
X-Received: by 2002:a05:6402:1383:: with SMTP id b3mr4405edv.100.1610983146203; 
 Mon, 18 Jan 2021 07:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20210118111745.20104-1-alex.bennee@linaro.org>
In-Reply-To: <20210118111745.20104-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jan 2021 15:18:55 +0000
Message-ID: <CAFEAcA93v5b7AOww+NPWZ8WOmzZVox6WtUbk8nrntaybPSraJg@mail.gmail.com>
Subject: Re: [PULL v2 00/30] testing, gdbstub and semihosting
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 18 Jan 2021 at 11:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 825a215c003cd028e26c7d19aa5049d957345f=
43:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210115-pull-r=
equest' into staging (2021-01-15 22:21:21 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-and-misc-180121-2
>
> for you to fetch changes up to 767ba049b8f8f8ebfebe90ecaf1b5a9cf8c865ff:
>
>   semihosting: Implement SYS_ISERROR (2021-01-18 10:05:06 +0000)
>
> ----------------------------------------------------------------
> Testing, gdbstub and semihosting patches:
>
>   - clean-ups to docker images
>   - drop duplicate jobs from shippable
>   - prettier tag generation (+gtags)
>   - generate browsable source tree
>   - more Travis->GitLab migrations
>   - fix checkpatch to deal with commits
>   - gate gdbstub tests on 8.3.1, expand tests
>   - support Xfer:auxv:read gdb packet
>   - better gdbstub cleanup
>   - use GDB's SVE register layout
>   - make arm-compat-semihosting common
>   - add riscv semihosting support
>   - add HEAPINFO, ELAPSED, TICKFREQ, TMPNAM and ISERROR to semihosting
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

