Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 088503E0978
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 22:41:44 +0200 (CEST)
Received: from localhost ([::1]:37274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBNhu-0005rD-PL
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 16:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBNgq-0005BL-Qp
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mBNgo-0001kO-PR
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 16:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628109632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eAqllevoFy4vHm/GUnXf0qVCijvbnc3pyQ5LGozTJ2c=;
 b=WgezCSG8a6M8I0eIs9gwb5NJPU9+IBMSrnaR5Qh3iGiyLTvUCPuBB8BsVIsTcuT6gmQWY+
 9eZBmG1ZZG41XD3wPZ8MrV4nSr1Ta5RHBG1LqtrJVxRko+zVPQWhQGJfyu5HR7LFdI1q7Q
 MFR5ZzENRHVnydIHq4C8S7cxDhcqPGo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-wrzQaEhJOsWugRztwsmyPw-1; Wed, 04 Aug 2021 16:40:31 -0400
X-MC-Unique: wrzQaEhJOsWugRztwsmyPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3358C7441;
 Wed,  4 Aug 2021 20:40:30 +0000 (UTC)
Received: from localhost (unknown [10.22.11.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45D2A1002D71;
 Wed,  4 Aug 2021 20:40:30 +0000 (UTC)
Date: Wed, 4 Aug 2021 16:40:29 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH for-6.2 06/10] docs: qom: Remove unnecessary class
 typedefs from example
Message-ID: <20210804204029.5am76o3rh6uhrwgh@habkost.net>
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-7-ehabkost@redhat.com>
 <CAFEAcA9=ZSawKJ8ZAuirNFD=EfmuHs9Oxyr_uDch8ZD6q6Ao2w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9=ZSawKJ8ZAuirNFD=EfmuHs9Oxyr_uDch8ZD6q6Ao2w@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 02, 2021 at 01:19:14PM +0100, Peter Maydell wrote:
> On Thu, 29 Jul 2021 at 19:01, Eduardo Habkost <ehabkost@redhat.com> wrote:
> >
> > When there's no specific class struct used for a QOM type, we
> > normally don't define a typedef for it.  Remove the typedef from
> > the minimal example, as it is unnecessary.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  docs/devel/qom.rst | 3 ---
> >  1 file changed, 3 deletions(-)
> >
> > diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> > index 05d045bf570..dee60a64c0a 100644
> > --- a/docs/devel/qom.rst
> > +++ b/docs/devel/qom.rst
> > @@ -20,9 +20,6 @@ features:
> >
> >     #define TYPE_MY_DEVICE "my-device"
> >
> > -   // No new virtual functions: we can reuse the typedef for the
> > -   // superclass.
> > -   typedef DeviceClass MyDeviceClass;
> >     typedef struct MyDevice
> >     {
> >         DeviceState parent;
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> though I agree with Daniel that in the long-term we should reverse
> the structure of the documents so the recommended macros go first
> and the behind-the-scenes boilerplate last.

I agree 100%, and maybe I will give it a try later.

My immediate goal was to just remove the examples in the docs
where type checking macros were defined manually.  Since we
introduced the new QOM helper macros, the number of OBJECT_CHECK
macros in the QEMU tree almost doubled (from 40 in commit
8110fa1d94f2 to 75 in commit bccabb3a5d60).

-- 
Eduardo


