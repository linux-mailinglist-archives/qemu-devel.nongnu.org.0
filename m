Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABDD6A21DA
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 19:55:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVdEC-0008N7-1O; Fri, 24 Feb 2023 13:55:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVdE9-0008Mx-9H
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:55:29 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVdE7-0008N0-Id
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 13:55:28 -0500
Received: by mail-pg1-x52a.google.com with SMTP id p6so136793pga.0
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 10:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gcwIDeJueMPoyB4ClPDkalOTu7vJnUXE6rxTLZRJu2Y=;
 b=FL3ldqO3YlQQIr+aMlAEMjsWYoQ5gC2P++N7Khr37hBt+WPbEzhzQu+AnsAflOkVkq
 OGkcpvAowr+8eBE1DxdUxZph0Z7jEeUZ+TgshOSy0XA5brsPNmvjnuoScWGZx2LPG3qB
 LkDd8l3w3A7aCfnuLqXII2lvtobeZkzWlbCchPxfqYGLTGlcmhL70jLuBFlUl2BBBmr5
 O0fcAen6k7rcX9xAxMmeDun25+/jYpPAb9UulBsNqkNnIfIt5QyO/PsBMj3CeR+w+i26
 +YcvL32vLajww0uQsjS6YRft9v4LgY4VicW9ALild1Q/vAM4/ig7g7SaZF8J1msh9p3B
 Koug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gcwIDeJueMPoyB4ClPDkalOTu7vJnUXE6rxTLZRJu2Y=;
 b=4g2+JHLc9ECs/pXOw21asVHWTkhvv6z0xiaq+4VL1XGK07ehWSQ2bVopRzReCNA3I7
 hSypBruf8SB5fkSWBkAN5/ULNOuDrQJC2b3qOa4OeSuU7khNykk5zlxaT6YAfmC5Y7MY
 4Bova4T78JMfwuEv53Yl8z5XKY1VtUkKL6EyzwU8V72ctEuB35FlZby7lmmnk9AsuFp2
 ijT8T1f+4umzHkN6mhH5BXUUGWoodNf3iSLuttMoC46A3D/PPPDiBjdcKVuqoL5vydPK
 XlGJxMKpSvW1zQiTQ9TrI9Tj9a13bqaeZmXP4QVfUIxB1x+VHv1yDS4lkrLJK4Kt6OT0
 OZfQ==
X-Gm-Message-State: AO0yUKVVqfURY+f/uVqEOmWiCH/dloibpRXXDFIdS7wlCsjFfVNkfQMr
 8P5NxO+L8jCx2HpqnAx5JVeQ1zEJdE1Tx38BtYcOIsjeJx1DuA==
X-Google-Smtp-Source: AK7set9fXMsLOiFw+0kZW5YONo+55Dm8oGfIJ3o36Fyg/xWGDQfOGTWAZPq3JUy9+NaTehjn2nxxXVGRGog0NKhw1b4=
X-Received: by 2002:a62:ce47:0:b0:5db:b9b9:ba05 with SMTP id
 y68-20020a62ce47000000b005dbb9b9ba05mr2096118pfg.5.1677264925761; Fri, 24 Feb
 2023 10:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20230223155720.310593-1-alex.bennee@linaro.org>
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 18:55:14 +0000
Message-ID: <CAFEAcA_bqLjiF6VHABTRop7HsdgTpd1KVJzTgpXvXgo+uuABtg@mail.gmail.com>
Subject: Re: [PULL 00/13] testing updates (gitlab, cirrus, docker, avocado,
 windows)
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52a.google.com
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

On Thu, 23 Feb 2023 at 15:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit 79b677d658d3d35e1e776826ac4abb28cdce69=
b8:
>
>   Merge tag 'net-pull-request' of https://github.com/jasowang/qemu into s=
taging (2023-02-21 11:28:31 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stsquad/qemu.git tags/pull-testing-next-230223-1
>
> for you to fetch changes up to e9969376f01180d7bcbee25ae8333983da7eda2c:
>
>   cirrus.yml: Improve the windows_msys2_task (2023-02-23 15:48:23 +0000)
>
> ----------------------------------------------------------------
> testing updates:
>
>   - ensure socat available for tests
>   - skip socat tests for MacOS
>   - properly clean up fifos after use
>   - make fp-test less chatty
>   - store test artefacts on Cirrus
>   - control custom runners with QEMU_CI knobs
>   - disable benchmark runs under tsan build
>   - update ubuntu 2004 to 2204
>   - skip nios2 kernel replay test
>   - add tuxrun baselines to avocado
>   - binary build of tricore tools
>   - export test results on cross builds
>   - improve windows builds
>
> ----------------------------------------------------------------

So I've been applying pullreqs relying on a combination of the
private-runner CI jobs plus using the free minutes allowance
on my personal gitlab account, and ad-hoc local builds. I'm
a bit reluctant to do that for this one though, because it's
touching all the gitlab config and we won't be able test that
that is OK until we can do a full run with the standard config.
What do you think ?

thanks
-- PMM

