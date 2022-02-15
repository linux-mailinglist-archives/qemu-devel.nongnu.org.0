Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B454B6EB0
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 15:17:52 +0100 (CET)
Received: from localhost ([::1]:40100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyeN-0007D0-7v
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 09:17:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJyVV-00050W-67
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:08:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nJyVR-00049F-OY
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 09:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644934115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type; bh=Ma7McfMBrZUYhVGyyDCwe1q/qOGJriw0npTkg0M61SA=;
 b=AgPaA/ZJhXC0m5JP5+gRAqhS7zZ0Kr5RHK/NpwcIYf+9fdvHWsakhEmvjGiFiQ2H55KVGZ
 KznBM63auO/r64/CX6nNWPtY1GEVzIqqel20D0Kk9Qczfkq7xOanZSsVmNjircP6tFv4fp
 HsZno++DY2Ff1KfcMRM5nuIvh/Ye1VI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-Hfhqhbl_NtCKa25BGGvkxw-1; Tue, 15 Feb 2022 09:08:29 -0500
X-MC-Unique: Hfhqhbl_NtCKa25BGGvkxw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E1AA100CD02;
 Tue, 15 Feb 2022 14:08:28 +0000 (UTC)
Received: from redhat.com (unknown [10.39.196.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92C832AA93;
 Tue, 15 Feb 2022 14:08:27 +0000 (UTC)
Date: Tue, 15 Feb 2022 14:08:24 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Possible end of Ubuntu LTS 18.04 as a build target in 7.1 ?
Message-ID: <Yguz2GtTm+oEN0rI@redhat.com>
MIME-Version: 1.0
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per our platform support policy

  https://www.qemu.org/docs/master/about/build-platforms.html

  "The project aims to support the most recent major version at all
   times. Support for the previous major version will be dropped 2
   years after the new major version is released or when the vendor
   itself drops support, whichever comes first."

In April this year, Ubuntu LTS 22.04 will arrive, which means the
"previous" release will then be considered to be "LTS 20.04" and
thus "18.04" will no longer be in scope for what we aim to support.

It is possible that this might enable us to assume newer versions
of some software we depend on, but I've not analysed the situation
yet. This would apply from start of 7.1 development cycle if any
min version bumps do appear relevant.

When we previously had 16.04 fall out of scope for support, we had
a roadblock in bumping min versions. IIRC this was due to various
machines in the compile farm Peter used for merge testing not
supporting anything newer.

I don't have a good understanding of what machines are used for
testing now, so I'm wondering if we're going to hit any kind of
similar issue if we try to drop 18.04 support ?  If so we might
want to start thinking about our options now.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


