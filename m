Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E71D664CD6B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 16:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5U64-0007iq-Ug; Wed, 14 Dec 2022 10:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U62-0007iO-A9
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:55:02 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U60-0005C8-JK
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 10:55:02 -0500
Received: by mail-wr1-x430.google.com with SMTP id h16so131384wrz.12
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQ12kQ8GJlUpybjgHiW4SL+jDsM6U/tVV4jQZXS1Pts=;
 b=3tMc5nR8fW0OUso/NAHkN8xIBH1DpyYlfwuoRZZJyRlT7mVNJholywYkeccZPA6rnr
 rmzIV8HkU9otz38sWpsKDm3hcDkdBEaAZQRdii/EtjaAF4oDsJTBjMNbNRuI4roczjqv
 07uHSzWXlP71nzyRsmlXGkQwRvnw6YYNe16Zdt3X1pF7NntSkVbQXKiRMP3ZCcqwWFK9
 ee7UfgAAskIvHR3p3kt9KdZfc19PJ+Z8NCdXPig3Tj222nDY66zcJwF4HST8xXpEOEua
 GMmGfbrtH4sUm24HLeka3tsbXbEM1xWa0XKeXXrSJftHFTJs5N2Odgx5XzlzrtX9eYKo
 Rgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQ12kQ8GJlUpybjgHiW4SL+jDsM6U/tVV4jQZXS1Pts=;
 b=Rj1ghQM0tVxZi8ItogufXLbvvM0mAEGEdyMSMe78HXHe5gQwmRxOPMdQtr5GeryP8q
 h3n/uSkTaeBu20gwp/0o/H//pDzarSAUw03gmRrXCUd0PJdelRdPaBBjyAuW7KUeeaOK
 E5DebvQakbtvQ+eGTC4FcOFQ2YQLfV2b2L2BNLhk0bzefba5SCbFX+LCLUlElxAnadfd
 iHMyMTXX4Mpo66HwT8LR4oKsu3gEXQPfk+TfkgOscxDyk/gjYWgWmRW6XpULjHN7pKq9
 DGHZ32d7f080G5Oea4QhkhSjAZDFKcZdwc9uujHylxdrKvyJrJNz+FvuYy5Um0PkyAZ+
 Wxag==
X-Gm-Message-State: ANoB5plp1mlZjzmzNMX5GIhVibSAQaqAOaGNOHuSM40esoTNGeXmFhoC
 x7DvvG7J2dgYvLO40vBT/qAt8JpWFTcvUsFOEE81oA==
X-Google-Smtp-Source: AA0mqf7VtE8Ri0zRJ0vykO9JSi3b7hf+ODJF1/JYWw0kfIwYtmQbpUPQcZN6Frhv364udyt1NZNC271dtB70mdDsvJA=
X-Received: by 2002:adf:eecd:0:b0:242:3d24:5474 with SMTP id
 a13-20020adfeecd000000b002423d245474mr17258669wrp.681.1671033299225; Wed, 14
 Dec 2022 07:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
 <20221129000647-mutt-send-email-mst@kernel.org>
 <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
 <874juirvrr.fsf@pond.sub.org>
 <CAARzgwzgtP93NKdiC-p_k5LLzgY_eEruFgeGC8wOcH9AvSrwtA@mail.gmail.com>
In-Reply-To: <CAARzgwzgtP93NKdiC-p_k5LLzgY_eEruFgeGC8wOcH9AvSrwtA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 14 Dec 2022 21:24:48 +0530
Message-ID: <CAARzgwyX9yLrok2rePbEqE2O187k68LWwJ6OuO1Uw6ywPzFfew@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
To: Markus Armbruster <armbru@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::430;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 29, 2022 at 3:41 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 29, 2022 at 2:18 PM Markus Armbruster <armbru@redhat.com> wro=
te:
> >
> > Ani Sinha <ani@anisinha.ca> writes:
> >
> > > On Tue, Nov 29, 2022 at 10:37 AM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> > >>
> > >> On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
> > >> >
> > >> >
> > >> > On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote=
:
> > >> >
> > >> >     Added the SPDX license identifiers for biosbits tests.
> > >> >     Also added a comment on each of the test scripts to indicate t=
hat they run
> > >> >     from within the biosbits environment and hence are not subject=
ed to the
> > >> >     regular
> > >> >     maintenance activities for QEMU and is excluded from the depen=
dency
> > >> >     management
> > >> >     challenges in the host testing environment.
> > >> >
> > >> >     Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > >> >     Cc: Paolo Bonzini <pbonzini@redhat.com>
> > >> >     Cc: Maydell Peter <peter.maydell@linaro.org>
> > >> >     Cc: John Snow <jsnow@redhat.com>
> > >> >     Cc: Thomas Huth <thuth@redhat.com>
> > >> >     Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> >     Cc: Igor Mammedov <imammedo@redhat.com>
> > >> >     Cc: Michael Tsirkin <mst@redhat.com>
> > >> >     Cc: Thomas Huth <thuth@redhat.com>
> > >> >     Cc: qemu-trivial@nongnu.org
> > >> >     Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reminder: michael, please queue this for your next PR.

> > >> >
> > >> >
> > >> > Is anyone going to queue this for 7.2 given it's quite trivial?
> > >>
> > >> Don't see why we should bother.
> > >
> > > Completeness?
> >
> > We're about to tag -rc3.  It's too late for trivial stuff.  Anything bu=
t
> > release-critical fixes would be madness at this stage.
> >
> > I recommend to route this via qemu-trivial into the next release.
>
> Sounds good. I'll make sure I remind people again after the release
> and before I go underground for xmas.

