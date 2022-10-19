Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8992603A8C
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 09:22:45 +0200 (CEST)
Received: from localhost ([::1]:60198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol3PW-00072D-6o
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 03:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol3Ab-0005DH-W2; Wed, 19 Oct 2022 03:07:20 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:35449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ol3AZ-00064l-CS; Wed, 19 Oct 2022 03:07:17 -0400
Received: by mail-qk1-x736.google.com with SMTP id t25so10174857qkm.2;
 Wed, 19 Oct 2022 00:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNj/0tn8fXTZWLwf/sy+getuOMy5EAle/M5NZFKVsLQ=;
 b=RGXVVOL9uXCgAbddEzaMUw8pEid7bsjegUYYcQUtkt3UrKJOBK4qSoY3jbsRuV9SYR
 Dvpk+IZ6cK9mHpI71OTl6NpSYbKTOA+d6SX8gikNEaEzBEp/0zE4V4uRYV2Xnc/Ls+Wi
 ZyXhjU2KpWAJZLUTfdMFtJrSrT2iIDR/2wVm0XqXlyacG4/+uQG691v9pVWHvAqpt6Sl
 MIsQQLVE4evnaI6e2hRAUUqej39g/AHI7jVOVN7ke0U2O6YbL/WBguS+vNyhgbe6xT18
 lhLp5obY8biXxl/iPGkz+PuD9TB8TRctCFq1rE769EBeIKmnYvc9dMw8NUjfGJw2D2Bv
 k+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNj/0tn8fXTZWLwf/sy+getuOMy5EAle/M5NZFKVsLQ=;
 b=xSToP0Q8uEe79i1ec29uEptp/BEHWpml3eybykwvfsBl+vEQoCazmf9w4aORTRBtYf
 TnwH+i6Oi397KHurL3A9wOg9VleM7jrubTdGzbZl1V3VJ2jp1bk6kO9AVem+P5MCjwj/
 TKTNPgsFJYCnyWwGtwpzUp5KRtEUHTB7wENY3K1KFyCwF+7YAhDallCmPiYHV7LAAGKU
 UQ4bRSVrXQQkj6xbaiJ8nPbbCy/XdAzgW//taZQ+CMkLMkXtN9iSFE2jYsnCMtPwZPlC
 7ulPfmLNZnd/eEMRnvTxShlyWB3E91Ckgo/uV+7js3ZTsIVsWaHhCecHtXvM6oJi9JQK
 rTvQ==
X-Gm-Message-State: ACrzQf1cjZX6aDEe29si6OKoz1PwgQUX1OpB4EG4LWznfFAfor0lbGOl
 UZaL5cV/WpLQgMqQ02pODt4N6xsqF6DcgqSkwrk=
X-Google-Smtp-Source: AMsMyM6dOHUfIovIP1XOgs5ZC3VLwveUDZUQDZFAfMD+5OXP1wzg9Jw+jv/Cuus3yb9xnixoaJcRxK0cGmrQVAbIS1g=
X-Received: by 2002:a05:620a:304:b0:6ee:77f1:ecf9 with SMTP id
 s4-20020a05620a030400b006ee77f1ecf9mr4524425qkm.94.1666163233354; Wed, 19 Oct
 2022 00:07:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
 <87ilkwitc6.fsf@linaro.org>
 <CAEUhbmUfm+V-pN5j17VxRvYd1RGJYa3KF=op9Z-nB5Xq4RhUmA@mail.gmail.com>
 <CAEUhbmXc+7s6udZTNE7AeY+YkNr42fQ2HNHpDufZKDhB5qfL6g@mail.gmail.com>
 <87sfjlazr2.fsf@linaro.org>
In-Reply-To: <87sfjlazr2.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 19 Oct 2022 15:07:03 +0800
Message-ID: <CAEUhbmUyk-2aa-3jBcsgc8mZw9nYOksuBAy+2vgAjUSpiq4HGQ@mail.gmail.com>
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x736.google.com
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

On Wed, Oct 19, 2022 at 12:00 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > Hi Alex,
> >
> > On Fri, Oct 7, 2022 at 1:31 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> On Fri, Oct 7, 2022 at 4:35 AM Alex Benn=C3=A9e <alex.bennee@linaro.or=
g> wrote:
> >> >
> >> >
> >> > Bin Meng <bmeng.cn@gmail.com> writes:
> >> >
> >> > > In preparation to adding virtio-9p support on Windows, this series
> >> > > enables running qtest on Windows, so that we can run the virtio-9p
> >> > > tests on Windows to make sure it does not break accidently.
> >> >
> >> > I'm happy to take this whole series through my testing/next however =
I
> >> > don't have working CI for the month so need to wait for my minutes t=
o
> >> > reset. Have you done a full CI run* with this?
> >> >
> >>
> >> Yes, gitlab CI passed.
> >>
> >> > (*make sure any CI run is only on a repo forked from
> >> > https://gitlab.com/qemu-project as you won't get the discount cost
> >> > factor otherwise)
> >> >
> >
> > Patch 4 and 10 are already applied in the mainline by Thomas.
> >
> > Daniel will queue patch 14, 15, 16.
> >
> > Could you please help queue patch 1, 2, 3, 5, 6, 7, 9, 13 from this
> > series?
>
> I've queued those except 13 into my testing/next. There was a merge
> failure so I guess a dependency on another patch?
>

Thank you Alex.

Indeed patch 13 depends on a previous patch. Please ignore. I will
rebase in the next version.

Regards,
Bin

