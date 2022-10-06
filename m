Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7146C5F624E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 10:09:14 +0200 (CEST)
Received: from localhost ([::1]:48130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogLwM-0003g1-8T
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 04:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogLlr-0007Ko-Cn
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 03:58:19 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38471)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1ogLlp-0000w3-4J
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 03:58:19 -0400
Received: by mail-pf1-x42b.google.com with SMTP id w191so1358246pfc.5
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 00:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=hS9Pi9hzoqy2YYYjNPiwU1QocsnPL/1AZ+vQ0vfNPis=;
 b=7nOr3BMmLDAi9pC0AdbyHVgF9m4nORT2hkEi+KJ7110jtcWGQFckUMiJ2XOf/zJtl9
 4UzNsMt50oIr2Y3WnUjP5ug+mGwet/8EtL0XoLGZyIkzU4tDIjcmQ49V/BDEiDEqSYLH
 CcWkD2I64p66sWd8LOeXqC3PraYErSH2ErcF9aMZ760oSYgzhqWdLh9WUs8lijiitXUI
 DTQM4bsPxO3y8LhneUSIW6DRs+V/L7wR5k6NdnydCYGdyyMS5TKU8J+bkBW+j1wOTvZp
 Q3PQtNKQTv4wnZnw+qCWh2oL1lO5sR4uTQa9B/EL6yxFgVN6nDLs0kswGOzYAuztt/oz
 B4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hS9Pi9hzoqy2YYYjNPiwU1QocsnPL/1AZ+vQ0vfNPis=;
 b=uBIGXGl4gaEWSmlFY6fns5mP6CIIjsUNyYjdpHmnYXSa3lEEjtd56Ae6UtYMcUJh1y
 13WNZ2WK9+eZ90K77PsewqzG2Xn5jE+7HOZfrIEPRCrMdD3t9qEouh2oH+7zgmDYOtPu
 zPlwSbdDf/zfWSpd66OEkWSBQ7B/clUKmxO6g5M4rrBjzPUehqVImdJURw0mTTYy42/Q
 jOZHmOZYBuMSFYZdoxDa0Mmg2c53jR9bba2JhHx/+J0APdImlPgWXPTBmBUO4adsv2Jr
 nO4fNagay+McCLXqPh8MKrw97IQmsAJthEwdR8Uw2V+BuSmT3OWoyRu+h4jmoGXWTen1
 oWdg==
X-Gm-Message-State: ACrzQf3iEpUqJNbETWO9P7UkZNWTm/h//BduOkhnH0dvEvzKBmRqroOf
 XJFfqN+xw8HaAimRMGLyImtLtg==
X-Google-Smtp-Source: AMsMyM7UhO5fG7dKOI9Kync+9Oj5qp0NKPE7lbEs9lSe4QGo+TwAU2p3ROdITwxW4NPVODt1kVD1Og==
X-Received: by 2002:a63:2155:0:b0:455:7b5b:c2d7 with SMTP id
 s21-20020a632155000000b004557b5bc2d7mr3342996pgm.309.1665043095047; 
 Thu, 06 Oct 2022 00:58:15 -0700 (PDT)
Received: from 192.168.1.12 ([115.96.122.113])
 by smtp.googlemail.com with ESMTPSA id
 q16-20020aa79830000000b00561e56cd33fsm3627733pfl.168.2022.10.06.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 00:58:14 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 6 Oct 2022 13:28:08 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 pbonzini@redhat.com, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Ani Sinha <ani@anisinha.ca>, imammedo@redhat.com, jsnow@redhat.com, 
 peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
In-Reply-To: <20220928055339-mutt-send-email-mst@kernel.org>
Message-ID: <5b2c3c2c-c3bc-ae74-f554-fed4a0f64f56@anisinha.ca>
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
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="2088271309-1401413795-1665043094=:3799686"
Received-SPF: none client-ip=2607:f8b0:4864:20::42b;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42b.google.com
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

--2088271309-1401413795-1665043094=:3799686
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT



On Wed, 28 Sep 2022, Michael S. Tsirkin wrote:

> On Wed, Sep 28, 2022 at 11:39:36AM +0200, Thomas Huth wrote:
> > On 28/09/2022 11.35, Michael S. Tsirkin wrote:
> > > On Wed, Sep 28, 2022 at 10:31:39AM +0200, Thomas Huth wrote:
> > > > On 27/09/2022 23.21, Michael S. Tsirkin wrote:
> > > > > On Tue, Sep 27, 2022 at 04:45:09PM +0100, Daniel P. Berrangé wrote:
> > > > > > On Tue, Sep 27, 2022 at 07:35:13PM +0530, Ani Sinha wrote:
> > > > ...
> > > > > > > Alright, .gitlab-ci.yml is produced and the pipeline succeeds.
> > > > > > > However, the question still remains, where do we keep the generated
> > > > > > > artifacts?
> > > > > >
> > > > > > The following link will always reflect the published artifacts from
> > > > > > the most recently fully successful CI pipeline, on the 'qemu-bits'
> > > > > > branch, and 'qemu-bits-build' CI job:
> > > > > >
> > > > > > https://gitlab.com/qemu-project/biosbits-bits/-/jobs/artifacts/qemu-bits/download?job=qemu-bits-build
> > > > > >
> > > > > > Tweak as needed if you push the CI to master branch instead. This
> > > > > > link can be considered the permanent home of the artifact. I'd just
> > > > > > suggest that the QEMU job automatically skip if it fails to download
> > > > > > the artifact, as occassionally transient infra errors can impact
> > > > > > it.
> > > > >
> > > > > This just means once we change the test old qemu source can no longer use it.
> > > > > Why is this a good idea? Are we so short on disk space? I thought CPU
> > > > > is the limiting factor?


I did some expriments and it seems we can keep latest artifacts for every
tagged release of bits. So I have adjusted the yaml file so that everytime
I push a new tag, a build is
triggered and the artifacts are preserved without expiry. Ofcourse for
non-tagged changes, one can trigger the build manually from the web UI as
well.

For exmaple, this link
https://gitlab.com/qemu-project/biosbits-bits/-/jobs/3134519120/artifacts/download?file_type=archive
should download the current artifacts for the tag qemu-bits-latest.

What I am not sure is how to get a downloadable link for the latest build
for a particular tag without the numeric job ID (which can change across
builds)? So for example, we can have a consistent URLs to download
archives
for every tagged releases and then the test can choose which tagged
release to
use. If we can have this then its as good as keeping binaries in a version
control system like git.


> > > >
> > > > FYI, we'll soon be short on disk space, gitlab plans to introduce storage
> > > > limits:
> > > >
> > > >   https://about.gitlab.com/pricing/faq-paid-storage-transfer/
> > > >
> > > >   Thomas
> > >
> > > A good reason not to use CI artifacts to store images maybe?
> > > I was proposing storing binaries on qemu.org not on gitlab.
> >
> > For qemu.org, you should maybe talk to Paolo and Stefan first, I'm not sure
> > whether we could allow additional network traffic
> > beside the normal release tarballs there...
> >
> >  Thomas
>
> I guess we need to design this sensibly to checksum local files
> and only fetch if there's change, and that only for
> people who work on ACPI.
>
> --
> MST
>
>
--2088271309-1401413795-1665043094=:3799686--

