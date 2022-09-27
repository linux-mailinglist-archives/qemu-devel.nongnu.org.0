Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFD5EC838
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:39:51 +0200 (CEST)
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCgY-00050w-W3
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:39:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odBDa-0002NK-4B
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:05:55 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1odBDR-0004TL-3Z
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:05:47 -0400
Received: by mail-io1-xd32.google.com with SMTP id g8so7851839iob.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=HfMOHQhZhy2QAMxomTD62Bk6SNSADyJWsudHrX9zvyY=;
 b=swT/OeiIGfETsJ9T9WwzFnTM+zV1jdSGn6GtwncGzTXX50VWLNfLDnvJqGPAHwmJ7a
 jzcmXvpNFUG7+IZbklKe+Wls3DbaEdJUrxo5p6sAkGkPj66gjjlffi7M0AKlM8IflrVS
 f0xXm+ZXWcZj2GTrq3wlzKaj5EEvKjpMdRpnLHby/1tZ02d0a8thsJVWp7zguOU5p9cB
 3gAqxp6w5nvqeKenMUpzO0na6ccXyZv1BrTStcR5Vdm3MFR13Uwn6YJ4mwFwCYAcxSVp
 3AqMQ83IQpjsaQ9v4EpG158DlnIeexb92gp1zAiB53EYh5n5PLKSNJyNsHN5eQ7a1574
 wkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=HfMOHQhZhy2QAMxomTD62Bk6SNSADyJWsudHrX9zvyY=;
 b=SGT9BY8LMLs07LPQ/co/4za2S8/Tgjetb97O2AngWyYENICdlCaUrs+yQWxscxBMI1
 H76owvOKnUCPeppmWQGsrCZRobfyuaFlkUVGkyM1BgHe/jeXFAymt914OR4D9scpwqUD
 1e1e1zOQ2hbcFZnjr1ChcOv17O7p5d7T1CgOlXb/uL39WCL78rbNlQi5FFgBVN5qSvsk
 4d1hRMxwCOIeA5hFZq2RkD78i1slNnUiNL8XxDbeDR8+H2Z4h+aOFn0jr726cpS4B1RE
 ky5FOczMuUFO1ohZGZIQvzW6RLGlPgww7bVdXZAH7oI6apwSBIzknj0/4DBxdGTFDMlY
 qyvA==
X-Gm-Message-State: ACrzQf1Vd1aLkKdUqDpoajMk3uYWg1+viXy58vzxfyfU8maEkcoWweXq
 FFBHLSPuCXRyvSPYiZ/NRT4cz+gQiEjoQctq9pmZiA==
X-Google-Smtp-Source: AMsMyM6qsX9dx3MiFgfxvzKJqUknWTotDvfaJ7BBeiFv+PJx/tiQl18VuYdL1YrJhry5y1zstIf0kOoFV0rgFLwOnj8=
X-Received: by 2002:a05:6638:238a:b0:35a:25b7:a1a7 with SMTP id
 q10-20020a056638238a00b0035a25b7a1a7mr15056120jat.92.1664287524849; Tue, 27
 Sep 2022 07:05:24 -0700 (PDT)
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
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
In-Reply-To: <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Tue, 27 Sep 2022 19:35:13 +0530
Message-ID: <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
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

On Tue, Sep 27, 2022 at 5:12 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Sep 27, 2022 at 3:48 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
> >
> > On Tue, Sep 27, 2022 at 03:37:39PM +0530, Ani Sinha wrote:
> > > > > > > > >
> > > > > > > > > OK fine. Lets figuire out how to push bits somewhere in g=
it.qemu.org and
> > > > > > > > > the binaries in some other repo first. Everything else hi=
nges on that. We
> > > > > > > > > can fix the rest of the bits later incrementally.
> > > > > > > >
> > > > > > > > DanPB, any thoughts on putting bits on git.qemu.org or wher=
e and how to
> > > > > > > > keep the binaries?
> > > > > > >
> > > > > > > Can we please conclude on this?
> > > > > > > Peter, can you please fork the repo? I have tried many times =
to reach
> > > > > > > you on IRC but failed.
> > > > > >
> > > > > > Probably because of travel around KVM forum.
> > > > > >
> > > > > > I think given our CI is under pressure again due to gitlab free=
 tier
> > > > > > limits, tying binaries to CI isn't a great idea at this stage.
> > > > > > Can Ani just upload binaies to qemu.org for now?
> > > > >
> > > > > I agree with Michael here. Having a full ci/cd job for this is
> > > > > overkill IMHO. We should create a repo just for the binaries, hav=
e a
> > > > > README there to explain how we generate them and check in new ver=
sions
> > > > > as and when needed (it won't be frequent).
> > > > > How about biosbits-bin repo?
> > > >
> > > > If QEMU is hosting binaries, where any part contains GPL code, then=
 we
> > > > need to be providing the full and corresponding source and the buil=
d
> > > > scripts needed to re-create the binary. Once we have such scripts i=
t
> > > > should be trivial to trigger that from a CI job. If it isn't then
> > > > we're doing something wrong.
> > >
> > > I was thinking of commiting the build scripts in a branch of
> > > https://gitlab.com/qemu-project/biosbits-bits.
> > > This would separate them from the main source. The scripts would buil=
d
> > > a version of qemu-bits based on the version information passed to it
> > > from the environment.
> > > Before I committed the scripts, I wanted to check whether we would
> > > want to do that or have a separate repo containing the binaries and
> > > the build scripts.
> > > Seems we want the former.
> > >
> > > As for the gitlab-ci, I looked at the yaml file and the qemu ones
> > > looks quite complicated. Can someone help me generate one based on th=
e
> > > build script here?
> > > https://github.com/ani-sinha/bits/blob/bits-qemu-logging/build-artifa=
cts.sh
> >
> > Yes, QEMU's rules aren't a good place to start if you're trying
> > to learn gitlab CI, as they're very advanced.
> >
> > The simple case though is quite simple.
> >
> >   * You need a container image to act as the build env
> >   * In 'before_script'  install any packages you need on top of the
> >     base container image for build deps
> >   * In 'script'  run whatever shell commands you need in order
> >     to build the project
> >   * Add an 'artifacts' section to publish one (or more) files/dirs
> >     as output
> >
> > The simplest example would be something like
> >
> >    mybuild:
> >      image: fedora:36
> >      before_script:
> >        - dnf install -y gcc
> >      script:
> >        - gcc -o myapp myapp.c
> >      artifacts
> >        paths:
> >          - myapp
> >
>
> How does this look?
> https://pastebin.com/0YyLFmi3

Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
However, the question still remains, where do we keep the generated
artifacts?

