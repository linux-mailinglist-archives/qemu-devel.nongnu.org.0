Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C32C8C4B
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Oct 2019 17:06:42 +0200 (CEST)
Received: from localhost ([::1]:56298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFgDB-0006YO-2l
	for lists+qemu-devel@lfdr.de; Wed, 02 Oct 2019 11:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45159)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berrange@redhat.com>) id 1iFgAF-0004ir-7x
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:03:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berrange@redhat.com>) id 1iFgAE-0007oZ-1Q
 for qemu-devel@nongnu.org; Wed, 02 Oct 2019 11:03:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40232)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <berrange@redhat.com>)
 id 1iFgAB-0007kZ-8N; Wed, 02 Oct 2019 11:03:35 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7697E30820C9;
 Wed,  2 Oct 2019 15:03:33 +0000 (UTC)
Received: from redhat.com (unknown [10.42.22.189])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F07C4100194E;
 Wed,  2 Oct 2019 15:03:31 +0000 (UTC)
Date: Wed, 2 Oct 2019 16:03:29 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] iotests: Do not run the iotests during "make check"
 anymore
Message-ID: <20191002150329.GA30342@redhat.com>
References: <20191002142146.6124-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191002142146.6124-1-thuth@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Wed, 02 Oct 2019 15:03:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 02, 2019 at 04:21:46PM +0200, Thomas Huth wrote:
> Running the iotests during "make check" is causing more headaches than
> benefits for the block layer maintainers, so let's disable the iotests
> during "make check" again.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/Makefile.include   | 2 +-
>  tests/qemu-iotests/group | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

I don't have any objection to removing from 'make check', but I feel
like this commit should be modifying the travis.yml config so that
it explicitly runs the block tests, otherwise we're loosing automated
CI and the block tests will increase their rate of bitrot again.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

