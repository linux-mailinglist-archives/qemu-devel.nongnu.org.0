Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F8D378DBA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:47:39 +0200 (CEST)
Received: from localhost ([::1]:35386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg6G2-0007tQ-8C
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:47:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg6FC-00070K-Gi
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg6F9-0001HJ-8x
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620654401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IltYbhvGdxA+tynuKhGegOaeZnrxfu7Mu91T/8mbpts=;
 b=dYfXXlUQzfRpiEmZoh3e8+XKN+D/2vU7PSN3316lgo5HTGGPhjlxwZ934pqHJPoT3rOWjj
 fvrM6kTxMx5kNq5fvCZ1Hzcm+TdKI89IWVJY79eUGZ9b+klgwobuAXL3Z0vulNw8hVT6Gv
 a6XQLI/WNsPt4Om7uZ9b+pfQ035xgPU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-s3TpnsrdNTioOtL8demuaQ-1; Mon, 10 May 2021 09:46:38 -0400
X-MC-Unique: s3TpnsrdNTioOtL8demuaQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 095AA800FF0;
 Mon, 10 May 2021 13:46:38 +0000 (UTC)
Received: from redhat.com (ovpn-115-206.ams2.redhat.com [10.36.115.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7620460BD8;
 Mon, 10 May 2021 13:46:36 +0000 (UTC)
Date: Mon, 10 May 2021 14:46:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: qemu.org server bandwidth report (May 2021)
Message-ID: <YJk5ObfemfPCI32J@redhat.com>
References: <CAJSP0QXLcsRy8yONRyh8ZzmFJHALwRKqPa5m52TTL4h5iBZcmg@mail.gmail.com>
 <YJkLLewVDP25TDCg@redhat.com>
 <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJSP0QXMwSZqMRLXx3XYrrCe+OMP0k-hqFWb_GR_uMW35zZqDA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 02:40:16PM +0100, Stefan Hajnoczi wrote:
> On Mon, May 10, 2021 at 11:31 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > For the https:// URIs should we setup a HTTP redirect ?
> >
> > When git clones via https it fetches some specific paths which
> > I believe we have rules for in httpd conf:
> >
> >   ScriptAliasMatch "^/git/(.*\.git/(HEAD|info/refs))$" \
> >     /usr/libexec/git-core/git-http-backend/$1
> >   ScriptAliasMatch "^/git/(.*\.git/git-(upload|receive)-pack)$" \
> >     /usr/libexec/git-core/git-http-backend/$1
> >
> > If we set those URI path matches to send a HTTP 307 redirect
> > to gitlab, that would essentially kill off our git traffic on
> > qemu.org, while still allowing the qemu.org gitweb UI to
> > work normally. The downside is that people won't notice to
> > update their clone URIs. Still feels like an easy win and
> > we can easily remove the redirect if we use code 307.
> 
> I remember there were concerns about warning messages that
> git-clone(1) prints when an HTTP redirect is encountered? If everyone
> is okay I can turn the git-http-backend(1) aliases into HTTP 307
> redirects to GitLab.

I presume that'll be the case with git fetch/pull too, and anything
else which talks to the server.

None the less, if git prints a warning message when getting a redirect,
I'd say that is probably a desirable feature, as it'll make it more
likely that people will fix their URIs to directly point at gitlab.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


