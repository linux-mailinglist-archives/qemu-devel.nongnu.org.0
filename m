Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B42605F3A
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:47:14 +0200 (CEST)
Received: from localhost ([::1]:52520 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olU12-0005LE-0h
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:47:12 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTfT-0004te-O6
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olTAl-0007Ee-CB
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:53:20 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:47041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olTAi-0007lZ-BL
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:53:10 -0400
Received: by mail-il1-x12e.google.com with SMTP id l3so10243273ilg.13
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DTNDz/l5eLihrTPSntrI7D3QK9vR9AxpY1Pa4+67FQ=;
 b=ey1JR3L6VkirgLzp/GBf1nk8seIHV6M6uJgMmWZrxA2Z7ippPU3Oa5yz9cDn01rTHV
 2O8IQKjCBBH3V75rYS7WkkijZiKP0yEDv4LenfZY3KcJc0ObKcBr/We2Kodi1Q7FSEA3
 9+qz86rew5BmPrW0qq+4fiMJeoIgQTPX8SivcNk4PEXNjqlJK4QxPQZsvjmvxfk0baR5
 viU+ccy1GsOuzOFrZcpdwkarhE54cog2SN5B0TXhTFd1i48+M31gqUMm8Z/LlB6qUfd/
 cAP8FZhAiDypF0j2DMRWKLeRWz7m1iThxhB3+Og5vJIP7I6ehvllbz6tuZgFpKBjB6n4
 owAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DTNDz/l5eLihrTPSntrI7D3QK9vR9AxpY1Pa4+67FQ=;
 b=1gT4Nqvgjycp0CXhqE6J298yxcllmsJeZlk9anSiF7d80oZT6FKKZePz9eBWDqlQLA
 t3C0d6ANJDuDU4XaAMYTEcazkg7VUQio012RSOn0UG5L8TiMmPWc2NwbPsIK8IW6Skir
 uNAkPOSQWulh2rQUdl6Dek+P0W0kOKzNGJm5HPA23EabvzrfrrVB3xYJo3+Jib9drmPp
 lIziKMQJmbF6d9f0cTmhFUu+6Wlxc6oJqH6ERwEaNhJUyK3h7I6rBwSydf6G/KlUXL4M
 OrKcuFgJSPHAb9+Qj3b1X1V3UN8a/FMRVLBooXxOP8VMRxAkxbf9FvziOXeSLXrojR9P
 WM7Q==
X-Gm-Message-State: ACrzQf1v/LeTxGb08pjcBd065gAlZ1l+Hf50ZR93JvL1Z634K4kqIUJ4
 hrJuaWYF+CLUmIXtPrd+Zn9Nc1H+LKAy8f03S/rXfg==
X-Google-Smtp-Source: AMsMyM7RVyXVNDdndL5JWVMj0UZhgdg+Jkxde8PNR4qHltr/zy551BjoXCdHsmoNJDTEBuR1NKVM+Ie6LSgeNTjnp0s=
X-Received: by 2002:a05:6e02:1253:b0:2fd:2fb5:c9f7 with SMTP id
 j19-20020a056e02125300b002fd2fb5c9f7mr9511652ilq.129.1666263186881; Thu, 20
 Oct 2022 03:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-6-ani@anisinha.ca>
 <8735bjbzhf.fsf@linaro.org>
 <CAARzgwy96mb9=sQJhDn_ZpjxfTVRX4rCfEpuWnMZFcqYkq8rcQ@mail.gmail.com>
 <87czamai0k.fsf@linaro.org>
In-Reply-To: <87czamai0k.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 20 Oct 2022 16:22:55 +0530
Message-ID: <CAARzgwyM8Zh8qRvLwd1hY8C4X5o8pSxV81DChxrZ5LtOn+Z13A@mail.gmail.com>
Subject: Re: [PATCH v5 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Michael Tsirkin <mst@redhat.com>, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 20, 2022 at 4:17 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > On Wed, Oct 19, 2022 at 9:02 PM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >>
> >>
> >> Ani Sinha <ani@anisinha.ca> writes:
> >>
> >> > Added the SPDX license identifier for smilatency tests.
> >> > Also added a comment indicating that smilatency test is run from wit=
hin the
> >> > biosbits environment/VM and hence is not subjected to QEMU build/tes=
t
> >> > environment dependency fulfilments or QEMU maintanance activities.
> >> >
> >> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> >> > Cc: Maydell Peter <peter.maydell@linaro.org>
> >> > Cc: John Snow <jsnow@redhat.com>
> >> > Cc: Thomas Huth <thuth@redhat.com>
> >> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> > Cc: Igor Mammedov <imammedo@redhat.com>
> >> > Cc: Michael Tsirkin <mst@redhat.com>
> >> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> >> > ---
> >> >  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
> >> >  1 file changed, 4 insertions(+)
> >>
> >> Thinking about this again, why not just merge this with the initial co=
de
> >> dump?
> >
> > I wanted to keep the original test scripts untouched from bits and
> > make our changes in separate commits. That way it helps to understand
> > exactly what we added/modified in the original bits test script.
>
> That if fair enough as long as bisection isn't broken. Do the tests only
> get run at the end of the series?

Yes patch 8 is the actual avocado test that executes these bits tests
from within bits VM.

