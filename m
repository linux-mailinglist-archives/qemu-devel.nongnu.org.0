Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30D75FC1E1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 10:21:14 +0200 (CEST)
Received: from localhost ([::1]:55112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiWzJ-0003hJ-PO
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 04:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiWtO-0008Az-8e
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:15:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oiWtL-0001Zo-Eo
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:15:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665562497;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PPsOz6AMo7eV3hngAwojeeL75kz+nOYv6o/0JyQy6oA=;
 b=CQZJcqaihQkVa4zFj0G2St3X9y7zoh4u7QkSFeppPbhw3fr5x9WN7ecRxbCpjqUak5LSnf
 afrrsFzomflsUoe51eWczDrgzgetI7rNUgtpMAxfsyLji4ymxukrT3El7G00ybeQUMc95X
 ulyXHvbM/sPy6pSZMOt3l82fhRcGTgY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-192-3xB8-6dwPM6OiJWcT6VRyw-1; Wed, 12 Oct 2022 04:14:56 -0400
X-MC-Unique: 3xB8-6dwPM6OiJWcT6VRyw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 682A1858282;
 Wed, 12 Oct 2022 08:14:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC86492B05;
 Wed, 12 Oct 2022 08:14:54 +0000 (UTC)
Date: Wed, 12 Oct 2022 09:14:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 "Hajnoczi, Stefan" <stefanha@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Message-ID: <Y0Z3fMpQo+8fz9ul@redhat.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Oct 12, 2022 at 08:46:35AM +0200, Paolo Bonzini wrote:
> Il mar 11 ott 2022, 21:29 Alex Bennée <alex.bennee@linaro.org> ha scritto:
> 
> > This reverts commit 730fe750fba63023e294ff0acf0f874369f1946f.
> >
> > Unconditionally building all the bios for all arches was a little too
> > far too fast.
> >
> 
> I would like to understand the issue better, because chances are that it is
> preexisting and applies to the TCG tests as well.
> 
> Daniel, does building the TCG tests work for you? If not, I think we should
> just disable containers by default.

I've never (knowingly) tried running TCG tests. IIUC, they are strictly
an opt-in test needing explicit 'make check-tcg', so any container usage
wouldn't be encountered by most contributors ?

Note, my objection wasn't that the containers are broken - it did
eventually work. Rather the issues I see were

 * Downloading and building containers as part of 'make' made
   the build insanely slow due to my limited 4G network connectivity.
   It took over 1 GB of downloads, which doesn't sound like much
   for those with reliably high speed internet, but was absolutely
   awful for me as my 4G was very degraded at the time.

 * Downloading and building the containers printed lots of
   verbose progress information that destroyed the progress
   output from meson when doing a parallel build

 * The containers being built were not even used by the build
   process, as I filtered the target list to only x86 and thus
   had no cause to build s390 / ppc64 firmware.

 * When the container rebuild failed, restarting seemed to use
   the downloaded image, that was previously considered stale,
   instead of trying the fresh rebuild again.

IOW, I'd like to see

 - Explicit opt-in at configure time for use of container
   downloads during 'make'
 - Tailor downloads wrt the target list configured
 - Supress the verbose output to preserve meson progress
   readability
 - Handle failure during container builds correctly


The problem of data downloads during 'make' arguably applies to
submodules too, but few submodules are needed when the distro
has provided the required deps in packages, and so those submodules
left are small and their download isn't noticably slow / large data
volumes.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


