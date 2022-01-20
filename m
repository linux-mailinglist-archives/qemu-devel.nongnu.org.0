Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324F849577C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 01:46:21 +0100 (CET)
Received: from localhost ([::1]:50888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAi4K-0002PH-22
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 19:46:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAfGi-00061D-UG
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:46:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAfGI-0004ke-Dd
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 16:46:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642715112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iJGsKQ1QovJhT061WnBr0wuZINyrxbxDPKn7Aogg+vM=;
 b=irn/HFO4I/yG5gzfzJZ3xiTOGpnjEigF/AuH617tvDJm2kfUhjx8pe+t3CpwzYO+Waf0tn
 hoZL+G1Y+FZ6b856g4TZ7SHHjtNI2GXsU70B4PcXkMajmkd6yqbBkRw0XzXCEZSxBmbknF
 1a2jdKLrxZCD6vp8YteH7VuiLSbpU1E=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-RtVXUbl_MsuOZJ1PQqcAJQ-1; Thu, 20 Jan 2022 16:45:10 -0500
X-MC-Unique: RtVXUbl_MsuOZJ1PQqcAJQ-1
Received: by mail-ua1-f70.google.com with SMTP id
 g20-20020ab01054000000b00308348ddd80so4352909uab.2
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 13:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iJGsKQ1QovJhT061WnBr0wuZINyrxbxDPKn7Aogg+vM=;
 b=3oUnJ9B8wMUjPd6KAfVmpIzX0X2fHbP84Xspl0kQFwqmXm81gK34AYXwhmah+lv8jl
 nJB70WP4HbKwxtpobUWX5v6ysiCkHY8wBrqWmc2oOZuxWKACuq0cDl6KI4Z1RFLks/Gu
 lL3TIydx3zFy+nc95S3Nkx65FKdk3FQWt8j2fCqH4LNh+5tcylhyLFEWXVVyESSMLGCH
 jqVXDrd4CwzBsg0TtbwPq9C3otwO1H2Q1FtKJz8fpQknMjA/8KjrFMzIUNuJxX+MsnF9
 GFW1p4hIudYUPiwwv+fF+PlFYtSJwH5nQlZKTcyX+O2Qaxbo5+PcctleFE2Z4YjIca3s
 UKig==
X-Gm-Message-State: AOAM530+UfbRbNJ4LvmJaPtcxBKodW44utBklw6qCvj+gHeJDv0nEq/6
 5efunCrdd1oLCoujADuKYzDQIFPtGOSlE2eQ84wcEJW4x21XW0ozW/mU/WQRaRvl9NtO1MT0B5N
 x3PTPkaksLgV3w88aW4vMcA1SqJCgjWc=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr639590uae.128.1642715109713;
 Thu, 20 Jan 2022 13:45:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznMpKzirVnoF91WT9Wkz6ZtysVE1srECJD/VA4qqFTpIGOqcvphg2S2mbVFXAbxbo/ptPE5S9EblC9jvREgoc=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr639576uae.128.1642715109413;
 Thu, 20 Jan 2022 13:45:09 -0800 (PST)
MIME-Version: 1.0
References: <20220119193916.4138217-1-jsnow@redhat.com>
 <20220119193916.4138217-3-jsnow@redhat.com>
 <20220120130617.cmh7aiugzezy4yr3@laptop.redhat>
In-Reply-To: <20220120130617.cmh7aiugzezy4yr3@laptop.redhat>
From: John Snow <jsnow@redhat.com>
Date: Thu, 20 Jan 2022 16:44:38 -0500
Message-ID: <CAFn=p-ZJPVEKthrgk1MTY-Wpts+eyjdefJLuQRHd=aaCRkUn3w@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] python: use avocado's "new" runner
To: Beraldo Leal <bleal@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Qemu-block <qemu-block@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 20, 2022 at 8:08 AM Beraldo Leal <bleal@redhat.com> wrote:
>
> On Wed, Jan 19, 2022 at 02:39:13PM -0500, John Snow wrote:
> > The old legacy runner no longer seems to work with output logging, so we
> > can't see failure logs when a test case fails. The new runner doesn't
> > (seem to) support Coverage.py yet, but seeing error output is a more
> > important feature.
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > ---
> >  python/avocado.cfg | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/python/avocado.cfg b/python/avocado.cfg
> > index c7722e7ecd..a460420059 100644
> > --- a/python/avocado.cfg
> > +++ b/python/avocado.cfg
> > @@ -1,5 +1,5 @@
> >  [run]
> > -test_runner = runner
> > +test_runner = nrunner
> >
> >  [simpletests]
> >  # Don't show stdout/stderr in the test *summary*
>
> Since Avocado 82, the new one is the default. So, you could remove the
> the "[run]" section.
>

I think it was actually since 91.0, but I figured it was more obvious
to reviewers to see the explicit change. Less to explain, and it will
explode a little more if you use an avocado old enough that doesn't
have the nrunner.

> In any case:
>
> Reviewed-by: Beraldo Leal <bleal@redhat.com>
>

Thanks,
--js


