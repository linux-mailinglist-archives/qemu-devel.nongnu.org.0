Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4EF415C2E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:47:52 +0200 (CEST)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTMGd-0005w2-FT
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:47:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTME8-0003mm-Ek
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:45:20 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTME6-0000Mj-HF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:45:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id t8so15998124wri.1
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ponlbCRbF/w4STFlNb5cbyjc/Rf1bAzfgQc9BqTzMjY=;
 b=XyqVp0+B0kVkeL+uCP77GPjBwGlAeIDzAiQHS4KyuiSRKv3hYYd+Yz+JaeG1YKhCzu
 EIyHmn+xAQxNEQKJyPvpoDzb4CIQMLRy6uMUgcHof6yjAnELf/Ct5X6n/UN1wT3SxiW+
 NlLs5JPE8DmaB8kG+49P1+xMtCWbvirTaV3GybIduMciYRtJLZFjaPo9N3DwIlz1Fyjr
 NMejznuzTGBtPPrKi63i/VGBC1zdforms0vKekKrlC2k40vsRCxB3EUMTfEqcPQMh42o
 yRGRV5NdDMHPVvgMAJRNRakp/mg9MTVe1kRxTXHa2TSu4dSgEQSTWJ81OMvSVPIwLoWT
 gvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ponlbCRbF/w4STFlNb5cbyjc/Rf1bAzfgQc9BqTzMjY=;
 b=cijhAD4kR5SUJse8yavDhUs672Bw9ide9liOocpqPzW7HUbofuyimrxpLwNHsPmxFR
 ykHZOaCAjHLmSZYohWJocGxwiotV9uBUw3bVj/KY8W6+DEhD0cnRAAsu4gOW2PmTJZR/
 jncwrM6naAtqvt2w27nse36mF5kbrskB5dpfFaGH0o7DvPIB3NylN08qt1R6AlTyD3az
 4VVEK7FvNKxD/yYinhY2+RXv785LJZALEXQZKY9qVVbfi6+SZqc/n/Nzgk72uf6KPJzz
 363nCSpi6JhDevEAKVkJQkPDbe2KNhOueg2YJdqbsPYKK0wJOEz6QOErJBsGqY3SaS89
 c5JQ==
X-Gm-Message-State: AOAM530yuuoYRuOqQxDj7Wg5MD5chLbZNRwUUS1ZAPxMe34DvgZK4A5b
 3Xl5iUxY9P2NgB2li+aopNMePnp/g3MvUzgsTGq4Yg==
X-Google-Smtp-Source: ABdhPJyeARDVDGufV8XKG6WnSX4ujXoeiv/8qbdOIdwOMQPhYWGqocyAKKaRGsGDzJBbY6R11nWpVFNJg4K/yr6lc90=
X-Received: by 2002:adf:fd12:: with SMTP id e18mr4240779wrr.275.1632393913089; 
 Thu, 23 Sep 2021 03:45:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210923081555.3648310-1-pbonzini@redhat.com>
 <YUw5Pglv2lcS2Nz6@redhat.com>
 <aac1894b-e515-cbc7-5b51-aaddc6fc3de4@amsat.org>
 <02853d4e-a708-5141-f38b-0dd48329f305@redhat.com>
In-Reply-To: <02853d4e-a708-5141-f38b-0dd48329f305@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 11:44:20 +0100
Message-ID: <CAFEAcA--6NfnjuY46LbTmpQ6as+uaxQ0aaMwAOUJ4CHaR4xnsg@mail.gmail.com>
Subject: Re: [PATCH] tests: qtest: bios-tables-test depends on the unpacked
 edk2 ROMs
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 11:32, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 23/09/21 12:00, Philippe Mathieu-Daud=C3=A9 wrote:
> > See also "blobs: Only install required (system emulation) files":
> > https://lore.kernel.org/qemu-devel/20210323155132.238193-1-f4bug@amsat.=
org/
>
> Nice and makes a lot of sense.  Regarding "there is probably a nicer way
> to do this with Meson", I would do without all the variables and do
> something like
>
> foreach target : target_dirs
>    if target in ['...']
>      blobs_ss.add('...')
>    elif target in ['...']
>      blobs_ss.add('...')
>    endif
> endforeach
>
> directly in pc-bios/meson.build.

Is it possible also to have meson handle the "symlink the blob from
the source dir to the build dir" which currently configure is doing ?
That would mean we could avoid having effectively two lists of blobs.
(Somebody would need to cross-check that all the blobs the wildcards in
configure are linking in are listed in the meson list.) I guess
the question is whether other parts of the build system assume those
links already exist (ie they don't explicitly declare a dependency
on the existence of the blob and would need to change to do so).

thanks
-- PMM

