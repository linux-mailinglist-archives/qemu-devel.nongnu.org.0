Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AD345BBBD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 13:21:33 +0100 (CET)
Received: from localhost ([::1]:52004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mprHI-0000Lc-Qf
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 07:21:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprFU-00082P-FR
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:19:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mprFR-0001zb-4u
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 07:19:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637756375;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=9lfhnS28stDa/Q766AaSMVgsaN0L0qZr8Ah1r58aXxw=;
 b=c8Xp3/oQ0si3I95bLJnZD1TH3OizNQ/AQJEtzTimqgJLfXUQI0IocBePsIFKilRsvHlG27
 e7cM56LMw3z44vzea/cz1tOAgYU4ZHvImuWmtmwCCxg3iQ8cdghr07+I+21WFcvT6l5mcy
 DElFT2tH0XkSxSoJkO/BuX7kYxYxQgY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-151-fu3XKkyXNLSqN0VcPeZsDA-1; Wed, 24 Nov 2021 07:19:29 -0500
X-MC-Unique: fu3XKkyXNLSqN0VcPeZsDA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EDBFE1023F4D;
 Wed, 24 Nov 2021 12:19:27 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.199])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C082B178;
 Wed, 24 Nov 2021 12:19:06 +0000 (UTC)
Date: Wed, 24 Nov 2021 12:19:04 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH 0/6] tests/docker: Update Fedora containers
Message-ID: <YZ4tuO2tJKdT7FP3@redhat.com>
References: <20211103144844.1285634-1-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211103144844.1285634-1-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 10:48:38AM -0400, John Snow wrote:
> Fedora 33 will be EOL before 6.2 ships; Fedora 35 was just
> released. Update our various containers to test on F34 and F35.
> 
> Fix a minor code warning issue that surfaces in a new version of Clang,
> and fix a small deprecation issue for the latest version of spice.
> 
> In testing, I found that oss-fuzz was more likely to time out on GitLab;
> it's unclear if this is a performance regression or just getting unlucky
> with when I test.

For me it times out every time on Fedora 35. In fact if I run it
locally, it doesnn't even finish after 24 hours ! There's a real
bug in there somewhere.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


