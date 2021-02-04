Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357B230F681
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 16:40:29 +0100 (CET)
Received: from localhost ([::1]:38708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7gk7-0002t7-V0
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 10:40:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7giN-00020X-Ld
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:38:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l7giK-0001zb-Gc
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 10:38:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612453115;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=aDXHboZ38dAUElqr875uD95rfqhppf6pVpRsj0H7Pa8=;
 b=Lv0IpaY1yi4g1ithsSpRVDKOorQ3uTYT1LIBFqOQsR7IWbdCo1Od1oAib85ETcSkhcWsjy
 AoZ4ObhP1utUAK8o/TMUrxLrsgmWRPpcPpbJ1NDUXw6boFX5aRTZeRn+4cFvf90FwmeJYe
 6gYUgurW8858+x8wXWtJ4HnSAguQxb8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-3PoKeD-hNAmtwDWkGOEd6g-1; Thu, 04 Feb 2021 10:38:29 -0500
X-MC-Unique: 3PoKeD-hNAmtwDWkGOEd6g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2490F100C661;
 Thu,  4 Feb 2021 15:38:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-169.ams2.redhat.com [10.36.115.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CA44197FA;
 Thu,  4 Feb 2021 15:38:25 +0000 (UTC)
Date: Thu, 4 Feb 2021 15:38:22 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v11 12/12] migration: introduce snapshot-{save, load,
 delete} QMP commands
Message-ID: <20210204153822.GS549438@redhat.com>
References: <20210204124834.774401-1-berrange@redhat.com>
 <20210204124834.774401-13-berrange@redhat.com>
 <20210204153433.GG24147@work-vm>
MIME-Version: 1.0
In-Reply-To: <20210204153433.GG24147@work-vm>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 04, 2021 at 03:34:33PM +0000, Dr. David Alan Gilbert wrote:
> This is (intermittently?) failing for me because of ordering issues:
> 
> --- /home/dgilbert/git/migpull/tests/qemu-iotests/tests/internal-snapshots-qapi.out
> +++ internal-snapshots-qapi.out.bad
> @@ -344,8 +344,8 @@
>                                       "vmstate": "diskfmt0",
>                                       "devices": ["diskfmt0"]}}
>  {"return": {}}
> +qemu-system-x86_64: Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "load-err-stderr"}}
> -qemu-system-x86_64: Unknown savevm section or instance '0000:00:02.0/virtio-rng' 0. Make sure that your current VM setup matches your saved VM setup, including any hotplugged devices
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "load-err-stderr"}}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "STOP"}
>  {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "aborting", "id": "load-err-stderr"}}
> Not run: 259
> Failures: internal-snapshots-qapi
> Failed 1 of 124 iotests
> 
> I'll disable the test for now.

Ok. I'm working on a patch series to make migration code use "Error **errp"
that ought to fix this properly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


