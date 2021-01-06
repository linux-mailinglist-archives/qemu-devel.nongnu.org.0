Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01752EBEC7
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:38:18 +0100 (CET)
Received: from localhost ([::1]:38548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx90z-0001ak-P5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8zU-0000jJ-5W
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:36:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kx8zQ-0001ca-RE
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:36:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609940198;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=abK9UDDFCljHxp2HwD5SwLHOtjjDUk5uy/f71sNronM=;
 b=CDijYckxUPt301g76MeDwfdirHAcYtvYFaI/uJm08JWEDSKefm+4YNVLsVHQlkETXzSrnF
 wGgPKH/RjaRwCjwxLW3XqNJz0CfKdsn7Hf9MkKRZ2ODBOUMSC6UaqSuSeUz5SAMi5MYcqv
 qxWg7F+Gls/h3yLBy8ctsedlfyAdsIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-YHt9WX9RNAS099_Hrkl1hA-1; Wed, 06 Jan 2021 08:36:28 -0500
X-MC-Unique: YHt9WX9RNAS099_Hrkl1hA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5319C801ADB;
 Wed,  6 Jan 2021 13:36:27 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 430EA19D7C;
 Wed,  6 Jan 2021 13:36:25 +0000 (UTC)
Date: Wed, 6 Jan 2021 13:36:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
Message-ID: <20210106133622.GM976881@redhat.com>
References: <20210106114159.981538-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210106114159.981538-1-berrange@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: Ed Maste <emaste@freebsd.org>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 06, 2021 at 11:41:59AM +0000, Daniel P. Berrangé wrote:
> The Cirrus CI macOS build hosts have exhibited a serious performance
> degradation in recent months. For example the "qom-test" qtest takes
> over an hour for only the qemu-system-aarch64 binary. This is as much
> 20-40 times slower than other environments. The other qtests all show
> similar performance degradation, as do many of the unit tests.
> 
> This does not appear related to QEMU code changes, since older git
> commits which were known to fully complete in less than 1 hour on
> Cirrus CI now also show similar bad performance. Either Cirrus CI
> performance has degraded, or an change in its environment has exposed
> a latent bug widely affecting all of QEMU. Debugging the qom-test
> showed no easily identified large bottleneck - every step of the
> test execution was simply slower.

It appears I might be mistaken here. On IRC it was reported that
going back furrther to v5.1.0 shows good performance in Cirrus
still.

I had only gone back as far as 2a5a79d1b57280edd72193f6031de3feb682154e
which I thought was fast originally.

So somewhere between v5.1.0 and 2a5a79 we apparently regressed.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


