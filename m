Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1DB292391
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 10:23:48 +0200 (CEST)
Received: from localhost ([::1]:37024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUQSJ-0002YM-QM
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 04:23:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUQGm-0000wu-O7
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kUQGg-0006Ms-PU
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 04:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603095104;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jVZmUFVjAFebrcSnM9WFujupJHlst1F0cqqbr+tckYs=;
 b=AozDCsTJBUCTNFbngaAPMMUWQrwgfjasn2F7f/aOJvnaW4AUHep4hiUKkcg6ftS9EDKjf9
 zHfOOu9wJYLHcndWCkAHnebGJeK7TJpZxtspaRgBga2Sos0Z9Y8feaj3eS9WBPlsop9GDG
 7hB6tuGvCihdeWW12JP0u2PPNXH1fMQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-wMLuvcfpMIyOQ3WMqiNXEA-1; Mon, 19 Oct 2020 04:11:38 -0400
X-MC-Unique: wMLuvcfpMIyOQ3WMqiNXEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E0DA1015C9A;
 Mon, 19 Oct 2020 08:11:36 +0000 (UTC)
Received: from redhat.com (ovpn-114-2.ams2.redhat.com [10.36.114.2])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD0E6EF59;
 Mon, 19 Oct 2020 08:11:31 +0000 (UTC)
Date: Mon, 19 Oct 2020 09:11:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH] meson: Only install icons and qemu.desktop if have_system
Message-ID: <20201019081128.GC236912@redhat.com>
References: <20201015201840.282956-1-brogers@suse.com>
 <CAAdtpL73mOJM1Jp45fh_CrN45eQ4ezLnEzUzMGTjUYNKZufQPA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAdtpL73mOJM1Jp45fh_CrN45eQ4ezLnEzUzMGTjUYNKZufQPA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, kraxel@redhat.com,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Bruce Rogers <brogers@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Oct 16, 2020 at 10:26:16AM +0200, Philippe Mathieu-Daudé wrote:
> Le jeu. 15 oct. 2020 22:22, Bruce Rogers <brogers@suse.com> a écrit :
> 
> > These files are not needed for a linux-user only install.
> 
> 
> > Signed-off-by: Bruce Rogers <brogers@suse.com>
> > ---
> >  ui/meson.build | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/ui/meson.build b/ui/meson.build
> > index 78ad792ffb..fb36d305ca 100644
> > --- a/ui/meson.build
> > +++ b/ui/meson.build
> > @@ -113,8 +113,11 @@ if have_system or xkbcommon.found()
> >  endif
> >
> >  subdir('shader')
> > -subdir('icons')
> >
> > -install_data('qemu.desktop', install_dir: config_host['qemu_desktopdir'])
> > +if have_system
> >
> 
> Some tools could have an icon, QSD later?

The icons are only needed for the tools with graphical display (ie SDL)
right now.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


