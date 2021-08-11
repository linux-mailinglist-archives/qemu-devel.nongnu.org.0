Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA023E8C10
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 10:41:43 +0200 (CEST)
Received: from localhost ([::1]:60006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDjnv-0004YD-P3
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 04:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDjmq-0003nE-N5
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:40:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mDjmn-00077n-Eo
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 04:40:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628671227;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o2wPcj/vLpVfMfbmQcsILcvpAxuiIuUQHvrtOZLQxfE=;
 b=aOBDGxIx/Z7oZD+bx4GqzD0ywxJ25Ztmu7JPKqQKWo9JnALj7JSrLhmeeTzeCTZMmY+nR2
 38VG9Z1jT6UWh9uIaqG0LxOIIbLqv7WjV4uMm64ZriINqsg1tS06YWXgk0lfqauo5WYOLE
 Ry/VtXdTDs5bUrnS+WoixLcJLDot7Z4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-TYyjAkU2PnG3e6jyrCR31w-1; Wed, 11 Aug 2021 04:40:24 -0400
X-MC-Unique: TYyjAkU2PnG3e6jyrCR31w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E3E0801A92;
 Wed, 11 Aug 2021 08:40:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 608A25C1B4;
 Wed, 11 Aug 2021 08:40:10 +0000 (UTC)
Date: Wed, 11 Aug 2021 09:40:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] build: remove redundant 'check-build' make target
Message-ID: <YROM5sYj9Z6vgODg@redhat.com>
References: <20210810164416.3981147-1-berrange@redhat.com>
 <c4e62272-4662-14ef-28e8-9585196f0d63@redhat.com>
MIME-Version: 1.0
In-Reply-To: <c4e62272-4662-14ef-28e8-9585196f0d63@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 11, 2021 at 08:02:44AM +0200, Thomas Huth wrote:
> On 10/08/2021 18.44, Daniel P. Berrangé wrote:
> > The 'check-build' make target was added as a way to build all the unit
> > test binaries, since the standard 'all' target would not trigger this.
> > 
> > Since the switch to meson, however, 'all' will now include the 'test'
> > binaries. As a result, 'check-build' is a no-op:
> > 
> >     $ make all check-build
> >     ..snip lots of output...
> >     make: Nothing to be done for 'check-build'.
> 
> I think it would be better to restore the previous behaviour, so that "all"
> does not build the test files by default. Most normal users don't need the
> tests, so compiling them by default wastes precious CPU cycles.

Building tests by default is a good idea. If I'm refactoring code I want
to see straight away if I've broken test binaries, just as much as if
I've broken a part of the emulator code. I wouldn't want QEMU to go back
to the old behaviour as IMHO that is broken.

If someone doesn't want to run tests in a particular scenario, then by
all means have a meson option to disable tests entirely - neither build
nor run them - which wouldn't require a target to trigger test builds
manually.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


