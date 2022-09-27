Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF85EBDE0
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 10:58:15 +0200 (CEST)
Received: from localhost ([::1]:37820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od6Pu-00022o-GF
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 04:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od5id-0007IN-16
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:13:31 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od5ib-0007te-3u
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 04:13:30 -0400
Received: by mail-io1-xd32.google.com with SMTP id n192so5985299iod.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 01:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=KrNEiZhQNbDF0mxt5i7EG+x+4lldhJ/giMmKoZ3ZLT4=;
 b=qwdjGpg7bL/POq5aXsxhZBZuI+Geb//7X7caLBOc/gO6M0SeywUY1lpsXleU38qoyE
 I5GImVUpUzIg+xjeWMPl5MQ0GP17KQYl1bgOSquqLZ2F7sbhqi/MbewVGmnqdrLJoAAt
 dUr6rZUznxnfGQwUySn2rxg0jjZZh6n5SvtjwI3hFNv6ecWIXS+Z2xBwDMb43+j3lA1/
 koCIQFi1vtdWgE0hdvXdbVvIXXNQYQWVdAShcEDCJC6XFVhZeEHrT/b6XeURuG7jaQMD
 BP46/Tb1UwNpDwISX8v4VB0FJgFO2SN28CaDOcfkpRc0oJtkBgCLyEjoJToVrdqNufm7
 2Plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=KrNEiZhQNbDF0mxt5i7EG+x+4lldhJ/giMmKoZ3ZLT4=;
 b=yImjxXEh/++0HykoelPbA+dfcNKitMNXy+tV+m6VmBdZvdf6KSSVyeLW+hw/emd6md
 F9hGixK8dRYwAoubm0s+sOmClSXwAKc2HVRVYlKYXlFtRlMuh7Ih8+SZXHNgKftKqaAj
 zVfk4VDRXSS6RYSxgL7r2amplbOP07di28suRx+X+br0ljhKhNEuW0zMAkyyFd1tU1I6
 7MVL9IFWL11mekaNuGhbQOuBlNLjEBN8QZhdbDjPdJQel6X/6Jun0PUFjoL4O0qTDG3X
 JYoD49N+AR8PRbEfKQjwY5aBtTsFqPch1ndCCp2HAJIn4ZYcojapkFE+S0Yrv7MPTPox
 ZG1g==
X-Gm-Message-State: ACrzQf0E0VnMUk7mIMIUVF9UM1og1i1DuTmLWdOiEfPs/fYgWxhpyvxF
 zSAOckUJBimUrb2BbNWNzvtFuQmK6afIodH9onLEKA==
X-Google-Smtp-Source: AMsMyM6BiROw95oPG/dj0omuGU/gmPrRQ38gFjbrYCvyRdnwD/fO3WxykJ/JfmGp/wAc1ZernxcyBjmH802PqvzS3hE=
X-Received: by 2002:a05:6638:238a:b0:35a:25b7:a1a7 with SMTP id
 q10-20020a056638238a00b0035a25b7a1a7mr14303982jat.92.1664266406073; Tue, 27
 Sep 2022 01:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <20220714163611-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220917162606-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 27 Sep 2022 13:43:15 +0530
Message-ID: <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: berrange@redhat.com, imammedo@redhat.com, jsnow@redhat.com, 
 pbonzini@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org, 
 thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd32.google.com
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

On Sun, Sep 18, 2022 at 1:58 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> > On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrote:
> > >
> > >
> > >
> > > On Mon, 25 Jul 2022, Ani Sinha wrote:
> > >
> > > >
> > > >
> > > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > > >
> > > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > > > >
> > > > > >
> > > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@redhat.co=
m> wrote:
> > > > > >
> > > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha wrote:
> > > > > >     > > Instead of all this mess, can't we just spawn e.g. "git=
 clone --depth
> > > > > >     1"?
> > > > > >     > > And if the directory exists I would fetch and checkout.
> > > > > >     >
> > > > > >     > There are two reasons I can think of why I do not like th=
is idea:
> > > > > >     >
> > > > > >     > (a) a git clone of a whole directory would download all v=
ersions of the
> > > > > >     > binary whereas we want only a specific version.
> > > > > >
> > > > > >     You mention shallow clone yourself, and I used --depth 1 ab=
ove.
> > > > > >
> > > > > >     > Downloading a single file
> > > > > >     > by shallow cloning or creating a git archive is overkill =
IMHO when a wget
> > > > > >     > style retrieval works just fine.
> > > > > >
> > > > > >     However, it does not provide for versioning, tagging etc so=
 you have
> > > > > >     to implement your own schema.
> > > > > >
> > > > > >
> > > > > > Hmm I=E2=80=99m not sure if we need all that. Bits has its own =
versioning mechanism and
> > > > > > I think all we need to do is maintain the same versioning logic=
 and maintain
> > > > > > binaries of different  versions. Do we really need the power of=
 git/version
> > > > > > control here? Dunno.
> > > > >
> > > > > Well we need some schema. Given we are not using official bits re=
leases
> > > > > I don't think we can reuse theirs.
> > > >
> > > > OK fine. Lets figuire out how to push bits somewhere in git.qemu.or=
g and
> > > > the binaries in some other repo first. Everything else hinges on th=
at. We
> > > > can fix the rest of the bits later incrementally.
> > >
> > > DanPB, any thoughts on putting bits on git.qemu.org or where and how =
to
> > > keep the binaries?
> >
> > Can we please conclude on this?
> > Peter, can you please fork the repo? I have tried many times to reach
> > you on IRC but failed.
>
> Probably because of travel around KVM forum.
>
> I think given our CI is under pressure again due to gitlab free tier
> limits, tying binaries to CI isn't a great idea at this stage.
> Can Ani just upload binaies to qemu.org for now?

I agree with Michael here. Having a full ci/cd job for this is
overkill IMHO. We should create a repo just for the binaries, have a
README there to explain how we generate them and check in new versions
as and when needed (it won't be frequent).
How about biosbits-bin repo?


>
> --
> MST
>

