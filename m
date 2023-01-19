Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D028673539
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 11:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIRuL-0004LO-Vr; Thu, 19 Jan 2023 05:12:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pIRuJ-0004Go-1N
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pIRuH-0006eP-EN
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674123148;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=b8E7FKORFjbVJ6VZPP01DjsIA6oCzRkrlHmQ501/XgE=;
 b=BLKy//s1XivGV4BgdeCI/DjZyRd3+kb3TIlNJvfTV6j/r8JNe1pNY4hCIhExTgkpxmMyWe
 +8a7/KGcm0ba6DIyeyUCMoow5aDG+lEPNL19ddR6OGYOxLvyzv1++OtjewYX80ODa4ytAD
 0WLU7rnnpxPq/l9bMHojXqaBykIdgfA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-CUgTlMouP7ie0qChwjrK9w-1; Thu, 19 Jan 2023 05:12:24 -0500
X-MC-Unique: CUgTlMouP7ie0qChwjrK9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 087F68A010A;
 Thu, 19 Jan 2023 10:12:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CAFE40C2064;
 Thu, 19 Jan 2023 10:12:23 +0000 (UTC)
Date: Thu, 19 Jan 2023 10:12:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Wang, Wenchao" <wenchao.wang@intel.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: Announcement of aborting HAXM maintenance
Message-ID: <Y8kXhd2EcRU2QxVC@redhat.com>
References: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DM6PR11MB40903663BB06C7A64136DF3587C49@DM6PR11MB4090.namprd11.prod.outlook.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Jan 19, 2023 at 03:56:04AM +0000, Wang, Wenchao wrote:
> Hi, Philippe,
> 
> Intel decided to abort the development of HAXM and the maintenance
> of its QEMU part. Should we submit a patch to mark the Guest CPU
> Cores (HAXM) status as Orphan and remove the maintainers from the
> corresponding list? Meanwhile, should the code enabling HAX in QEMU
> once committed by the community be retained?

If you no longer intend to work on QEMU bits related to HAXM, then
yes, you should send a patch for the MAINTAINERS file to remove you
name and mark it as "Orphan" status.

We would not normally delete code from QEMU, merely because it has
been orphaned. If it is still known to work then we would retain
it indefinitely, unless some compelling reason arises to drop it.
This gives time for any potential users to adjust their plans,
and/or opportunity for other interested people to take over the
maintenance role.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


