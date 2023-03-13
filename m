Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E36E6B736F
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 11:09:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbf6n-0001FL-EV; Mon, 13 Mar 2023 06:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbf6l-0001FB-Ky
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:08:47 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1pbf6j-0003Vt-W3
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 06:08:47 -0400
Received: by mail-ed1-x530.google.com with SMTP id er25so18228559edb.5
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 03:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678702124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNKiyROgdS6LJijuBu/KlKLtOxD2rtVZFzvaWNpfBMc=;
 b=GuF+wBMS54OJR/B2Uk0GKwPh4tFguuT54mjke5JO78xD06aPLoaVLkhqXn2RbNSxVm
 /KIp5lUbw+N42JB7z74cf8I4IHG86NYEQ0NaX+artzmFF630TYwP5IF+Y5kj6awubyoE
 tfGj/vJc+RJL41OciIKLPaZKG61UJ2o4uTOEZF5XEhPRpAC1XY+KOjr8s6QWG2S5Ix1t
 QFB6HS5Vt+FJrFC2o0/aQ6ylip/DtONwILSc6F0YE3lqTy0l0BSbJKOPEcZ85cBiJGf6
 y9CfsZmbygdE1jGtm8eoFnhePGZG5MTarSFH73FXpSimPrLZ41h53/iuwhmqYGtaM6Qy
 LayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678702124;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gNKiyROgdS6LJijuBu/KlKLtOxD2rtVZFzvaWNpfBMc=;
 b=VvNBE+QZuHEct+SqEUQyvOFxSh5qRJMZ3/6Mxwaec6FXRi/I7waSK0+ikWjxV8D/7o
 hjk08OYQF6DQrUpB4qTjaYgz9ZNLcfo7PGl64MvFdZueU7mgvIbfY8QryoJy6OmkTc2H
 eHZDTLFKTA1IdyUSxQrI4GHuFCSKwt7ebon4HE7g/aePjD/ZiJs0QH/AkYYiYGsBEHM1
 1KI8yFHteyjk9KeMo4pCNiZpE9uY1zCIWJ32yKgdNMvAguNaULdizbmVOodr6v6r0H9A
 pALvN9dINqo0lF7chEyjez4NbTtFQCCYwIK0KkTbzn3cM31Vkz2BkCXSftvf67RsV/BG
 JxQA==
X-Gm-Message-State: AO0yUKUgJv2DpNad2ubtBZ5CZpN4UQCG3wSFkvsceuNAyYZlNE1mAMza
 60i34G3LDVHW70VgTeAgi/AEPdNHft32MwJE7hk=
X-Google-Smtp-Source: AK7set/sTL7sZec6UmPRn3ZNNYj0x19jXzJZJCBImmp34964skprMiPJLcIkbrrmvAtiezVZTWoFxX/D99MQanjNBYM=
X-Received: by 2002:a50:9fea:0:b0:4fc:532e:215d with SMTP id
 c97-20020a509fea000000b004fc532e215dmr1498231edf.6.1678702124378; Mon, 13 Mar
 2023 03:08:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
 <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
 <CAEUhbmXoOPXQZaCBHjpwJbbkiAy8Hd4ywALQ_2AiOrPJ3294UQ@mail.gmail.com>
 <5f1e8a9e-d19b-c9c5-ed07-7393de520b36@linaro.org>
 <CAEUhbmX1sO4YBbQZ3HtMh+LEtO0q68zxekXzCCsjG1xC=yS46w@mail.gmail.com>
 <1600686e-a109-8ea4-4e1e-6844658150d8@linaro.org>
In-Reply-To: <1600686e-a109-8ea4-4e1e-6844658150d8@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 13 Mar 2023 18:08:32 +0800
Message-ID: <CAEUhbmXfiJ54_AtLDFQVK_QTiv62M8ob62+jbZQvP1MrCL1ztg@mail.gmail.com>
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Simon Glass <sjg@chromium.org>, Beraldo Leal <bleal@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?UGF3ZcWCIFBvxYJhd3NraQ==?= <ppolawsk@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, Mar 13, 2023 at 6:01=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 13/3/23 10:35, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Mon, Mar 13, 2023 at 4:51=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> > <philmd@linaro.org> wrote:
> >>
> >> On 13/3/23 03:09, Bin Meng wrote:
> >>> On Fri, Mar 10, 2023 at 9:50=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
> >>> <philmd@linaro.org> wrote:
> >>>>
> >>>> On 10/3/23 14:38, Peter Maydell wrote:
> >>>>> On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@l=
inaro.org> wrote:
> >>>>>>
> >>>>>> When we introduced this Gitlab-CI job in commit 71920809ce
> >>>>>> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
> >>>>>> the naive plan was to have reproducible binaries by downloading
> >>>>>> what this job would build, testing it and eventually committing
> >>>>>> it. With retrospective, nothing happened 3 years later and this
> >>>>>> job is just bitrotting:
> >>>>>>
> >>>>>>      Step 1/3 : FROM ubuntu:18.04
> >>>>>>      18.04: Pulling from library/ubuntu
> >>>>>>      mediaType in manifest should be
> >>>>>>      'application/vnd.docker.distribution.manifest.v2+json' not
> >>>>>>      'application/vnd.oci.image.manifest.v1+json'
> >>>>>>
> >>>>>> Remove this job to avoid wasting maintenance and CI ressources.
> >>>>>
> >>>>> Does the same thing hold for the opensbi job ?
> >>>>
> >>>> Cc'ing Bin, I have no idea.
> >>>>
> >>>
> >>> The OpenSBI job now builds fine. I have no preference on keeping vs.
> >>> removing it.
> >>>
> >>> I remember our previous goal was to create CI jobs for every pc-bios
> >>> image but apparently that never happened.
> >>
> >> Yes, and I don't see interest in the community (neither worry that
> >> pc-bios/ images committed are built on each maintainer workstations).
> >>
> >> If it isn't consumed by QEMU, then better remove that job and save
> >> precious CI minutes. I presume OpenSBI itself is already tested
> >> by its mainstream project.
> >
> > Not sure what does "consumed" here mean?
> >
> > QEMU uses OpenSBI images on RISC-V machines by default.
>
> QEMU repository allows building QEMU system binaries which 'consume'
> the following (committed) files:
> - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
> - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
>
> We don't need to run the build-opensbi job to run QEMU: we use the
> prebuilt images.

Okay, thanks for the clarification. I believe that's the case for
every pc-bios image? If yes, we don't need to build these pc-bios
images in QEMU CI.

Regards,
Bin

