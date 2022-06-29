Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7BF55FDD1
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 12:53:25 +0200 (CEST)
Received: from localhost ([::1]:55620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6VK0-0000Yn-Tz
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 06:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o6VIA-0007a6-KS
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:51:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60242)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o6VI8-0007Al-0p
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 06:51:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656499886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mVvp2qM4RcNYFkcgnsx74VQNFa7XMtO9ShqyAsj6BIo=;
 b=R36uHUEQNOcPSDGtkNPdf3yBj8xg9tPjTY5eqy2v4g1KxxdnCySaoEItbJAYDYyMI9M7UC
 9n49lu/6wdfsTOwDJSqPLp68CItsxnx+ySELVxFHf1/50OWsv7whtC1+/LyFdtNeOtaYV8
 druqhLuZyh2jCvVQzWeSSMeHrw2CwDE=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-407-0flGWvayOYO2y1vdLnh0uw-1; Wed, 29 Jun 2022 06:51:25 -0400
X-MC-Unique: 0flGWvayOYO2y1vdLnh0uw-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-f2db7440d8so10079876fac.9
 for <qemu-devel@nongnu.org>; Wed, 29 Jun 2022 03:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mVvp2qM4RcNYFkcgnsx74VQNFa7XMtO9ShqyAsj6BIo=;
 b=ALcsB/ZdkbXPT5aDIcQerO34rNxTIxr3lYiYdQFQa3AGZbNhuDWuso7ykkA8zGW3Sp
 Q71Wf1e8EbBcn6hjzzmwcfA9J+DEcX+sNlmEE6H0WAzFKksGIMzT80EtTXuIqYNdULFp
 NdI/68fFnQItoUKdFWck7zjrZPudSvyz0RDyHqtBGc+ChNXfaPgzGEAAidvRHvbgYWVL
 P48erQEhfZJfWcFHCrmIk+b1ZZyaHckrMw37d6kCnGyemfIbSxQdNP2X0rhmd+ThUxKH
 SW0vj6l2dCJr6GanSSCsKZ/5QAPyoEDfph/tR4e3959FXc1KQT0nQvC8j4ZjxsB0H5Ah
 gkSw==
X-Gm-Message-State: AJIora8vCBw84IiK6zOV9GNqgAhW9h7O3jFyki4SAwBjzaOv0ZPdLa2j
 /mEZGOHOiMW9X4g8u4kF39RbOD2aQaKrEWn8LDiThA0pk6ZsDzAgdxNhBGF6AOmmEIFzH3Cby0u
 GGsrcQGnpCMxf77erb6wKCwfFdabIvZY=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr1549483oad.53.1656499884419; 
 Wed, 29 Jun 2022 03:51:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sXB/yGympQPx5jrsDnft2esbehuRk26WOlbKkAYZHtjVjxkBvnnPXhPLdyU2sSsaoXZDjXZgOK7jadeEdiSXI=
X-Received: by 2002:a05:6870:c1c1:b0:ee:5c83:7be7 with SMTP id
 i1-20020a056870c1c100b000ee5c837be7mr1549474oad.53.1656499884270; Wed, 29 Jun
 2022 03:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220628134939.680174-1-marcandre.lureau@redhat.com>
 <CAFn=p-Y0O0MgL91jhiV1uRq1q6oL3g4bfDJ58Ws7NiWu_RBLYA@mail.gmail.com>
In-Reply-To: <CAFn=p-Y0O0MgL91jhiV1uRq1q6oL3g4bfDJ58Ws7NiWu_RBLYA@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 29 Jun 2022 14:51:13 +0400
Message-ID: <CAMxuvaw1=0H4C0bON3fq2_5KTahYEwsp1V06HKLeEVvyXJHXKg@mail.gmail.com>
Subject: Re: [PATCH 0/2] python/qemu/machine: fix potential hang in QMP accept
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
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

Hi

On Tue, Jun 28, 2022 at 9:08 PM John Snow <jsnow@redhat.com> wrote:
>
> On Tue, Jun 28, 2022 at 9:49 AM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Hi,
> >
> > As reported earlier by Richard Henderson ("virgl avocado hang" thread),=
 avocado
> > tests may hang when QEMU exits before the QMP connection is established=
.
> >
> > My proposal to fix the problem here is to do both accept() and wait()
> > concurrently by turning some code async. Obviously, there is much large=
r
> > work to be done to turn more code into async and avoid _sync() wrappers=
, but
> > I do not intend to tackle that.
> >
> > Please comment/review
> >
>
> This has been on my list, it's been a problem for a while. If this
> series doesn't regress anything, I'm happy to take it. It'd be nice to
> get a proper "idiomatic" asyncio Machine class, but that can wait. I
> just got back from a vacation trip, please harass me in a few days if
> I haven't cleared this off my to-do list.
>

It has a few regressions. Plus I am considering Daniel's suggestions.
Let me revisit first.

thanks


