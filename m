Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4763B7B31
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:10:26 +0200 (CEST)
Received: from localhost ([::1]:58022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOkD-0002No-Id
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:10:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOiS-0001hr-Q5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:08:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOiQ-0000fG-Rf
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:08:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625015314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC9w4AzCh4LP4j/5Eq4w7lnHQn2UjO19MgmWdBd/aBY=;
 b=ED1KIpgnk5tBgvl8Rq3LaVrqMH8XHO1Y49O8aGX6EQ9udy8SQyeZ3zgMKY/SIUKvCaq8Y6
 bhX5KgDOEpgF2Wdc3dskd9fEvLoVGeAKm2B2fXbBSe6rXs4EqYnt9NPz5aaWG/2P7kLUhz
 1F4NnFo4IyK7mVFAfbUOkVlDXdAc4oI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-qtF-5Pu3NBmQfv69Tn1r1g-1; Tue, 29 Jun 2021 21:08:31 -0400
X-MC-Unique: qtF-5Pu3NBmQfv69Tn1r1g-1
Received: by mail-ej1-f69.google.com with SMTP id
 w22-20020a17090652d6b029048a3391d9f6so168846ejn.12
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 18:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GC9w4AzCh4LP4j/5Eq4w7lnHQn2UjO19MgmWdBd/aBY=;
 b=OJng+/WNtpHg+j8Zj3Dhe3Ka9DhQOTMjxMCN8OUR4/K0s3DWFir2aYqX4tjvdafHmR
 blKCfTodxKDBmcd4642VYVlQeIITRsibK4GRyhBP0pVvaqOrRh5kqVaTd9Rhi+eKTSD+
 HcrngsvRGFD9X6GfPO0jeYVVVTPFwAAjP0AtoJazB7IrVlh89XbvMIglecROp9vD4BnC
 RJwUlaH3RBoRwX3PeKK8LSM4eWQ+t9cidFxYgrnF4msJ6AuYRsBdtl6Durp+ZFn9qKjL
 fQ72fOWUe5eIH/Px1bALNIhA6/1d1KmcUW5xf2kSNzcyjjDBOR6r65eXXW2Jnj9z3jVl
 aKhA==
X-Gm-Message-State: AOAM533L3JKVXyH/8/rsSxun/GUbrj8dsdQJl0yVNubhDpmQPsRXY0wF
 qwqcHghCixKBHfsUKRZkH5LalLxQ+PDT7d2mGR0EQZNKm0WQSeZvpUjnLm69SM/5LlisvUrVTQM
 P44WJfoeRrYe9yf+MTZizKHqEOLg5oZA=
X-Received: by 2002:aa7:dcd5:: with SMTP id w21mr42464544edu.144.1625015310838; 
 Tue, 29 Jun 2021 18:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyViA8sv5Ehfwq4SZGxqNx36aLfEb88pPYhUupHbtjEeyUHtw35jV5lkNz0NdiMhpr4XFTurOKjCHkdqstS/aA=
X-Received: by 2002:aa7:dcd5:: with SMTP id w21mr42464513edu.144.1625015310665; 
 Tue, 29 Jun 2021 18:08:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
 <87czssirw4.fsf@linaro.org>
In-Reply-To: <87czssirw4.fsf@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 21:08:19 -0400
Message-ID: <CA+bd_6LJvf5hUYd=XSBaSO+Tx12_qyyDhw7TKDeit=05WDqBLA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 11, 2021 at 7:04 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>
>
> Cleber Rosa Junior <crosa@redhat.com> writes:
>
> > On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >
> >  Hi Alex, Stefan,
> >
> >  On 6/8/21 5:14 AM, Cleber Rosa wrote:
> >  > The QEMU project has two machines (aarch64 and s390x) that can be us=
ed
> >  > for jobs that do build and run tests.
> >
> <snip>
> >
> >  Who has access to what and should do what (setup)? How is this list of
> >  hw managed btw? Should there be some public visibility (i.e. Wiki)?
> >
> > These are good questions, and I believe Alex can answer them about thos=
e two machines.  Even though I hooked them up to GitLab,
> > AFAICT he is the ultimate admin (maybe Peter too?).
> >
> > About hardware management, it has been suggested to use either the Wiki=
 or a MAINTAINERS entry.  This is still unresolved and feedback
> > would be appreciated.  For me to propose a MAINTAINERS entry, say, on
> > a v7, I'd need the information on who is managing them.
>
> I can only talk about aarch64.ci.qemu.org which is a donated Equinix
> machine that comes from the WorksOnArm initiative. I applied for it on
> behalf of the QEMU project and we can have it for as long as it's
> useful.
>
> I don't know if we need anything more that documenting the nominal
> contacts in:
>
>   https://wiki.qemu.org/AdminContacts
>

That's enough indeed, thanks.  I'll follow up with a proposal about
the expected duties of admins, which should be nothing but common
sense.

Is there anyone that can speak for the s390x machine?

> >  Is there a document explaining what are the steps to follow for an
> >  entity to donate / sponsor hardware? Where would it be stored, should
> >  this hw be shipped somewhere? What documentation should be provided fo=
r
> >  its system administration?
>
> I think the project can only really work with donations out of someones
> data centre where they keep responsibility for the physical aspects of
> any machines including the ongoing hosting and running costs.
>

Agreed.  Anything else is beyond what can be managed atm.

> --
> Alex Benn=C3=A9e
>

Thanks,
- Cleber.


