Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360732AB4DC
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 11:27:47 +0100 (CET)
Received: from localhost ([::1]:54880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc4Oo-0000DN-B5
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 05:27:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kc4NN-0008AR-RT
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 05:26:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kc4NL-0000Qu-W0
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 05:26:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604917574;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Nr6JuLDtnOoAPCqii3oF3K6hcapB0tV+HvUjRdQa/0c=;
 b=RMG9i1mxjwt4dFV7Gnssgac4RbHYv1RAbQn+ofWRT/8TERn4EzFmDbPnhDFO1Bb6fsxS3A
 6a5Z0IJputpUZ3p3flOSYOx1Eh5TO7Ap41kUTBnm7TEADeFoZhmLvwMMXrc2GCLiTtJb+a
 qOiAz9NFqGYKdNaivHPwsnX88PhwX3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-LkcIpr3aN6q8OWxCIF4x9w-1; Mon, 09 Nov 2020 05:26:07 -0500
X-MC-Unique: LkcIpr3aN6q8OWxCIF4x9w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D81891009E21
 for <qemu-devel@nongnu.org>; Mon,  9 Nov 2020 10:26:06 +0000 (UTC)
Received: from redhat.com (ovpn-114-194.ams2.redhat.com [10.36.114.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E9D760E1C;
 Mon,  9 Nov 2020 10:25:59 +0000 (UTC)
Date: Mon, 9 Nov 2020 10:25:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: dtrace warnings for trace/trace-dtrace-hw_virtio.dtrace
Message-ID: <20201109102556.GD684242@redhat.com>
References: <87r1p2syo9.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r1p2syo9.fsf@dusky.pond.sub.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 00:04:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 09, 2020 at 09:48:54AM +0100, Markus Armbruster wrote:
> I get this on Fedora 32:
> 
> [12/8327] Generating trace-dtrace-hw_virtio.h with a custom command
> Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax error near:
> probe vhost_vdpa_dev_start
> 
> Warning: Proceeding as if --no-pyparsing was given.

Patch is posted and reviewed but needs merging still:

  https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05608.html

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


