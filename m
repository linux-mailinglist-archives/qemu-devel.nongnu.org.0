Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FABC3B7B1F
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 02:48:39 +0200 (CEST)
Received: from localhost ([::1]:50252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyOP8-0004Ck-9K
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 20:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOOF-0003YK-Rd
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:47:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50169)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOOE-0003aA-4s
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 20:47:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625014060;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0bjbX0L2AQSI61PPcfksUFXXhhSA3NikPOahhNWbgU8=;
 b=BcTLrSctdcpdlsg33MTU4BgNvEil5kxBdJPbZEOY9VJd/3VoLtO9C2PeEfTwDj3fYsNNhN
 OWKM58wyXM6nZITrtvP5x+1SRDBYXc8ePcAej89rNH8T5RboeFkw96GqNOTx/fI/vME06V
 ZnWYT1vO6aN0QL/nyIQ4f2z6J/UIFtI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-hY0NlD0rNGe4JEjhJ0StlA-1; Tue, 29 Jun 2021 20:47:38 -0400
X-MC-Unique: hY0NlD0rNGe4JEjhJ0StlA-1
Received: by mail-ej1-f72.google.com with SMTP id
 q8-20020a170906a088b02904be5f536463so175906ejy.0
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 17:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0bjbX0L2AQSI61PPcfksUFXXhhSA3NikPOahhNWbgU8=;
 b=tIZJqkHg6XZ/lkyW5y3PgqBH/Nu1Hl3Agb+AQmccJeXhiuRYoq1+X0AnwBT9YGk0eb
 xjQhJ2hPustvJn0EzJSr41p2YNlrfMfizxqfpy38YbBjrAgI8vkuHySI2GvxFq+JpWOe
 gOpOT3lnpXDY+tId+dhg7lQkIJiP6/EMSK2S1UW/3AzIARA1JSjOj70ZxMFgjwP6g8AD
 BRH6ti28Fmaneh31OVR32bNzo/T7WJNcNf33E0CM0gG26zRXhovvXsfoYNPowiXvLfai
 NHInUUZbvAq/8LexSDyhMd5f3Z3IJOmr1AxL0/NeQ271/WUemABnXQ9qyKR2WshW+bvK
 0q6Q==
X-Gm-Message-State: AOAM530m20xlTIAo/Adt4QzTv/CB6R4SGi9KbdXlPLt+k9OvRqAEajAy
 9hDQhInRRuNML81ZLSUXKbZyKo43JAnAqcd7+nQZyRfZHZyZ08SmAqcz+hBSG8rx2iAHohYDlWx
 Uahhjs2A5+8U1yNeZ6UQb3t5Zvu6eRww=
X-Received: by 2002:a05:6402:4243:: with SMTP id
 g3mr26012557edb.118.1625014057618; 
 Tue, 29 Jun 2021 17:47:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlDVEN8qJWK+Pj4iZjsrGY+G0n7cI53D8kWq2J6nbE1udpV6XeSrAfLndozE4AlIb5P7mtFXaKt2IB7ke3iGc=
X-Received: by 2002:a05:6402:4243:: with SMTP id
 g3mr26012531edb.118.1625014057395; 
 Tue, 29 Jun 2021 17:47:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
 <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
 <6f4a0d6a-b306-5c14-1def-483ed9b81fda@redhat.com>
 <YMDZp95Sd6EApSmN@stefanha-x1.localdomain>
In-Reply-To: <YMDZp95Sd6EApSmN@stefanha-x1.localdomain>
From: Cleber Rosa <crosa@redhat.com>
Date: Tue, 29 Jun 2021 20:47:26 -0400
Message-ID: <CA+bd_6LeqDv_SviNh7JPVE-kosf2n7YCz21VcgX6S9=HFpLcgQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: Stefan Hajnoczi <stefanha@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 9, 2021 at 11:09 AM Stefan Hajnoczi <stefanha@gmail.com> wrote:
>
> On Tue, Jun 08, 2021 at 04:07:57PM -0300, Wainer dos Santos Moschetta wrote:
> > > And I understand that are a lot of them (from everyone, including
> > > myself).  The dilemma here is: should we activate the machines already
> > > available, and learn in practice, what's missing?  I honestly believe we
> > > should.
> >
> >
> > IMHO we should merge the minimum possible to start using the existing
> > machines, then address the questions (good questions, btw) raised by
> > Philippe as needed.
>
> That sounds good.
>
> Does anyone want to volunteer to be the QEMU CI runners point of contact
> who is responsible for defining the process? Cleber's last email left a
> lot for Alex and me to define, but I would prefer it if someone who is
> not me takes this on since I'm already spread thin. Alex? Philippe? Cleber?
> Wainer?
>
> Stefan

Sure, I can do it.

I'll start by resurrecting the now ancient RFC that contains a lot of
proposals with regards to the process, in light of the current status
and developments:

  https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg00231.html

IMO we can start with documentation (either at ci.rst, or preferably
in the WIKI for now) for the process of onboarding new CI runners, and
track it with issues in GitLab itself.  I'll formalize those opinions.

Thanks,
- Cleber.


