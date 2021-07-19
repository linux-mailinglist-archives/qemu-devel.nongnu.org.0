Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBDA3CD634
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 15:57:47 +0200 (CEST)
Received: from localhost ([::1]:37428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5TmE-0006w6-SE
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 09:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5Tl2-0005yp-Aj
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:56:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m5Tl0-0004MX-Qt
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 09:56:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626702990;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cbn1Dld67dwbtp5Sn7Z5HbPQzeXYrlvBAMMX0E62R5I=;
 b=IdmjExQ/jxPDEftsHLoNWuPW9sphJ5MDWfiageNABF8aSrMyyCzfDOuSMGpliKvt68G6aK
 YcYbZ6RcpXTnec96EpgGQ2TfsAr6nPW+qR+M6Rxz7hapuB7KCD+7NRmEvSKiH81PoXccUZ
 lVZQm3i6BfuvsZGS9tGn7IlMPhR7/bI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-KJJPel6ZMYu0d7k_9vvkEA-1; Mon, 19 Jul 2021 09:56:28 -0400
X-MC-Unique: KJJPel6ZMYu0d7k_9vvkEA-1
Received: by mail-ed1-f71.google.com with SMTP id
 x16-20020aa7d6d00000b02903a2e0d2acb7so9263688edr.16
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 06:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cbn1Dld67dwbtp5Sn7Z5HbPQzeXYrlvBAMMX0E62R5I=;
 b=V3oMAUHBrLSVP9tKfCOL6V5Q5pAfJnMfMfCTsrl2o2w0myEMdeJMSt2795GFfxHun1
 SfnBpto7JfGRRVkrXBLaL4kRckSTvp14LU2A5RNe/bqp5SU27dm7hn+Q8tN1uyDWUipC
 rIejihSXEuwGdTP9SAzrpYrU8zJRkcjKYUTLQDjB/OJjdrrEhdVoTiQWUOkKFnbRcjHr
 OeWbjokkZyk5rsPyRyH07N+v1xfk6X85cYywKFISntqLtZn3fT5VztX0VHsnDyGH1tIt
 CqlZA13OR2r6CFisqrauDXsRj4VfLpQTSkq7oAI5ReECL4nB5SJ0rUVqp6OsGmKIbBxv
 cKzA==
X-Gm-Message-State: AOAM530h4UP7WoIVb0F2iWfqMohUaffBe0xVLivfEeh39DE83Gh+bDpy
 MUfk27+K8Nxdfz5Yaeja3hkJ3NDoV4SuIT/eZps+MspuOW4hkVjsNx0ozJ9WGPRoc1GiXNBfSUD
 tKV3eb0hKPkJXmLr7BUbOXODyy4W+8lM=
X-Received: by 2002:a05:6402:1b06:: with SMTP id
 by6mr33977038edb.95.1626702987756; 
 Mon, 19 Jul 2021 06:56:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9mhFrQqX5g4Bi3+vZYvWY33IwKRiRR7LjCDfAPhuQ2gGdTxzuwdzz4J6zGtNUIYV00VUia+j+x2R/mj3ex0U=
X-Received: by 2002:a05:6402:1b06:: with SMTP id
 by6mr33977019edb.95.1626702987576; 
 Mon, 19 Jul 2021 06:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
 <87a6mpez2b.fsf@dusky.pond.sub.org>
 <97703096-ad9d-f676-ffcb-46ad4bf340c2@redhat.com>
 <87a6modt46.fsf@dusky.pond.sub.org>
 <20210719153837.46fdef08@redhat.com> <871r7ummz8.fsf@dusky.pond.sub.org>
In-Reply-To: <871r7ummz8.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Mon, 19 Jul 2021 15:56:16 +0200
Message-ID: <CAP+75-UZRjqWJKN3ningHrcmR=P3fx+mhG5SEzQ5u5V5SnXdjA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
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
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 19, 2021 at 3:50 PM Markus Armbruster <armbru@redhat.com> wrote=
:
> Igor Mammedov <imammedo@redhat.com> writes:
> > On Thu, 15 Jul 2021 07:49:13 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> >> >>> IMO the "right" solution is to check via QMP if TMP is supported
> >> >>> or not. This is now doable since commit caff255a546 ("tpm: Return
> >> >>> QMP error when TPM is disabled in build").
> >> >>>
> >> >>> Long term we'd like to decouple the tests/ build from the various
> >> >>> QEMU configurations, and build the tests once.
> >> >>
> >> >> This argument applies only to macros from target-specific headers l=
ike
> >> >> $TARGET-config-target.h, not to macros from config-host.h.  #ifdef
> >> >> CONFIG_TPM should be fine, shouldn't it?
> >> >
> >> > Some definitions depend on the host (OS, libraries installed, ...),
> >> > others depend on the --enable/--disable ./configure options.
> >> >
> >> > IMO it would be nice if we could get qtests independent of the latte=
r.
> >>
> >> Why?
> >
> > In another mail-thread Philippe mentioned that there is desire
> > to use qtest out of tree to test other QEMU binaries.
> >
> > However, just probing for features at runtime aren't going
> > to help with the goal as tests are tailored for the latest
> > CLI/QMP/ABI. To make it work we would have practically
> > introduce versioned tests.
> >
> > So I wonder why one external acceptance-tests suite is not
> > sufficient, that we would want to hijack relatively simple
> > internal qtest at expense of increased resources needed to
> > run/write unit tests.
>
> Yes.  qtest was not designed for use with anything but HEAD, and I doubt
> we can make it fit such uses at reasonable expense.

One HEAD but multiple configurations...

If you want to simplify human time, can we simply run qtests once per
arch/OS but with all features enabled? Otherwise skip qtests?


