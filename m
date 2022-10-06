Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B62705F649B
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 12:57:00 +0200 (CEST)
Received: from localhost ([::1]:41144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogOYl-00034T-Q5
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 06:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogNxQ-0006Ia-Ah
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:18:25 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogNxO-0004d5-4y
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 06:18:23 -0400
Received: by mail-pg1-x529.google.com with SMTP id j71so1505024pge.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 03:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=SNkv3q9/amFs7Fv74VHo1p3ckVw39fh5UqukWBIHa/8=;
 b=ZgvA//d+8KyR+0BMGk6ciKJ2v/6p/jIkECazhckohhGgLNTaBXTDOrUQhd0KEz70Ui
 LYTjXY5cB5yeIZwtAZKt7TDjAFx39kxSun3DSOuXlpQFn81jXobtkzYh8AZmMtnbrdjJ
 XYgfBNApor6mxaGh7n+EVOsGiqF/ffeegvm0zNQcIK7LgcM2T1YgCAboldXuw28HFEFG
 K5Zwpv78lw6gC/OhMMmZFPSIATJPJnMqHFUQt+hsft0RjCVSXh3jwXyHe0gSdAOuTyl9
 y0/C90cfz0II7eh2CPhsbXaK3FGbMCJs4fVuKLrcqNgG+3xkTqTuAnMeAl1TldN8OzQk
 TJDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SNkv3q9/amFs7Fv74VHo1p3ckVw39fh5UqukWBIHa/8=;
 b=LtSTCUPw5a0Foh07aKJIbhItVVVsF/uY/XfHnl/lckGGqx5LWWn7aASKS+4Dn7gWHp
 mjl+8g8/USw50CR6A0zSEk5rADj9fcV/ixZH7k+FukFDlzNSfubb2LC6lLC/oUEVImLu
 Q89Eu/hN6OmNt4/QdDE2OZKk/TIOWxsgkz79Cyje2ylkQPd4cTRrLURPXM0f99eCVWlA
 AVb0kHK3NlgvpURCyEkeYMjgOF8oVLVjnNw5xT47w2YeXTbGkLWrKUAbV4vCZq2uLRZh
 O9QmYIG5ZuvAhJTr//Ugwo58b+bSV7VfXWilbjJTzm2gY9PgphzEVvnXlt+4OmTFny4Q
 46FQ==
X-Gm-Message-State: ACrzQf09HngylyNizdh4JzSu7V1BfUXqNUQ3JR2hKjsXdC9DZSNrnV1b
 U2+dgVfOHWvo6on5NjwQFreDsA==
X-Google-Smtp-Source: AMsMyM7GK+YFakTbFxIFZi8buNxskWEFrDD11iv3rIDtBArW/MRwXrfGeUFDQbSc198uFqFnRWfmcQ==
X-Received: by 2002:a05:6a00:804:b0:544:9d05:60a2 with SMTP id
 m4-20020a056a00080400b005449d0560a2mr4071486pfk.57.1665051500339; 
 Thu, 06 Oct 2022 03:18:20 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.122.113])
 by smtp.googlemail.com with ESMTPSA id
 z12-20020a170903018c00b00172e19c2fa9sm12113155plg.9.2022.10.06.03.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 03:18:19 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 6 Oct 2022 15:48:13 +0530 (IST)
To: Ani Sinha <ani@anisinha.ca>
cc: "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, pbonzini@redhat.com, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 imammedo@redhat.com, jsnow@redhat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <125d5b7-2f90-635c-cc8f-1f893d947e92@anisinha.ca>
Message-ID: <40cc3fc1-fb51-1e56-584e-e6bbaab24bc9@anisinha.ca>
References: <YzK1VzoU05vnlxY4@redhat.com>
 <CAARzgwxpm-tF3OwK95gHe+9_6qBebiqPFLug-59RUt85aCnuZQ@mail.gmail.com>
 <YzLN3Y1pNO8SVn9M@redhat.com>
 <CAARzgwx+ZitnYKvmkDGA1+Aq3_yPQFSs5GfTvGaAeNmHxUSNOQ@mail.gmail.com>
 <CAARzgwwLXp9rDkQ4OTW2TUgnp_XDyMTXf6OhsKE9qAL1HTuMRQ@mail.gmail.com>
 <YzMahUpNtsas18rN@redhat.com> <20220927172044-mutt-send-email-mst@kernel.org>
 <2a5c6c18-e0b1-aaf8-78fa-5a12396fef87@redhat.com>
 <20220928053421-mutt-send-email-mst@kernel.org>
 <17d249fc-d1b7-4336-fa4c-dc5e245e10c8@redhat.com>
 <20220928055339-mutt-send-email-mst@kernel.org>
 <5b2c3c2c-c3bc-ae74-f554-fed4a0f64f56@anisinha.ca>
 <125d5b7-2f90-635c-cc8f-1f893d947e92@anisinha.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1241458362-1665051499=:3799686"
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x529.google.com
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2088271309-1241458362-1665051499=:3799686
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT



On Thu, 6 Oct 2022, Ani Sinha wrote:

>
>
> On Thu, 6 Oct 2022, Ani Sinha wrote:
>
> >
> >
> > On Wed, 28 Sep 2022, Michael S. Tsirkin wrote:
> >
> > > On Wed, Sep 28, 2022 at 11:39:36AM +0200, Thomas Huth wrote:
> > > > On 28/09/2022 11.35, Michael S. Tsirkin wrote:
> > > > > On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
> > > > > > On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> > > > > > > On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> > > > > > > > On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> > > > > > ...
> > > > > > > > > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > > > > > > > > However, the question still remains, where do we keep the generated
> > > > > > > > > artifacts?
> > > > > > > >
> > > > > > > > The following link will always reflect the published artifacts from
> > > > > > > > the most recently fully successful CI pipeline, on the 'qemu-bits'
> > > > > > > > branch, and 'qemu-bits-build' CI job:
> > > > > > > >
> > > > > > > > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> > > > > > > >
> > > > > > > > Tweak as needed if you push the CI to master branch instead. This
> > > > > > > > link can be considered the permanent home of the artifact. I'd just
> > > > > > > > suggest that the QEMU job automatically skip if it fails to download
> > > > > > > > the artifact, as occassionally transient infra errors can impact
> > > > > > > > it.
> > > > > > >
> > > > > > > This just means once we change the test old qemu source can no longer use it.
> > > > > > > Why is this a good idea? Are we so short on disk space? I thought CPU
> > > > > > > is the limiting factor?
> >
> >
> > I did some expriments and it seems we can keep latest artifacts for every
> > tagged release of bits. So I have adjusted the yaml file so that everytime
> > I push a new tag, a build is
> > triggered and the artifacts are preserved without expiry. Ofcourse for
> > non-tagged changes, one can trigger the build manually from the web UI as
> > well.
> >
> > For exmaple, this link
> > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/3134519120/artifacts/download?file_type=archive
> > should download the current artifacts for the tag qemu-bits-latest.
> >
> > What I am not sure is how to get a downloadable link for the latest build
> > for a particular tag without the numeric job ID (which can change across
> > builds)? So for example, we can have a consistent URLs to download
> > archives
> > for every tagged releases and then the test can choose which tagged
> > release to
> > use. If we can have this then its as good as keeping binaries in a version
> > control system like git.
>
>
> To answer my own question, this is the URL for the qemu-bits-latest tag:
>
> https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits-latest/download?job=qemu-bits-build
>
> which is the same as
>
> https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits-09272022/download?job=qemu-bits-build
>
> currently.
>
> If the latest version of bits changes, we can make "qemu-bits-latest" tag
> always point to the latest version while artifacts for the older tagged
> releases will continue to be available.
>
> danPB, please correct if I am mistaken.

Seems this answers it:
https://docs.gitlab.com/ee/ci/pipelines/job_artifacts.html#access-the-latest-job-artifacts-by-url

So even we can download individual files from the artifact:

https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits-latest/raw/bits-2020-e40af4a7-grub.tar.gz?job=qemu-bits-build

where the ref can be a tag or a branch. This makes me happy.

>
> >
> > > > > >
> > > > > > FYI, we'll soon be short on disk space, gitlab plans to introduce storage
> > > > > > limits:
> > > > > >
> > > > > >   https://about.gitlab.com/pricing/faq-paid-storage-transfer/
> > > > > >
> > > > > >   Thomas
> > > > >
> > > > > A good reason not to use CI artifacts to store images maybe?
> > > > > I was proposing storing binaries on qemu.org not on gitlab.
> > > >
> > > > For qemu.org, you should maybe talk to Paolo and Stefan first, I'm not sure
> > > > whether we could allow additional network traffic
> > > > beside the normal release tarballs there...
> > > >
> > > >  Thomas
> > >
> > > I guess we need to design this sensibly to checksum local files
> > > and only fetch if there's change, and that only for
> > > people who work on ACPI.
> > >
> > > --
> > > MST
> > >
> > >
--2088271309-1241458362-1665051499=:3799686--

