Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C8460227F
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 05:21:56 +0200 (CEST)
Received: from localhost ([::1]:33172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okdAw-0004jk-QG
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 23:21:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okd85-00034s-7W
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 23:18:58 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1okd82-00071v-Oo
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 23:18:56 -0400
Received: by mail-io1-xd34.google.com with SMTP id r142so10752090iod.11
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 20:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E1ofLRgctu9BRPwEj0fLsQqZAEc3CfN77GzyREukJAo=;
 b=TBgN5h+hkEyZLsyWVV9EsDJocWpBF/Gkr9mrZMJaLuaEBCp445CPB8OCC432yqa43N
 XsBdZZOhHe5T4KEYOieUAOi2lGidHlbJdQ62XTn30foSZJEAxSEwmzETOdWcEBMvDPAC
 LWQmJKAW2nY7tjGR1rgahZ4fXkDgoTrUsJXY12VwkL+wnj7JLKCZaeLtcw9ELR06kzXK
 cDO5VDflxP0uv4tT/cx/65uC1lZn54yMHL/h+R08zT1QA/NZ/rZI4A2a45+erLxJMs8y
 1OsU5NN3ZFYG0pzYSUSnVd4U+tca+bieocZj2WrQUAglagE5yHBMdji7yT/tV8W+zP20
 n+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E1ofLRgctu9BRPwEj0fLsQqZAEc3CfN77GzyREukJAo=;
 b=ho0LN3ERXWNF5Rn05RGtNPVzayeuYfBqE6tB5ncHhNIK75/QkOIWlL3cEyKP8rDtoE
 pRnUT/lqYO3X/FybsQoDefBwFujXVnXnBtvrYGUW8nSjx4ExDURcBdW2SAzh7nWtJ2R/
 EsldaljNJwpZ/o0rGaNK842ohghw/nKmKC/rSGnRmlYpZTyuwrQlXKEshbhhAiTZiM1e
 1y+pt+fKdr+/ufkSa/ipZu0n0QFusfwjHcsaJF7jxipQ5Fr3/AjUaxDjA3nDTQr1TAhk
 YQDXV2CZAhF9TS5iEK+rZSFQYH1zcagttwuaM0HDosYiTJg187ME8lkeXACrqy9bQAKO
 JyPw==
X-Gm-Message-State: ACrzQf14e1tuT551ocJeq9cR69IH/1ILbONVJqe7QxeP430xmM3MWcfg
 CXFC6dTQXcTCEYdEuGbbEgpqvG2k8RWRXHAgPZdutg==
X-Google-Smtp-Source: AMsMyM6Nk/THgwwnKcUcXtR2hcIf3FE3COCrpa1WA/msiMralV0TEuk/197SwHu6BI3CUbCXYgiE58lbzmugxGoBubI=
X-Received: by 2002:a05:6638:12d1:b0:363:e250:9ed with SMTP id
 v17-20020a05663812d100b00363e25009edmr889637jas.309.1666063132294; Mon, 17
 Oct 2022 20:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221014173508.222823-1-ani@anisinha.ca>
 <20221014173508.222823-2-ani@anisinha.ca>
 <5df81a97-8fd7-8ee6-f631-7c979a2e58a0@linaro.org>
In-Reply-To: <5df81a97-8fd7-8ee6-f631-7c979a2e58a0@linaro.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 18 Oct 2022 08:48:38 +0530
Message-ID: <CAARzgww4dZH0E9q4EGNnjrLdvb8ZMkewOVT6kYvShU1XZXSDaQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] acpi/tests/avocado/bits: initial commit of test
 scripts that are run by biosbits
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter <peter.maydell@linaro.org>, 
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd34.google.com
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

On Tue, Oct 18, 2022 at 2:43 AM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 14/10/22 19:34, Ani Sinha wrote:
> > This is initial commit of cpuid, acpi and smbios python test scripts fo=
r
> > biosbits to execute. No change has been made to them from the original =
code
> > written by the biosbits author Josh Triplett. They are required to be i=
nstalled
> > into the bits iso file and then run from within the virtual machine boo=
ted off
> > with biosbits iso.
> >
> > The test scripts have a ".py2" extension in order to prevent avocado fr=
om
> > loading them. They are written in python 2.7 and are run from within bi=
os bits.
> > There is no need for avocado to try to load them and call out errors on=
 python3
> > specific syntaxes.
> >
> > The original location of these tests are here:
> > https://github.com/biosbits/bits/blob/master/python/testacpi.py
> > https://github.com/biosbits/bits/blob/master/python/smbios.py
> > https://github.com/biosbits/bits/blob/master/python/testcpuid.py
> >
> > For QEMU, we maintain a fork of the above repo here with numerious fixe=
s:
> > https://gitlab.com/qemu-project/biosbits-bits
> >
> > The acpi test for example is maintained here in the fork:
> > https://gitlab.com/qemu-project/biosbits-bits/-/raw/master/python/testa=
cpi.py
>
> I missed the previous iterations of this series, and wonder why copy
> these files in QEMU repository if they already are in a forked
> repository. Why not add the fork as a submodule?

Check the thread "Why we should avoid new submodules if possible" in
the mailing list.

