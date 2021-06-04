Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D4139B571
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 11:02:20 +0200 (CEST)
Received: from localhost ([::1]:48988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp5ic-0003TS-EM
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 05:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5h7-0002US-Fc
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:00:45 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lp5h5-0007t6-8n
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 05:00:44 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 b15-20020a17090a550fb029015dad75163dso5522371pji.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 02:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FyWepY4JjoUfuJ0cMElhDPZ/gV3eWFbuJU2+7J1omBg=;
 b=c0xvKqFQ//gW4YwFjlC7P897izgTCE73MjRlNgKa42VTz5R/vlWimkWNr1u9u0XBuE
 jmRhrp8NeMIQLndkc5PeS/bgKzHYypeWhSb/loxUYDJpoiJWeUdZ115wbf/4l1AqEVyt
 ximiEWedOeIJyLKImYtVZFH1eoF8ceTI6fXTeuWg4edBwZ/0poAPkR3+M3tM3lZVkaQw
 ZprC+bCspJP19AbO32jI7g9S/emQjJCxj3gTYUttJ5nSl/2GwC4EVNiOy0ldfHrRZRZW
 qG8qZqdGiB0cONk64+Bsi9+V8aSqibaHaSgi2SI1Onca3GoYllRQvtge6WzRAG7VFUh4
 dPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FyWepY4JjoUfuJ0cMElhDPZ/gV3eWFbuJU2+7J1omBg=;
 b=iJ7v5E0KmStYliYvZtHHXwv8ovVGmBo2YxplKUBFnszLNw6HyJVbTuh81r+ONt+vDj
 Pl5ukDjBgHmBJnwBmRCUGMUr30tuuOM329qCBh1mcKaBeLGCj2afnytDMrVUJozYMSn2
 RrmIt31Hpnp8FQc5EOSuu/m0PgUiurQ6hnO3Wi4ncxpU7TpuJ4ryfNGRFPk5+/tViJyh
 MJIylsoOp45tiqGqR5/mL8ltO37cmvphvyEfr7bkhaRFlULnVO2m40KBvWtHUc6io72p
 8DiP3gcVZucbISCtp56EJ+gdUxwDZc92HMLO1+HlC2meWjacA3XQI8Ow9dR0ex8lTV0n
 K6IQ==
X-Gm-Message-State: AOAM530mX7QH5KpoXDHajP8wWRvjgcNkDrZg5O7QpyNx2/M9bx1gSDpE
 29nOPpcOL9SLf7D41GbCRcco5NxTLou5BQf0Z3bghA==
X-Google-Smtp-Source: ABdhPJwb33cGxn1NBA8Hi/XeXHHwQfnXy3mrDqo/dmZDkH9GygH465wggfdgcaQ+GqGZyNkrDSooyewCVQBMeGIlXKs=
X-Received: by 2002:a17:902:f68c:b029:102:e6b5:f8c8 with SMTP id
 l12-20020a170902f68cb0290102e6b5f8c8mr3412678plg.70.1622797241579; Fri, 04
 Jun 2021 02:00:41 -0700 (PDT)
MIME-Version: 1.0
References: <OS3PR01MB61515F08F0709D9E22B8DDDFE9249@OS3PR01MB6151.jpnprd01.prod.outlook.com>
 <TYCPR01MB6160FB4A9712F3F5E14D8BBAE93E9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <CAFEAcA_fZ_jC640XrFUCSk6YxzoSmdwDaMDAXoX47mBFKdS9hg@mail.gmail.com>
 <a56283b3-3bb2-d9a3-9a6e-8175cc17b376@linaro.org>
 <TYCPR01MB6160998DCE40866CDC3134BBE93C9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <65323e52-789c-567a-3446-ccb7709877e2@linaro.org>
 <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB6160266A2DFDE090276C44D0E93B9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jun 2021 10:00:07 +0100
Message-ID: <CAFEAcA9vttSZRRX_DS7p6Hgo-4zbhDfkSd0jb-+LJZUOLrumAA@mail.gmail.com>
Subject: Re: [RFC] Adding the A64FX's HPC funtions.
To: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Jun 2021 at 09:29, ishii.shuuichir@fujitsu.com
<ishii.shuuichir@fujitsu.com> wrote:
>
> Hi, Richard.
>
> > Well, Peter disagreed with having them enabled by default in -cpu max, so we
> > might need at least one extra property.  I see no reason to have three
> > properties -- one property a64fx-hpc should be sufficient.  But we might not
> > want any command-line properties, see below...
>
> I understood.
>
> > For comparison, in the Arm Cortex-A76 manual,
> >    https://developer.arm.com/documentation/100798/0301/
> > section B2.4 "AArch64 registers by functional group", there is a concise
> > listing of all of the system registers and their reset values.
>
> Thank you for the information.
>
> > The most important of these for QEMU to create '-cpu a64fx' are the
> > ID_AA64{ISAR,MMFR,PFR} and MIDR values.  These values determine all of
> > the
> > standard architectural features,
>
> The values of ID_AA64{ISAR,MMFR,PFR} and MIDR are not listed in the specifications published at this time.
> Of course, they are listed in the A64FX specification document managed within Fujitsu,
> but we cannot tell how far these setting values can be disclosed
> without checking with the A64FX specification staff within Fujitsu.

If somebody has access to A64 hardware they could write a minor kernel
patch to just print the values...

-- PMM

