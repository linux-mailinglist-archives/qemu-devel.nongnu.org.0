Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3CA38939D
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 18:24:25 +0200 (CEST)
Received: from localhost ([::1]:48498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljOzg-0007Ea-Bk
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 12:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljOxI-00058T-F3
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:21:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1ljOxF-0001rb-PL
 for qemu-devel@nongnu.org; Wed, 19 May 2021 12:21:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621441313;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+l0/BiHmdllkbQCs1/jInUDX8q/vADAi5+YhJSLBX8E=;
 b=b1voKhWsj2X/ME4J08Y7uEg4ygqGlyCl8f+dJH6QlLZUs+0JCcdMxhDCGjPWVRgx2xiqjd
 g1DH9uyh1FxEy+/ydrGHNbfJusMKhcnf2jmET1BKG4Agsft5PzA30MNv5eDQUFW+bT+qxD
 9crK3FUD15jWp0EHQChESHgyTzE60oI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-yZFgbPF8Psin3ijIRAEbcg-1; Wed, 19 May 2021 12:21:47 -0400
X-MC-Unique: yZFgbPF8Psin3ijIRAEbcg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E13E1020C2E;
 Wed, 19 May 2021 16:21:46 +0000 (UTC)
Received: from redhat.com (ovpn-115-106.ams2.redhat.com [10.36.115.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C735D1A866;
 Wed, 19 May 2021 16:21:44 +0000 (UTC)
Date: Wed, 19 May 2021 17:21:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] block/ssh: Bump minimum libssh version to 0.8.7
Message-ID: <YKU7FefHpLXlkO71@redhat.com>
References: <20210519155859.344569-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210519155859.344569-1-thuth@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 05:58:59PM +0200, Thomas Huth wrote:
> It has been over two years since RHEL-8 was released, and thus per the
> platform build policy, we no longer need to support RHEL-7 as a build
> target. So from the RHEL-7 perspective, we do not have to support
> libssh v0.7 anymore now.
> 
> Let's look at the versions from other distributions and operating
> systems - according to repology.org, current shipping versions are:
> 
>              RHEL-8: 0.9.4
>       Debian Buster: 0.8.7
>  openSUSE Leap 15.2: 0.8.7
>    Ubuntu LTS 18.04: 0.8.0 *
>    Ubuntu LTS 20.04: 0.9.3
>             FreeBSD: 0.9.5
>           Fedora 33: 0.9.5
>           Fedora 34: 0.9.5
>             OpenBSD: 0.9.5
>      macOS HomeBrew: 0.9.5
>          HaikuPorts: 0.9.5
> 
> * The version of libssh in Ubuntu 18.04 claims to be 0.8.0 from the
> name of the package, but in reality it is a 0.7 patched up as a
> Frankenstein monster with patches from the 0.8 development branch.
> This gave us some headaches in the past already and so it never worked
> with QEMU. All attempts to get it supported have failed in the past,
> patches for QEMU have never been merged and a request to Ubuntu to
> fix it in their 18.04 distro has been ignored:
> 
>  https://bugs.launchpad.net/ubuntu/+source/libssh/+bug/1847514
> 
> Thus we really should ignore the libssh in Ubuntu 18.04 in QEMU, too.

Agreed, if they're going to ship such a monster, at the very least
they should be responsive to fixing the fallout it creates. Given
the lack of action I agree with ditching libssh support on Ubuntu
18.04, despite it otherwise being  supported distro target.

> Fix it by bumping the minimum libssh version to something that is
> greater than 0.8.0 now. Debian Buster and openSUSE Leap have the
> oldest version and so 0.8.7 is the new minimum.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  block/ssh.c | 59 -----------------------------------------------------
>  configure   | 19 +----------------
>  2 files changed, 1 insertion(+), 77 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


