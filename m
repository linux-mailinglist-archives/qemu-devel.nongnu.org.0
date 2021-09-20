Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A5041189A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 17:49:21 +0200 (CEST)
Received: from localhost ([::1]:60454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSLXk-0001fR-OJ
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 11:49:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSLPo-00021T-DS
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mSLPj-000203-OZ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 11:41:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632152462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ou7OJsVRPOh6va7rPtFOjyu+xcEbNoXYsNbiY3S15C4=;
 b=DoRnoO4oMSEYhvXXyORsPLhEN6N8T9M61jVYWle7vST8IS3ui1wI4xCK/LffMMuJFCuCJ2
 4U4Gdgx1f8h75G1ZJicVHqmHT0t6826f2GdwaqU/ePgYaCF22lUwCAxhZguhl6hKSKof9W
 60WDBHUqJN09mf/5RKe1k5TwMzxQdCA=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-pMgGSH8qN2Kzja54l_C_Fw-1; Mon, 20 Sep 2021 11:40:59 -0400
X-MC-Unique: pMgGSH8qN2Kzja54l_C_Fw-1
Received: by mail-vs1-f69.google.com with SMTP id
 a67-20020a671a46000000b002d50de61230so8415154vsa.2
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 08:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ou7OJsVRPOh6va7rPtFOjyu+xcEbNoXYsNbiY3S15C4=;
 b=Q6Vecme/VKc3H6V/ifncW6uqO3qAN8gdW0a+HKvK1H5kvGm4tirBlHtMsXxKLpxLp3
 s1Nz78WKi8SyXSWqQ7b6bNQyc+lbqUsS91BUg23AP8rALT/qGAfs09Krrp2gbPsxkwwL
 T7NDjEpiufiamesK8NvLRS2t6oJQ7obR32ueGLozc5Qq1c8v/DOl7uBGASISALuOHnIN
 aUUXkBnTtCFTSCLojB36mUdFxGXIi8NSAdHlxsDAoAG4+1JXYoEQWgos5gXa32fN9DsH
 jckPR4RfNt5CpjOyh0k4+PApSMnXthYA56sOBG5jPSqEmzdn2xf5sjzHucRnUDjQsuB4
 GcTQ==
X-Gm-Message-State: AOAM533g4lrhxZ26PI1v8dlH/nsHrT79WEnm5NHxiyX8UGlTd/GedQHj
 snpLWQCrF/C1vg0YLjooQGYxCPxTvvvqw9nLLjGApbbhG4Z0A9hvVJ7t0dPOqiLdcasXEzygd2D
 AoWWIcTToJpWgm+H0lEXU8gmE4HSE0BI=
X-Received: by 2002:a1f:5e14:: with SMTP id s20mr15224040vkb.7.1632152458866; 
 Mon, 20 Sep 2021 08:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy7G2JTKHwDDDicOpjJhXh8Kkm9rSWfVxDebUE6+6tyIeHdnQVxjvPNWM5d+C9pRvDFqkskTByRdtKo06z5RQ=
X-Received: by 2002:a1f:5e14:: with SMTP id s20mr15224015vkb.7.1632152458681; 
 Mon, 20 Sep 2021 08:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210803193447.3946219-1-crosa@redhat.com>
 <CAFEAcA-oLJeEOXakQboy=gWhWukv595Dr=5n6Nh7tN5GKfYWcA@mail.gmail.com>
In-Reply-To: <CAFEAcA-oLJeEOXakQboy=gWhWukv595Dr=5n6Nh7tN5GKfYWcA@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 20 Sep 2021 12:40:32 -0300
Message-ID: <CAKJDGDZ1ZKMduxF-QA35G7ReiOqBtXsXRRyDZWgnHZ8SvgYE6w@mail.gmail.com>
Subject: Re: [PATCH 0/2] Acceptance Tests: clean up of temporary dirs and
 MAINTAINERS entry
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.475,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 20, 2021 at 10:59 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 3 Aug 2021 at 20:35, Cleber Rosa <crosa@redhat.com> wrote:
> >
> > This is a reply to an issue[1] reported by Peter, and while at it, an
> > update of the MAINTAINERS entry so other people now the status and
> > where to go for help with regards to the acceptance tests'
> > infrastructure.
> >
> > [1] https://lists.gnu.org/archive/html/qemu-devel/2021-08/msg00349.html
>
> Ping? I was reminded of this today, and it looks like
> the acceptance tests are still wasting gigabytes of
> everybody's disk space with non-cleaned-up tempfiles...

Cleber will be out until next Wed. I took the bug fix patch and
changed it based on Wainer's comment:

https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg05117.html

>
> -- PMM
>


