Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336A4A4981
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:39:52 +0100 (CET)
Received: from localhost ([::1]:56016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXqQ-0000Kc-Ur
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:39:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXim-000067-Li
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:31:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nEXih-00048S-Dy
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 09:31:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643639510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Jr26QzYzFr9QOqsAxKm4BckmDyVpDHixTtWZXECycf8=;
 b=OSjJJur/ov0RdasQfWhrCBweGunYnBWujKXzqfsShmq31jGdZxmBEckYYWLOpB/55TzG+x
 2ULkDdNUIWA6HWGylQOQ3YPkML4oj0ndpz5XVnAOaRtfSZD8KL5iRiEHWwnyTloNhYdeKt
 Ozj+jzpAL9pxF0NXpQ7aB0dPpqRtXU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-255-dtt5Vg8bNiWntwknV2jodg-1; Mon, 31 Jan 2022 09:31:48 -0500
X-MC-Unique: dtt5Vg8bNiWntwknV2jodg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C441083F60
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 14:31:47 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26B5C10A403F;
 Mon, 31 Jan 2022 14:31:29 +0000 (UTC)
Date: Mon, 31 Jan 2022 14:31:26 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: otubo@redhat.com
Subject: Re: Stepping down from seccomp mintainership
Message-ID: <YffyvhfUBDfa25eE@redhat.com>
References: <CAGMDDkd07FTemjXL=5OwTdx0ZEJv85wAp=AS--B_Po7qmu8=yg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGMDDkd07FTemjXL=5OwTdx0ZEJv85wAp=AS--B_Po7qmu8=yg@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 31, 2022 at 01:54:02PM +0100, Eduardo Otubo wrote:
> Hello all,
> 
> It's been a while since my last commit or pull request, and given the
> current state of things I don't think I'll be coming back to actual
> QEMU development. At least not as frequently as I wanted to have
> seccomp under my eyes at all times.
> 
> This being said, I'd like to retire as the seccomp maintainer. Anyone
> who wishes to take over from here is welcome to do so.

I've been responsible for a number of the seccomp patches, and the
overall change in design approach from deny-all-with-exceptions to
allow-all-with-exceptions. I don't especially want to take on more
work, but this feature doesn't see frequent changes, so I'd be ok
to pick this up in an 'odd fixes' role, unless some other maintainer
has a burning desire to invest more time.

I can send a MAINTAINERS file update swapping our names, in a few days
unless some else jumps in to volunteer in the meantime....

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


