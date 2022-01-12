Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292D448CA9A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 19:05:54 +0100 (CET)
Received: from localhost ([::1]:37774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7i0O-00064f-Mm
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 13:05:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hxu-0003tC-MV
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 13:03:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hxr-00061V-S0
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 13:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642010595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WdZ2HOob8E2QpRUznbgPG6e2BVf7KMejDr0FmCeEEM4=;
 b=LT+2i9Fp/YPyVC0IaboDAvEBK+ZAqCi6coDtqvwlQ6vn51OeuGIwmmBPmRRwGH7A7veWNj
 mPVUVZNXEoFzzObhgwkcNz/HerJ9cMXj5fAJH5fATlirGnv7JDFgKLIyFgf0v4AA3pmIzI
 e63xJ6bVC3eIuG69h6kPJ+WY8r4NDdY=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-_ebyVH1DOsOxFdMlev2-6Q-1; Wed, 12 Jan 2022 13:03:11 -0500
X-MC-Unique: _ebyVH1DOsOxFdMlev2-6Q-1
Received: by mail-ua1-f69.google.com with SMTP id
 y7-20020ab05607000000b003065444c62dso2129301uaa.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 10:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WdZ2HOob8E2QpRUznbgPG6e2BVf7KMejDr0FmCeEEM4=;
 b=tVIqF9SXqNtYlrPZwztZABDesz7/kwq12e5U83PgOx25dLJZecpwzJ2WN02ijnmVZa
 kxtdGXPsApgNes27dfVtHxNR8HvuVjEmhLGq+8gzreXnV1cUM6OU7V6WoGAh8DBtn+wu
 ZrHvowwaN2JwGoxic5waopR6ZRSlT8JciHFfd+Qdyz9EDlvXXQ7dfzXfa/1o9YAQ7BI0
 TaZfVpFJRBZegaoB+V+kvpFgl7wAcEsrByRF/SsoLPY2guyv29unH0ZwgtrkazLsVgOv
 jMV8ZU+Zn5e8R1vc/k+lscbg+61eCGnnFwDyuQcy/v9YPeJCEg/+VOYT3v+HMA+rsZLb
 F30g==
X-Gm-Message-State: AOAM533/qP855aAXeWGLDb7w02Q+Ns44bmkH9bx0D6A7P6S5Nk/+RfhS
 pUNW+barPj3SpPfuzk2xb7VPL2tZpH8sEgKCHIlOhu+/BqUlm7y3TRTIyvSK+kj50Ibc9g2S2U8
 PdQMTaAekbb9TPjyHJ708dAGoF67luLc=
X-Received: by 2002:a05:6102:3566:: with SMTP id
 bh6mr568387vsb.11.1642010590985; 
 Wed, 12 Jan 2022 10:03:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYpurmU4GVn4wPAurcB6Ks1a5pKeXDdetPHNzorJOOlPf1LU1c/aTV/vJJaHOVzgnKxs47XghrhRvhvo4+F2M=
X-Received: by 2002:a05:6102:3566:: with SMTP id
 bh6mr568354vsb.11.1642010590357; 
 Wed, 12 Jan 2022 10:03:10 -0800 (PST)
MIME-Version: 1.0
References: <CAFn=p-b+ene2vKCCDJR9viT9P=GyhBeAO5ZLGsUmiijoxrkfCg@mail.gmail.com>
 <Yd6z2WS3hGwPNKkl@stefanha-x1.localdomain>
 <CAFn=p-Zb3fmj5sf=+dGizxiYTySM4gU2Q6wudxnf67X=6nsyvQ@mail.gmail.com>
 <Yd8RFkaghPuEyBUF@redhat.com>
 <CAFn=p-Zn3KiGj2zHwjuBd6xRdG_rD-+QM-PsZ5NiKk62vQTx0g@mail.gmail.com>
 <Yd8VH1eSi1fOmQXc@redhat.com>
In-Reply-To: <Yd8VH1eSi1fOmQXc@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 13:02:59 -0500
Message-ID: <CAFn=p-a09+EsFrzniorB0eYtf1XU99XZ6ekQ1NWthYRNBGzQBw@mail.gmail.com>
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

On Wed, Jan 12, 2022 at 12:51 PM Daniel P. Berrang=C3=A9 <berrange@redhat.c=
om> wrote:
>
> On Wed, Jan 12, 2022 at 12:47:01PM -0500, John Snow wrote:
> > On Wed, Jan 12, 2022 at 12:34 PM Daniel P. Berrang=C3=A9 <berrange@redh=
at.com> wrote:
> > >
> > > On Wed, Jan 12, 2022 at 12:25:16PM -0500, John Snow wrote:
> > > > On Wed, Jan 12, 2022 at 5:56 AM Stefan Hajnoczi <stefanha@redhat.co=
m> wrote:
> > > > >
> > > > > [Context: John created a PyPI QEMU user in order to publish the q=
emu.qmp
> > > > > package. If anyone wants to publish additional Python packages fr=
om
> > > > > qemu.git, please contact him for PyPI access.]
> > > > >
> > > > > On Tue, Jan 11, 2022 at 03:42:23PM -0500, John Snow wrote:
> > > > > > Account made: https://pypi.org/user/QEMU/
> > > > > >
> > > > > > I can't update the wiki, I lack admin perms to edit
> > > > > > https://wiki.qemu.org/AdminContacts
> > > > > >
> > > > > > I assume in the event that I fall into a black hole or get laun=
ched
> > > > > > out of a cannon into the sun, any mails sent to jsnow@redhat.co=
m can
> > > > > > be recovered by Red Hat in general, so there's a sufficient rec=
ourse
> > > > > > for recovering the account in that circumstance.
> > > > >
> > > > > Thanks, I have added the PyPI QEMU user and added you as the admi=
n
> > > > > contact:
> > > > > https://wiki.qemu.org/AdminContacts#Other_resources
> > > > >
> > > > > Stefan
> > > >
> > > > Thanks, Stefan!
> > > >
> > > > As additional context, there is currently a single package that
> > > > belongs to that user, "qemu.qmp" [1]. I published it "in advance" t=
o
> > > > be able to test integration in an RFC patch set I posted to the lis=
t
> > > > just before the winter break [2]. The package is an "alpha prerelea=
se"
> > > > and is at a very low-risk to be installed by accident. The version
> > > > chosen here will be considered "less than" any other valid version
> > > > string chosen, and can be deleted permanently from PyPI after
> > > > consensus on list review. Please forgive the mid-review publishing.
> > > > The exact metadata, wording of the README, etc is still under revie=
w
> > > > here [3].
> > > >
> > > > As for the PyPI account itself, I have volunteered to administer it=
.
> > > > If anyone wants access (esp. a leadership committee member from
> > > > another employer), please contact me - I'm happy to share.
> > >
> > > As a general rule we should ensure we always have 2 nominated people
> > > with access to any account held on behalf of the QEMU project, so we
> > > have some redundancy in case of unexpected events. So we definitely
> > > ought to have a 2nd person with access to PyPI even if they do nothin=
g
> > > with it.
> > >
> >
> > I'm perfectly fine with that. It'd increase the fault tolerance to
> > have someone from outside of RH be the paper-admin there. Any
> > volunteers?
> >
> > (I can add your email as a secondary contact to the account such that
> > you would be able to use that email to initiate an account recovery,
> > but you wouldn't receive email from PyPI concerning the comings and
> > goings of the account. Your name and email would not show up on any
> > PyPI package pages, so it should very hopefully not involve really any
> > actual maintainership on your part.)
>
> In my case I expect it could complain that my email(s) are already
> in use for other PyPI accounts of my own.

It does complain about this, but there's always the
myname+arbitrary@example.com trick, which works. I have no problem
adding you, but for the purposes of fault tolerance I'd prefer adding
someone outside of RH. If there aren't any takers after a bit, ...

--js


