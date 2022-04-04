Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7915A4F19DA
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:56:30 +0200 (CEST)
Received: from localhost ([::1]:56454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbRsE-0007Tt-Ji
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:56:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbRqH-0006US-Ba
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 14:54:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbRqE-0004Qk-Fh
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 14:54:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649098456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fBlK59ZVMPcc3hpDpHgS9MU0zl3rlReA3pEh5Y/+6Xw=;
 b=OcTn+nNctG6tczG1lsTdXUN9LI7Gcxg+gOPPqy0X6RPSlYPNCTVjdCTFsPx74IoRWncae8
 h5JFZiV5vnC/ycUOzS+qFG3gRhj/fswDjuKic8abcvw2QRDts3ydEspIE13+j5bk1AjHAt
 U7If2M7RKh/G3t3dIL24AIamPBjPUVk=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-2VkJ7Oi5NQ6SYUcXLM0X-A-1; Mon, 04 Apr 2022 14:54:16 -0400
X-MC-Unique: 2VkJ7Oi5NQ6SYUcXLM0X-A-1
Received: by mail-vk1-f199.google.com with SMTP id
 b17-20020ac5c0d1000000b0034493923b9dso253699vkk.12
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 11:54:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fBlK59ZVMPcc3hpDpHgS9MU0zl3rlReA3pEh5Y/+6Xw=;
 b=Er1GMsN8p9q4wNDy7G4MoVoIeR7w1NX+PUnOLXR19Zm7/UsZsi7KaqsIs5Ei66fSiv
 rHKL3hrEOizn5CqibajY5u1ms2ZDY6zPwWlH5cbJ+QlyUvOh7g3Z9EzN7iQNnRQlCBLz
 qFbS+M7P0KC0/6Mbh14+Plb0azWcv0YrUjPgllsxanU9UdrIxucW2sZ3d1rKyhVcYaHF
 oUm9su3FTsiDQqT+I9ksI56eh3nZhVOjHhylkDyNps6BfCKQxtm3uw+sCjpmm6aaoocV
 kSSJ4g5Uc7OlFYz8AdglwwSw7WAWLWQpiTr4BMmBxyryJKDcD3N/9K9PYsPaY0nAtzNu
 4M5A==
X-Gm-Message-State: AOAM530osDi4Fnc/zZZR9I/EcnH3tYJ/m1Er2BFELIyi0vJQzgdU0v8z
 TzH7Hoyh6xE2pKa7BxFhtGjur42kVH+hkwVgjCyihnU2hsYKiKsGILbT1UYnpPgdygLphV8lxRe
 PvWPlsVq2oMLaiXwWKCR3Vmy/hKLlM+w=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr414914vst.35.1649098455447; 
 Mon, 04 Apr 2022 11:54:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykHMbKj6fbb6w18+nbtmzyb6zXiBW+ie2hYj8QqnI2rQ22gQcEIa8ENyN5y8LDNDp2Ubbq2M1wNmIiPzjm6PQ=
X-Received: by 2002:a05:6102:c91:b0:325:e47d:bab2 with SMTP id
 f17-20020a0561020c9100b00325e47dbab2mr414904vst.35.1649098455270; Mon, 04 Apr
 2022 11:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-3-jsnow@redhat.com>
 <YkcwzP2lu8B8dYNu@paraplu>
In-Reply-To: <YkcwzP2lu8B8dYNu@paraplu>
From: John Snow <jsnow@redhat.com>
Date: Mon, 4 Apr 2022 14:54:04 -0400
Message-ID: <CAFn=p-ZZxDNhvYuOqO4XZ1H72ED4R3te2fikoV+mF6UZ7+pqRA@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 02/13] fork qemu.qmp from qemu.git
To: Kashyap Chamarthy <kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 1, 2022 at 1:05 PM Kashyap Chamarthy <kchamart@redhat.com> wrote:
>
> On Wed, Mar 30, 2022 at 02:24:13PM -0400, John Snow wrote:
> > Split python/ from qemu.git, using these commands:
> >
> > > git subtree split -P python/ -b python-split-v3
> > > mkdir ~/src/tmp
> > > cd ~/src/tmp
> > > git clone --no-local --branch python-split-v3 --single-branch ~/src/qemu
> > > cd qemu
> > > git filter-repo --path qemu/machine/           \
> >                   --path qemu/utils/             \
> >                   --path tests/iotests-mypy.sh   \
> >                   --path tests/iotests-pylint.sh \
> >                   --invert-paths
> >
> > This commit, however, only performs some minimum cleanup to reflect the
> > deletion of the other subpackages. It is not intended to be exhaustive,
> > and further edits are made in forthcoming commits.
> >
> > These fixes are broken apart into micro-changes to facilitate mailing
> > list review subject-by-subject. They *could* be squashed into a single
> > larger commit on merge if desired, but due to the nature of the fork,
> > bisectability across the fork boundary is going to be challenging
> > anyway. It may be better value to just leave these initial commits
> > as-is.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  .gitignore |  2 +-
> >  Makefile   | 16 ++++++++--------
> >  setup.cfg  | 24 +-----------------------
> >  setup.py   |  2 +-
> >  4 files changed, 11 insertions(+), 33 deletions(-)
>
> The changes here look fine to me (and thanks for making it a "micro
> change").  I'll let sharper eyes than mine to give a closer look at the
> `git filter-repo` surgery.  Although, that looks fine to me too.
>
> [...]
>
> >  .PHONY: distclean
> >  distclean: clean
> > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > +     rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> >       rm -f .coverage .coverage.*
> >       rm -rf htmlcov/
> > diff --git a/setup.cfg b/setup.cfg
> > index e877ea5..4ffab73 100644
> > --- a/setup.cfg
> > +++ b/setup.cfg
> > @@ -1,5 +1,5 @@
> >  [metadata]
> > -name = qemu
> > +name = qemu.qmp
> >  version = file:VERSION
> >  maintainer = QEMU Developer Team
>
> In the spirit of patch 04 ("update maintainer metadata"), do you also
> want to update here too? s/QEMU Developer Team/QEMU Project?
>

Good spot.

> FWIW:
>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
>
> [...]
>
> --
> /kashyap
>


