Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD9B3B866E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 17:43:28 +0200 (CEST)
Received: from localhost ([::1]:53314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lycN5-0007wl-A5
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 11:43:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lycCr-0006FI-PN
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lycCl-0005Vk-Go
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 11:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625067166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zd7x8cln82ZpzYYqKIkdZGR/ByLXu+viJTMHh8fyu/k=;
 b=gTr89z0s1Jdoep39k6rA59fXvO4cnZKD9Qc6VLcP4nq2rJgSbJdJBbJ0m+9qDJE5jmrllk
 P+Xie5LmNPwnx/miV/efj3o4UrBma1W85exegJd6dtE6gz4k3Qzgk+WLulSnrwF7Qtt/Pg
 QT/LPbIpzok1zWD8BJ2xg/WguPo6M6c=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-493-_xLzWxkgMGC-HMQkshUnOA-1; Wed, 30 Jun 2021 11:32:43 -0400
X-MC-Unique: _xLzWxkgMGC-HMQkshUnOA-1
Received: by mail-vk1-f198.google.com with SMTP id
 r3-20020a05612206a3b029024f4add844aso612658vkq.2
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 08:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zd7x8cln82ZpzYYqKIkdZGR/ByLXu+viJTMHh8fyu/k=;
 b=pv+Vy3ccGxiSEZtrZEcXBOAUKb9JGOvwu8a5FSgaxxYUKaqShnj4C5dtNHXeqSjWOU
 45Mt8HJx06VwPhbSOzCZYIevkN7Gw0cBwY+CEO5lNpVWY6HavSIMpdQnezBwXPHJJfuu
 m8XzjRiEMc28MIrMG1zQ+y4ZOaDcWmRndyquvWGldzoOllU5a6B+LWke30MerWPsYeqM
 RyWcYFyl14oEWPVfLSWjansYJ59GqcsRVfm2wMt5OE9K4s7BeQvX/MI1NQ//8tL6/+Pk
 MQuexF1Ru+fOulZHgWKIMygMnVCz8BfIzDZpHiQj5S2NAnQ861Te+vBXXdlhbfBpjRcl
 saig==
X-Gm-Message-State: AOAM531Z8+LSfa/GsOl2Ou3KIP2n2yZ1n3Gz5Cj0XFhcQhpDvffE7Ic+
 ivVqhZhfUar7aUTC48JMVc6X1TTHHSx9DhMaUD3OhTFmf3Ps5sUWnBLjisg3NKKw3zH9qS98oUT
 B1JR6yeq6MSPMvW0xB4jsFZ6iQVgX1tE=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr35176720uam.110.1625067162806; 
 Wed, 30 Jun 2021 08:32:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymTp3mJjqJ2cipZCBjaGIYQUVHrdZ3MnBFUBlyyfC1B3N45LqQMOhR4QN0zPXAdcHRtlUqIUBRMExNdAMV7NA=
X-Received: by 2002:a9f:204e:: with SMTP id 72mr35176687uam.110.1625067162563; 
 Wed, 30 Jun 2021 08:32:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-12-jsnow@redhat.com>
 <CAKJDGDYrqaQpj+NH7p7WvnW1zzo3R3DQHhev33=ddcPAkga0NA@mail.gmail.com>
 <CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com>
In-Reply-To: <CAFn=p-aTMNMfcT_i57ZHoiG+TNEmXWME2KKnJvKPQQZ5F3H69g@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 12:32:16 -0300
Message-ID: <CAKJDGDZ-HAbf8KdgBqfm23abwr4r=Mu+kxnUEUTtNn66WuyKzw@mail.gmail.com>
Subject: Re: [PATCH v3 11/15] python: add 'make check-dev' invocation
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 30, 2021 at 11:58 AM John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Wed, Jun 30, 2021 at 10:41 AM Willian Rampazzo <wrampazz@redhat.com> wrote:
>>
>> On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com> wrote:
>> >
>> > This is a *third* way to run the Python tests. Unlike the first two
>> > (check-pipenv, check-tox), this version does not require any specific
>> > interpreter version -- making it a lot easier to tell people to run it
>> > as a quick smoketest prior to submission to GitLab CI.
>> >
>> > Summary:
>> >
>> >   Checked via GitLab CI:
>> >     - check-pipenv: tests our oldest python & dependencies
>> >     - check-tox: tests newest dependencies on all non-EOL python versions
>> >   Executed only incidentally:
>> >     - check-dev: tests newest dependencies on whichever python version
>> >
>> > ('make check' does not set up any environment at all, it just runs the
>> > tests in your current environment. All four invocations perform the
>> > exact same tests, just in different execution environments.)
>> >
>> > Signed-off-by: John Snow <jsnow@redhat.com>
>> > ---
>> >  python/Makefile | 35 +++++++++++++++++++++++++++++++++--
>> >  1 file changed, 33 insertions(+), 2 deletions(-)
>> >
>>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>>
>
> Thanks. I am squashing in a hotfix here to add .dev-venv to .gitignore, too. Not worth an entire respin for that.
> (Assuming that's gonna be A-OK with both of you.)
>

Acked-by: Willian Rampazzo <willianr@redhat.com>


