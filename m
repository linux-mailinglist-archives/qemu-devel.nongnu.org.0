Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C7257BC5C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 19:10:36 +0200 (CEST)
Received: from localhost ([::1]:51610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEDDX-0008RM-8R
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 13:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEDBa-0006iQ-Sp
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:08:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEDBV-0005jP-VC
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 13:08:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658336908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jUoclEt7GX82aKLavFyzjJ4uJdwvBgfQK0XWh+1sY0o=;
 b=aoBgEe5Aj6N+XSYVZj2fDya4openDr5JPhzsK4PNtItQKeKmK9cYjhuGvAZgtql8u8b1Jo
 Ll80ALZVjBy4Fsm/0+u1Lp3//q8nww1adwTmohStSp6iIkqxo9zWC6M+WO7dmyb2ZIt5CZ
 S90zJySs4gScjefI8wTDHu2/eJtLJEY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-dxkWGhClPnyHXoMjoV1IPQ-1; Wed, 20 Jul 2022 13:08:23 -0400
X-MC-Unique: dxkWGhClPnyHXoMjoV1IPQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32E7A85A586;
 Wed, 20 Jul 2022 17:08:23 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.94])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 84E60202699A;
 Wed, 20 Jul 2022 17:08:22 +0000 (UTC)
Date: Wed, 20 Jul 2022 12:08:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 1/9] tests: introduce tree-wide code style checking
Message-ID: <20220720170820.a37iermixiljc2xh@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-2-berrange@redhat.com>
 <CAFEAcA-gANYJSK4LPXQoP0jTO5ex-zf3XZA2WH91ByXCEZMysQ@mail.gmail.com>
 <Ytgt+I+XFg2sFbNi@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ytgt+I+XFg2sFbNi@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 05:31:52PM +0100, Daniel P. Berrangé wrote:
> > > diff --git a/meson.build b/meson.build
> > > index 65a885ea69..d8ef24bacb 100644
> > > --- a/meson.build
> > > +++ b/meson.build
> > > @@ -18,6 +18,8 @@ config_host = keyval.load(meson.current_build_dir() / 'config-host.mak')
> > >  enable_modules = 'CONFIG_MODULES' in config_host
> > >  enable_static = 'CONFIG_STATIC' in config_host
> > >
> > > +in_gitrepo = run_command('test', '-d', '.git', check: false).returncode() == 0
> > 
> > Should we use Meson's fs.is_dir() rather than running a shell?
> > (https://mesonbuild.com/Fs-module.html)
> 
> Will investigate

Probably not a good idea as-is; .git need not be a directory, but can
also be a symlink.  So 'test -e .git' is the better check (see
scripts/qemu-version.sh); but if you can write an existence check in
meson (instead of a directory check), then go for it.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


