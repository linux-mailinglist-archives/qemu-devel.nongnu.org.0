Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A31E41773D
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 17:05:47 +0200 (CEST)
Received: from localhost ([::1]:50502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmlm-0003PJ-1o
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 11:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTmjt-0002b8-4o
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:03:49 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:42561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTmjr-0001HM-3Q
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 11:03:48 -0400
Received: by mail-wr1-x431.google.com with SMTP id i24so12477150wrc.9
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 08:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hJxPvP4UGRG/Zqtir8/iFF1Qj4FvyGinMMToJ8rsocU=;
 b=d1fBYr3QX7c+iBIoKeNbPEvDGYj6TndKLNkudPn0PuWJj7cBFwzlekXlFSvd6ubYLl
 p6/cYKkc0I/pa4hNtYzEgby5ebnCChrjvLgQL2lgP73dV8+sXKoB8Q1HeqnWfZMxBeoc
 bFSrmadS2CLuuTGCHGiGvpLhlcgFJPaSEYWLYNoC2pYDgfWVCYO2Fo6qRFGwUBE8reG0
 aspBbhOafymIp1BR9DVek2gl7UfDzHHKP/L9eiPj0gp7MElm3hGqag3PWPpCD55p5UCI
 QlRnyqG0OlkJRBob5iAdLPWBaTn86Pri/0r6WNR9JYHYW0KWn0P5I/tJ3a43nf2Hxfmf
 y7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hJxPvP4UGRG/Zqtir8/iFF1Qj4FvyGinMMToJ8rsocU=;
 b=0WXnlcbVMlwoBeuYJqFLYiudbalXPga3yyITTpZ2tf/IuDedYDyYJmpm8Kh2CLvqB+
 /XOf5G6c/WGfrXs7G8KVTTI4LuM1cv46EINvl3Px5QaPL6T4ENBDnxKzcYQ2VbjOdLcb
 dSpIR+ARTYvuLMtbncOG91owewAMjnzGTBoQb88Hgv2p+F92RFg9EHricneV5DqoTL4D
 BEvrUvr7rmFdwfIhcoFAMkVK3VLIPCjDgTK/bKaP2TgFlY+T6/UagyZgl+WcV4fPNcmH
 k7a+/esEL7IQU/GCaktYCrY+dcPGd7QgxSsVEBIF9Ymmhm+RXTfW+SamsyZtPxi/ZkgK
 E5Dg==
X-Gm-Message-State: AOAM532N88kjGwJssj1XFE9l1zyJafGGXNuSqY2+KnBF+vKVdoas4/uq
 aMGzmccvTkNTSu0VjrZqS3XjQpginfYlPwFRggA6ew==
X-Google-Smtp-Source: ABdhPJwkO/H3Hvxg0SH0cUkmharSKj9g0TmoKyaxg7edvTPU4etoo0TU8cxkhdws1QkMV1UE1XtpPhdyNfMRxGUYnZw=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr2603114wmm.133.1632495825318; 
 Fri, 24 Sep 2021 08:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190218140607.31998-1-armbru@redhat.com>
 <20190218140607.31998-19-armbru@redhat.com>
 <CAFEAcA9tzLOwbzO56HjhPUM2yTT7xxfkkOYX3OHVfKT-UC14gA@mail.gmail.com>
 <874kaarwou.fsf@dusky.pond.sub.org>
 <CAFEAcA8mMzzgKyDbUUTh+W0r=5C0_HJv+7MMZ3Rdx-E2vcsRZA@mail.gmail.com>
 <87sfxup03r.fsf@dusky.pond.sub.org> <YU3j859R7riCP1Ja@redhat.com>
In-Reply-To: <YU3j859R7riCP1Ja@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Sep 2021 16:02:52 +0100
Message-ID: <CAFEAcA9zp0O3QWV2d9pEyS-6G79bkq30O=s1oieHnpMvRdQW6Q@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 18/18] qapi: move RTC_CHANGE to the target
 schema
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Sept 2021 at 15:43, Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Fri, Sep 24, 2021 at 03:35:52PM +0200, Markus Armbruster wrote:
> > Peter Maydell <peter.maydell@linaro.org> writes:
> > > Side side note: the JSON event doesn't seem to contemplate
> > > the possibility that a machine might have more than one RTC...
> >
> > Right.  It clearly needs an additional member @qom-path identifying the
> > RTC device.
>
> Are there (mainstream) machines with more than one RTC ?

Probably not many. The most likely case is probably "SoC has
a crappy RTC and the board designer put a better one on the board".
https://www.mail-archive.com/tech@openbsd.org/msg45128.html
has a mention of some rockchip-based board like that.

-- PMM

