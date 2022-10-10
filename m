Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 432915F9BAA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 11:11:39 +0200 (CEST)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohooz-0003F4-OB
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 05:11:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohoiA-0005kC-0d
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:04:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ohohz-000869-2I
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 05:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665392662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=MfyuqB3WC9KOE/xuxbAo+08f1ITrrXoRrDZm96C4/SQ=;
 b=PwD9Dx0EDOThXTU3/dauZWTSZHSyMVEyW2w7lG69X35bl6kGaBBnJlZyTsmSeDOL6RdCY3
 uDq+8YzQ1Y1R4vZee2QROB3HF+fMGURkBu90t9Q0NM97ACgCS5RYjA3CThSjXYEnCK2QPl
 H2tuxSVEC6nCibWnYrVJgR/KfMghVgI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402--FsqeapBPsSH_r5uOOrqeg-1; Mon, 10 Oct 2022 05:04:20 -0400
X-MC-Unique: -FsqeapBPsSH_r5uOOrqeg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 912ED1C0514F;
 Mon, 10 Oct 2022 09:04:20 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 108B04B4019;
 Mon, 10 Oct 2022 09:04:19 +0000 (UTC)
Date: Mon, 10 Oct 2022 10:04:17 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Dennis Clarke <dclarke@blastwave.org>
Cc: qemu-devel@nongnu.org
Subject: Re: total fail on FreeBSD 14.0 amd64 regardless of compiler
Message-ID: <Y0PgEczlqpyp2XkP@redhat.com>
References: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <841ab433-7dcd-2cf3-de7a-eb8b890f1652@blastwave.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, Oct 10, 2022 at 06:56:51AM +0000, Dennis Clarke wrote:
> 
> re: https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg01249.html
> 
> Using GCC 12 is even worse :
> 
> [2040/6841] Compiling C object qemu-system-aarch64.p/softmmu_main.c.o
> [2041/6841] Linking target qemu-system-aarch64
> FAILED: qemu-system-aarch64
> /usr/local/bin/g++12 -m64 -mcx16 @qemu-system-aarch64.rsp
> /usr/local/bin/ld: libqemuutil.a.p/util_filemonitor-inotify.c.o: undefined
> reference to symbol 'inotify_init1'
> /usr/local/bin/ld: /usr/local/lib/libinotify.so.0: error adding symbols: DSO
> missing from command line

This is trying to tell us that inotify_init1 is in libinotify.so.0
but we have not put -linotify on the command line for the link
step.  On Linux these are a standard part of glibc, but on FreeBSD
they are separate.

I'm thinking that in previous FreeBSD we probably got this linked
indirectly, but something in 14.0 has become stricer, wanting it
listed explicitly.

IOW, a meson.build change is likely needed to  add -linotify on
FreeBSD.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


