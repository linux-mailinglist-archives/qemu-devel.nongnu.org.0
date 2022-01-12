Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB91B48CA5C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:49:09 +0100 (CET)
Received: from localhost ([::1]:54036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hkC-0002Yx-Bg
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:49:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hiT-0001Da-QD
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:47:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hiQ-0003Kf-2v
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:47:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642009637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6qYb9CDJov5MGQgKjgvCix/8QTtwmQNafkUzxNt7RE=;
 b=IHu7LXJRfSzrzZemJ9SGVAfMgn8qfvjSlYJFyEqKpHyLoPCu/zI7Sc8HUtvcx92A8tqK5K
 mbFg6d8Fzoy0iQ3HmyNHkLKl4Iby1ZMdmq8xBeoBx5GLBr9JBQnzdBPf7Us3A8sgUI3gEJ
 grqg9CXZGsaihDYGB9aYkq/wZNyojbI=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-p4stE4XuMyOPf-hkydIvdQ-1; Wed, 12 Jan 2022 12:47:13 -0500
X-MC-Unique: p4stE4XuMyOPf-hkydIvdQ-1
Received: by mail-ua1-f71.google.com with SMTP id
 z20-20020ab05654000000b00306092e79faso2132932uaa.0
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 09:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g6qYb9CDJov5MGQgKjgvCix/8QTtwmQNafkUzxNt7RE=;
 b=2+TFjg2JCG/sq7V64oA9/sgQgAFZmC3aNXKCY74SEciFXkAkWQ38mDamWqc7r5Lx62
 br/df0vEumR8BBAi6oD3j4fFavkp8jUTQykdGcpe1sIW5rydOwAgfrsi+Y/FNqRjLkJ2
 lceTwsMorW2X9xLub+EAoBt7lcNwEu7ydLwwUHXu3Rsfrce8fl7AbP+YDNyDX0FZtjAB
 qeN31ZgFcELOhU2GE5248j4wnTpDFoi3J+UTSflE3C2COxUg1Q90cSs1UqDAxQLvI42x
 KMTUw8KVcopAgfFQ5ar7Z1j27pNGeyFzeDF6WViwg96CvhjmUMdtoEGD7TPIQC8dZwp7
 CJrw==
X-Gm-Message-State: AOAM5336kfYn9aqGbuYGrnn1Ml9Q8gePOcMKnOAiRNxwv4VWD1mDS2a8
 kbyZ5qGQL1logtDdJMrTUTAvwJNdTAWiTfyRsIjoVp3V6oADP8v3e4nF9YuOv63hP5eX961eqXM
 bSBsU2QiclYJNAzlJjcLEC43g6Yitjfs=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr539112vkt.3.1642009633367;
 Wed, 12 Jan 2022 09:47:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJztFkRP6fG5n9y4HNceEU+8Z9idf19YhQHyP7x3QMfI6cf6/hUmlDY5U7rYbmdsCTSRBWSDmA74jKzblHP3D7w=
X-Received: by 2002:a1f:2d8a:: with SMTP id t132mr539074vkt.3.1642009632749;
 Wed, 12 Jan 2022 09:47:12 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
 <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
 <CAFn=p-Zb3fmj5sf=+dGizxiYTySM4gU2Q6wudxnf67X=6nsyvQ@mail.gmail.com>
 <Yd8RFkaghPuEyBUF@redhat.com>
In-Reply-To: <Yd8RFkaghPuEyBUF@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 12:47:01 -0500
Message-ID: <CAFn=p-Zn3KiGj2zHwjuBd6xRdG_rD-+QM-PsZ5NiKk62vQTx0g@mail.gmail.com>
Subject: Re: PyPI account
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 12:34 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Jan 12, 2022 at 12:25:16PM -0500, John Snow wrote:
> > On Wed, Jan 12, 2022 at 5:56 AM Stefan Hajnoczi <stefanha@redhat.com> w=
rote:
> > >
> > > [Context: John created a PyPI QEMU user in order to publish the qemu.=
qmp
> > > package. If anyone wants to publish additional Python packages from
> > > qemu.git, please contact him for PyPI access.]
> > >
> > > On Tue, Jan 11, 2022 at 03:42:23PM -0500, John Snow wrote:
> > > > Account made: https://pypi.org/user/QEMU/
> > > >
> > > > I can't update the wiki, I lack admin perms to edit
> > > > https://wiki.qemu.org/AdminContacts
> > > >
> > > > I assume in the event that I fall into a black hole or get launched
> > > > out of a cannon into the sun, any mails sent to jsnow@redhat.com ca=
n
> > > > be recovered by Red Hat in general, so there's a sufficient recours=
e
> > > > for recovering the account in that circumstance.
> > >
> > > Thanks, I have added the PyPI QEMU user and added you as the admin
> > > contact:
> > > https://wiki.qemu.org/AdminContacts#Other_resources
> > >
> > > Stefan
> >
> > Thanks, Stefan!
> >
> > As additional context, there is currently a single package that
> > belongs to that user, "qemu.qmp" [1]. I published it "in advance" to
> > be able to test integration in an RFC patch set I posted to the list
> > just before the winter break [2]. The package is an "alpha prerelease"
> > and is at a very low-risk to be installed by accident. The version
> > chosen here will be considered "less than" any other valid version
> > string chosen, and can be deleted permanently from PyPI after
> > consensus on list review. Please forgive the mid-review publishing.
> > The exact metadata, wording of the README, etc is still under review
> > here [3].
> >
> > As for the PyPI account itself, I have volunteered to administer it.
> > If anyone wants access (esp. a leadership committee member from
> > another employer), please contact me - I'm happy to share.
>
> As a general rule we should ensure we always have 2 nominated people
> with access to any account held on behalf of the QEMU project, so we
> have some redundancy in case of unexpected events. So we definitely
> ought to have a 2nd person with access to PyPI even if they do nothing
> with it.
>

I'm perfectly fine with that. It'd increase the fault tolerance to
have someone from outside of RH be the paper-admin there. Any
volunteers?

(I can add your email as a secondary contact to the account such that
you would be able to use that email to initiate an account recovery,
but you wouldn't receive email from PyPI concerning the comings and
goings of the account. Your name and email would not show up on any
PyPI package pages, so it should very hopefully not involve really any
actual maintainership on your part.)

--js


