Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C3E2D43C3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 15:04:47 +0100 (CET)
Received: from localhost ([::1]:55142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn05G-0006QA-2M
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 09:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1kn00v-0004EA-Fw
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:00:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jdillama@redhat.com>)
 id 1kn00r-0002FQ-7Q
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 09:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607522407;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=flKz5frzaxZXCthNuJu+SJ5+Xtfz3JJbvsiRWnCbKgA=;
 b=Yl6ZXU+nAQuz5SwDTv7/dZmpZCWJG4Kny42uDB78xbiaFAL4huEjPxiG4WS2a4QiZnZsp5
 C48QFefm+vMbDdeMRIv2CsjZcX86QGGXdoFq2ncRVd8bHRBgcjHZV3l7JQHabjgLVI6JT5
 LAx5ByOzWEghufMsDI5AfpszeWwvnhU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-iFCWzYmGPsi0S3unT_GYaw-1; Wed, 09 Dec 2020 09:00:05 -0500
X-MC-Unique: iFCWzYmGPsi0S3unT_GYaw-1
Received: by mail-wr1-f69.google.com with SMTP id n13so695758wrs.10
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 06:00:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=flKz5frzaxZXCthNuJu+SJ5+Xtfz3JJbvsiRWnCbKgA=;
 b=o4nP+788/VXir7iYKyv2XcX+ozT5WPC6tPI/SY4MjVa5iF3zQ+hN14HAFUNVUNNKFC
 g9Dqv6/t1IHrpk6CfMTKFVz+0DCtT2xMY/3AmBTz1Iaz0/ozkQbmy+MMOoS2maXeBJcL
 9MYvg1RQodftzzDUH66o9kv3ifnZuj8JL4BkGagROeYSR/vB1wC8tC/ME+m8lnEGlp/n
 mLI2gynpMkAdc3XeIGXka3V/1afa1uirXnBJVi1GL/QmnGHkVYeZPhZ8RloLgWAZNCG7
 S9iPvZaud5Lj0PRl/V6hIWqPFUTFRNMhYEJDE7ivbu1KDGe+sb+BCFINuhD83elzgrF9
 iMeg==
X-Gm-Message-State: AOAM530BaCDTY13i/STuIRSFgwsVn58HPqI9+GVwhUEuPA3+JryolMcx
 JPuwXyoHAt7U0FkNsFD1sYVt/5awkPyrRSR36LgKCSbsHfGrtRVfs7LmuZknJ24SzWKwx9S7znq
 T3+JIcWVJXPm/wWTsPyHYnpW+5WOzFmc=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr2920240wrp.121.1607522404456; 
 Wed, 09 Dec 2020 06:00:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4FgdnZxa9r89jvw9XIq/c13BeGDOqAT7qDwAjEVuEEPHQTHU8oMMT9WAfT+LPqvvb+u7ThNx0DFOfqrD5QFk=
X-Received: by 2002:adf:f6c9:: with SMTP id y9mr2920198wrp.121.1607522404150; 
 Wed, 09 Dec 2020 06:00:04 -0800 (PST)
MIME-Version: 1.0
References: <92e0ea53-59e1-7ca0-dd0a-e4f350a6e032@kamp.de>
 <db284cf5-b7a8-7cab-29e3-38980c0839b2@kamp.de>
In-Reply-To: <db284cf5-b7a8-7cab-29e3-38980c0839b2@kamp.de>
From: Jason Dillaman <jdillama@redhat.com>
Date: Wed, 9 Dec 2020 08:59:53 -0500
Message-ID: <CA+aFP1C1+zhr9snPhOe-WM-u_ijjeEi1h08iM++PPatnjY8hFA@mail.gmail.com>
Subject: Re: qemu 6.0 rbd driver rewrite
To: Peter Lieven <pl@kamp.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jdillama@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jdillama@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: dillaman@redhat.com
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Christian Theune <ct@flyingcircus.io>, qemu block <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 9, 2020 at 7:19 AM Peter Lieven <pl@kamp.de> wrote:
>
> Am 01.12.20 um 13:40 schrieb Peter Lieven:
> > Hi,
> >
> >
> > i would like to submit a series for 6.0 which will convert the aio hooks to native coroutine hooks and add write zeroes support.
> >
> > The aio routines are nowadays just an emulation on top of coroutines which add additional overhead.
> >
> > For this I would like to lift the minimum librbd requirement to luminous release to get rid of the ifdef'ry in the code.
> >
> >
> > Any objections?

None from me (speaking in my role under Ceph) -- even Luminous is EoL
for us upstream. Hopefully no one would attempt to install QEMU 6 but
expect to keep librbd frozen at a >3 year old Kraken or earlier
release.

> > Best,
> >
> > Peter
> >
>
> Kindly pinging as the 6.0 dev tree is now open. Also cc'ing qemu-devel which I accidently forgot.
>
>
> Peter
>
>

-- 
Jason


