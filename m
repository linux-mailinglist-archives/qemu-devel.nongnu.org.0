Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA86D403DAD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 18:38:09 +0200 (CEST)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mO0aO-0003Lf-KA
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 12:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO0Z3-0001wd-4Z
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:36:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mO0Z1-0007nj-Iu
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 12:36:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631119002;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ylUGIHvW9S/mY+tIUN4RnDq7SEZiAhBNenAXsgiNPMI=;
 b=MUrl9Og2Pi31wQOEDUN9lQCO1DEE+hI0q2PpO0JJ9uvfsVh0AvGN5rk3R5ey9M7chdJ6EN
 V+073AEYPZC2EKYW1whpZKJGHM5SsfsSyLkXC2f8WqMvYd1LCnovQXclYrJlaS9crjzt8G
 i7HzDd35IiAUmbyuK/PlY9iO0heJFEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-Xe-WT_t-PaeKH1MCrlSX7A-1; Wed, 08 Sep 2021 12:36:37 -0400
X-MC-Unique: Xe-WT_t-PaeKH1MCrlSX7A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0422C1006AA1
 for <qemu-devel@nongnu.org>; Wed,  8 Sep 2021 16:36:37 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FDF26060F;
 Wed,  8 Sep 2021 16:36:32 +0000 (UTC)
Date: Wed, 8 Sep 2021 17:36:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: Compatibility between -device sga and -machine graphics=off
Message-ID: <YTjmjfbjqD4dA/VM@redhat.com>
References: <YTjf6BhpPU3aLct9@redhat.com>
 <364031a0-982d-f6bd-cbcc-9f6d9be4ba69@redhat.com>
MIME-Version: 1.0
In-Reply-To: <364031a0-982d-f6bd-cbcc-9f6d9be4ba69@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 08, 2021 at 06:28:01PM +0200, Paolo Bonzini wrote:
> On 08/09/21 18:08, Daniel P. Berrangé wrote:
> > Despite this difference, I was able migrate from a x86 guest using SGA
> > to a guest using graphics=off without errors being reported. So it
> > doesn't seem to change the migration data sections sent on the wire
> > at least.
> 
> It would probably break with Windows XP/2003 guests on AMD processors, as
> those are the ones that use kvmvapic.  On other guests and processors, it's
> a no-op.

After running an incoming migrate, the target QEMU's  'info mtree'
changed to reflect what the src QEMU originally reported.  So whatever
difference 'graphics=off' causes compared to -device sga initially,
appears to have been eliminated by running the migrate. Not sure if
that's true in the general case or not - I'm just testing with a
minimalist CLI and no real OS running

 qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio  -device sga

vs

 qemu-system-x86_64 -nodefaults -display sdl -device VGA -serial stdio  -machine graphics=off

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


