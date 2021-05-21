Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F2B38CCB5
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 19:51:33 +0200 (CEST)
Received: from localhost ([::1]:53942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk9J6-000857-Oa
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 13:51:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk9HE-0005Vs-5v
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk9HA-00063E-4N
 for qemu-devel@nongnu.org; Fri, 21 May 2021 13:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621619371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RI2pmeWcT28+sYUe+GlPSFbS6fQkmCrOz5peViPMPMY=;
 b=V24f6IXtsiwtVq26u34ZKGxc9EqeVRf9MQJFWXIPVU++Q2j7pNfcQA+HmMWXL8QUW8RDP1
 HyJSvr3TCRplCyvyhL7PTq6H2GnuWQpkCSFMGjNX/rjHYf9HemPEjusrvBkuVWIxsNA9Uz
 +9Fkn7BfrO2Itx80zYi568J1FdCEKuQ=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-sLcwZNPBPdCc9KjxBJq1xw-1; Fri, 21 May 2021 13:49:29 -0400
X-MC-Unique: sLcwZNPBPdCc9KjxBJq1xw-1
Received: by mail-ua1-f69.google.com with SMTP id
 b34-20020ab014250000b02901eb696c5fbaso7840445uae.22
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 10:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=RI2pmeWcT28+sYUe+GlPSFbS6fQkmCrOz5peViPMPMY=;
 b=uUSW7kre6T77QZ1iFLHoFOWKCRxOPO5s8l2tYrZGaN95wUcl3saYIMAI4TPMxI9kYJ
 KGkQiyEGqw10P10ff9Lvi01Sz/UH2askriJ4E6NtUkNLQ9kVbgC2DIo854hOoZ2Y8tmJ
 GpiUdF4fqyLDfDHCuXmBrmAtBLIiffa6wV3oXYZdiXrAC9lrsG03elJDyF8hYGYTleS5
 NLNZjp8AJIiQKR29N7Xm3ID8sANmhLIti/p/a8t8AvNDHgVqShJOFcw5MrYgXgdzkp0R
 biUlvyi9ibaX38O8UNENjB1QJg6UlKtwVD3Pgpgt1VBC31fVOYkzD4ZWoYz0cYplU+K0
 ZaJA==
X-Gm-Message-State: AOAM533GDMySfWGje+vCsGuSDBzd6AJU1kTIcDrEg2V78D4BV6IW1S4T
 +P6jxotqF2oempfUUrmrAF/s79QhZjiVDQbwpxt7SD7QslrrHwtevjuTDlrOmMALJudaAZnneSs
 8bd8POh2qSGPOOQfW8GRkOjCRuVEEIFk=
X-Received: by 2002:a67:f357:: with SMTP id p23mr11767790vsm.50.1621619368839; 
 Fri, 21 May 2021 10:49:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZ2GRS1U/aHq+hiLzx5zNTIiSx0EpZA3v5twHmTSaR5OCj4Tabf/ZPqqsBd4rwtPacbb3eBdmfJsLmKYsvqmc=
X-Received: by 2002:a67:f357:: with SMTP id p23mr11767768vsm.50.1621619368643; 
 Fri, 21 May 2021 10:49:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
In-Reply-To: <27149825-16a4-6820-2740-ab110eb231a5@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 14:49:02 -0300
Message-ID: <CAKJDGDZ2guQ2cpnV0Q-f6YgjPMe88TJddG473FC155td23GrrA@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: qemu-devel <qemu-devel@nongnu.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 2:14 PM Thomas Huth <thuth@redhat.com> wrote:
>
> On 21/05/2021 16.29, Peter Maydell wrote:
> > On Fri, 21 May 2021 at 15:19, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >> If you think these tests belong to tests/tcg/, I am OK to put
> >> them they, but I don't think adding the Avocado buildsys
> >> machinery to the already-complex tests/tcg/ Makefiles is going
> >> to help us...
> >
> > This does raise the question of what we're actually trying
> > to distinguish. It seems to me somewhat that what tests/acceptance/
> > actually contains that makes it interestingly different from other
> > tests/ stuff is that it's specifically "tests using the Avocado
> > framework". On that theory we might name it tests/avocado/.
>
> I think there are two aspects:
>
> 1) These tests are using the avocado framework
>
> 2) These tests are downloading other stuff from the internet (unlike the
> other tests that we have)
>

After Peter's reply, I noticed QEMU does not organize tests under the
tests folder by software engineering test category but by the
mechanism/machinery the tests run on. This makes me think that we may
need to handle the folders name and the CI jobs name differently:

1 - Change the current "test/acceptance" folder name to "test/(avocado
or avoqado)." Change the "make check-acceptance" to "make
check-validation," and the GitLab CI job names to "validation,"
meaning that, in a promising future, other tests running on a
different framework and acting like validation tests would run in the
same make command and same GitLab CI job.

2 - Change the current "test/acceptance" folder name to "test/(avocado
or avoqado)." Change the "make check-acceptance" to "make
check-(avocado or avoqaco)" and the GitLab CI job names to "(avocado
or avoqado)," meaning that, in a promising future, we can categorize
validation jobs inside the CI and run each of the different validation
tests supported by a framework on its own GitLab CI job.

Personally, I prefer option 2 as it gives more flexibility to decide
how to set a GitLab CI job or run it when testing locally.

> > Or we could just leave it as it is -- is the current naming
> > actually confusing anybody? :-)
>
> Yes, I think "acceptance" is rather confusing. So far they haven't been p=
art
> of your PR acceptance tests (well, now they are part of the gitlab-CI,
> though), and it's also not about tests that have been set up by customers=
,
> which is what you normally think of when hearing "acceptance tests". So a
> different name would be adequate.
>
> I think I'd vote for either "avocado", "avoqado" or "validation".
>

Even laughing every time I read "avoqado" (and thanks for that), I
liked the idea as there is supplementary code added inside
"tests/acceptance/avocado_qemu" to support the tests, meaning they are
not "pure" avocado.

>   Thomas
>


