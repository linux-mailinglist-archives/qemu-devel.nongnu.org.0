Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A94604C13
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 17:48:15 +0200 (CEST)
Received: from localhost ([::1]:45910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olBIj-0004ZK-6Z
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 11:48:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olB7L-0008WS-7Y
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:36:32 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:41640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1olB7H-0005FD-TX
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 11:36:26 -0400
Received: by mail-il1-x12b.google.com with SMTP id y17so9356834ilq.8
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a0VUOf1ihzodIh5AeK4VjpfVYQS5B8LaciOtxnpYj88=;
 b=dEEOaqjwrOs0YNTtEndIB0uNNosjfkVNU5xt51hhOiNrYDQvpB35YkNhrg594LONlH
 0FQgEtZL/6ZDMHMEWt4ywvBKMdVNLFPL6mOazj0FCiqEfVQd6mteIU1zqqLrEi5dRm4N
 qNX7Agz021nPf7svu0J5TlOLvFIPJDbFSWZNyTSZw9mvVOoGrLL9fMs+PpEuLYAfssyI
 TRYvdFgqYaS8EF6f9q9azZadSPhD8/TpGhHEcBEQY7zTdfW5C+uOg40C6tpWzfolPaGB
 qPjBXBWt1ce1rE+iHlB+tGZgu4KS7X5kfKW4+Y7gVTlsG6CzC/nMFmKDwYiAsQM/86V2
 6kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a0VUOf1ihzodIh5AeK4VjpfVYQS5B8LaciOtxnpYj88=;
 b=TXS5l3oPnOnMQeY89a18PEbi5vDo+FJaxbDGF+JQHNrGDUqM4G7FMaf+rSYL6kp5hz
 oXqVo9KAE1sdYbcGfAEaraJHPi2iv7B39a4JIGZGFaFzbsyJ+w9Oz6OByAC4QLoj9Joe
 HNUh/dCT4vgucklbGjt8k3ZIUJU5TK3OHq4Tc2ullGLxShzaW9JuJ6vqLuqzk+VUBzDs
 wM2w+w8JemvqSTHefEbJzWVHGGvglzG9Tw+XT7HqkRGbyqBeq5u+Ct8CiU9QaZskwJuP
 1KVmr2Us+dD6u+EtgR/Z7I0thKve/wnqjrohPdJmCumMkxA5vfJLdBzX9NYcvvzyJiOA
 aQIA==
X-Gm-Message-State: ACrzQf03MUIOvb8jVnHDykB9cfxDvLtf2/J3e1tNPF4S+Ttpn5OagWhP
 HgtPXtNkL/QdJfWFm5STsOSzdQwQUQkvFs7E9I9Fbw==
X-Google-Smtp-Source: AMsMyM5WFU8KcHGTlfP4qCizresyHqh74E8/mkJxCl5NAmDDA8NxGmb3zWv4OxVSQTJwkgeP+/+parKRVW7br0i+uHs=
X-Received: by 2002:a05:6e02:dc6:b0:2f9:76bd:9f76 with SMTP id
 l6-20020a056e020dc600b002f976bd9f76mr6440636ilj.259.1666193757750; Wed, 19
 Oct 2022 08:35:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221019025828.683113-1-ani@anisinha.ca>
 <20221019025828.683113-6-ani@anisinha.ca>
 <8735bjbzhf.fsf@linaro.org>
In-Reply-To: <8735bjbzhf.fsf@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 19 Oct 2022 21:05:46 +0530
Message-ID: <CAARzgwy96mb9=sQJhDn_ZpjxfTVRX4rCfEpuWnMZFcqYkq8rcQ@mail.gmail.com>
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
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=ani@anisinha.ca; helo=mail-il1-x12b.google.com
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

On Wed, Oct 19, 2022 at 9:02 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Ani Sinha <ani@anisinha.ca> writes:
>
> > Added the SPDX license identifier for smilatency tests.
> > Also added a comment indicating that smilatency test is run from within=
 the
> > biosbits environment/VM and hence is not subjected to QEMU build/test
> > environment dependency fulfilments or QEMU maintanance activities.
> >
> > Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Maydell Peter <peter.maydell@linaro.org>
> > Cc: John Snow <jsnow@redhat.com>
> > Cc: Thomas Huth <thuth@redhat.com>
> > Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Michael Tsirkin <mst@redhat.com>
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  tests/avocado/acpi-bits/bits-tests/smilatency.py2 | 4 ++++
> >  1 file changed, 4 insertions(+)
>
> Thinking about this again, why not just merge this with the initial code
> dump?

I wanted to keep the original test scripts untouched from bits and
make our changes in separate commits. That way it helps to understand
exactly what we added/modified in the original bits test script.

