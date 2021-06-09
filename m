Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D683A1D64
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:59:44 +0200 (CEST)
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr3QV-0007TA-IO
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr3OL-0005BQ-B9
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:57:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lr3OI-0000I5-OO
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:57:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623265045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aLCMty/d5rYA/031fTfA5yXkASb3Xd54TEAj7pkTOn4=;
 b=DkvrQBH1eeHz9dU3r86UIwK66fcLASlddYsmnlHEf48oQUo11vyc53oPKIvyHXYv3sgdfT
 OkhQ4Mpqbq67JhEW1cMDvrECGbtT4T+aCnmhlyxr/gNUdHbJthBcHLwSTQOA/j0kM0LLbR
 FWNwbFB2UAemubQiWkgiPMTFRsPp+ao=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-g1xcvH8EMTm8v38KQlpq_g-1; Wed, 09 Jun 2021 14:57:23 -0400
X-MC-Unique: g1xcvH8EMTm8v38KQlpq_g-1
Received: by mail-vs1-f69.google.com with SMTP id
 e26-20020a67eb9a0000b029025e73f153d5so358400vso.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLCMty/d5rYA/031fTfA5yXkASb3Xd54TEAj7pkTOn4=;
 b=pI22P046mO512ZaTON7cVuUFqhC6wbzEOA//TPr5nVlhyXRU2IcgZcYyei4AKlsgMz
 7RYqteYGyjSGhO2oiSro+qF1+Z3JlqIq4Sxf6yJHv7/xCXYPn1eIP6ZGaFM8rSo2fMYP
 RyvQHU1EvZQjagcm7VZGCfmd1gHzJdgblsbYWAk/zKqUtVmi4fQa6ncH8c0Kfss14EAW
 EEYtBS5urfuddI/HYsDTowUIV1nNPRpC+zDDR1eJVvmc6ub2wjcJ6eldeHq63lxhRRCu
 0aTbEhlqHFgJqwwPa4OWuZ+xOpvrGJbABL3wazCnX8WP2WtL73Kfi/UJCq1Jm86AsCTK
 m7mg==
X-Gm-Message-State: AOAM53018Fjl8dF+xYdfL7cF4fhHDjvpaQk6lxoPvCvaY9JqrBfItwLg
 8qWH7yZyjXy3dNrs3PGPJG/d0B6Kt/Cu2fVLs8euTXS9ahEdtrGV9qIlTnQt8BEGhVxfPJmWm7n
 lRnkvW7PyUdNaujvv4JHzLbOZHDh5VLA=
X-Received: by 2002:a67:f946:: with SMTP id u6mr1356213vsq.39.1623265043392;
 Wed, 09 Jun 2021 11:57:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3yWNbg+UBIOvo2uktjZwqgpQ0uqEKpg29T8ZsJibII/Z9DyWA1+JzDfl4fj+aHNliIMIxjHisVF9mF81aJFk=
X-Received: by 2002:a67:f946:: with SMTP id u6mr1356199vsq.39.1623265043240;
 Wed, 09 Jun 2021 11:57:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
In-Reply-To: <20210608031425.833536-5-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 9 Jun 2021 15:56:57 -0300
Message-ID: <CAKJDGDYr=mGHecPEv0wFpqHqh4mrVPQxaYR0HvjXbVq4JB=DnA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 8, 2021 at 12:14 AM Cleber Rosa <crosa@redhat.com> wrote:
>
> The QEMU project has two machines (aarch64 and s390x) that can be used
> for jobs that do build and run tests.  This introduces those jobs,
> which are a mapping of custom scripts used for the same purpose.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
>  1 file changed, 208 insertions(+)
>

Based on the comment from the cover letter that these jobs are defined
as trying to mimic what Peter runs on staging, the code looks good to
me, so:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


