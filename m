Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19004662EEF
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 19:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEwpo-0004dx-O7; Mon, 09 Jan 2023 13:25:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEwpk-0004br-Oy
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:25:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pEwpi-0002LP-6N
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 13:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673288717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=QGnuWOardXtAlAPJLBzRCWpRtKMeypWm9KiaIXT8uLc=;
 b=a2dCdBe0WeEyknR/4uSYzuLrFH6rllzydhbdKitdyVWCF6Klqmq3suJA5mepMrp1dh9ALz
 JKoHom7dhMpJMiGrCRoZ30vxN4316wZWsbZi8T6P0UoiqjLUK05CCtBGpoB5N7LSuJYUxm
 w2BjZ5YZcC8oEeV0lozPHb5wAa87r98=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-Eq8eutSQPNe5034mnUUpUA-1; Mon, 09 Jan 2023 13:25:13 -0500
X-MC-Unique: Eq8eutSQPNe5034mnUUpUA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 988B585A588;
 Mon,  9 Jan 2023 18:25:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A6B6175AD;
 Mon,  9 Jan 2023 18:25:10 +0000 (UTC)
Date: Mon, 9 Jan 2023 18:25:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Ed Maste <emaste@freebsd.org>, Li-Wen Hsu <lwhsu@freebsd.org>
Subject: Re: QEMU cirrus freebsd 13 CI failing with 'Undefined symbol
 "rl_set_timeout"'
Message-ID: <Y7xcAThWrjYCVUcv@redhat.com>
References: <CAFEAcA_C0orpsqaOFHc-eNXySUrDiXsi6zmcRfn3aJy-0c-KQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA_C0orpsqaOFHc-eNXySUrDiXsi6zmcRfn3aJy-0c-KQQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 05:14:38PM +0000, Peter Maydell wrote:
> I've just noticed that our (optional) FreeBSD 13 CI job is
> failing while running the qemu-iotests, like this:
> 
> +ld-elf.so.1: /usr/local/bin/bash: Undefined symbol "rl_set_timeout"
> 
> Full job logs from a couple of sample builds:
> https://cirrus-ci.com/task/6541458329567232
> https://cirrus-ci.com/task/6036627739377664
> 
> Any idea what this is about? It looks at first glance like
> the bash on the CI system is busted because it can't find
> libreadline, but maybe I'm missing something. Are we missing
> some runtime shared library from a config file?

Usually this kind of thing happens when FreeBSD issue a new
minor release. The ports build will pick up a dependency on
an API in the new release, and the ports package manager
never checks that it is running on the current base image.

In this case though, we're already running on FreeBSD 13.1,
which is most current release, and 13.2 isn't due for at
least 2 months. So my usual fix of updating the base image
version won't solve this.

It does feel like the ports 'bash' build is broken.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


