Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF8737BF22
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 16:01:32 +0200 (CEST)
Received: from localhost ([::1]:51380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgpQZ-0000Ls-PJ
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 10:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgpOj-0007hA-Ak
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:59:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lgpOe-0002oj-OY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 09:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620827971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/JiFd3sqzjPI0TaD/2d09nCM6EMqON24jQLMU2uaeQE=;
 b=eo0uXnQfhXTKSEeNNvMD8rpyLOqz4rJPIgpD2lJrBoHTr7XIP6p1LOt8C8Ps0InDh6aANY
 wtExV0pXhe1KQNEVbOCjLrTmzcj0BFnY0FHkeC+B4QnsXyuhEJcTuMcLRsW2DtWxNcbTFu
 aWVFvZ0MRsATlj+BTGRyl/JlAlcKB8I=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-CQW8PERlNTKtvHbZsse5_Q-1; Wed, 12 May 2021 09:59:30 -0400
X-MC-Unique: CQW8PERlNTKtvHbZsse5_Q-1
Received: by mail-vk1-f198.google.com with SMTP id
 b203-20020a1fb2d40000b02901c9714c9241so3052301vkf.19
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 06:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/JiFd3sqzjPI0TaD/2d09nCM6EMqON24jQLMU2uaeQE=;
 b=NDT+S7Shyailt9wZh/siP2JVjKPS7oP3Z49j5B4cJxNNwmPuU8/vVrDfdq3KZDVLHI
 UPjS4taN3GW7bDQHZkFdoxXI2kpfSlQZfqRF2xDNI27WR2P0ScQbUKwC7zdrbzqSW9MK
 FjlvMV9v2WxrSiw/HG8nHxygcVxXgA3JQSV5wPDB/Q3FYx1B8zt1BoSwD+hhX2llLvXo
 h+KKX18UteQAWRjSpZjcTcNl67HtcFIbp7Ih1eQqvv3/6hsI4fe14wKPuXG+z5pgVMTV
 aBPVqcuhN/GaWIf4Xsu9+yolPVpwcID2Qe6D56gEGxQn690mZOAbusJO1awDviVXwJPF
 Ruug==
X-Gm-Message-State: AOAM5319bmSKcrJHC8D0SrEF0CS0giPQ44n7JT6xzUOaYeBSG1VdQRUz
 L+ONQBb/Vi4hN7Zdf5DmXkBeuvDoPmo73ORnpRzF6bkZ4pxthFxz2+tkrvhJHzTblN1ZRo7ZNNf
 bQdrDgWxmQF9AI4nvpgMm2IVqbDsphHM=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr32440283uap.113.1620827969605; 
 Wed, 12 May 2021 06:59:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNikmVBl1RMuf+BqsBkapaosdgrNG1MdLLCfhVHhbxPylSxFX65gwV1K7K30a/U0lnu+D6Vo/VAZhnm23/7RU=
X-Received: by 2002:ab0:3403:: with SMTP id z3mr32440261uap.113.1620827969423; 
 Wed, 12 May 2021 06:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
 <5b582933-6004-3549-b5fe-208c182d5efe@redhat.com>
 <CAKJDGDZUScyzVzhwpG+d6di3Wa0+Txk0SONVXiC++dukzNeTew@mail.gmail.com>
 <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
In-Reply-To: <93b24ba1-0898-250f-0f8c-87bc08934220@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 12 May 2021 10:59:03 -0300
Message-ID: <CAKJDGDbye98ftCQSrPbPTR6nrH9m54BupD+pZKkSCuqTYkt7BA@mail.gmail.com>
Subject: Re: non-x86 runners in the Gitlab-CI (was: Re: [PATCH 12/12]
 configure: bump min required CLang to 7.0.0 / XCode 10.2)
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Ademar Reis Jr <areis@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 10:56 AM Thomas Huth <thuth@redhat.com> wrote:
>
> On 12/05/2021 15.47, Willian Rampazzo wrote:
> > Hi Thomas,
> >
> > On Wed, May 12, 2021 at 8:54 AM Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 12/05/2021 13.44, Philippe Mathieu-Daud=C3=A9 wrote:
> >>> On 5/11/21 3:26 PM, Daniel P. Berrang=C3=A9 wrote:
> >>>> Several distros have been dropped since the last time we bumped the
> >>>> minimum required CLang version.
> >>>>
> >>>> Per repology, currently shipping versions are:
> >>>>
> >>>>                RHEL-8: 10.0.1
> >>>>        Debian Stretch: 7.0.1
> >>>>         Debian Buster: 7.0.1
> >>>>    openSUSE Leap 15.2: 9.0.1
> >>>>      Ubuntu LTS 18.04: 10.0.0
> >>>>      Ubuntu LTS 20.04: 11.0.0
> >>>>            FreeBSD 12: 8.0.1
> >>>>             Fedora 33: 11.0.0
> >>>>             Fedora 34: 11.1.0
> >>>>
> >>>> With this list Debian Stretch is the constraint at 7.0.1
> >>>>
> >>>> An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> >>>> which dates from March 2019.
> >>>
> >>> But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
> >>> for non-x86 targets until we have figured out who is willing
> >>> to share/maintain such non-x86 native runners on Gitlab.
> >>
> >>    Hi Cleber,
> >>
> >> by the way, what's the status of your patch series to get the dedicate=
d CI
> >> machines (s390x, aarch64, ...) running in our Gitlab-CI? AFAIK the las=
t
> >> iteration of your patches has been weeks ago, so I wonder whether you =
could
> >> finally send a new version with the requested fixes included? ... this=
 topic
> >> slowly gets more and more urgent now that our Travis-CI is in process =
of
> >> dying...
> >
> > I don't know if you saw this:
> > https://docs.travis-ci.com/user/billing-overview/#partner-queue-solutio=
n.
> >
> > tl;dr, Travis now has support from partners to run non-x86 arch. It is
> > always good to have a plan B, like qemu own CI runners, but, at least,
> > with these non-x86 arch available on Travis, we will have some time to
> > breathe.
>
> Uh, that's what we're already using in our travis.yml ... but I guess you=
've
> rather missed:
>
>   https://blog.travis-ci.com/2021-05-07-orgshutdown
>
> and on travis-ci.com, the CI minutes are not for free anymore. At least n=
ot
> for the QEMU project. Or do you know of a sponsor who is going to pay the=
 CI
> minutes for us there?
>

The link I posted tells arm and s390x will still be free for OSS projects.

From that page:

IBM CPU builds in IBM Cloud (sponsored by IBM)
ARM64 CPU builds in Equinix Metal (former Packet) infrastructure
(sponsored by ARM)

Willian

>   Thomas
>


