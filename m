Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5305180A2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 11:07:16 +0200 (CEST)
Received: from localhost ([::1]:44624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nloV1-0001Rz-I6
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 05:07:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nloNQ-0002vs-73
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:59:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nloNN-0006YG-NE
 for qemu-devel@nongnu.org; Tue, 03 May 2022 04:59:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651568360;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ot/7eChXTldL1N8j1l8zXeJK6YtAoMfdOqTOVuPJYjs=;
 b=VrqO7GTO1ADsHKrbjfJVdUGth5s9oFNLaGeO4CJTiZxZ4P8GbaFSSr9IxOYIWPm5w5/+3D
 tIDyf9cw8hQ2DMX72OjNjQ9uyWQoCnlEIHpZYQelCSjRodKFGnxF6YIe4V4Y3VOcdOA0Ut
 RC1ddxfQPVnia6DAnvkG9iAmSALvYnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-bQendS1gObi6Byk3OF3ToA-1; Tue, 03 May 2022 04:59:19 -0400
X-MC-Unique: bQendS1gObi6Byk3OF3ToA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DACBC1014A60;
 Tue,  3 May 2022 08:59:18 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75E8140CFD29;
 Tue,  3 May 2022 08:59:17 +0000 (UTC)
Date: Tue, 3 May 2022 09:59:14 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Subject: Re: [PATCH 0/2] build improvments
Message-ID: <YnDu4lkn9UPcspqX@redhat.com>
References: <20220428182120.302066-1-kkostiuk@redhat.com>
 <0b0afdba-2f8f-1035-458b-f13d1f09f355@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b0afdba-2f8f-1035-458b-f13d1f09f355@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 29, 2022 at 12:10:34AM +0200, Paolo Bonzini wrote:
> On 4/28/22 20:21, Konstantin Kostiuk wrote:
> > Konstantin Kostiuk (2):
> >    configure: Add cross prefix for widl tool
> >    qga-vss: always build qga-vss.tlb when qga-vss.dll is built
> > 
> >   configure                 | 3 +++
> >   qga/vss-win32/meson.build | 4 ++--
> >   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> Both titles make sense, but they didn't reach the mailing list.

They did, but were each sent as standalone mail threads before this
cover letter was sent.

Konstantin: I'd suggest using 'git-publish' for sending patches in
future, as it automatically does the right thing, ensuring that the
threading is set correctly, and has many other benefits over sending
patch emails manually

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


