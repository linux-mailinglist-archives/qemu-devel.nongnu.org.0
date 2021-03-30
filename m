Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2334E302
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Mar 2021 10:20:07 +0200 (CEST)
Received: from localhost ([::1]:36304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lR9bV-0004iO-86
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 04:20:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lR9aY-0003uA-2X
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:19:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lR9aT-0001Jg-Ay
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 04:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617092334;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XxPtAjRoEu8FIQGk6jQ5AwaHIJ87lNyS8X4n8h9qgSI=;
 b=XVLUE6PDiYIyvaUxGEJMieGZziseT2IX+K1mobBCRsnuw9q14kovQnv4YiknyW3JhpuIpb
 BspqyseSG+635eEh3rXOEAdE0T6JBw5FpWLxkldhxqjqG539bjFpGOgpIvfTDEnnbEnd24
 db051f/6sXAMjSAEoS08NopQI4UVIeY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-ReKoCaFOMkWdY_bggglRPw-1; Tue, 30 Mar 2021 04:18:48 -0400
X-MC-Unique: ReKoCaFOMkWdY_bggglRPw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DED4610CE7A7;
 Tue, 30 Mar 2021 08:18:46 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9550F62688;
 Tue, 30 Mar 2021 08:18:44 +0000 (UTC)
Date: Tue, 30 Mar 2021 09:18:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: Add a QEMU Code of Conduct and Conflict Resolution
 Policy document
Message-ID: <YGLe4XdJHiAMIY+s@redhat.com>
References: <20210329180140.2761383-1-thuth@redhat.com>
 <YGIdduioIxRIxMMp@redhat.com>
 <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfbyDTNyww5QE-tOsBVfkZVziX3uwGJCN+7mrXOQ_ZuHFg@mail.gmail.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 29, 2021 at 10:59:23PM +0200, Paolo Bonzini wrote:
> Il lun 29 mar 2021, 20:33 Daniel P. Berrangé <berrange@redhat.com> ha
> scritto:
> 
> > The obvious alternative is to import the contributor covenant
> >
> >   https://www.contributor-covenant.org/
> 
> 
> The Contributor Covenant 1.x and 2.x are very different in that 2.x also
> includes conflict resolution. Unlike the code of conduct, the consequences
> of bad behavior are hard to generalize across multiple projects, so I would
> prefer anyway the 1.x version. The differences with the Django CoC aren't
> substantial.
> 
> However this does mean being more careful about the language in the
> "custom" documents such as the conflict resolution policy.
> 
> 
> The second, it isn't a static document. It is being evolved over
> > time with new versions issued as understanding of problematic
> > situations evolves. We can choose to periodically update to stay
> > current with the broadly accepted norms.
> >
> 
> This however has the same issues as the "or later" clause of the GPL (see
> the above example of 1.x vs 2.x for the Contributor Covenant). I don't
> think upgrade of the CoC should be automatic since there are no
> "compatibility" issues.

Note, I didn't say we should automatically upgrade - I said we can
choose to upgrade. 


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


