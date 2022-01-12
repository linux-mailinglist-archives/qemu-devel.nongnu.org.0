Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576748C9FD
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:41:12 +0100 (CET)
Received: from localhost ([::1]:40600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hcU-0001qb-R4
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hSa-0001s3-IY
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:30:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7hSW-00004w-4Y
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642008636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+nCIP2vyyIXRDzq8YL8ENJEbX5KbR8CeBi/v2p8Ifos=;
 b=ZoUcLPu9x0jP0juczKim6jVpDSHnMnGgD68f9EW8p/p5FnM5BwWQloZVoqyliIGfNWevrF
 8psBHPUZJRd5LDQfZwN0D8/DXomPL+D6k/5Vr4bXHxkyHNJkuOGIOvltkCST4NPFG604ey
 EP//sOGHNaYW9/HNK5TEaUNe/WzLSgM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-kE7f0-haNA6nG7sZPtYyJA-1; Wed, 12 Jan 2022 12:30:34 -0500
X-MC-Unique: kE7f0-haNA6nG7sZPtYyJA-1
Received: by mail-ua1-f70.google.com with SMTP id
 k19-20020ab05393000000b003058f4a3fabso2089030uaa.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 09:30:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+nCIP2vyyIXRDzq8YL8ENJEbX5KbR8CeBi/v2p8Ifos=;
 b=O221bDq3WMoLTu0xialmmtEy9rxMZWtjxW6j9U3ignoUHSAuQCF+Po/lKsxgMTlotb
 vCBerf5d7K/C0+rEniYYE565xCkRJp1TT02/1Bq8sW2B/LqrI+J9BidHPxQrRs0f/nWV
 DKtPXuisZ7VFv3+CJO401nbrO/rW5yM+S390qZShbQd5S3rgXNAoPPCnttadPnlzCg6a
 PKIcq8AsUoID7c2odNj9Sc8qe7QajBVmxnD/gipv1q+MjWP8nK8yxvB9sS4ZfXQm2Qdc
 p21i6XbQJqx8ng8PZr6mvyQxwP0KvvXNBLMIwjJvWCixHKzJb7fO4QlE6Ux16KQCThW1
 mFVA==
X-Gm-Message-State: AOAM530BkWLRIKStceudPpZSdoqhUoBSlC36wB8VXlkDQ8SZdyx2YCjp
 ORhftAzrBM2RNFY5MWDpqSa41RORpyMW4G3I/D/trdUxIoaKOTyUlbuC1Esl/8c+Pvm09IL6WQr
 mjH1c3y03mXr/mnP6Y6/unA92MVQ7lmM=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr478252vst.61.1642008633842; 
 Wed, 12 Jan 2022 09:30:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyhy1YrVKHiNtxpVuP0ep+SXUrH6CJCn0MLETmPwT6u0+c4MVS3h65AR0FlGBHXAMshET/NHwt8GZGqdZmfTmE=
X-Received: by 2002:a05:6102:3714:: with SMTP id
 s20mr478229vst.61.1642008633579; 
 Wed, 12 Jan 2022 09:30:33 -0800 (PST)
MIME-Version: 1.0
References: <20211215210634.3779791-1-jsnow@redhat.com>
 <20211215210634.3779791-18-jsnow@redhat.com>
 <YbsZe9A/Lf2g1Xk8@redhat.com>
 <CAFn=p-bPUsw19uW=gfzGBwT5zDm3t4QHCvzf0nJjbcwcOKkA=g@mail.gmail.com>
 <YbyUlrmexR77cbip@redhat.com>
 <CAFn=p-ZmBfThKMJ-vWyvJ8b7ccD+mv=TynSPDoCM-tdne5jEYw@mail.gmail.com>
 <Yd6oS3mCXs1AXVPy@redhat.com>
In-Reply-To: <Yd6oS3mCXs1AXVPy@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 12 Jan 2022 12:30:22 -0500
Message-ID: <CAFn=p-aoM8wnWBeHmtx8PQZokyOZDNPE90KKASNdKw1EkHx+LQ@mail.gmail.com>
Subject: Re: [RFC qemu.qmp PATCH 17/24] Makefile: add build and publish targets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 5:07 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Tue, Jan 11, 2022 at 02:48:55PM -0500, John Snow wrote:
> > On Fri, Dec 17, 2021 at 8:46 AM Daniel P. Berrang=C3=A9 <berrange@redha=
t.com>
> > wrote:
> >
> > > On Thu, Dec 16, 2021 at 06:35:23PM -0500, John Snow wrote:
> > > > On Thu, Dec 16, 2021 at 5:48 AM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com>
> > > > wrote:
> > > >
> > > > > On Wed, Dec 15, 2021 at 04:06:27PM -0500, John Snow wrote:
> > > > > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > > > > ---
> > > > > >  Makefile | 32 ++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 32 insertions(+)
> > > > > >
> > > > > > diff --git a/Makefile b/Makefile
> > > > > > index 97d737a..81bfca8 100644
> > > > > > --- a/Makefile
> > > > > > +++ b/Makefile
> > > > > > @@ -110,3 +110,35 @@ distclean: clean
> > > > > >       rm -f .coverage .coverage.*
> > > > > >       rm -rf htmlcov/
> > > > > >       rm -rf test-results/
> > > > > > +
> > > > > > +.PHONY: pristine
> > > > > > +pristine:
> > > > > > +     @git diff-files --quiet --ignore-submodules -- || \
> > > > > > +             (echo "You have unstaged changes."; exit 1)
> > > > > > +     @git diff-index --cached --quiet HEAD --ignore-submodules=
 --
> > > || \
> > > > > > +             (echo "Your index contains uncommitted changes.";=
 exit
> > > 1)
> > > > > > +     @[ -z "$(shell git ls-files -o)" ] || \
> > > > > > +             (echo "You have untracked files: $(shell git ls-f=
iles
> > > > > -o)"; exit 1)
> > > > > > +
> > > > > > +dist: setup.cfg setup.py Makefile README.rst
> > > > > > +     python3 -m build
> > > > > > +     @touch dist
> > > > > > +
> > > > > > +.PHONY: pre-publish
> > > > > > +pre-publish: pristine dist
> > > > > > +     @git describe --exact-match 2>/dev/null || \
> > > > > > +             (echo -e "\033[0;31mThere is no annotated tag for=
 this
> > > > > commit.\033[0m"; exit 1)
> > > > > > +     python3 -m twine check --strict dist/*
> > > > > > +     git push -v --atomic --follow-tags --dry-run
> > > > > > +
> > > > > > +.PHONY: publish
> > > > > > +publish: pre-publish
> > > > > > +     # Set the username via TWINE_USERNAME.
> > > > > > +     # Set the password via TWINE_PASSWORD.
> > > > > > +     # Set the pkg repository via TWINE_REPOSITORY.
> > > > > > +     python3 -m twine upload --verbose dist/*
> > > > > > +     git push -v --atomic --follow-tags
> > > > > > +
> > > > > > +.PHONY: publish-test
> > > > > > +publish-test: pre-publish
> > > > > > +     python3 -m twine upload --verbose -r testpypi dist/*
> > > > >
> > > > > It doesn't feel very pythonic to have a makefile in the project.
> > > > >
> > > > > If we want some helpers for publishing releases, I would have
> > > > > expected to see a python script  eg scripts/publish.py
> > > > >
> > > > >
> > > > Eh, Python folks use Makefiles too. I've been using these little Ma=
kefile
> > > > targets for hobby things for a while and I had them laying around a=
nd
> > > ready
> > > > to go. I have no strong need to "upgrade" to python scripts for the=
se
> > > right
> > > > now, unless there's some extra features you want to see.
> > >
> > > Using make means you have to worry about portability across different
> > > impls of make and different impls of shell. Using python means your
> > > python project is portable to anywhere that python runs.
> >
> >
> > I still like the idea of using a Makefile as a "canonical menu of thing=
s
> > you can do in this directory", but there's probably room for interactiv=
e
> > error checking and so on with the TWINE_USERNAME / TWINE_PASSWORD /
> > TWINE_REPOSITORY environment variables in a python script. I'll look in=
to
> > it as a follow-up, if that's fine. (I'm worried it's a lot of polish an=
d
> > effort on a maintainers-only interface that only I will likely use for =
at
> > least the next year or two.)
> >
> > Ultimately, what's likely to happen here is that I will generate some o=
auth
> > tokens with publish permissions and a hypothetical user would set e.g.
> > TWINE_USERNAME to "__token__", and the password would be
> > "pypi-tokengoeshere". Using the "keyring" python package, we could atte=
mpt
> > to fetch stored values from a session keyring, falling back to an
> > interactive prompt if they're unset.
>
> FWIW, don't consider this original comment of mine to be a technical
> blocker, rather it is more of a conceptual observation.  If you don't
> think it matters, I won't mind.
>

OK, thanks -- just didn't want to give the impression I was just
simply ignoring it, since I appreciate the look-over.

--js


