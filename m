Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBE6A5441
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 09:17:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWvAI-00086d-Ox; Tue, 28 Feb 2023 03:16:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWvA4-000865-BO
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pWvA2-0004qi-Jw
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 03:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677572193;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bcV+JUcYaQKvIA/a7vAuTBBn+8/5qwFfb2XkFLsU+qk=;
 b=J6VscDcf8SVvqsxrOkvw9Ibc+7PitmW9Gd2PwRQDoZulzRvYfK3LUgWrKgpmwP60JfApAY
 JH5iE09ZD8+caFBXYIBoGkZd3cMGQ2NPb9DsT0FnLON7DX2NLrnyiSjOyNGeYc18Jnc3lS
 i9rNOAljFbWBrkC7mH9rMuFfTScpXrk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-3-fVJmivknPCGezS0UYc0Kow-1; Tue, 28 Feb 2023 03:16:31 -0500
X-MC-Unique: fVJmivknPCGezS0UYc0Kow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2ED931C0418E;
 Tue, 28 Feb 2023 08:16:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C152026D4B;
 Tue, 28 Feb 2023 08:16:30 +0000 (UTC)
Date: Tue, 28 Feb 2023 08:16:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dinah B <dinahbaum123@gmail.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Subject: Re: Adopting abandoned patch?
Message-ID: <Y/24XKwyFcn56LV5@redhat.com>
References: <CAH50XRfsWih++5yoZSx-3L9mzf+vGPRz2Che=_6TAuATphvXbQ@mail.gmail.com>
 <874jr7juo5.fsf@linaro.org>
 <CAH50XRddEDTxJeCMXmbNg417vRojEuYpb8GzDrw75rt=OmF_uQ@mail.gmail.com>
 <CAH50XRe5EJG_CecVjwNJDuMbO4D-dJC4e8wrkR2G0Rn0VFF+oQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH50XRe5EJG_CecVjwNJDuMbO4D-dJC4e8wrkR2G0Rn0VFF+oQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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

On Mon, Feb 27, 2023 at 04:34:12PM -0500, Dinah B wrote:
> It looks like the author didn't include a "Signed off" in their patch draft
> and it doesn't look like Debian qemu-kvm maintainers ever merged it.
> Does this change the patch adoption process?
>
> On Mon, Feb 27, 2023 at 4:23 PM Dinah B <dinahbaum123@gmail.com> wrote:
> 
> > Thanks, here's the original patch:
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?att=2;bug=621529;filename=multiboot2.patch;msg=15

That is unfortunate. That patch is very large and complex, so I don't
think we'd be willing to take it without a Signed-off-by from the
original author.

It is quite old, but try emailing the original author, you might
get lucky and find their email addr still works

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


