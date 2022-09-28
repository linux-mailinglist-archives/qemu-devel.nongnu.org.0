Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A005ED34E
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 05:11:47 +0200 (CEST)
Received: from localhost ([::1]:47524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odNU7-0001qO-AW
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 23:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odNRd-00080B-FL
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 23:09:09 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:35376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odNRb-0002sB-AA
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 23:09:09 -0400
Received: by mail-io1-xd35.google.com with SMTP id b23so9243831iof.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 20:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Dn6LcbjnH17FG6VGm2GlIyxunOI0mb+kujP6HUecpVQ=;
 b=6/VywGmhmJsHp9+x6dInyjcjk3wrGdyIZRfGFKLT8memFBMtDg6zWw7YWJpNUKI3Tk
 vKNrBP5cVyGIbqkBi5nf2VZhjC8Mi8ug5LiraXuV4vidUFvyAC041VyM2cVJoHtnlH15
 KQNnnLIqLtbrnc4PdHHsOICHEPRURSTFaVDKx1k/qkd3aURi9jfG9WCEjWE1HxmtTOEJ
 t0oNCbInbNQAQm+oQO9szzwkTMglls4+WaeAjsgvenVCN6chn0Zj+0cQjL6uLAR0eT0O
 84lPl4/dbJYJhaRYf5SpgKgZfM4lYKd7zvtibZreqTDSiTkcvRYRRJDUgQYiGalAG2iR
 PJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Dn6LcbjnH17FG6VGm2GlIyxunOI0mb+kujP6HUecpVQ=;
 b=71X5fyczYfLxjlk+uefz5uc0lCQ7hC2sXELO8NplIn5esIsO76mWGAwn6kK4rAJ74y
 3inY++mRWGUC9HzSqwYvKZHxdAet832aXTpj/QsHYNb09C0vO/HZ4BHHJUyJ0q6pvDRm
 K74zTyhU/yrWFQ/nDiPK0xS9vVWF2F6yKyTRW26k/t2zT8XcgxcDbIpqZ4oqSdfjHQza
 eDIVeVQPyIJeObfK0njdFGaegD42xPJRXJ9LdLbcg+sruUy9kKkOc8gJq1i+SXuS3Sfy
 ntQOJfhhxVQl5T/Cch+b7GdNGUpQNhjO48rBb1J24BGKE5flf186F4tZ1DrXhF8k81V+
 Ju8A==
X-Gm-Message-State: ACrzQf1mdxLOq/7jQAY/btA1eduCafTmcMjw+nLB8pFciKgMNxzAK3p7
 u5HJ/RGQ3Py+nOELX90zdsPS4Az+k1EYl1RsA67WIA==
X-Google-Smtp-Source: AMsMyM6XlCYN6CNxZi374Mjw6Fg0W4msty7cOMP5bHEkriwH5q+yYQD9GZrvjjLuIGGFuR54qQvSbWjy1zGvqtII1dI=
X-Received: by 2002:a05:6602:399a:b0:6a1:c3fc:9909 with SMTP id
 bw26-20020a056602399a00b006a1c3fc9909mr13292295iob.28.1664334545858; Tue, 27
 Sep 2022 20:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2207150929020.2162493@anisinha-lenovo>
 <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com> <20220927171601-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220927171601-mutt-send-email-mst@kernel.org>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 28 Sep 2022 08:38:54 +0530
Message-ID: <CAARzgwx=514Q8hMMLP4OpczRH4U2iiMnHqhJ6p3vg-8O3_aK=w@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 imammedo@redhat.com, jsnow@redhat.com, pbonzini@redhat.com, 
 peter.maydell@linaro.org, qemu-devel@nongnu.org, thuth@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=ani@anisinha.ca; helo=mail-io1-xd35.google.com
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

On Wed, Sep 28, 2022 at 2:48 AM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Sep 27, 2022 at 09:33:27AM +0100, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Sep 27, 2022 at 01:43:15PM +0530, Ani Sinha wrote:
> > > On Sun, Sep 18, 2022 at 1:58 AM Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > > >
> > > > On Fri, Sep 16, 2022 at 09:30:42PM +0530, Ani Sinha wrote:
> > > > > On Thu, Jul 28, 2022 at 12:08 AM Ani Sinha <ani@anisinha.ca> wrot=
e:
> > > > > >
> > > > > >
> > > > > >
> > > > > > On Mon, 25 Jul 2022, Ani Sinha wrote:
> > > > > >
> > > > > > >
> > > > > > >
> > > > > > > On Sat, 16 Jul 2022, Michael S. Tsirkin wrote:
> > > > > > >
> > > > > > > > On Sat, Jul 16, 2022 at 12:06:00PM +0530, Ani Sinha wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > On Fri, Jul 15, 2022 at 11:20 Michael S. Tsirkin <mst@red=
hat.com> wrote:
> > > > > > > > >
> > > > > > > > >     On Fri, Jul 15, 2022 at 09:47:27AM +0530, Ani Sinha w=
rote:
> > > > > > > > >     > > Instead of all this mess, can't we just spawn e.g=
. "git clone --depth
> > > > > > > > >     1"?
> > > > > > > > >     > > And if the directory exists I would fetch and che=
ckout.
> > > > > > > > >     >
> > > > > > > > >     > There are two reasons I can think of why I do not l=
ike this idea:
> > > > > > > > >     >
> > > > > > > > >     > (a) a git clone of a whole directory would download=
 all versions of the
> > > > > > > > >     > binary whereas we want only a specific version.
> > > > > > > > >
> > > > > > > > >     You mention shallow clone yourself, and I used --dept=
h 1 above.
> > > > > > > > >
> > > > > > > > >     > Downloading a single file
> > > > > > > > >     > by shallow cloning or creating a git archive is ove=
rkill IMHO when a wget
> > > > > > > > >     > style retrieval works just fine.
> > > > > > > > >
> > > > > > > > >     However, it does not provide for versioning, tagging =
etc so you have
> > > > > > > > >     to implement your own schema.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > Hmm I=E2=80=99m not sure if we need all that. Bits has it=
s own versioning mechanism and
> > > > > > > > > I think all we need to do is maintain the same versioning=
 logic and maintain
> > > > > > > > > binaries of different  versions. Do we really need the po=
wer of git/version
> > > > > > > > > control here? Dunno.
> > > > > > > >
> > > > > > > > Well we need some schema. Given we are not using official b=
its releases
> > > > > > > > I don't think we can reuse theirs.
> > > > > > >
> > > > > > > OK fine. Lets figuire out how to push bits somewhere in git.q=
emu.org and
> > > > > > > the binaries in some other repo first. Everything else hinges=
 on that. We
> > > > > > > can fix the rest of the bits later incrementally.
> > > > > >
> > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where an=
d how to
> > > > > > keep the binaries?
> > > > >
> > > > > Can we please conclude on this?
> > > > > Peter, can you please fork the repo? I have tried many times to r=
each
> > > > > you on IRC but failed.
> > > >
> > > > Probably because of travel around KVM forum.
> > > >
> > > > I think given our CI is under pressure again due to gitlab free tie=
r
> > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > Can Ani just upload binaies to qemu.org for now?
> > >
> > > I agree with Michael here. Having a full ci/cd job for this is
> > > overkill IMHO. We should create a repo just for the binaries, have a
> > > README there to explain how we generate them and check in new version=
s
> > > as and when needed (it won't be frequent).
> > > How about biosbits-bin repo?
> >
> > If QEMU is hosting binaries, where any part contains GPL code, then we
> > need to be providing the full and corresponding source and the build
> > scripts needed to re-create the binary. Once we have such scripts it
> > should be trivial to trigger that from a CI job. If it isn't then
> > we're doing something wrong.  The CI quota is not an issue, because
> > this is not a job that we need to run continuously. It can be triggered
> > manually as & when we decide we need to refresh the binary, so would
> > be a small one-off CI quota hit.
> >
> > Also note that gitlab is intending to start enforcing storage quota
> > on projects in the not too distant future. This makes it unappealing
> > to store binaries in git repos, unless we genuinely need the ability
> > to access historical versions of the binary. I don't believe we need
> > that for biosbits.
> >
> > The binary can be published as a CI artifact and accessed directly
> > from the latest artifact download link. This ensures we only consume
> > quota for the most recently published binary artifact. So I don't see
> > a compelling reason to upload binaries into git.
> >
> > With regards,
> > Daniel
>
> I don't really care where we upload them but only having the
> latest version is just going to break anything expecting
> the old binary.

In fairness, I am not entirely certain if there is a tight coupling
between the qemu tests and the bits binaries. I have written the test
framework in a way such that test modifications and new tests can be
pushed into the bits binaries and the iso gets regenerated with the
new tests from QEMU itself before running the tests. Only when we need
bits bugfixes or say upgrade to new acpica that we would need to
regenerate the bits binaries.

>
>
>
> > --
> > |: https://berrange.com      -o-    https://www.flickr.com/photos/dberr=
ange :|
> > |: https://libvirt.org         -o-            https://fstop138.berrange=
.com :|
> > |: https://entangle-photo.org    -o-    https://www.instagram.com/dberr=
ange :|
>

