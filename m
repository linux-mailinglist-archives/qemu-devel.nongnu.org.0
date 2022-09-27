Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D69E5EC45E
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 15:23:36 +0200 (CEST)
Received: from localhost ([::1]:45052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odAYh-00075e-4h
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 09:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od8zA-0001u1-1C
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:42:48 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1od8z7-00059T-AD
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:42:47 -0400
Received: by mail-io1-xd32.google.com with SMTP id b23so7513342iof.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=w+2zQCtqkJ8ny1UlZpxdjPeZHugmrUni8tX7g6GngBE=;
 b=6CsyE4rBUoeWU2C9inujCplO3k2qi/dA3fzWHS0QHam5ueuD6NP4BXS3DApvE9rscz
 peLujCD68bo7GvTzMKuC4HcyKxQ3rz13o476IuCzH14hJCq2kVS/IDIPseV8ZrBO4RVg
 eZl3JX0Ug6wqaCOyH5d8XvjA6TTtbOXPPEeCLqXv8FPE+Jx8CDAbx7aDdTc/OiUaXFVT
 vjH34OCbD9eqDOatrrzJlKHoimNojQXsm+O5JGEwhr/3MLk2wxsYwtt3hki54ItYM+nt
 zsoGBL7CD4vdbXuEvkBtk/MIvcVapfv5QQRP5uI3VKc6UgzfLp3fwnRP24bhfeNK7CHn
 tdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=w+2zQCtqkJ8ny1UlZpxdjPeZHugmrUni8tX7g6GngBE=;
 b=nHdkRRNSSltoxdNcSL3sWFlxY5DSixXBAIbUt1ce8CSpSvNecuOKCud0KJRNjfj44q
 9IwMigSDw7QXV88KSDxLJ79zgYWWKNlYRDK0QRy27/TzUV0GlZvY8fuQLD0Q7e3KQn60
 G0nBPejiC8X/HkuuQZITzEjAJytSpBXH5EHB9HAbyAURB0cNUfZlRE3JG87UUG+Wmr7H
 glP9Te2Zvm0272Qwbig3BCYdsBJ1h2kbinUgXUtV/293ZDOPGr27CAv5bNCIvxN+T/GP
 E0cIE3xatDKq9JELjytmEDf0YxzBuPpJCaVIfr8Jb0jpuO/KNik1vaxVlSX6iNEM6kMO
 EIFA==
X-Gm-Message-State: ACrzQf2RNWTkPOfCcmmYoK8D2ZZ0fRiAou1zpGxzmlY53aFx4bqpnGso
 gasBckFvZFoI8OxTEA4ng7bYHwD8T6Nqk7esPO170g==
X-Google-Smtp-Source: AMsMyM5s+nunsrwu3S4OowSWVMQHehA+q8DXPP8yOwO4P4Xmf+TCSXzvZXRU4rwD/VZl50vqqv6bYPYagOIbiG9I3yY=
X-Received: by 2002:a05:6638:2491:b0:35a:53dd:f98e with SMTP id
 x17-20020a056638249100b0035a53ddf98emr14130150jat.261.1664278959118; Tue, 27
 Sep 2022 04:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220715015941-mutt-send-email-mst@kernel.org>
 <CAARzgwwjXMmbRQ-ETPPqHP5eq5jtrGMSh2GeBh5fLS9Pcsut+A@mail.gmail.com>
 <20220716112943-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2207251100590.87138@anisinha-lenovo>
 <alpine.DEB.2.22.394.2207271137210.130455@anisinha-lenovo>
 <CAARzgwwpy6yUJfuxxfM2vAUDqh+RyxjLqd+1xARiazqwTLbN9A@mail.gmail.com>
 <20220917162606-mutt-send-email-mst@kernel.org>
 <CAARzgwxoy_E-vkwo-mKo0tbG31Y3E3r9FB6v3H3hgPYW4fb6sA@mail.gmail.com>
 <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
In-Reply-To: <YzLN3Y1pNO8SVn9M@redhat.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 27 Sep 2022 17:12:28 +0530
Message-ID: <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, imammedo@redhat.com,
 jsnow@redhat.com, 
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

On Tue, Sep 27, 2022 at 3:48 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > > >
> > > > > > > > OK fine. Lets figuire out how to push bits somewhere in git=
.qemu.org and
> > > > > > > > the binaries in some other repo first. Everything else hing=
es on that. We
> > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > >
> > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or where =
and how to
> > > > > > > keep the binaries?
> > > > > >
> > > > > > Can we please conclude on this?
> > > > > > Peter, can you please fork the repo? I have tried many times to=
 reach
> > > > > > you on IRC but failed.
> > > > >
> > > > > Probably because of travel around KVM forum.
> > > > >
> > > > > I think given our CI is under pressure again due to gitlab free t=
ier
> > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > Can Ani just upload binaies to qemu.org for now?
> > > >
> > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > overkill IMHO. We should create a repo just for the binaries, have =
a
> > > > README there to explain how we generate them and check in new versi=
ons
> > > > as and when needed (it won't be frequent).
> > > > How about biosbits-bin repo?
> > >
> > > If QEMU is hosting binaries, where any part contains GPL code, then w=
e
> > > need to be providing the full and corresponding source and the build
> > > scripts needed to re-create the binary. Once we have such scripts it
> > > should be trivial to trigger that from a CI job. If it isn't then
> > > we're doing something wrong.
> >
> > I was thinking of commiting the build scripts in a branch of
> > https://gitlab.com/qemu-project/biosbits-bits.
> > This would separate them from the main source. The scripts would build
> > a version of qemu-bits based on the version information passed to it
> > from the environment.
> > Before I committed the scripts, I wanted to check whether we would
> > want to do that or have a separate repo containing the binaries and
> > the build scripts.
> > Seems we want the former.
> >
> > As for the gitlab-ci, I looked at the yaml file and the qemu ones
> > looks quite complicated. Can someone help me generate one based on the
> > build script here?
> > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifact=
s.sh
>
> Yes, QEMU's rules aren't a good place to start if you're trying
> to learn gitlab CI, as they're very advanced.
>
> The simple case though is quite simple.
>
>   * You need a container image to act as the build env
>   * In 'before_script'  install any packages you need on top of the
>     base container image for build deps
>   * In 'script'  run whatever shell commands you need in order
>     to build the project
>   * Add an 'artifacts' section to publish one (or more) files/dirs
>     as output
>
> The simplest example would be something like
>
>    mybuild:
>      image: fedora:36
>      before_script:
>        - dnf install -y gcc
>      script:
>        - gcc -o myapp myapp.c
>      artifacts
>        paths:
>          - myapp
>

How does this look?
https://pastebin.com/0YyLFmi3

>
> So essentially use 'docker run yourimage:tag' locally to bring
> up the build env, and interactively work out what packags yuo
> need to install, and what scripts to invoke to build it. When
> you have it figured out, just copy those commands into the
> before_script/script sections in .gitlab-ci.yml
>
>
> Note, the .gitlab-ci.yml file would be in the git repo of the
> project you're building typically, which would be the main
> 'biosbits' project i presume.
>
> There's a fairly decent reference of syntax here:
>
>   https://docs.gitlab.com/ee/ci/yaml/
>
> And broader set of docs
>
>  https://docs.gitlab.com/ee/ci/
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

