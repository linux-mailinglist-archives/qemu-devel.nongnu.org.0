Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BC46A33E4
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Feb 2023 21:15:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWNOz-0004gM-E0; Sun, 26 Feb 2023 15:13:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWNOx-0004g5-0q
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 15:13:43 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWNOv-0007EV-42
 for qemu-devel@nongnu.org; Sun, 26 Feb 2023 15:13:42 -0500
Received: by mail-pl1-x629.google.com with SMTP id y11so561168plg.1
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SCdbcZwfJDUcfhBRHtuAc9KRoqltNB5eZFxswt1VGME=;
 b=I53VnQc4UQ6A0BO+S5YcNRPLuw61CBxasC5rkV43kHVcOt3A8mRzlw9dWGwTYziII/
 u+Om8Pdm3wUNVOmto6M7v6hOCdpFD6OQiQmY9wsQNTqyGmsmjS+/PwZtfBXl1ISOFq+Y
 5VU2cEoIt1UyXBqBDZKrh0ktk7bwBCOQ+lBvkB0BbhB41jaU7B9nE0PeCjuIZV5mRXS7
 6vwbN4PyvEpHLfRjGkJVRM9xyNfJQsDxWK5VLXSnUQ4gBud/v7G6S6LHeySwopTUXeVn
 UWfvqzhS+COHOZaGD+6YL0fyteRimfev1mAzqjtNzqHNaLe0JEJ/8q1ajl4WZABmbzFW
 c82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SCdbcZwfJDUcfhBRHtuAc9KRoqltNB5eZFxswt1VGME=;
 b=eY8GqGZwDS6lhv6N0dhx+GGMVaZeYSm11nDcqrPC8z+G7NZbIsDmkI5dw15j0SvL0p
 Meu4b0ILaSE/iOsohh7qqSaes1hJYXcxjVX/kynI7gArNMx6Nh5nY7UJYIsuds7iZY0n
 XTApqWku3pbuhto7pLi5hdJpkX6oHx+bqpGx4lWqiB4vGC25+VrtTRc43Oao4NaHVxst
 7Z6n+ZLiIlTyjLRdN8sOpUrfg4BVuH8MnXgz02RpZjswwQkMnaR6iQ/C5ax3ZCTbehZ6
 RCT/UUQ9PPu7daxviawAE+4h9RXGTiVt/YJkQ4ajO8lLHZIc9wpBoPzRb9Ug8ob4N9XR
 VoiQ==
X-Gm-Message-State: AO0yUKU7k6Xw0i3isU3QvL9J0IgGDyzLUBpdYoH4MkMouhnxj1rxIJc1
 iLpTIIJUdPseiBlGAcl3Yn+/PqQpDkWGKXy0RDt9OQ==
X-Google-Smtp-Source: AK7set/tOH9fVIRGQ6nWa8hft7aple/xoaKYFas3LMQzDPY0ONM12URL+HyIdpXmTm+hqzqDXFCdWRotbVHPXjAqW5I=
X-Received: by 2002:a17:903:1313:b0:19a:b151:eb83 with SMTP id
 iy19-20020a170903131300b0019ab151eb83mr5182154plb.13.1677442418770; Sun, 26
 Feb 2023 12:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20230223155720.310593-1-alex.bennee@linaro.org>
 <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
 <87sfeurgb4.fsf@linaro.org> <8fe14d63-ebe1-4a1c-ab1d-ea96718e278e@linaro.org>
In-Reply-To: <8fe14d63-ebe1-4a1c-ab1d-ea96718e278e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 26 Feb 2023 20:13:27 +0000
Message-ID: <CAFEAcA8Ae0vQmo4AZkkKKJHruR5EeC9kxVYHcPzU23gurwa0zw@mail.gmail.com>
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 24 Feb 2023 at 21:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 24/2/23 20:52, Alex Benn=C3=A9e wrote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>>
> >>> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cd=
ce69b8:
> >>>
> >>>    Merge tag 'net-pull-request' of https://github.com/jasowang/qemu
> >>> into staging (2023-02-21 11:28:31 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>    https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-=
1
> >>>
> >>> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda=
2c:
> >>>
> >>>    cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0=
000)
> >>>
> >>> ----------------------------------------------------------------
> >>> testing updates:
> >>>
> >>>    - ensure socat available for tests
> >>>    - skip socat tests for MacOS
> >>>    - properly clean up fifos after use
> >>>    - make fp-test less chatty
> >>>    - store test artefacts on Cirrus
> >>>    - control custom runners with QEMU_CI knobs
> >>>    - disable benchmark runs under tsan build
> >>>    - update ubuntu 2004 to 2204
> >>>    - skip nios2 kernel replay test
> >>>    - add tuxrun baselines to avocado
> >>>    - binary build of tricore tools
> >>>    - export test results on cross builds
> >>>    - improve windows builds
> >>>
> >>> ----------------------------------------------------------------
> >>
> >> So I've been applying pullreqs relying on a combination of the
> >> private-runner CI jobs plus using the free minutes allowance
> >> on my personal gitlab account, and ad-hoc local builds. I'm
> >> a bit reluctant to do that for this one though, because it's
> >> touching all the gitlab config and we won't be able test that
> >> that is OK until we can do a full run with the standard config.
> >> What do you think ?
>
> What is the alternative, waiting 5 days up to March 1st?

That would be the other option, yes.

-- PMM

