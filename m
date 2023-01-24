Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB967A26E
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 20:12:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKOgr-0003Fy-01; Tue, 24 Jan 2023 14:10:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pKOgl-0003Fi-A8
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:10:35 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1pKOgj-0003iQ-LO
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 14:10:35 -0500
Received: by mail-lj1-x232.google.com with SMTP id g14so17798685ljh.10
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 11:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaahApBzKzReGy4DPJeMXf95J1542dLEbKC/PsLpLP4=;
 b=o9R9+Iyb68TPmtV/bagLGo+km9pNLYL2Gy467doGvWP02IiBIT4NDn98EGY9L5K2lT
 P/z3uSq3Ok6YF2SUrOXXXUhy06akjE1+GZE+cJPoFQoRVJMMBkk/hE0i0HFkjwlKDUSy
 bNmSv8MLITJeoJqnWwciYL+e7DLijSEJ5pYk/lrL98ccYRf78FCWavEDwCZFOT5J9zWp
 9UFKeK/Wq816aAfWWHv0EBXiI+Rw8014D5glZiuXomBT6beFn2Uirz/Uj12TmMgkxAZa
 p2kUZXk4ZV6Twv6E2JUC9iO2157jQcTj4kRLf/bgcjoKUx5pej/1QtWyVBoYdRLz4HOt
 6Knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaahApBzKzReGy4DPJeMXf95J1542dLEbKC/PsLpLP4=;
 b=kuDCVArgFxFWKGzmhaTEISFQe/1sOfYJfGal7eOUU0w0f7js+TvKlhs5IUQrtjr8yn
 +y/GuqYyInHgf/WjzV0LpwecA8V6B0Wze9Oypw/kkr4A9FstxWeaQDx35JDqUKATCzVc
 XEFsGDfxWZlYKVzUPG98BZO4BFaa3y9qbxojX3D2kI7bAJSxazxKxirH2qrRQEPXVI5p
 vXy/sXLYtjyZ1lz+haSxP1OOTroBN0NUAfClVa+vfWPkbZrh9+zFdrIfXPeIMdD+R5+t
 KHI3lh4KFx4WC6efSYYsyMaWdZTNAEENAMWe6sNqkx7rWBJ6JZsyEes26JcYkL6th6ks
 Iz7Q==
X-Gm-Message-State: AFqh2kq+bMNyMAbg2GpqnM1ip/hMA7jEuWQB8TAtPlbGd5cY2ddE87wv
 YBTiJZco2oam8aUG8Toji+VuiE2UGcLnOS6nCSc=
X-Google-Smtp-Source: AMrXdXsypIMiYg5PqeW9RyeOiwIlIR2Fc7bM90XGZXpxfQ8sLvFM4zclYurXRUCEQB0biegGo9K3b/JXX2VSRsOsG54=
X-Received: by 2002:a05:651c:10af:b0:285:31d2:a898 with SMTP id
 k15-20020a05651c10af00b0028531d2a898mr2028998ljn.452.1674587431560; Tue, 24
 Jan 2023 11:10:31 -0800 (PST)
MIME-Version: 1.0
References: <c2246b1a-51b3-2843-5164-c424c571874f@redhat.com>
 <CAJ+F1C+EC-tgDOyX5e56utKdUz-DXMMtwrtVyKXT2Jj4r43OCA@mail.gmail.com>
 <839268cb-b65c-68d6-1294-47548ed383b1@redhat.com>
 <CAJ+F1CJteJ665MLSUhWg-p9=tH6B7w-m=pop+o9ktGffxCiZaA@mail.gmail.com>
 <Y860hPT+o15BGQYq@redhat.com>
 <0c771cc2-4746-0e5b-e372-c2a7be830144@redhat.com>
 <Y8/0bBPM0cxnYnKy@redhat.com>
In-Reply-To: <Y8/0bBPM0cxnYnKy@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 24 Jan 2023 23:10:20 +0400
Message-ID: <CAJ+F1CJvSiD9Hp4s24enRw06Er+XrCaOYmH61=zP9jCLYLoHLA@mail.gmail.com>
Subject: Re: MinGW and libfdt (was: Re: MSYS2 and libfdt)
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>, 
 Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>, 
 Cole Robinson <crobinso@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x232.google.com
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

Hi

On Tue, Jan 24, 2023 at 7:08 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jan 24, 2023 at 03:43:25PM +0100, Thomas Huth wrote:
> > On 23/01/2023 17.23, Daniel P. Berrang=C3=A9 wrote:
> > > On Fri, Jan 20, 2023 at 05:57:29PM +0400, Marc-Andr=C3=A9 Lureau wrot=
e:
> > ...
> > > > > > On Thu, Jan 19, 2023 at 12:31 PM Thomas Huth <thuth@redhat.com>=
 wrote:
> > > > > > >
> > > > > > >
> > > > > > >     Hi all,
> > > > > > >
> > > > > > > in some spare minutes, I started playing with a patch to try =
to remove the
> > > > > > > dtc submodule from the QEMU git repository - according to
> > > > > > > https://repology.org/project/dtc/versions our supported build=
 platforms
> > > > > > > should now all provide the minimum required version.
> > ...
> > > So in theory we can try to drop the submodule for dtc now
> >
> > The dtc package is also still missing in the MinGW cross compiler suite=
 in
> > Fedora ... does anybody know what's the right way to request it there?
>
> Someone will need to write a specfile, and submit it for review. I can do
> the submission, or the review, but not both (can't mark your own homework=
)
>

It's already been in rawhide for a few months. We can probably merge
and update f37.
https://packages.fedoraproject.org/pkgs/dtc/dtc/


--=20
Marc-Andr=C3=A9 Lureau

