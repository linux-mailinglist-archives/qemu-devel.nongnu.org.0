Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CDF30001B
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:23:23 +0100 (CET)
Received: from localhost ([::1]:59254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tb8-0000vY-KM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2tYf-0007d7-4b
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:20:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l2tYZ-0003AT-Ps
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:20:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611310841;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NRQboFBUCklR0OJEmbhSytdVNHNtY1SuxWPvIw0pQNA=;
 b=BO7TI1OHhD2IxAxaXW9Mu3Fr3fX02bOTkbbbFaWBRLFaUS+2fy6+z4V8ucnoFtRAgi6YPw
 JOw11JIJjzzElk3WIGwWhSLFU30EcOPpLZa1rn2thrMvHceILR7T1gCinAhOQ/MVV8n7kj
 ksOixLCU68C5v0N79bJJyALreZg9bW4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-CwcS2NeDOHaXCBH-FNBOOQ-1; Fri, 22 Jan 2021 05:20:35 -0500
X-MC-Unique: CwcS2NeDOHaXCBH-FNBOOQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A5F801817;
 Fri, 22 Jan 2021 10:20:34 +0000 (UTC)
Received: from redhat.com (ovpn-115-108.ams2.redhat.com [10.36.115.108])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 574C45D9CA;
 Fri, 22 Jan 2021 10:20:26 +0000 (UTC)
Date: Fri, 22 Jan 2021 10:20:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci.yml: Use the whole tree as artifacts to speed
 up the CI
Message-ID: <20210122102022.GD3150238@redhat.com>
References: <20210122100722.705375-1-thuth@redhat.com>
 <20210122101833.GC3150238@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210122101833.GC3150238@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jan 22, 2021 at 10:18:33AM +0000, Daniel P. Berrangé wrote:
> On Fri, Jan 22, 2021 at 11:07:22AM +0100, Thomas Huth wrote:
> > Currently, our check-system-* jobs are recompiling the whole sources
> > again. This happens due to the fact that the jobs are checking out
> > the whole source tree and required submodules again, and only try
> > to use the "build" directory with the binaries and object files
> > as an artifact from the previous stage - which simply does not work
> > anymore (with the current version of meson). Due to some changed
> > time stamps, meson is always trying to rebuild the whole tree.
> 
> This used to work in the past didn't it ? Did something change in
> meson to break this, or have we just not noticed before.

For to ask, could we address it by using  'meson test --no-rebuild'
perhaps ?

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


