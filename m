Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5962CC73F
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 20:56:48 +0100 (CET)
Received: from localhost ([::1]:45002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkYF5-0006eh-E7
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 14:56:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkYDk-0005sx-Av
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:55:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kkYDi-000386-94
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 14:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606938920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xPQXIfDx+O4iuIe2x52ltWvmCUGZo5DqCIANEz22UiE=;
 b=SAyg8TJu9DmJe+HHMmBKBCmQxWx0bAwkoqrZURr9dNsXfZxWAG9AXJ9C5X4wu4emeK6gu5
 bKQ6BVKg1BLAioq5fWA+xsdNjGjeGIdWjVyh8Lb+EIqgIWmED2R5VeZIBcLw4WY7hzQErv
 Z49f7tbAbs9VVUcfIhz8KO+/c29MSEs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-t02q2GkfPCKo-Ee2KjqORA-1; Wed, 02 Dec 2020 14:55:18 -0500
X-MC-Unique: t02q2GkfPCKo-Ee2KjqORA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6A6E3E74B
 for <qemu-devel@nongnu.org>; Wed,  2 Dec 2020 19:55:17 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7D8A5D74A;
 Wed,  2 Dec 2020 19:55:09 +0000 (UTC)
Date: Wed, 2 Dec 2020 14:55:08 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] docs: set CONFDIR when running sphinx
Message-ID: <20201202195508.GI3836@habkost.net>
References: <20201201183704.299697-1-marcandre.lureau@redhat.com>
 <cca70efa-d001-f4d5-f019-5ec55b7a4349@redhat.com>
MIME-Version: 1.0
In-Reply-To: <cca70efa-d001-f4d5-f019-5ec55b7a4349@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 02, 2020 at 10:05:50AM +0100, Paolo Bonzini wrote:
> On 01/12/20 19:37, marcandre.lureau@redhat.com wrote:
> > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > 
> > The default configuration path /etc/qemu can be overriden with configure
> > options, and the generated documentation used to reflect it.
> > 
> > Fixes regression introduced in commit
> > f8aa24ea9a82da38370470c6bc0eaa393999edfe ("meson: sphinx-build").
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1902537
> > Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> > ---
> >   docs/meson.build | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/docs/meson.build b/docs/meson.build
> > index ebd85d59f9..bb8fe4c9e4 100644
> > --- a/docs/meson.build
> > +++ b/docs/meson.build
> > @@ -9,7 +9,7 @@ endif
> >   # Check if tools are available to build documentation.
> >   build_docs = false
> >   if sphinx_build.found()
> > -  SPHINX_ARGS = [sphinx_build]
> > +  SPHINX_ARGS = ['env', 'CONFDIR=' + qemu_confdir, sphinx_build]
> >     # If we're making warnings fatal, apply this to Sphinx runs as well
> >     if get_option('werror')
> >       SPHINX_ARGS += [ '-W' ]
> > 
> 
> I can queue the patch, but I also wouldn't mind removing support for
> /etc/qemu completely.  I'm not sure why one would use it.  Eduardo?

I agree, and I had a series for this 3 years ago.

I guess I need to my keep my word and finally submit v5 of the series:
https://lore.kernel.org/qemu-devel/20171005123414.GE4015@localhost.localdomain/

-- 
Eduardo


