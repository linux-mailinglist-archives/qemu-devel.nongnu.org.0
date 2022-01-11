Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 671F248AEE9
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:52:16 +0100 (CET)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HZP-0004y8-HU
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:52:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7HDW-0006ZQ-Np
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:29:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7HDT-00029X-8c
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:29:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641907769;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJJ2lh28xLOkB/orgR80dO+sI1FoE1h8QY9OK3cfEyg=;
 b=BM9g3bbcCXvYbi/TMsd+zw8qKl0NsaNn+Zza7ucsNRGXnMrIHN6RmElv+SypcwLV6DCiAV
 4RgYC+JjXi7g9ipbcS2+D6MthaimSGZzt4aW6TFhIKWzLsoDOH70hcQxvcPfdg3fgupPV7
 ZgESZonxJ7dHlUmqzm4KL14cwcUpHNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-Ok7kQw20N1OpzbSen3vdoA-1; Tue, 11 Jan 2022 08:29:23 -0500
X-MC-Unique: Ok7kQw20N1OpzbSen3vdoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0F69193578B;
 Tue, 11 Jan 2022 13:29:21 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58B062AAA0;
 Tue, 11 Jan 2022 13:29:20 +0000 (UTC)
Date: Tue, 11 Jan 2022 13:29:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: cirrus-ci: FreeBSD failure (lttng-ust package not found)
Message-ID: <Yd2GLdR/4W9ANOat@redhat.com>
References: <c4b8b407-e270-b5eb-8f41-2b28d94059e3@amsat.org>
MIME-Version: 1.0
In-Reply-To: <c4b8b407-e270-b5eb-8f41-2b28d94059e3@amsat.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ed Maste <emaste@freebsd.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 11, 2022 at 02:11:14PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> I am getting this failure for the x64-freebsd-*-build jobs [1, 2]:
> 
> pkg: No packages available to install matching 'lttng-ust' have been
> found in the repositories

It was being installed fine on FreeBSD 13 as recently as 5
days ago

  https://gitlab.com/qemu-project/qemu/-/jobs/1944746050

but then disappeared from FreeBSD 13 four days ago

  https://gitlab.com/qemu-project/qemu/-/jobs/1949284897

and then disappeared from FreeBSD 12 yesterday

  https://gitlab.com/qemu-project/qemu/-/jobs/1958443678

Looking back at the older working builds I see

[quote]
==>   NOTICE:

The lttng-ust port currently does not have a maintainer. As a result, it is
more likely to have unresolved issues, not be up-to-date, or even be removed in
the future. To volunteer to maintain this port, please create an issue at:

https://bugs.freebsd.org/bugzilla
[/quote]

I notice last year they marked it broken in >= 13:

  https://cgit.freebsd.org/ports/commit/?id=abe5fefed2e24ef43a890f4d50ba712c581c7cfe

Overall it feels like we probably just need to drop this package
from the build on FreeBSD

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


