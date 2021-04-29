Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB30036E8BA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 12:27:59 +0200 (CEST)
Received: from localhost ([::1]:43962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc3tm-0003GX-Vb
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 06:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc3r3-0002Md-TQ
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:25:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lc3r1-0000qU-Cn
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 06:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619691903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=J+5NeZde8IkZIX2SEVo0ci2uB79bVMQ6U9xPc87OmZ4=;
 b=Q0umvIgBRqnNtj7Dyj7A57mzvvdCAkNGB/yomZgBLcZ/U6Cy9xKkIW4HlyT5/UXXQwC+aH
 BS6J4IYuVTOBgDn04fGUfC9GLjSM/91ojWSmtu5Vc54YvU7Js9jTdHEW5T3zlfKGuScHAg
 3ejdnW0RSgICFYJwaPwMQkCUSehcdr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290--RbWhvQaNHqUz8kXakWs2Q-1; Thu, 29 Apr 2021 06:24:53 -0400
X-MC-Unique: -RbWhvQaNHqUz8kXakWs2Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C976CC621;
 Thu, 29 Apr 2021 10:24:52 +0000 (UTC)
Received: from redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14B7563BA7;
 Thu, 29 Apr 2021 10:24:38 +0000 (UTC)
Date: Thu, 29 Apr 2021 11:24:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: Let's remove some deprecated stuff
Message-ID: <YIqJY1Z4jqruCu17@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210429101842.hupkajdlkttq6l4v@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Robert Hoo <robert.hu@linux.intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 29, 2021 at 12:18:42PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> >     ``QEMU_AUDIO_`` environment variables and ``-audio-help`` (since 4.0)
> >     Creating sound card devices and vnc without ``audiodev=`` property (since 4.2)
> >     Creating sound card devices using ``-soundhw`` (since 5.1)
> 
> I think these three should be dropped together, to minimize disruption.
> 
> Where do we strand in terms of libvirt support?  IIRC audiodev= support
> in libvirt is rather recent (merged this year).  I'd tend to wait a bit
> longer because of that.
> 
> Daniel?

Libvirt added supoort for -audio in 7.2.0, release April 4th, so only
one month ago.

If we drop the features in QEMU in this dev cycle though, this won't
impact most users until QEMU 6.1 releases in mid August. I'm perfectly
ok with people who use unreleased QEMU git master needing to update
their libvirt. The final release date is far enough away that distros
will have had new enough libvirt for a good while.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


