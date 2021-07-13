Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E166C3C7832
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 22:51:41 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PNU-0004tc-P0
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 16:51:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3PMi-00044T-De
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:50:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1m3PMg-0003lS-KY
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 16:50:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626209449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z8o2HyP+xkHniAL9JTVRisK0oK0pLs956/zV2eniE1M=;
 b=dA2kCUzzl+gJ2JBmHxT9yuEGxWxFxHtyQquao7AWOiPNQgB1Vd4e+gcLwlOpYk9qmxYPDe
 EGJ3wMhHVYxaHJcBM9MVOm2ZJQB5i9/3env3olzKr5wCS2jeEc8o0EcCnZ+xcWTaZB4LUh
 fvH1jhmXDxEaQKMkufRWaBcok6q1EZo=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551--VHAcnbzP22c-e6oAgpHdA-1; Tue, 13 Jul 2021 16:50:47 -0400
X-MC-Unique: -VHAcnbzP22c-e6oAgpHdA-1
Received: by mail-vs1-f69.google.com with SMTP id
 o20-20020a67e1540000b0290293b5c01bdeso3609349vsl.21
 for <qemu-devel@nongnu.org>; Tue, 13 Jul 2021 13:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z8o2HyP+xkHniAL9JTVRisK0oK0pLs956/zV2eniE1M=;
 b=esEAD0NBQsqsZjNzWAASNLRa8DQWM5hZUMqJrgcHtoDGIKpkL1oSKEH0cMdYeemnJk
 uNK2zPT3AfC3krNQAHx+cfuTpCVcsIAJH2+YOsLoDMNE98QRkPKP0ezgA483+xk0+puI
 pYhZ7vVJSCJXsM81HWG31lIauMRw8/a1hO+flkCSYMD72gB2qElWRhXfNHXXtDu1kkB+
 WV7oyEODqnBB+RWoZ0uObj0y5fHr6Cdvor19MsMWeJJPX/RMIxG2U+xD19msUbWpQbPn
 N7ysqunkx5evXVxXbpX5ufxEDlLMyxFfTi558Kd6OLORGEnsOY7iEC/RosaH+kq18dm1
 UJZQ==
X-Gm-Message-State: AOAM531qNTS4UEKoiti69E6bgtcBFanp3o86rbLDIH+otLBPCGSnAjzX
 A0RplaAqQklZ9YjA28UAyXaqo0pAl62r4AAhghy7WRKKsFYNOA7RHYsmVFWSZEosC7d0bWOCuih
 h5p/WBGzdrUm92x5yuJxtSAoGEcqHXSQ=
X-Received: by 2002:ab0:758e:: with SMTP id q14mr8561705uap.113.1626209446788; 
 Tue, 13 Jul 2021 13:50:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHA8+wGn3dpHh/jAcjjbKOAdn6VTx+eYDfyL1HkD5bGM+qK9vI03PGlauAVS715ZiKB7jJ3bEmkrUNmjGpnOI=
X-Received: by 2002:ab0:758e:: with SMTP id q14mr8561686uap.113.1626209446648; 
 Tue, 13 Jul 2021 13:50:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210707152454.246519-1-willianr@redhat.com>
 <a10abbac-4ea1-d2fc-daae-da8a8e0f151c@redhat.com>
In-Reply-To: <a10abbac-4ea1-d2fc-daae-da8a8e0f151c@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 13 Jul 2021 17:50:20 -0300
Message-ID: <CAKJDGDYKKeGuFvTXik8g0rmRc2G+Ss-PD6DGj6yL5hVzjj4gvw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: allow control over tags during
 check-acceptance
To: Wainer Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Wainer,

On Fri, Jul 9, 2021 at 4:32 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
>
> Hi,
>
> On 7/7/21 12:24 PM, Willian Rampazzo wrote:
> > Although it is possible to run a specific test using the avocado
> > command-line, a user may want to use a specific tag while running the
> > ``make check-acceptance`` during the development or debugging.
> I always wanted that feature, thanks for implementing it!

I'm glad it is helpful.

> >
> > This allows using the AVOCADO_TAGS environment variable where the user
> > takes total control of which tests should run based on the tags defined.
> >
> > This also makes the check-acceptance command flexible to restrict tests
> > based on tags while running on CI.
> >
> > e.g.:
> >
> > AVOCADO_TAGS="foo bar baz" make check-acceptance
>
> If I run `AVOCADO_TAGS="machine:malta arch:mips" make check-acceptance`
> it is going to get the tests with 'machine:malta' *or* 'arch:mips' tags,
> whereas with AVOCADO_TAGS="machine:malta,arch:mips" it gets those with
> 'machine:malta' *and* 'arch:mips', i.e., the semantic is different. I
> think it deserves a mention in the docs/devel/testing.rst, maybe linking
> to Avocado's doc [1] as well.

Okay, that is fair. I'll summarize something in the testing
documentation and point to the Avocado doc to avoid duplication.

>
> [1]
> https://avocado-framework.readthedocs.io/en/latest/guides/user/chapters/tags.html
>
> >
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   docs/devel/testing.rst |  8 ++++++++
> >   tests/Makefile.include | 12 +++++++++---
> >   2 files changed, 17 insertions(+), 3 deletions(-)
>
> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>

Thanks for testing and reviewing.


