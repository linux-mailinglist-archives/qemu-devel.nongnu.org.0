Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D62B05B3843
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 14:56:04 +0200 (CEST)
Received: from localhost ([::1]:53936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWdYB-0004lM-4M
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 08:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oWdVs-0002LE-Ox
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 08:53:40 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:33397)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oWdVq-0002Lz-Do
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 08:53:40 -0400
Received: by mail-ed1-x52b.google.com with SMTP id b35so2420169edf.0
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=xz2CQUw2E0tNmL6fzbD21KNHyjAEJQQpt9hOLeoKRBc=;
 b=VFxuHeBlWXcMBmVyQyK83rajvvaOdpha6PPe8yfi4AKUHlE2ByNfVn61+CyUi2lYGr
 XvyBqUctWsx9xPr3a8kE6TOU584d3hcr9dCY+C3wKFHnyzdPRTOxz88HfPOlI7zmf8g4
 yVC+0cINx0GuC+ZOVt06T6k5hxkZ9zOrDbUKbMJHAuFJ88hxcd0VpflyAdoZaPWznLJ8
 +pO+lLAgV7AkF3S5VqBD8fdQysficwyQuq3m9yOsvXOf12FjqBJjSZ8ygodpYsvT7RzX
 y/3isJWR/UpUCWo40swQE5ntDmJVFoCZg0Oz8ffPL3e+DGa/f40FAI/vQYI/DZzWSyLu
 Msmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=xz2CQUw2E0tNmL6fzbD21KNHyjAEJQQpt9hOLeoKRBc=;
 b=rj6foBARHo7fZdCTGll2rk6ocp3yoNV9zsl0VTsF10Hz5JGdw419xrYPHY9vxRuQ+d
 hfiEXBPrZWBnGM/meF6yBAHho1QmYm6E8p26lO0HIPYk6KcIJIaNwGKmbnDA6uj2MosY
 kMzegtXOnpCoh9UqJnTnCMbFZBqkKPevXeFc9SzPa7JCLjceODcl3hz0hUxVcytiBYi3
 fJqg3Y03SO0LQZUjvoAQrAoT5wy890NAvvLuXpVyq8niBrNK/p31TAuyKy9dK6G8odNU
 1dj48ey1BSffJ6YGpxNNf9eS4moIF8ftfAMB2SsWg4eX+oAWb3tdG4xhWC/o1qZ/1Cbd
 OV5Q==
X-Gm-Message-State: ACgBeo1SGiZdA7VKksDWvpT8HIDtb+sJg3Z9iXcUl4/RJZ800y2e1wO6
 Fb0RLO72tubKKgXY/We0R60dk3QC59IXu9La60uVDA==
X-Google-Smtp-Source: AA6agR5KXvbIibeRZ/LTxr2EMVzzqdFr+whmb2FdiAcVpecFgeUuRM1Rtr4qhT2hfDMmCzpbkVey5mcrd6uvo9OirsQ=
X-Received: by 2002:a05:6402:f11:b0:44f:e1ff:801a with SMTP id
 i17-20020a0564020f1100b0044fe1ff801amr7432024eda.109.1662728016271; Fri, 09
 Sep 2022 05:53:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
 <YxdH/c9jx+3oVs9m@redhat.com>
 <CAARzgwz7XzNHik3zxJUNXOuO8HN59zhd8nZgMMt+OL22AiVXjw@mail.gmail.com>
 <YxdLd/rS8PyEY+z+@redhat.com>
In-Reply-To: <YxdLd/rS8PyEY+z+@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Fri, 9 Sep 2022 18:23:24 +0530
Message-ID: <CAARzgwwrZkOFE5Tsy1AV1n=KHWcxrKurQo0+-B7Mc7DmYJzdxg@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, imammedo@redhat.com, 
 jsnow@redhat.com, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::52b;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

+alexb

On Tue, Sep 6, 2022 at 7:00 PM Daniel P. Berrang=C3=A9 <berrange@redhat.com=
> wrote:
>
> On Tue, Sep 06, 2022 at 06:58:02PM +0530, Ani Sinha wrote:
> > On Tue, Sep 6, 2022 at 18:45 Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
> >
> > > On Thu, Jul 14, 2022 at 02:24:18PM +0100, Peter Maydell wrote:
> > > > On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > > >
> > > > > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > > > > Changelog:
> > > > > > v2:
> > > > > >  - a new class of python based tests introduced that is separat=
e
> > > from avocado
> > > > > >    tests or qtests. Can be run by using "make check-pytest".
> > > > > >  - acpi biosbits tests are the first tests to use pytest enviro=
nment.
> > > > > >  - bios bits tests now download the bits binary archives from a
> > > remote
> > > > > >    repository if they are not found locally. The test skips if
> > > download
> > > > > >    fails.
> > > > > >  - A new environment variable is introduced that can be passed =
by
> > > the tester
> > > > > >    to specify the location of the bits archives locally. test s=
kips
> > > if the
> > > > > >    bits binaries are not found in that location.
> > > > > >  - if pip install of python module fails for whatever reaoson, =
the
> > > test skips.
> > > > > >  - misc code fixes including spell check of the README doc. REA=
DME
> > > has been
> > > > > >    updated as well.
> > > > > >  - addition of SPDX license headers to bits test files.
> > > > > >  - update MAINTAINERS to reflect the new pytest test class.
> > > > > >
> > > > > > For biosbits repo:
> > > > > >  - added Dockerfile and build script. Made bios bits build on g=
cc 11.
> > > > > >
> > > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > > > > >
> > > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifa=
cts.sh
> > > > > >    The build script generates the zip archive and tarball used =
by
> > > the test.
> > > > >
> > > > > So far so good, I think it's ok for a start. It's probably a good=
 idea
> > > > > to host the source on qemu.org. Peter - any objection to this?
> > > >
> > > > Dan was looking at v1 from the point of view of how we handle the
> > > > guest binary blobs for these tests -- I'd rather defer to him rathe=
r
> > > > than taking the time to get up to speed on the issue myself.
> > >
> > > Storing the *source* git repo for biosbits on gitlab.com/qemu-project
> > > is sensible, as that's what we've done for other 3rd party bits that
> > > we bundle/depend on git repo access for.
> >
> >
> > Great. Can you or Peter please create a git repo cloned from the offici=
al
> > bios bits repo please? You don=E2=80=99t have to clone mine. Please pro=
vide me with
> > push access so that I can push fixes that I have made in order to build=
 it.
>
> I don't have any admin privileges for qemu infra, so can't do this
> myself.
>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>

