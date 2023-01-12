Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211166730B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 14:18:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFxT3-0007lg-4H; Thu, 12 Jan 2023 08:18:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFxSu-0007jY-Ou
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:17:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFxSn-00044b-OR
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 08:17:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673529469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ek8i3WBQqDPOCtiGo00P0S5EiNCMCW8hy4CgvvCmRJo=;
 b=XQi9RiBJQhlhDK1rpptC5ENaaD4l0tSFE39jsFOJpMQLmqJVhQKPleyzV19zq34ywGFTLl
 wBZaKESVI2MANv/ZIV0ikD6AIDbBrlt3qn8myMYSyuZ0IX7bB4NqBjserlzNW88nfw7Bet
 e1v/wJp0SUS33EFPnKq/k0R07t4oTiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-VkoBZah-PgSIxkXTDliLDg-1; Thu, 12 Jan 2023 08:17:44 -0500
X-MC-Unique: VkoBZah-PgSIxkXTDliLDg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AA1118E0044;
 Thu, 12 Jan 2023 13:17:43 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.222])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D378351EF;
 Thu, 12 Jan 2023 13:17:42 +0000 (UTC)
Date: Thu, 12 Jan 2023 13:17:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 paul <paul@xen.org>
Subject: Re: [PATCH] remove unnecessary extern "C" blocks
Message-ID: <Y8AIdFk8NL8eKQdL@redhat.com>
References: <20230110084946.299480-1-pbonzini@redhat.com>
 <afc99f0cdfd9686e99a6e1b94e609dc0e73cff43.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afc99f0cdfd9686e99a6e1b94e609dc0e73cff43.camel@infradead.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

On Thu, Jan 12, 2023 at 01:10:13PM +0000, David Woodhouse wrote:
> On Tue, 2023-01-10 at 09:49 +0100, Paolo Bonzini wrote:
> > A handful of header files in QEMU are wrapped with extern "C" blocks.
> > These are not necessary: there are C++ source files anymore in QEMU,
> > and even where there were some, they did not include most of these
> > files anyway.
> > 
> > Remove them for consistency.
> 
> 
> Are we allowed C++ in qemu?

Not any more, we've just made an effort to eliminate the last part
of QEMU emulator related code that was C++.  All that's left is
one part of the Windows installer for the guest agent.

> I ask because we have a full single-tenant implementation of XenStore
> lying around, designed to be VMM-internal... that just happens to be
> written in C++.

That's unfortunate :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


