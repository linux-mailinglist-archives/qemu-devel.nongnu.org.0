Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD4B494B7E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 11:16:23 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAUUN-00042B-UA
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 05:16:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATVj-0005wq-3R
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:13:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nATVg-0007Wo-JC
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 04:13:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642670015;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=YCOywZD+pVChHZj/3MqZYQPxp3HLeGYCpyb/bXW7MI4=;
 b=QLjf9wm6oZqAexAaCqnpzyAtqZJbrJQPq+Qzua0seCm+pxOjOV+LbY9i1d6kIkzyhSR1Hs
 dAPIInqrRGPk0GZgh9KYI7fJWeWM43qNgIaFd/Sstqafz0oF96U53a9FLKgjC/pfVWqQgw
 6SmqHenVmD5HQ3wd47qiAm7ca5zy3yA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-R3gMS9T6OAuJvnWRuWd0qQ-1; Thu, 20 Jan 2022 04:13:32 -0500
X-MC-Unique: R3gMS9T6OAuJvnWRuWd0qQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F385284B9A6;
 Thu, 20 Jan 2022 09:13:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.153])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C70797D73E;
 Thu, 20 Jan 2022 09:13:22 +0000 (UTC)
Date: Thu, 20 Jan 2022 09:13:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v2 5/5] python/aqmp: add socket bind step to legacy.py
Message-ID: <Yeknr1ZvsyppLY0d@redhat.com>
References: <20220119193916.4138217-1-jsnow@redhat.com>
 <20220119193916.4138217-6-jsnow@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220119193916.4138217-6-jsnow@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 19, 2022 at 02:39:16PM -0500, John Snow wrote:
> The old QMP library would actually bind to the server address during
> __init__(). The new library delays this to the accept() call, because
> binding occurs inside of the call to start_[unix_]server(), which is an
> async method -- so it cannot happen during __init__ anymore.
> 
> Python 3.7+ adds the ability to create the server (and thus the bind()
> call) and begin the active listening in separate steps, but we don't
> have that functionality in 3.6, our current minimum.
> 
> Therefore ... Add a temporary workaround that allows the synchronous
> version of the client to bind the socket in advance, guaranteeing that
> there will be a UNIX socket in the filesystem ready for the QEMU client
> to connect to without a race condition.
> 
> (Yes, it's ugly; fixing it more nicely will unfortunately have to wait
> until I can stipulate Python 3.7+ as our minimum version. Python 3.6 is
> EOL as of the beginning of this year, but I haven't checked if all of
> our supported build platforms have a properly modern Python available
> yet.)

RHEL-8 system python will remain 3.6 for the life of RHEL-8.

While you can bring in newer python versions in parallel,
IMHO it is highly desirable to remain compatible with the
system python as that's the one you can guarantee users
actually have available by default.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


