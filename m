Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACB1323C10
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 13:48:40 +0100 (CET)
Received: from localhost ([::1]:40554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEtap-00037Q-3I
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 07:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEta3-0002hS-FW
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:47:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lEta1-0002D7-WC
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 07:47:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614170869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Zo5lETG9dQ+4O5rJ7ypFbsWwu4v5jl6C/j8vmqICf1E=;
 b=EzxVw+zHsBC/FvUgDz7ZEeKWodSEEAGjm1ClHplnmiDOwZlUvjrwqMK23HCBbE2uyxpW5T
 DhLUhqovyH3qIfc7QVqh8b3gSYD8fDSgA/0TA2FQ77MFkISEUbKSi2NIFUJywJBGvhbM69
 fSOid5mVFgBWRdjJH8UZhzViLoUa6xI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-ZrPIZB3kPyKyFNInEfad8Q-1; Wed, 24 Feb 2021 07:47:44 -0500
X-MC-Unique: ZrPIZB3kPyKyFNInEfad8Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 684951E568;
 Wed, 24 Feb 2021 12:47:43 +0000 (UTC)
Received: from redhat.com (ovpn-115-119.ams2.redhat.com [10.36.115.119])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9891860862;
 Wed, 24 Feb 2021 12:47:38 +0000 (UTC)
Date: Wed, 24 Feb 2021 12:47:34 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 0/3] fix build failures from incorrectly skipped
 container build jobs
Message-ID: <YDZK5uh3YemZjSK0@redhat.com>
References: <20210216132954.295906-1-berrange@redhat.com>
 <YDY/GK9TWgCEnqOD@redhat.com>
 <6d57c632-b8e2-5853-5cae-97fec79e7a32@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d57c632-b8e2-5853-5cae-97fec79e7a32@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 01:45:10PM +0100, Thomas Huth wrote:
> On 24/02/2021 12.57, Daniel P. Berrangé wrote:
> > ping - can we get this series merged so we reduce the chances of
> > stale container images for people working across multiple branches
> 
> It's in already:
> 
>  https://gitlab.com/qemu-project/qemu/-/commit/c31fa24e9690ef62b
> 
> You should also have gotten the PULL mail on CC: ? Did it get lost?

Doh, sorry for the noise. I am indeed behind on my branch.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


