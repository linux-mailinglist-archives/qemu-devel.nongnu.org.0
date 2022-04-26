Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8713550F35E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 10:07:29 +0200 (CEST)
Received: from localhost ([::1]:58642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njGEJ-00032q-QK
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 04:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njG52-0008RE-B1
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:57:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1njG50-0000UR-Dn
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 03:57:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650959869;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=2zQQNa19FXyI2Ew2mZhiLmGyR/IcM1WJIy1c8vLkskY=;
 b=QMxldiW2e+m+S1JzFHAK1FR5Gqr3CVNuGNBtySiFPjyXdGFgteB5jyRagmBah3zd/KN8MD
 ALUluFCigOM7x1ljo6+B+nT3vHjQUjQugWqhQvInr+wQ50BhnIB3SqjxGUhGnrHy3NPxkg
 2ONwXlnlYyTaQBdB4APF1k5fW8sZL+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-JaYHcnBCM8eFFewPHvD31g-1; Tue, 26 Apr 2022 03:57:46 -0400
X-MC-Unique: JaYHcnBCM8eFFewPHvD31g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 43F5B1014A60;
 Tue, 26 Apr 2022 07:57:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 175A9403149;
 Tue, 26 Apr 2022 07:57:43 +0000 (UTC)
Date: Tue, 26 Apr 2022 08:57:41 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 0/6] Kraxel 20220425 patches
Message-ID: <Ymel9Y9dXM2ueKlR@redhat.com>
References: <20220425061029.3932731-1-kraxel@redhat.com>
 <4f3017ea-3f6b-dd43-275a-5012cf0f412a@linaro.org>
 <20220426071550.3y5h7ydyptppo777@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220426071550.3y5h7ydyptppo777@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Beraldo Leal <bleal@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 09:15:50AM +0200, Gerd Hoffmann wrote:
> On Mon, Apr 25, 2022 at 10:21:00AM -0700, Richard Henderson wrote:
> > On 4/24/22 23:10, Gerd Hoffmann wrote:
> > > The following changes since commit a74782936dc6e979ce371dabda4b1c05624ea87f:
> > > 
> > >    Merge tag 'pull-migration-20220421a' of https://gitlab.com/dagrh/qemu into staging (2022-04-21 18:48:18 -0700)
> > > 
> > > are available in the Git repository at:
> > > 
> > >    git://git.kraxel.org/qemu tags/kraxel-20220425-pull-request
> > > 
> > > for you to fetch changes up to ef798418a3037434951002d0afc5f3d919e294db:
> > > 
> > >    avocado/vnc: add test_change_listen (2022-04-22 13:43:28 +0200)
> > > 
> > > ----------------------------------------------------------------
> > > vnc: add display-update monitor command.
> > > screendump: add png support.
> > > vmsvga: screen update fix.
> > > 
> > > ----------------------------------------------------------------
> > > 
> > > Carwyn Ellis (1):
> > >    hw/display/vmware_vga: do not discard screen updates
> > > 
> > > Kshitij Suri (2):
> > >    Replacing CONFIG_VNC_PNG with CONFIG_PNG
> > >    Added parameter to take screenshot with screendump as PNG
> > > 
> > > Vladimir Sementsov-Ogievskiy (3):
> > >    ui/vnc: refactor arrays of addresses to SocketAddressList
> > >    qapi/ui: add 'display-update' command for changing listen address
> > >    avocado/vnc: add test_change_listen
> > 
> > 
> > Fails testing with
> > 
> >   ERROR: unknown option --disable-vnc-png
> > 
> > See https://gitlab.com/qemu-project/qemu/-/jobs/2374050341
> 
> Hmm, how do I test that?  My CI run didn't include the centos test case
> for some reason: https://gitlab.com/kraxel/qemu/-/pipelines/522456078

That's a job running on the private runner i expect.

Anyway the fix is simple enough - its just a renamed configure
option that needs changing in two places.

$ git grep disable-vnc-png
scripts/ci/org.centos/stream/8/x86_64/configure:--disable-vnc-png \
scripts/meson-buildoptions.sh:    --disable-vnc-png) printf "%s" -Dvnc_png=disabled ;;

The latter seems to be an auto-generated file that gets checked into
git :-(

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


