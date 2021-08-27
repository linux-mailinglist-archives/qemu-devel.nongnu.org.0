Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F23F9E9A
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:13:12 +0200 (CEST)
Received: from localhost ([::1]:41810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgLi-0005CA-Hy
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJgB6-0002Lz-Sf
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:02:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mJgB4-0003mi-11
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 14:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630087325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LwdW9jKP/lmhyEP84RKfQLyZ/onmgBAMfwQJ4FpVmvo=;
 b=GI78bqH4D6Kqc0T0ak0Sje74wXlVBS0QdZhrFBrSSGihxcfDmCM4XUcdNKP35mYGsgkt1r
 oOGkTaQsP9ZstxMrNpdO1Tu9r/EZf/hTqmKGiN2ODLmrH+wtK9OI0x7PzCjJF99egHhGCx
 WL1SFfSnNvtBbihXuyucQw05FLaiv6g=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-S8cjpUgNPHm_GlIS2X7rMQ-1; Fri, 27 Aug 2021 14:02:03 -0400
X-MC-Unique: S8cjpUgNPHm_GlIS2X7rMQ-1
Received: by mail-pg1-f200.google.com with SMTP id
 k11-20020a6568cb0000b029023d00ca7bbcso577203pgt.22
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 11:02:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LwdW9jKP/lmhyEP84RKfQLyZ/onmgBAMfwQJ4FpVmvo=;
 b=jx83Q7TBf4l6TmbsCxkcIrjqZxalazwXusPIAMjmiZgmsnyQpeTr0OIZDxMOaYK2UQ
 2RbLp9J1SRU8aPipGteLeiMNwbrSWlynTTzxktjkS/JBbpV2kcCe5M+bBwCbKIMDaO7u
 7sQ83TsOzqTWq1CoZW7MgRhMu7GvInjnB7Em19gh7lZPinow/4pDhK0sUiv+MgGykkl7
 xWpsBFcZvtPn0NZQVL1CmNqnxYTdwDi/ElAY2/PcFoVThxSmO0Zv9jgLsYhf5c7Ca54v
 2lHZ2lgj8QAKfUQBA2gBgmkRdD4P98s43jGWqWyLEfmeXAILRr5RtGkHQZeS3Tx/q/mk
 +JDQ==
X-Gm-Message-State: AOAM530nmZDdjFKbJPkNQdn+ndO9cz4rPcb1fxTTjLKrP/rIhgKzC1LM
 RcHy7qc6yF5jCPNNn8WD9GVdSh1uHjb5aZfoiV1OAfet2oGI4nmkIfO2/t6SgHBpVvRwTr5ZBcn
 1Nzri2ftmZidlSEhpGOfRHPNBlSffusk=
X-Received: by 2002:a17:90a:2ecb:: with SMTP id
 h11mr12542632pjs.159.1630087322188; 
 Fri, 27 Aug 2021 11:02:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykRIbW9XLbZLMEyu0qMHt/SAxFbb/TKR4vhkq4S6r/CqOJiKPHehyjn506JrV8afM8sNWPqU9fiPMlJ6UbmlQ=
X-Received: by 2002:a17:90a:2ecb:: with SMTP id
 h11mr12542598pjs.159.1630087321872; 
 Fri, 27 Aug 2021 11:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210708145514.1751773-1-f4bug@amsat.org>
 <CAFEAcA_ukc+t_BYddOSv7EF6O1qoVHGGj6sA5uumUgt0VMS_pA@mail.gmail.com>
 <CAFEAcA8PLvMUEzyu=sN4bn4mU30w1aajU+T+i__5jnB0QMZnqg@mail.gmail.com>
 <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
In-Reply-To: <7cbaaf94-e255-a91b-8d71-ca720943bfcc@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 27 Aug 2021 15:01:35 -0300
Message-ID: <CAKJDGDbxBYQ5O3Cim5evkNfFcLZ_FwFEe7GhQgE=WWHS7jODOg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/raspi: Remove deprecated raspi2/raspi3
 aliases
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Phil,

On Thu, Aug 26, 2021 at 1:49 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Hi Peter,
>
> On 7/9/21 6:00 PM, Peter Maydell wrote:
> > On Fri, 9 Jul 2021 at 16:33, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> >>
> >> On Thu, 8 Jul 2021 at 15:55, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
> >>>
> >>> Since v1:
> >>> - renamed tests (Peter)
> >>>
> >>> Philippe Mathieu-Daud=C3=A9 (2):
> >>>   tests: Remove uses of deprecated raspi2/raspi3 machine names
> >>>   hw/arm/raspi: Remove deprecated raspi2/raspi3 aliases
> >>
> >>
> >>
> >> Applied to target-arm.next, thanks.
> >
> > I found that this seems to break 'make check':
> >
> >  (09/52) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_a=
rm_raspi2_initrd:
> > ERROR: Could not perform graceful shutdown (40.38 s)
>
> I can not reproduce. Maybe something got changed in Python/Avocado
> since... I'm going to simply respin (updating 6.1 -> 6.2).

I also could not reproduce. I checked and nothing changed on the
Avocado side. The version is still the same on the QEMU side.

>
> >
> > Dropped from target-arm.next.
> >
> > thanks
> > -- PMM
> >
>


