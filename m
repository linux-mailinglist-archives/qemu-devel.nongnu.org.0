Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488FF55C0E6
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:12:14 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6A4f-00026i-AR
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6A3Q-0000xw-Sa
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:10:53 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:33589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o6A3P-0004Ro-58
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:10:52 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-317710edb9dso115235337b3.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+UQq89eUj6ibQmpOmG8rRHPnrqxkfOi8jJhvLJO9wOg=;
 b=bS3KCd6BCL8hYSBRL8chE5Z3BmMSCHDLDvS5W4G5XuqainfHvv74ozFC2VdKtV5qwX
 qSdzfShwROXNaRV7Vkx8MvNsd35LIHtTffbTS7bJOyZluVIceAwpTpZ+uO3HrifR4t8b
 hVcnAGwi0ef4v7oBnJIygOWoVRQ6vYfesl8IGj+fLLSiaX3ZWVn58bANYfeARoHpkfEo
 6K24n2bDK/FdDzMkrRqYDc4QZ1SZFP79ie9PUIArtTvD2xBAlJYlHsaVoznTCAdRKxj6
 dzuTeuqVRBcsw3fbPiekuVO/hmXgaY1Qsv80dxicsG9EfOgWZK9cE1y8K20xuzVdILG6
 0fFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+UQq89eUj6ibQmpOmG8rRHPnrqxkfOi8jJhvLJO9wOg=;
 b=RpSQj7Eb6RGeFQdfXOSGqcsxYTg3Gm5ToixVd2ymyiabRm1hKgGHFqkl/STWnq0/gP
 ZY8yudiu3MXpbn/g78VuQXxx4rwNjM/b9+qXqIsLscHshcH9hApg5NPR7p+Gfi0Al87Y
 /5JkMxyGyCGE1TpVzBYORiu36I1UO8gX5gaGO9Eei/wqZnI9koBbXza7S7VWWUM9Xxja
 U96A9Z7QBko29coNy8usDbzjs5y+dHOsEuTBfB+Rd9yxN7K+sFkI1pAv6dv9UGbaOzVf
 9ttG04sKsePnRPH0gJ4UC5N9If20mFH/V32/RHwzfFbooWuKtv7oBq/FDLQFlyhAN59w
 VsNw==
X-Gm-Message-State: AJIora+dS7LDgPbWz+3LMSWDf0yBXR2E/5bdkiHGvOf30ty3sSqyuTRF
 aV6PD7YB22Qjmt+WiBmoB5bKrul3fKk5OdRiupIrlQ==
X-Google-Smtp-Source: AGRyM1teAWkBS+5gZoIMNGUfWUw45WPuQONM3gNvhTEecpPh71pB0erkpQr1T07fN3MQ07vqHMmFwGiEYSxrv3fNeAU=
X-Received: by 2002:a0d:d712:0:b0:317:a108:9778 with SMTP id
 z18-20020a0dd712000000b00317a1089778mr21255235ywd.64.1656418249885; Tue, 28
 Jun 2022 05:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <7bf5976e-8277-7c78-f412-44f7be8754f4@redhat.com>
 <YrqyWhu8ThAcUGI4@redhat.com>
 <CAARzgwyZNAYK3p16wjeykoCB9C+tmznY+OZAM-vw+Pn_4CdMqQ@mail.gmail.com>
 <Yrq6anPW60FkjmK6@redhat.com>
 <59150265-44ed-0b14-df1c-42e3f2e97b7e@redhat.com>
 <CAARzgwzST+3PjEomfbweeB0KYnmO0yoxVJWiV9+9A_h32swnyw@mail.gmail.com>
 <YrrSFig7Qo/PKqNx@redhat.com> <20220628060510-mutt-send-email-mst@kernel.org>
 <CAARzgwwdWkqXnP=QHqme-GACa5LvfN5cO1PZpFhZ-G6NR73sEw@mail.gmail.com>
 <YrrbHYJn5soL/V6n@redhat.com> <20220628072610-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220628072610-mutt-send-email-mst@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jun 2022 13:10:12 +0100
Message-ID: <CAFEAcA8Z9uasRtyf5=oFx7ScFO_+T01ooH-zWLdkjECMaZpuQw@mail.gmail.com>
Subject: Re: venv for python qtest bits? (was: Re: [PATCH 11/12]
 acpi/tests/bits: add README file for bits qtests)
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Ani Sinha <ani@anisinha.ca>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, 
 qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 28 Jun 2022 at 12:50, Michael S. Tsirkin <mst@redhat.com> wrote:
> I think the main difference is not even in how it works, it's
> in what it does. Which is check that ACPI tables are sane.
> Who cares about that? Well developers do when they change the
> tables. Users really don't because for users we have the expected
> tables in tree and we check against these.

It wants to build and run a big guest binary blob -- that to me is
the main difference. Users don't much care about any of our tests,
whether they're under 'make check' or 'make check-avocado' or the
iotests framework. The reason to pick one framework or another
is mostly I think whether the properties of the test are such
that one framework works better. Avocado is (for better or worse)
the one we have for dealing with "actually run a guest machine
with a big lump of guest code in it".

-- PMM

