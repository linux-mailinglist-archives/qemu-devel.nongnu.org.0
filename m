Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B443A4C6FB0
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 15:40:03 +0100 (CET)
Received: from localhost ([::1]:47942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOhBy-0002Ut-Dd
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 09:40:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOhAj-0001F4-Uw
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:38:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nOhAd-0000Zy-7a
 for qemu-devel@nongnu.org; Mon, 28 Feb 2022 09:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646059118;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XZbY6dTxKcULIMs3sAbcc0SFcUf8Gxnfdm3biyWz8m8=;
 b=Cny6ieaM0jUxvDofVX+bjYa5w2RPd0vHQXA64fy7I3oYO0c9DX/ZGg7lBH1GppisS7kJcS
 2nwTbAcSPCwRfo1XazWOCZ4+cMmMB7Eb2O8HBHT9pTxc5ZT6lhnDCTWP9hqpkkidNCsbhd
 uQjxkShQlSJVAOm9dn2rIrtUKckgIPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-53-sbx0jNRgNHe8LHWzpSgBPA-1; Mon, 28 Feb 2022 09:38:32 -0500
X-MC-Unique: sbx0jNRgNHe8LHWzpSgBPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 670161091DA8;
 Mon, 28 Feb 2022 14:38:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.149])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 018F083BE3;
 Mon, 28 Feb 2022 14:38:27 +0000 (UTC)
Date: Mon, 28 Feb 2022 14:38:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] explicitly link libqemuutil against rt
Message-ID: <YhzeYQ7akrGqAIW7@redhat.com>
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Cc: qemu-trivial@nongnu.org, Simeon Schaub <schaub@mit.edu>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 02:15:11PM +0000, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 14:12, Simeon Schaub <schaub@mit.edu> wrote:
> >
> > >From e77de12cc33846a3de71d1858e497fbf4cdbff96 Mon Sep 17 00:00:00 2001
> > From: Simeon David Schaub <schaub@mit.edu>
> > Date: Sun, 27 Feb 2022 22:59:19 -0500
> > Subject: [PATCH] explicitly link libqemuutil against rt
> >
> > Qemu uses `clock_gettime` which is already part of more recent versions
> > of glibc, but on older versions it is still required to link against
> > librt.
> 
> Which version of glibc are you seeing this with ?

The man page says

   "Link with -lrt (only for glibc versions before 2.17)."

and even ancient RHEL-7 had glibc 2.17, so I can't imagine any platform
we currently target in QEMU has a glibc older than 2.17, so QEMU should
not need this change, unless there's some other scenario not described
in the commit message.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


