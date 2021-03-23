Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8473468A0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:12:55 +0100 (CET)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmSU-0002Ft-Da
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOmPR-000838-5X
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:09:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lOmPJ-0000sE-4Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 15:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616526570;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OWIjNEqfs0q8jCEsaznxSWQNuOrwMkrZiBFt1093eSk=;
 b=Ju9lFM9lUu1f4M5GLgfc1QVcQHeOPs4nlaiQZosv7HP4VGY7Un0vsJ1XI/MnUliKc9egDm
 t7j2dLiLGwQwkcAAitAHAliKKn4iFA8fVK2qxhC5cXwtmXfE3KZ+/x35TqE/YJ7IMRX+6V
 RVzJg+2XimGOBiXtMB6dmRI8hWGbIiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-B1mB9eQsO8Wd9Z188sEYEQ-1; Tue, 23 Mar 2021 15:09:25 -0400
X-MC-Unique: B1mB9eQsO8Wd9Z188sEYEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB51100B703;
 Tue, 23 Mar 2021 19:09:23 +0000 (UTC)
Received: from redhat.com (ovpn-113-223.ams2.redhat.com [10.36.113.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D39C119C45;
 Tue, 23 Mar 2021 19:09:18 +0000 (UTC)
Date: Tue, 23 Mar 2021 19:09:15 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: Re: [PATCH 0/2] yank: Always link full yank code
Message-ID: <YFo82zpHQf+zQ8+Q@redhat.com>
References: <cover.1616521341.git.lukasstraub2@web.de>
MIME-Version: 1.0
In-Reply-To: <cover.1616521341.git.lukasstraub2@web.de>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 23, 2021 at 06:52:19PM +0100, Lukas Straub wrote:
> Hello Everyone,
> These patches remove yank's dependency on qiochannel and always link it in.
> Please Review.

It would be useful if the cover letter or commit messages explained
to potential reviewers why this is being changed... The first patch
feels like a regression to me, without seeing an explanation why
it is desirable.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


