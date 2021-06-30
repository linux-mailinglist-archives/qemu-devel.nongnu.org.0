Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D153B8505
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:26:04 +0200 (CEST)
Received: from localhost ([::1]:45392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybAA-0000q5-Vw
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:26:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyb93-0008BS-Lq
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:24:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lyb90-0003c1-7Z
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:24:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cV1SIIYLAe0W38vHopu0idOO7cKKHfqm2cAG7jATUm8=;
 b=LduG9EBvphuPBCmpOq+yQpSVt/gJrXjxpc0UGxgrfcaSatGK0DN0p5nWxxCBcf9PMbfHlG
 2Tb28xJNsoSLzgs2+w5ZIGH01qUttbbAb82vOtUIgdSGIL7y5YZtADi9v334659XlVBN91
 76yCA6/mwZcWddft6YvEmrGTGPJ7HK4=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-18atIPv6P9C2IxFj06DOxg-1; Wed, 30 Jun 2021 10:24:46 -0400
X-MC-Unique: 18atIPv6P9C2IxFj06DOxg-1
Received: by mail-vk1-f198.google.com with SMTP id
 b12-20020a056122124cb029024f6b600c04so545815vkp.23
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cV1SIIYLAe0W38vHopu0idOO7cKKHfqm2cAG7jATUm8=;
 b=BybIE+H9DOppbhV7hXd7dL7CDrRz/IBukw6UfQNXKx6HPEME3wiYrunSbcVZbEnsXE
 mV8KWoNF23hJuvbvrZNiNox8VUG0splOuQM2ocmMQTxiYaMTHyP2Y4qDU+JkMw/ZwmdM
 NLfS+z5hU/ziF9smqrVjFEUhbYY/CLbGs5uE/eX9b59uWSXt/+9YzlmpGjIRwj7ZS6ZM
 89kNlB8f+d/Rl++3qq+eQSSld1iSNc3debt3hrSBlbKD2NlEqo5pYOhEt+AtQwGTzTNX
 tLZVtt+CxyBHkx1wOuwuTXnnUJmQp8kmdoij+7CcFDGC4vXhx5e2clq6xo8ln1KKCdC0
 ZwLg==
X-Gm-Message-State: AOAM532OQ3yo/GlRiYyeEIXJj/w0+2DBiUuKWPF7HOjvXrCQTGPwVf4m
 bUe1Unovk5ZdipdrIY6uep4DSBttu1uWWx5aNRk6Cd+HjujNzC0kFXMEckQRd1xqQKSop0glcoU
 frLlk5d2JOMU9z77xLv+DBVCSYQyLYfM=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr21693848vkh.7.1625063085590; 
 Wed, 30 Jun 2021 07:24:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQyuaCQaGVvQ3xHL66ouI/zUv/xn2odNcr2jc0iA4BYCxLS122PJc/BUi/HOUQcFUV0X1EUCq/6uAr+eokz04=
X-Received: by 2002:a1f:e3c2:: with SMTP id a185mr21693811vkh.7.1625063085401; 
 Wed, 30 Jun 2021 07:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
 <87czssirw4.fsf@linaro.org>
 <CA+bd_6LJvf5hUYd=XSBaSO+Tx12_qyyDhw7TKDeit=05WDqBLA@mail.gmail.com>
In-Reply-To: <CA+bd_6LJvf5hUYd=XSBaSO+Tx12_qyyDhw7TKDeit=05WDqBLA@mail.gmail.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 11:24:18 -0300
Message-ID: <CAKJDGDYWB6qLBN_TrMAype2W8pE1u67iXunNGfJhHOySU9f-FQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 10:08 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> On Fri, Jun 11, 2021 at 7:04 AM Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >
> >
> > Cleber Rosa Junior <crosa@redhat.com> writes:
> >
> > > On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@ams=
at.org> wrote:
> > >
> > >  Hi Alex, Stefan,
> > >
> > >  On 6/8/21 5:14 AM, Cleber Rosa wrote:
> > >  > The QEMU project has two machines (aarch64 and s390x) that can be =
used
> > >  > for jobs that do build and run tests.
> > >
> > <snip>
> > >
> > >  Who has access to what and should do what (setup)? How is this list =
of
> > >  hw managed btw? Should there be some public visibility (i.e. Wiki)?
> > >
> > > These are good questions, and I believe Alex can answer them about th=
ose two machines.  Even though I hooked them up to GitLab,
> > > AFAICT he is the ultimate admin (maybe Peter too?).
> > >
> > > About hardware management, it has been suggested to use either the Wi=
ki or a MAINTAINERS entry.  This is still unresolved and feedback
> > > would be appreciated.  For me to propose a MAINTAINERS entry, say, on
> > > a v7, I'd need the information on who is managing them.
> >
> > I can only talk about aarch64.ci.qemu.org which is a donated Equinix
> > machine that comes from the WorksOnArm initiative. I applied for it on
> > behalf of the QEMU project and we can have it for as long as it's
> > useful.
> >
> > I don't know if we need anything more that documenting the nominal
> > contacts in:
> >
> >   https://wiki.qemu.org/AdminContacts
> >
>
> That's enough indeed, thanks.  I'll follow up with a proposal about
> the expected duties of admins, which should be nothing but common
> sense.
>
> Is there anyone that can speak for the s390x machine?
>

I can be the backup here, if needed.

Willian


