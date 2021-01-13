Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E812F4F22
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:49:17 +0100 (CET)
Received: from localhost ([::1]:54486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziOa-0000S0-5X
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:49:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kziLw-0007ET-MM
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:46:32 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:37225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kziLu-0006Sc-S7
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:46:32 -0500
Received: by mail-ed1-x536.google.com with SMTP id g1so1773667edu.4
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 07:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tqMrdI/H1zT4pl0FFSAi7YNxrAlX3fH1mqVuob8rtKE=;
 b=AidDCg2DbC7syG+pZ6T1p0q7axfthqTg68Lf9y8FKy4H2RFBfNQSMG6XhNvzcIuCoe
 nYKT8OZ5EMJMJzk1phWb+6ocaoWHgnrELutm2/1Kh1nhVcJJIOdKPdEBd0mmnxihrP/N
 W0H+wLrScepCnqkSE6V5YYmnDXOhPryE5iwYqmAq3GNIncsq6gaGZkuetWuW+jQ2JKye
 Qmwcv8IKzJ2A6DSi5UWJrGqAy/XYrbH3Ybp9sd6DPujzNkQBB1k4adkVSMo7xxaO2k4m
 RU0dd6Ami7vhH9I7BCn4CrukZInmI1mpEGESd8WWLoFBUs4AVZcJvUvKuuC45sZbrpr0
 5r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tqMrdI/H1zT4pl0FFSAi7YNxrAlX3fH1mqVuob8rtKE=;
 b=jQ5S1juUOol+nggQIu2WZqBjSWGvMGxf8Y3LM2+afwVB8dX50Uea23kAbZoL2ZWR8x
 ULEURgJDiAv/fE7sJaWA1EqVe93uvY/HrJ1lHCVIY33YtZrEm/4kViDJUK4LZmDaQsoW
 8pnZ+sKrIgRm9S1r4SN9vuu7+/JJCF2LD06KyykPxjrPEtyYyT/n8ZPQdIfwIblKmpqv
 OWpv8Sy8U0sWZoDOuKEtYJCr1U1XOEht4scUkscDh6BZlwfcXnwJzrFzWymua7+FkjQo
 s8yu5DZGCD1WCv/8eqxyG4uTUHuGpWRfdp87L7yrjlwubhCuEl2yVRRv0/QwyeWo6gu/
 MK+Q==
X-Gm-Message-State: AOAM531x/SbiD3aQwLyxJq1ys9TeXJurI9mMbsQIFzeRaTBkB1GJQ9Rc
 vqgZJfrsInNSB7ELNaMLlLIPjmaDa4s8Lf4St6vgsQ==
X-Google-Smtp-Source: ABdhPJwQ/+QH28IHsxvEFCaY3Z9WC95rmOi6jHB++/UJcocPyJYjAyiXhzRjUUHsjBb1COYXq6Tgq23xDclAWnItX/c=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr2235708edw.44.1610552789113; 
 Wed, 13 Jan 2021 07:46:29 -0800 (PST)
MIME-Version: 1.0
References: <20210113151408.27939-1-alex.bennee@linaro.org>
 <20210113151408.27939-10-alex.bennee@linaro.org>
 <20210113153728.GF1568240@redhat.com>
In-Reply-To: <20210113153728.GF1568240@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Jan 2021 15:46:17 +0000
Message-ID: <CAFEAcA_VJV_rUweM_mwd1AXNWHYQKYZ0uQbwAe+xZYJvozjrmA@mail.gmail.com>
Subject: Re: [PATCH v1 9/9] gitlab: move docs and tools build across from
 Travis
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 13 Jan 2021 at 15:40, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Jan 13, 2021 at 03:14:08PM +0000, Alex Benn=C3=A9e wrote:
> > While we are at it we might as well check the tag generation. For
> > bonus points we run GNU globals htags into the public pages directory
> > for publishing with the auto generated pages.

> > +build-tools-and-docs-debian:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: debian-amd64
> > +    MAKE_CHECK_ARGS: ctags gtags TAGS cscope
> > +    CONFIGURE_ARGS: --enable-docs --enable-tools
> > +  artifacts:
> > +    expire_in: 2 days
> > +    paths:
> > +      - build
>
> Do we actually need this job at all ?
>
> Assuming the depenedancies are in the dockerfile, then all the
> build jobs will be testing docs and tools already, as meson will
> auto enable it.

What I would like to see is a set of "just build the docs"
CI jobs which test all our supported Sphinx versions
(eg 1.6, 2.0, 2.4, 3.0, 3.2), since we've found that Sphinx
is not great about consistency of accepted syntax from
version to version. (Somebody sent a patch for this ages
ago, but it was for a Travis CI job IIRC, which we're trying
to move away from.)

thanks
-- PMM

