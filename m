Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEF3FEC96
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 13:00:57 +0200 (CEST)
Received: from localhost ([::1]:48972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLkSl-0004gP-GK
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 07:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLkQO-0003KU-K4
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:58:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mLkQJ-0007Ti-Jh
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 06:58:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630580302;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gHwvMeaHKXY/KzJfx24PypasDD63COizkBPwAo3le4U=;
 b=byt60Tqbh2ZvIQsutt4dMgDjrYhKo4653HdfCcbW5lhUcGWxbA/Q++ZisoQP6GE+hcW+/c
 BBtzwmDKQu8hA7hZGu7W6TaFKlTTjTN66MRzwR/HExXHYJSz0ryeSzu1VWx4G+qUIsgHhH
 Jj9n26Lt47lmRQ/qI/S4d+ibWF1vVos=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-bFJGFx4DNoyFXcRQZK_1tQ-1; Thu, 02 Sep 2021 06:58:17 -0400
X-MC-Unique: bFJGFx4DNoyFXcRQZK_1tQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E937A107ACE3
 for <qemu-devel@nongnu.org>; Thu,  2 Sep 2021 10:58:16 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DF37819D9B;
 Thu,  2 Sep 2021 10:58:11 +0000 (UTC)
Date: Thu, 2 Sep 2021 11:58:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 3/3] softmmu/vl: Deprecate the -sdl and -curses option
Message-ID: <YTCuQB5dWMhYC3fW@redhat.com>
References: <20210825092023.81396-1-thuth@redhat.com>
 <20210825092023.81396-4-thuth@redhat.com>
 <CABgObfb8GHK0F=GCmDtaB=RqZT9+JnG+RRfNK+4XQ-ofoOxumA@mail.gmail.com>
 <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a03ba523-ac40-3090-442e-7cc38022a2cc@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Armbruster, Markus" <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 12:51:02PM +0200, Thomas Huth wrote:
> On 31/08/2021 15.53, Paolo Bonzini wrote:
> > As an alternative, you may want to turn it into "-display sdl" rather
> > than poke at dpy. This isn't much more code, but it keeps the shortcut
> > isolated within a single "case". This follows a lot of recently cleaned
> > up command line parsing code such as -no-hpet, -enable-kvm, -smp etc.
> > 
> > In the end (spoiler alert for my upcoming KVM Forum presentation—slides
> > are already on sched.com <http://sched.com> :)) what really produces
> > complexity is the lack of isolation/modularity. As long as UI code
> > doesn't care about command line parsing, and command line parsing
> > doesn't care about global variables from all over the place, the cost of
> > shortcuts is so small that it may tilt in favor of keeping them.
> 
> Honestly, I'd rather like to see them removed in the end. Our user interface
> is so terribly inconsistent here that I think that these options are rather
> confusing for the users than helpful. For example, why do we have -sdl and
> -curses, but no -gtk ? And as a normal user, I'd also always wonder what's
> the difference between "-display sdl" and "-sdl", since the difference in
> the amount of characters that you have to type here is not that much that it
> justifies the shortcut option. So IMHO let's rather clean this up completely
> than dragging the shortcut options along forever.

There's also the elephant in the room "-vnc" which has never been mapped
into -display, but which is also one of the most widely used options for
display backends :-(

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


