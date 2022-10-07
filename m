Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154E65F73F7
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 07:34:26 +0200 (CEST)
Received: from localhost ([::1]:45692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogg08-00074K-MJ
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 01:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogfxX-0003Zc-FU; Fri, 07 Oct 2022 01:31:43 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:36828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogfxW-00011j-0o; Fri, 07 Oct 2022 01:31:43 -0400
Received: by mail-qk1-x735.google.com with SMTP id i3so2343665qkl.3;
 Thu, 06 Oct 2022 22:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ksTe0gu7LiL6mzvprvgp+2nEYKgZPm4Kjth8b5lSvQQ=;
 b=URRzxhr2YDuYsL0VVvYkypMyD7Xl9kb+3SO0l5EONeSExqL/vpy6b97TkpeDXu7wMA
 66S1s8SQx3m0Wv2DmNnXA8bSwwcPAxBGn5luR0rAFebjGb/GC4C7uxp5GuKvqtnj3gTT
 d/KNkQqglK310d8KOcmbwTi9lLTYFPlfacclwnzxl22/6kQYWsOmRRbSj8UreONgI4wH
 vWkW2fFwnN+wro6pRTBvQT5nrfSMBRG24UxD4T29lQXXzIoyI1EWBe7IyxHBtDH8gK3o
 CM1CLVtq0dZKA4vuAuUrNbJTs3UnrbZC+CNSwVn4SGvOxH69QHR3kuTUdj7VaKmTT6RP
 xmdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ksTe0gu7LiL6mzvprvgp+2nEYKgZPm4Kjth8b5lSvQQ=;
 b=ewmPO1i8TL4zzmZ+OLxpOGKHvyO3XDQyucfAcNxravV9XxTHkZkfgRvWZq3pZPh5VM
 FnznL4VnG8zlvbobtOJxlMCPY3h6FqBgrgMa3Q11WuUNBgrWxiaqUGKz5VPexFJuLoXN
 HjseXNw8W6TOaUAvxYNQeEurmtdyLE1pmS+Y6Pa2HhMAL+S9swZ3Snrb+WNRydiAwT3O
 1oDWU1Ol2Dtrnoiq5gbEpFv61nhJlmyqIcZi2h7B6oCqbSCgzbZyjuJlNMR+nRJ7okVr
 9iw/zviLiic5LLyxYJhAin1ZeFUU85vHyrONl9lKuVW3hYq6573zt9lDR9e/FWC4fBxn
 Zc+w==
X-Gm-Message-State: ACrzQf23dhCNlXZBq2Col8kOBDuT6NPPge33vNb8yqJRfnn3okMWP2q9
 pDWxyIK5MtzaWqQ6xE8GcfArvXEDh5EN1BoKEHg=
X-Google-Smtp-Source: AMsMyM5q7sTxWJVtVzE/oMqWKqNo71XXUcvh8gWq2aKft+7KCzVP2pep52JyH/821+7nYtZGX4A6pWVtbRgEK6Cioc8=
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr2610161qkb.376.1665120700445; Thu, 06
 Oct 2022 22:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <87ilkwitc6.fsf@linaro.org>
In-Reply-To: <87ilkwitc6.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 7 Oct 2022 13:31:28 +0800
Message-ID: <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
Subject: Re: [PATCH v5 00/18] tests/qtest: Enable running qtest on Windows
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, 
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Kevin Wolf <kwolf@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x735.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 7, 2022 at 4:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > In preparation to adding virtio-9p support on Windows, this series
> > enables running qtest on Windows, so that we can run the virtio-9p
> > tests on Windows to make sure it does not break accidently.
>
> I'm happy to take this whole series through my testing/next however I
> don't have working CI for the month so need to wait for my minutes to
> reset. Have you done a full CI run* with this?
>

Yes, gitlab CI passed.

> (*make sure any CI run is only on a repo forked from
> https://gitlab.com/qemu-project as you won't get the discount cost
> factor otherwise)
>

Regards,
Bin

