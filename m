Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A330ABDF
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 16:50:31 +0100 (CET)
Received: from localhost ([::1]:44078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6bTC-0000VT-LH
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 10:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bRc-0007x5-9x
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:48:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l6bRY-0007Qt-E1
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 10:48:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612194527;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=laaY2JoEs1rYtl28GMyzVZuugf3raXmUCQF0DUxH6xc=;
 b=OCsZ90cw/eVGc5t5ZrEmt/OOKh9DC97j1q1ZwQG+gYq84kJacqQzaoT3mueNTyVWdXxYW/
 c0kMHf3XRi2ebkwRbBUAkuuP3+s/fwyofYYtAKvEDuAZ3kTkmGPYh1Ve4+vL8GyHa9r6/q
 T1XRJUBAOFrFpGei7ippsM2qSXSrjNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-WW-SwdIKMe-xyvkDhY4Zow-1; Mon, 01 Feb 2021 10:48:39 -0500
X-MC-Unique: WW-SwdIKMe-xyvkDhY4Zow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 910B591F9F7;
 Mon,  1 Feb 2021 15:46:57 +0000 (UTC)
Received: from redhat.com (ovpn-114-195.ams2.redhat.com [10.36.114.195])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE2A72BCF7;
 Mon,  1 Feb 2021 15:46:55 +0000 (UTC)
Date: Mon, 1 Feb 2021 15:46:52 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Programmingkid <programmingkidx@gmail.com>
Subject: Re: Makefile has local changes that will be overwritten
Message-ID: <20210201154652.GK4131462@redhat.com>
References: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
MIME-Version: 1.0
In-Reply-To: <B8D9E184-5C5A-4A15-BF48-927F0138F0DE@gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ddstreet@canonical.com, Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 01, 2021 at 09:23:24AM -0500, Programmingkid wrote:
> When trying to build QEMU I see this error:
> 
> error: Your local changes to the following files would be overwritten by checkout:
> 	Makefile
> Please commit your changes or stash them before you switch branches.
> Aborting

This suggests you've made changes to "Makefile" in your local
checkout that aren't committed.  What does 'git diff Makefile"
say ?

> 
> What I do to see this error:
> ./configure --target-list=i386-softmmu
> 
> I did some bisecting and found out this is the patch that causes the problem:
> 
> commit 7d7dbf9dc15be6e1465c756c2c5ae7f1ab104fc8
> Author: Dan Streetman <ddstreet@canonical.com>
> Date:   Tue Jan 19 12:20:46 2021 -0500
> 
>     configure: replace --enable/disable-git-update with --with-git-submodules
>     
>     Replace the --enable-git-update and --disable-git-update configure params
>     with the param --with-git-submodules=(update|validate|ignore) to
>     allow 3 options for building from a git repo.

That commit includes changes to "Makefile", so if you have made local
changes to Makefile yourself, this will cause the message you see from
git. Either stash your changes, or rebase to resolve them.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


