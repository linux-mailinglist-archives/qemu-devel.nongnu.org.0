Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FE254DF96
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 12:58:59 +0200 (CEST)
Received: from localhost ([::1]:39854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1nDG-0007hP-UN
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 06:58:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1mkz-0003dm-5Q
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:29:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o1mkw-000237-KQ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 06:29:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655375381;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IxIk5KC9FLQjeXYcQ+ERjQ1UbjR1Oh28A1GeClfWaTs=;
 b=PX98ugiz+BEBveNIoNu/ptqfuJ31RAieT2o3iJtlZC2GMJJCmUJKs/llhnnbxhQNdaaSbT
 f5ql79UraUK5L9TGfYur+QFBCmyfdvc/jomh078Ax9oLKLUI5P55z7slwx6bthUF5IZA0g
 1Dh1Pgq4IJML1uGowuoRXuVHIOTXA0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-OLLRH3RjMz-kmTcwxcuXMA-1; Thu, 16 Jun 2022 06:29:36 -0400
X-MC-Unique: OLLRH3RjMz-kmTcwxcuXMA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8B2D1D33865;
 Thu, 16 Jun 2022 10:29:35 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EACD4403350;
 Thu, 16 Jun 2022 10:29:34 +0000 (UTC)
Date: Thu, 16 Jun 2022 11:29:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, akihiko.odaki@gmail.com
Subject: Re: [PATCH] tests/vm: do not specify -bios option
Message-ID: <YqsGDMENCErROHcT@redhat.com>
References: <20220616083025.116902-1-pbonzini@redhat.com>
 <YqrtiL18Z2jWCHM3@redhat.com>
 <9bfd73ef-749b-e9d7-9202-5ba4221c0f72@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9bfd73ef-749b-e9d7-9202-5ba4221c0f72@redhat.com>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 16, 2022 at 12:14:01PM +0200, Paolo Bonzini wrote:
> On 6/16/22 10:44, Daniel P. Berrangé wrote:
> > On Thu, Jun 16, 2022 at 10:30:25AM +0200, Paolo Bonzini wrote:
> > > When running from the build tree, the executable is able to find
> > > the BIOS on its own; when running from the source tree, a firmware
> > > blob should already be installed and there is no guarantee that
> > > the one in the source tree works with the QEMU that is being used for
> > > the installation.
> > I think there is interaction with
> > 
> >    --firmwarepath=/usr/share/qemu-firmware:/usr/share/ipxe/qemu:/usr/share/seavgabios:/usr/share/seabios:/usr/share/sgabios
> > 
> > as the firmware path listed there will be searched before the local
> > build tree.
> > 
> > I agree with your desire to remove the -bios option, but I'm not
> > sure it is entirely safe unless logic in qemu_find_file is fixed
> > to ignore the global search path when running from the build
> > tree.
> 
> Isn't this the same for any other invocation of QEMU, for example in qtest?

Yes, quite likely in fact, so a pre-existing widespread problem and
thus not a reason to avoid this proposed change.

> I admit I didn't think of the interaction with --firmwarepath, but "if it
> hurts, don't do it" might apply here.  That is, install compatible firmware
> to the path _before_ trying to use a QEMU that specifies that path.

I'm mostly thinking of downstream distro developers where they have an
installed QEMU but are working on a build from a different QEMU version.
We can address this separately though

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


