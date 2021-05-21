Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D438CA46
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:36:12 +0200 (CEST)
Received: from localhost ([::1]:47890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk7C7-0001Hl-7j
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:36:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk7Aw-0008C7-12
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lk7As-0008RR-Vl
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621611293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FfaoevGaX5GtsuZp5BfhzO44hd+5Zm4qKdI5fj2Db7g=;
 b=hWUkNRDkBBPhTEsylfqmJL4/BVrbZh7pN83e08PNXt+gsU/cLfJa2d2AO2IGr3iouNJKmG
 uSvuHfQqu0o5nN58OA8tt5bq2VRSFk9UnRNsubB0VlEer4nHSP4QaZLcUbjVm4OGll5YvR
 +xPNxczjAeTPRvvFmgfoQX1iXQBM2SQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-2RTRg90yO2uX4IZ3jlJ-2A-1; Fri, 21 May 2021 11:34:51 -0400
X-MC-Unique: 2RTRg90yO2uX4IZ3jlJ-2A-1
Received: by mail-vs1-f70.google.com with SMTP id
 g18-20020a67fad20000b0290238d53e08c7so744764vsq.8
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:34:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FfaoevGaX5GtsuZp5BfhzO44hd+5Zm4qKdI5fj2Db7g=;
 b=IIMFJcZ2cPomQqV8sSkP02Hc24Hky7pQZq0ofu+QHavHm7cPP0C+o3IIsBlbPOHikP
 BUriEkTOBXKA8tN3arQD1IFKmMY1ppjjL6BxzVK7CVkglAOolDhutJdfl4ZKHGp/2MG7
 IA8EfT+3Cd2K4U736Sd8zYzWiDmkATdta0MiiTrhZIIZn8t5Wke3DCACaud+6/GQuwo/
 +qo7PoGNWcbDsYRGh1Hfpym/HpVvtr40szHefOvsvLI5QGTXcLRWJUA2A4K7iI9kzj8h
 W9F1aB1cemhTvPuOVCiJoa9bsF1ZfJg6+meLVFm2glPKmjwifLSZjdA7ncXAnWGEun50
 5ZgA==
X-Gm-Message-State: AOAM530nOyLIl/wOfyfe/L2bJzhd35WRnUdt1GH3Jn41PSYYA7Wv0W/v
 4gsO2Jp8W4l/g0VFJFoGc07kfNu5m9b4hhjtW1XJuhaxczyeoWZotiouAwbGAlFewU7aXclophm
 dMg85s4tNoogtUCFDX2Wvj+QZt8pMjb8=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr10771617vsi.45.1621611291417; 
 Fri, 21 May 2021 08:34:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSUu+p0bngs3fWqaGiDcdu6hsVMTfKQUofsE2GXG3E8tOGLU5hcpa7a3Vi9/2ZOhCXrl+sgwqz0dCnvD3ZK5k=
X-Received: by 2002:a05:6102:2431:: with SMTP id
 l17mr10771583vsi.45.1621611291227; 
 Fri, 21 May 2021 08:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210520195322.205691-1-willianr@redhat.com>
 <20210520195322.205691-2-willianr@redhat.com>
 <0f4a1c6c-ddba-ae57-2d55-f59c478dc9c5@redhat.com>
 <943fcdae-168a-adf8-c82b-b1a88369441c@redhat.com>
 <CAKJDGDZgnsFe9S967jjm1OMHPa25rb-tFmycpdC53WDK6DK1xA@mail.gmail.com>
 <a95cfa21-dde1-cf7c-a4e4-a5cf43c1de1d@redhat.com> <87sg2gb5lf.fsf@linaro.org>
 <b53b690c-f542-cc35-35a6-e577529ac303@amsat.org>
 <CAFEAcA98XBN2x=FvJod8U4+NM3fpmJigQsWoi-v4L5HXQpT+Rw@mail.gmail.com>
 <CAKJDGDa7W2BkYc-kgPJJySnBJtZDDyAfAzmMVxTzDrkDQSWUEA@mail.gmail.com>
 <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8kc=x8KTtW+Qg1wgdPNSvN-_13FEbmF2TPK8xC5q-GfQ@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 21 May 2021 12:34:25 -0300
Message-ID: <CAKJDGDZckVS1ZgBPpJptSqFGhYT6FQsid+cTFcxoJCiz7q=yxg@mail.gmail.com>
Subject: Re: [RFC 1/1] acceptance tests: rename acceptance to system
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 21, 2021 at 12:23 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 21 May 2021 at 16:13, Willian Rampazzo <wrampazz@redhat.com> wrote:
> > On Fri, May 21, 2021 at 11:29 AM Peter Maydell <peter.maydell@linaro.org> wrote:
> > > This does raise the question of what we're actually trying
> > > to distinguish. It seems to me somewhat that what tests/acceptance/
> > > actually contains that makes it interestingly different from other
> > > tests/ stuff is that it's specifically "tests using the Avocado
> > > framework". On that theory we might name it tests/avocado/.
> >
> > I think the updated README.rst from this RFC, inside the system
> > (originally acceptance) folder, is a good description of what these
> > tests should be: "This directory contains system tests. They're
> > usually higher level, and may interact with external resources and
> > with various guest operating systems." I can improve it, if needed.
> >
> > We are using Avocado Framework as a tool to accomplish the above
> > description, but I don't think we should strictly use it if there is
> > another way to accomplish what those tests are supposed to be. Calling
> > them "avocado" tests may restrict the intent of them, in my opinion.
>
> But the main reason IMHO that we have them in a separate directory is
> because that's where we have all the avocado machinery. I think the
> sharing of the machinery is what dictates whether a test winds up in
> tests/acceptance, tests/qtest, tests/tcg or tests/qemu-iotests
> much more than whether it is "usually higher level" or more of a
> unit test or whatever. If we ever added some other test framework for
> doing system tests, we'd probably want to put it in its own
> directory rather than lumping all its support machinery and
> build files in together with the avocado based tests.

Okay, I understand your point. With the organization of tests under
the test folder that QEMU has today, I agree with you.

>
> thanks
> -- PMM
>


