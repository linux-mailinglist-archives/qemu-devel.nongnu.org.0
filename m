Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184F255EEA
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Aug 2020 18:41:18 +0200 (CEST)
Received: from localhost ([::1]:57506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBhRF-0006rg-9U
	for lists+qemu-devel@lfdr.de; Fri, 28 Aug 2020 12:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kBhQN-0006LA-Uk
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:40:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36431)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kBhQL-0008Hp-Ui
 for qemu-devel@nongnu.org; Fri, 28 Aug 2020 12:40:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598632820;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HwWBP04dpvlcASylrd8QyqpP9hH8SW/Mhd9Buu0gpuM=;
 b=BSZoJOEjjCNTgthCpfeLcr84m0K55P6nKPx4otKvuyHuqZ3msQOtzMgpYg9f0mpNY+iqEP
 mkDW8KyHLQOhncNWJTVsL+2thRduareIT6dK2psLFQ2vbyyeDA27fMBUoJhCHFbxKPrACK
 z9JcSNwuzp3a/qhbVgbJqNjk5ncLgyw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-3cFkpGBHPCSm3INGV_eDOw-1; Fri, 28 Aug 2020 12:40:16 -0400
X-MC-Unique: 3cFkpGBHPCSm3INGV_eDOw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B89A1084C99;
 Fri, 28 Aug 2020 16:40:15 +0000 (UTC)
Received: from redhat.com (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BAE3217B7B;
 Fri, 28 Aug 2020 16:40:07 +0000 (UTC)
Date: Fri, 28 Aug 2020 17:40:04 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/3] Fixes 20200825 patches
Message-ID: <20200828164004.GR224144@redhat.com>
References: <20200825062008.6502-1-kraxel@redhat.com>
 <128e42b3-3b0f-744b-91be-f4c52837c3a2@redhat.com>
 <CAFEAcA8m13LKgeiBJGy=XKLzP8zOqqxeEG8R0w=0jG-GprBEVA@mail.gmail.com>
 <20200828051319.n5f2vq7idrcgefia@sirius.home.kraxel.org>
 <CAFEAcA8i35pGHquuoT1Cmrk7QZrvV0SmQt-oy1N-3pQjD=ou9A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8i35pGHquuoT1Cmrk7QZrvV0SmQt-oy1N-3pQjD=ou9A@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 12:40:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 28, 2020 at 05:29:44PM +0100, Peter Maydell wrote:
> On Fri, 28 Aug 2020 at 06:13, Gerd Hoffmann <kraxel@redhat.com> wrote:
> > On Thu, Aug 27, 2020 at 11:23:58AM +0100, Peter Maydell wrote:
> > >
> > > Also we need figure out how to handle the conflict between
> > > "gitlab's git repo is mirrored (by perodic push?) from
> > > git.qemu.org" and "test by pushing to the gitlab staging
> > > branch", because the former overwrites the changes that
> > > the latter makes.
> >
> > Pushing to a qemu fork runs CI too, so the staging branch doesn't have
> > to live in the official qemu-project repo.
> 
> We aren't going to let the project's gitlab runners (the aarch64,
> s390x, etc systems) run just anybody's CI jobs, because they're
> a very limited resource: they will only run for things pushed
> to the official repo.

Runners are registered to the project, so we could create a separate
gitlab.com/qemu-project/qemu-staging  repo just for purpose of CI
and that would have access to the runners.

I don't know how the mirroring is setup currently, but if we use
GitLab's own pull based mirroring, you can configure it to only
mirror protected branches.  We could thus mark "master" and any
stable branches as protected.  GitLab should then mirror those,
without overwriting any other branches you have. So that ought
to let you create a staging branch in the main repo.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


