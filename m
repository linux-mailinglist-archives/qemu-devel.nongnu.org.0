Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB733DD59A
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:26:23 +0200 (CEST)
Received: from localhost ([::1]:55746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX1T-0007p2-04
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:26:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1mAWkw-0004q7-6L
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:09:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ardb@kernel.org>) id 1mAWkt-0006l4-Rz
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:09:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 68AE160EFD
 for <qemu-devel@nongnu.org>; Mon,  2 Aug 2021 12:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627906153;
 bh=3idm9//Ek5aJaternD/Tcvtw4ZTDsiPtc0iUeg+TeM0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g+zocCKjHzv/xQHuYTX4KmKADIEcyi9cS99zfyouAE0zLb0rQxCffGKJI8kKj+YaX
 NK+yev0ALpRkUxW6i58hV16jrAD3BkyyQ4MkXIDq8W/NQLE/ulwvkghZiqIYDpranz
 Iy0aMRADG/Coe5yl8+1VDDW7IPCY5a2NZDUR3OBOVUtvBehH6ucDrWJJ1/EzrAn9Bn
 95uY26K/457mX4uNGK1pRqEEaZz2/H35HZWyZLuEndx/iBlPh9iFH+zK1nBO16Px3j
 WIpzxcU1flKtAhBV4qrdEsqcYD+WyzCH49FS8xPNT7CKISjRSO3TUFSNvts4SQX01o
 R6ddk6pBeMKKw==
Received: by mail-oi1-f181.google.com with SMTP id t128so23891572oig.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:09:13 -0700 (PDT)
X-Gm-Message-State: AOAM530oOILWsznBNupvs9shnVIWuS6llx2paL8px2611VlOZhuDR++/
 1Xg4QLhqit7ozYkwNOdtWpJd1iIt+PCJA1OeS+Y=
X-Google-Smtp-Source: ABdhPJzOPfXw1N+6fc5IzDY/zMlMFRCnd4fiKmz3qYQ9UPsWkT+PonNHA8xFi+iSfNKfFgT+GZByPmM+j3nXEjGerW8=
X-Received: by 2002:aca:4c49:: with SMTP id z70mr10031156oia.174.1627906152800; 
 Mon, 02 Aug 2021 05:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <f288d6fb-4286-252c-1e3c-f92076dbc51e@linux.ibm.com>
 <5ef559fa-c996-ba42-b9f0-416c7de661c8@redhat.com>
 <7207680a-5667-33ea-7d3a-99f6297f4b04@redhat.com>
In-Reply-To: <7207680a-5667-33ea-7d3a-99f6297f4b04@redhat.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 2 Aug 2021 14:09:01 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEX-9GPMhKRU6eoAzBgi-T=zNWxn8k5KP7bqbY9qB7nqQ@mail.gmail.com>
Message-ID: <CAMj1kXEX-9GPMhKRU6eoAzBgi-T=zNWxn8k5KP7bqbY9qB7nqQ@mail.gmail.com>
Subject: Re: Windows on ARM64 not able to use attached TPM 2
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=198.145.29.99; envelope-from=ardb@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -77
X-Spam_score: -7.8
X-Spam_bar: -------
X-Spam_report: (-7.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Ard Biesheuvel <Ard.Biesheuvel@arm.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2 Aug 2021 at 11:51, Eric Auger <eric.auger@redhat.com> wrote:
>
> and also adding Ard if he is aware of any limitation the TPM2
> integration may suffer for Windows support. On my end I am only able to
> test on Linux atm.
>

I never tested Windows with the TPM2 support, so I cannot answer this,
unfortunately.

>
> On 8/2/21 11:04 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Cc'ing Marc-Andr=C3=A9 who is your EDK2 co-maintainer.
> >
> > On 8/1/21 2:28 AM, Stefan Berger wrote:
> >> Hello!
> >>
> >>  I maintain the TPM support in QEMU and the TPM emulator (swtpm). I ha=
ve
> >> a report from a user who would like to use QEMU on ARM64 (aarch64) wit=
h
> >> EDK2 and use an attached TPM 2 but it doesn't seem to work for him. We
> >> know that Windows on x86_64 works with EDK2 and can use an attached TP=
M
> >> 2 (using swtpm). I don't have an aarch64 host myself nor a Microsoft
> >> account to be able to access the Windows ARM64 version, so maybe someo=
ne
> >> here has the necessary background, credentials, and hardware to run QE=
MU
> >> on using kvm to investigate what the problems may be due to on that
> >> platform.
> >>
> >> https://github.com/stefanberger/swtpm/issues/493
> >>
> >> On Linux it seems to access the TPM emulator with the normal tpm_tis
> >> driver.
> >>
> >> Regards,
> >>
> >>    Stefan
> >>
> >>
> >>
>

