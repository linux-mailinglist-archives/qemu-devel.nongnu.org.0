Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D0C54B408
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 17:00:42 +0200 (CEST)
Received: from localhost ([::1]:40342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1825-0002Hp-Us
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 11:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17xw-00009h-Gh
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:56:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1o17xu-0002N6-7y
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655218581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AgqnDdh9SkWdl9V4fZZiEvBxoUNAy8baQLtuPGsWjIk=;
 b=K0eF2u+EkvGBh+KIlWphAwwe/o0xNg/q3qIPJg0lRJCcRolW80lRExHOnLGaF+UHFD43Ny
 9znHhZGkxQB+uvpoDl7Siscz9BZBcZmYmYvqog/fj10TpBrsOQUZxE5tjA16SbBHIOsqWN
 MEM1KhJF0lWoCJ7WidWbpBWK+xr98Qs=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-Hny22R2oOiqTf6n_e23P6A-1; Tue, 14 Jun 2022 10:56:20 -0400
X-MC-Unique: Hny22R2oOiqTf6n_e23P6A-1
Received: by mail-ua1-f71.google.com with SMTP id
 s14-20020ab02bce000000b0035d45862725so4140900uar.22
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:56:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AgqnDdh9SkWdl9V4fZZiEvBxoUNAy8baQLtuPGsWjIk=;
 b=lsnkIu2o6c5DdLWmKpauhYIEm/KvKYbtjvMnjtPopP6aTu+P9dTeyUj0BKzxlKWkf7
 Mbp35q4hQuEb6jj+hIqEjquJeLuoyw1hs2Qker9ejyDpw89kzMgbRhRMLo3ssb5YZCdm
 KIHL6QxYa1l/pV+o0dCCREq1titGuuQrFJn9Xh26GGBhnSSVNt0SQ18wOuE1V72num69
 NxmKnupBoZ+hFi6Kpq+XFj7UgD6capb/E338QQWx0kDeXdSdmAhip/VymRmhtsD7ITG2
 w3+crCti5qqRevc9xPCiaGs4l47dz+2/dooY42nU4quKctA9sH24Y+0SoVYmBzIepkra
 iw5w==
X-Gm-Message-State: AJIora99gbwgWDIKA1qzs7f1decIxLvy4uO8ZDwWAmmX52B7glqnJP9E
 Gp/IfKFRe8L2UZbINKq+AsgU7QMEk8XbKDS8cSTwtoMDY/0MNwC00Dg97I0rhS76QLL5vW0NFdz
 0k6UlKBqBINQvppViTly2L0FwgYOB5j4=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2388447vso.61.1655218579867; 
 Tue, 14 Jun 2022 07:56:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v3D2CG4SOyS+2KCAteAYoeb9xZ7hbkrg9XuizrKIPdf2eqSu/UtYlYYn7tKOLLoO39CJ74NsX8vbBz6lOtOCM=
X-Received: by 2002:a67:f592:0:b0:34b:ba28:f7b4 with SMTP id
 i18-20020a67f592000000b0034bba28f7b4mr2388439vso.61.1655218579701; Tue, 14
 Jun 2022 07:56:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220614015044.2501806-1-jsnow@redhat.com>
 <20220614015044.2501806-5-jsnow@redhat.com>
 <YqhQLC7vsLDAjLK7@redhat.com>
In-Reply-To: <YqhQLC7vsLDAjLK7@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Jun 2022 10:56:09 -0400
Message-ID: <CAFn=p-bZRCD_grxoGgiC9spo7sf8rtB8J=dTdWxpL0E2C=fjmQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] tests/vm: switch CentOS 8 to CentOS 8 Stream
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>, 
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 14, 2022 at 5:09 AM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m> wrote:
>
> On Mon, Jun 13, 2022 at 09:50:43PM -0400, John Snow wrote:
> > The old CentOS image didn't work anymore because it was already EOL at
> > the beginning of 2022.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  tests/vm/centos | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/tests/vm/centos b/tests/vm/centos
> > index be4f6ff2f14..f5bbdecf62d 100755
> > --- a/tests/vm/centos
> > +++ b/tests/vm/centos
> > @@ -1,8 +1,8 @@
> >  #!/usr/bin/env python3
> >  #
> > -# CentOS image
> > +# CentOS 8 Stream image
> >  #
> > -# Copyright 2018 Red Hat Inc.
> > +# Copyright 2018, 2022 Red Hat Inc.
> >  #
> >  # Authors:
> >  #  Fam Zheng <famz@redhat.com>
> > @@ -18,7 +18,7 @@ import basevm
> >  import time
> >
> >  class CentosVM(basevm.BaseVM):
> > -    name =3D "centos"
> > +    name =3D "centos8s"
>
>
> What's the effect of this ?  It feels a little odd to set name to 'centos=
8s'
> here but have this file still called just 'centos' - I assume the 'name'
> variable was intended to always match the filename
>

Changes the logfile names in ~/.cache/qemu-vm, changes the hostname
config in gen_cloud_init_iso(), not much else.

You're right, though, I shouldn't change it in one place but not the
other ... I'll just leave it as "centos". I felt compelled briefly to
indicate it was "the newer, different CentOS" but with the old one
being EOL I suppose it's easy enough to infer.

--js


