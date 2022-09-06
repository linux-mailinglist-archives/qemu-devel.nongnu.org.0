Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5E25ADFC8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 08:31:19 +0200 (CEST)
Received: from localhost ([::1]:44738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVS7B-00024f-Q4
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 02:31:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVS2q-0000L9-9u
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:26:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oVS2o-0000JH-3Y
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 02:26:48 -0400
Received: by mail-ej1-x636.google.com with SMTP id bj12so20837854ejb.13
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 23:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=0GH1glT8+345EvRXvtUfNMLYacavQLIiFG8xrTOZf3I=;
 b=K7PVncEflyll7NNvQcmrFuVoUKr9E7a1voiQm4qt1K1YVwkkTR05iFBgYttRvbCpHV
 1kJOcBnd197Vh08Idfifxss/sLBQSyEp+RWljT9arrEjLuq/2xBghVwkEkydW29+cKyQ
 yCbivXmPsZ7ghwvd1eqOZiO3dyXYK69W5GelFUlqwK1g7nbbck0kVODtcC0szA1qKbxk
 N2SNg1cvHfv7iskdFbupWJpcxfMpVaiAHrSrR9LWzjXm6wY4VLdq9VoDasx1Kzu2wrZO
 BqVCSicpBEk+JGUl1yjZzsVrkUdzNbZ0/EhpKoOvXNBE17viY8z3Gf3ZZWN+wh3f7PfQ
 8NGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=0GH1glT8+345EvRXvtUfNMLYacavQLIiFG8xrTOZf3I=;
 b=yr9N69D8Mvp+oTpt5snua6+3TVpGkgbzq+462szAQfuDcndkATge/bfR0QRKm0M4Sd
 dnPLr+1atsAgNlpE3MgO6StdEnxg4yecOkk33+9qkaO0yXdz6Jdqo2FjI+QgLAa77EaZ
 XYfqA55MpdBd4UbLjnUVeWeSC1JdFIwfCPG3TJ8kw5FdtP2Eotig2ZX6LqK3vwXrjtuP
 hu4yhh0Xmt/PTxS5yrYwW3NZIenBICBogWDDJ7wp9RdsKz1dWRLb/ITD0y4bxo1HWihf
 UrTx9jKVuEtKYwtnAIgk20CxG3vNDBemciVEeb3yxI7Y7/OKzT+uVPyvrQVLmCcVljsu
 QF+w==
X-Gm-Message-State: ACgBeo2TecB8Aqk0m9+qd48N1tOvqLTxjVa+HTKvboJRr/mZ7SrBzWkv
 7I/uz25ybflbJpsnnYnPpTpC81Xg+ZOztIHODcxpbw==
X-Google-Smtp-Source: AA6agR7UijoWGRCoKTSzk7SAX2pc+DlgithpXah3oIIpLmsHsh8TO1WXRaCY3CExysu8exeOD/6RMCqfGVjwqDrWCSM=
X-Received: by 2002:a17:907:2cf1:b0:73d:d962:86d8 with SMTP id
 hz17-20020a1709072cf100b0073dd96286d8mr37777132ejc.121.1662445604389; Mon, 05
 Sep 2022 23:26:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220711044032-mutt-send-email-mst@kernel.org>
 <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_KUh_Hmozw2KthwNoM2L9rnA18ttrk9GHHnJZ-X_M4yQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 6 Sep 2022 11:56:33 +0530
Message-ID: <CAARzgwxUvkQSaoguyRYA5VSsvRzAYOYpbpzyDE+D1RvOyqEcug@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] Introduce new acpi/smbios python tests using
 biosbits
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 thuth@redhat.com, 
 berrange@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, 
 imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: none client-ip=2a00:1450:4864:20::636;
 envelope-from=ani@anisinha.ca; helo=mail-ej1-x636.google.com
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

On Thu, Jul 14, 2022 at 6:54 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 11 Jul 2022 at 10:34, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Jul 10, 2022 at 10:30:03PM +0530, Ani Sinha wrote:
> > > Changelog:
> > > v2:
> > >  - a new class of python based tests introduced that is separate from avocado
> > >    tests or qtests. Can be run by using "make check-pytest".
> > >  - acpi biosbits tests are the first tests to use pytest environment.
> > >  - bios bits tests now download the bits binary archives from a remote
> > >    repository if they are not found locally. The test skips if download
> > >    fails.
> > >  - A new environment variable is introduced that can be passed by the tester
> > >    to specify the location of the bits archives locally. test skips if the
> > >    bits binaries are not found in that location.
> > >  - if pip install of python module fails for whatever reaoson, the test skips.
> > >  - misc code fixes including spell check of the README doc. README has been
> > >    updated as well.
> > >  - addition of SPDX license headers to bits test files.
> > >  - update MAINTAINERS to reflect the new pytest test class.
> > >
> > > For biosbits repo:
> > >  - added Dockerfile and build script. Made bios bits build on gcc 11.
> > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/Dockerfile
> > >    https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifacts.sh
> > >    The build script generates the zip archive and tarball used by the test.
> >
> > So far so good, I think it's ok for a start. It's probably a good idea
> > to host the source on qemu.org. Peter - any objection to this?
>
> Dan was looking at v1 from the point of view of how we handle the
> guest binary blobs for these tests -- I'd rather defer to him rather
> than taking the time to get up to speed on the issue myself.

Ok let's resurrect this discussion again. What are we going to do with
bios bits? Put it in git.qemu.org then?
I have put a lot of time and effort into this work and I believe this
will add another valuable tool to test acpi stuff, so I am not going
away :-)

