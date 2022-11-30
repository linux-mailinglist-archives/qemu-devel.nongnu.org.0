Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3207563D6BB
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:30:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NAO-0007J5-KH; Wed, 30 Nov 2022 08:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0NAG-0007HZ-CO
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:30:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p0NA9-0007Qd-DY
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:30:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669815003;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66OcbgTvUwkaO5n7P3eC5yWjKRbH2tV2A0yULwML0x8=;
 b=cKPvYY7LtYOGKvOMzOCNtOjLYIbV4AHX2xgRqqLukIigH4ntVAmk2gepeSXvqrL5iB9fky
 3HH3mJ3NAWMyNkR0fSrg0YNWISTtEj1mGR0IqDd6j+YYJ6V6sosqy4rGYp+sEMwQIBuvw8
 jkuKckbY1ikTIO0oE4QPulnbb1IretY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-jfL7A9-cPb6vmHNDdxLHQw-1; Wed, 30 Nov 2022 08:30:02 -0500
X-MC-Unique: jfL7A9-cPb6vmHNDdxLHQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04F44811E84
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 13:30:02 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB47D492B04;
 Wed, 30 Nov 2022 13:30:00 +0000 (UTC)
Date: Wed, 30 Nov 2022 13:29:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Monitor commands related to display server passwords
Message-ID: <Y4da1Ble0mkqNvZW@redhat.com>
References: <87mt88oonj.fsf@pond.sub.org> <Y4ccR2d2GUHpmHwx@redhat.com>
 <87h6yglgke.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6yglgke.fsf@pond.sub.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Wed, Nov 30, 2022 at 02:25:53PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:

> > In 6.0 I introduced support for 'password-secret' to SPICE and VNC
> > command line.
> >
> > I don't know why, but I only deprecated 'password' in SPICE and
> > not in VNC.
> 
> I figure you mean
> 
>     ``-spice password=string`` (since 6.0)
>     ''''''''''''''''''''''''''''''''''''''
> 
>     This option is insecure because the SPICE password remains visible in
>     the process listing. This is replaced by the new ``password-secret``
>     option which lets the password be securely provided on the command
>     line using a ``secret`` object instance.
> 
> and -vnc password=...
> 
> There's also -iscsi password=..., and possibly more.

Oh, iSCSI already has password-secret=, so yeah, we should
deprecate the old way there too.

Basically I want nothing in QMP/CLI to accept passwords,
everything must use the 'secret' objects.


> > I didn't wire up any QMP commands todo live password changes. If
> > the display was already configured with 'password-secret', you
> > could delete and re-create the existing named secret object
> > using object-add/object-del, since we fetch the secret value
> > on every auth check.
> 
> Is this behavior documented?

I don't believe so


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


