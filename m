Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B993314C77
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 11:07:39 +0100 (CET)
Received: from localhost ([::1]:46312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Pvm-0002T6-H9
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 05:07:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9PtF-0001Mp-MR
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:05:01 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:40709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9Pt0-0001GA-EN
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 05:05:01 -0500
Received: by mail-ej1-x62d.google.com with SMTP id i8so30268550ejc.7
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 02:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/8Amys/1Fq7+1GJjiEQjzi+HCU0iKIhG4JaXd/UVJ7Y=;
 b=J9VyxBMR5oEWwR1Cfc+qbCgfsxmOOUSgPUeVdStt2QOfHD9I6pxDPh4c7D1N1ng5EZ
 vOFqAgdFODuX8/cU9EtOEdj1ORYTf30sBxKe9c1TW2CQhJ9iZc3BXNwXdy4Py1Oot3hK
 EQUga6m3S2GKMCGKWJo/xs+w+k3dixMJEzHQZvwvw01BRm5c+mVIpJkCXcRHdxw2ppgm
 B3Zibqg765DxP5tnzJL1Ths8NOslo+UjPPSRkmJqHTKoWe0NbaRw9sv5soC0NKVARHyL
 O1IQ2DzyfK1VWDiBgNJ35jcRRi05Srxrlid3+UmADvI4zzZFGtWi/X7afJhDiXw0c/m3
 5q0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/8Amys/1Fq7+1GJjiEQjzi+HCU0iKIhG4JaXd/UVJ7Y=;
 b=pTaD/lD5glj5KjqPZHRa25loCJA3KuVw90po0ifXM7NfWkrlRjD2P86pV6OUmbBbpX
 82UJuBFxgjNGk5eZKsxb2E5+gv6wbrkxVZqlYJrTuIUHLx5kFTEodw0wI0UfxfIRyJCO
 /X/JealLGvF279z6ILzgNkFPhzF67EhhmELdF8foLsBcwJi2/H9hcwlDjJZJ2YTrdVXr
 CxDdQIwXIGkezcYz6Rf5GaPgdg2n8fEQkzs0VUg9+xMMQqjd+ekhFSPcCqsiIuGBvLum
 5BWVG0LoJQDZ0BTabqf+eIq/fxWjsyoB4a3GmBTYUP9Rk5tbdjUSckMBcqVE8XnTwvTy
 5wjQ==
X-Gm-Message-State: AOAM530c9wAkAH4xpxJiI59xJA1OGnm9Av3KL1Bj/HmDN6OeV0OIfnjD
 C52A/Ix3yrZUbhdyoYgV3M4h7PrlIkJGJuabu1IwCg==
X-Google-Smtp-Source: ABdhPJy4L67HQ9LMQwIc9Q31MD+owCJXpmTH+AF3lf0avFwLKsOT2tBtnv7STm+kCzjhiOG/Xtg+ef1Uyw+3JDeWFm8=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr12978841eje.56.1612865083264; 
 Tue, 09 Feb 2021 02:04:43 -0800 (PST)
MIME-Version: 1.0
References: <20210208133711.2596075-1-philmd@redhat.com>
 <CAFEAcA-mrzsrOiNw3Fjes=AAg=X3xXh40DZ5fMO=+dA6YUonaQ@mail.gmail.com>
 <45a65770-787f-1e47-12a0-0c828b2ed140@redhat.com>
In-Reply-To: <45a65770-787f-1e47-12a0-0c828b2ed140@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2021 10:04:32 +0000
Message-ID: <CAFEAcA95zb3Rg9M8LFFKd7TqRO5=NQF8cEtROKeWpn2t=k0NMQ@mail.gmail.com>
Subject: Re: [PULL 00/18] Integration testing patches for 2021-02-08
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Feb 2021 at 20:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> On 2/8/21 9:06 PM, Peter Maydell wrote:
> > On Mon, 8 Feb 2021 at 19:58, Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com> wrote:
> >>
> >> The following changes since commit 5b19cb63d9dfda41b412373b8c9fe14641b=
cab60:
> >>
> >>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210=
205' into staging (2021-02-05 22:59:12 +0000)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/philmd/qemu.git tags/integration-testing-20210208
> >>
> >> for you to fetch changes up to fce8a00839564bf620b6c2957ed924197e54a12=
7:
> >>
> >>   Acceptance Tests: remove unnecessary tag from documentation example =
(2021-02-08 14:31:03 +0100)
> >>
> >> ----------------------------------------------------------------
> >> Integration testing patches
> >>
> >> Tests added:
> >> - Armbian 20.08 on Orange Pi PC (Philippe)
> >> - MPC8544ds machine (Thomas)
> >> - Virtex-ml507 ppc machine (Thomas)
> >> - Re-enable the microblaze test (Thomas)
> >>
> >> Various fixes and documentation improvements from Cleber.
> >> ----------------------------------------------------------------
> >
> > gpg thinks the key you signed this with has expired. I tried
> > refreshing from the keyserver to see if the expiry date had
> > been updated, but it doesn't seem so ?
>
> Oops sorry. I signed the same tag with my other key (because
> re-signing this one is not straight forward).
>
> Do you mind retrying?


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

