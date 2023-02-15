Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082EF697F9A
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 16:38:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSJqz-0007zB-OJ; Wed, 15 Feb 2023 10:37:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSJqv-0007yj-W1
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:37:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pSJqt-0002qn-Of
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 10:37:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676475466;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NtR+eg2f6A96dFPBQNrVYvmrXXxCVYrLz0UwPaKF7oU=;
 b=ajBj0fzqvttJ7EOm8UT/DpSPNq4anC4tWKlvGhaAkAuMGTV6xXorUQgZwAxQh0Y2YEsIgo
 flEw+gRAsrGCOamHqDpZvmDFMhoNh15i+empZHt8E6GvvPQhgqzztcHSVRo44BxBmDU7lZ
 fnhyaNSc4vlIcBC54dngyQbP0yNKiTQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-_m0EI5LGOmG5o9EDVL2T7A-1; Wed, 15 Feb 2023 10:37:43 -0500
X-MC-Unique: _m0EI5LGOmG5o9EDVL2T7A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96424857A9F;
 Wed, 15 Feb 2023 15:37:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.254])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3827C15BA0;
 Wed, 15 Feb 2023 15:37:40 +0000 (UTC)
Date: Wed, 15 Feb 2023 15:37:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH] gitlab-ci: Use artifacts instead of dumping logs in the
 Cirrus-CI jobs
Message-ID: <Y+z8QgG+fMkqK/TF@redhat.com>
References: <20230215142503.90660-1-thuth@redhat.com>
 <Y+zzIV2e6UigEIze@redhat.com>
 <1ed8e614-d43c-3d7d-b320-27985b521667@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ed8e614-d43c-3d7d-b320-27985b521667@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Wed, Feb 15, 2023 at 04:33:42PM +0100, Thomas Huth wrote:
> On 15/02/2023 15.58, Daniel P. Berrangé wrote:
> > On Wed, Feb 15, 2023 at 03:25:03PM +0100, Thomas Huth wrote:
> > > The meson log files can get very big, especially if running the tests in
> > > verbose mode. So dumping those logs to the console was a bad idea, since
> > > gitlab truncates the output if it is getting too big. Let's publish the
> > > logs as artifacts instead. This has the disadvantage that you have to
> > > look up the logs on cirrus-ci.com now instead, but that's still better
> > > than not having the important part of the log at all since it got
> > > truncated.
> > 
> > Having to go over to cirrus-ci.com is pretty awful user experiance,
> > especially as there's no direct link.
> 
> It's not that bad, see e.g.:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/3775523498
> 
> The log shows a link to cirrus-ci.com at the end:
> 
>  Build failed: https://cirrus-ci.com/build/4811273133621248
> 
> If you click on that URL, you've just got to go into the "build" and click
> through the build artifacts to get to the log that you want.
> 
> > > +      type: text/plain
> > 
> > Does it have to be either/or, can't we do both ?
> > 
> > 95% of the time the truncated testlog.txt is sufficient on its own.
> 
> I'd say 95% of the time the normal console output (without the "cat
> .../testlog.txt") is already enough since meson prints the stdout and stderr
> of the failing tests to the console already.
> 
> FWIW, this is the test run with the truncated output that Peter complained
> about earlier today in IRC:
> 
>  https://gitlab.com/qemu-project/qemu/-/jobs/3768540680
> 
> Even if you click on the "complete raw" link there, you'll have a hard time
> finding the information that you are interested in. So I'd really prefer to
> not dump testlog.txt by default and only have it via the artifacts instead.

Ok, you convinced me.

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


