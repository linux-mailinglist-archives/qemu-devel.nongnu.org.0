Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD39D37BCA3
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 14:37:13 +0200 (CEST)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgo6y-0007m8-CS
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 08:37:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgo5y-0006Sa-6g
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:36:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lgo5s-0007vT-D1
 for qemu-devel@nongnu.org; Wed, 12 May 2021 08:36:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620822962;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E/hMpcKtxm2KmcYXf5i7VSLu3SsJCmmiDQXAS6gwwMk=;
 b=Gl3f5OcCOsmXe5AjgngXRcaX81gltJx2MU3rCmXXNRwsXScKmMcltxHFsX43zXIvAtTd9J
 S4NyB2IuYQk6iAF24bQ/c4gqzD+0cfzXBfDIcAm0I4OXPKEYj5opVdxAOFO5KNjVkLZVYA
 bOtLZEON8ehaIFgWAa8D581yyAomx48=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-GHGTl3qPNYyamop0Yo_U6Q-1; Wed, 12 May 2021 08:25:38 -0400
X-MC-Unique: GHGTl3qPNYyamop0Yo_U6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3CDA46D254;
 Wed, 12 May 2021 12:25:37 +0000 (UTC)
Received: from redhat.com (ovpn-114-167.ams2.redhat.com [10.36.114.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 04005189A5;
 Wed, 12 May 2021 12:25:27 +0000 (UTC)
Date: Wed, 12 May 2021 13:25:25 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 12/12] configure: bump min required CLang to 7.0.0 /
 XCode 10.2
Message-ID: <YJvJNdsGmp+cCPuZ@redhat.com>
References: <20210511132641.1022161-1-berrange@redhat.com>
 <20210511132641.1022161-13-berrange@redhat.com>
 <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
MIME-Version: 1.0
In-Reply-To: <fcb6b808-c1de-d5f3-064c-1725c49999e0@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 12, 2021 at 01:44:51PM +0200, Philippe Mathieu-Daudé wrote:
> On 5/11/21 3:26 PM, Daniel P. Berrangé wrote:
> > Several distros have been dropped since the last time we bumped the
> > minimum required CLang version.
> > 
> > Per repology, currently shipping versions are:
> > 
> >              RHEL-8: 10.0.1
> >      Debian Stretch: 7.0.1
> >       Debian Buster: 7.0.1
> >  openSUSE Leap 15.2: 9.0.1
> >    Ubuntu LTS 18.04: 10.0.0
> >    Ubuntu LTS 20.04: 11.0.0
> >          FreeBSD 12: 8.0.1
> >           Fedora 33: 11.0.0
> >           Fedora 34: 11.1.0
> > 
> > With this list Debian Stretch is the constraint at 7.0.1
> > 
> > An LLVM version of 7.0.1 corresponds to macOS XCode version of 10.2
> > which dates from March 2019.
> 
> But we still rely on Travis-CI (Ubuntu Bionic 18.04 LTS)
> for non-x86 targets until we have figured out who is willing
> to share/maintain such non-x86 native runners on Gitlab.
> 
> There:
> 
> $ clang --version
> clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)
> 
> If we don't use Travis-CI, then your patch is fine, but we
> need a previous patch removing .travis.yml.

Bioic has clang 10 available so not sure why you're seeing
version 6 there

  https://packages.ubuntu.com/bionic/clang-10


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


