Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A6C2FA399
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 15:52:33 +0100 (CET)
Received: from localhost ([::1]:39326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1VtP-0003JN-Ts
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 09:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1Vrd-0001xq-9x
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47222)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l1Vra-0006Hn-D2
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 09:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610981436;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KNt8I2KtS8LBHMYY1pg2KMY7mTlm0B681NVj2CsqEyI=;
 b=dNyGh/GQit1y0Yv8p067MJrA02CkN4AfsIRz3NQSZDuGBF4tu97++m8i+WHvjIgLM3U8FE
 xPU4BAMtkJhvGphE7CUsQ6GEeT09+XcVc/PDhDL1gtsieW34LXR0rBu60BwGifLHrpUi/5
 H2mSs/PQiEVWQWIIWEHoqd5A02YGixo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-yO4lwVcOOgCKmKKG_aGz-Q-1; Mon, 18 Jan 2021 09:50:32 -0500
X-MC-Unique: yO4lwVcOOgCKmKKG_aGz-Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 326BB107ACE6;
 Mon, 18 Jan 2021 14:50:30 +0000 (UTC)
Received: from redhat.com (ovpn-116-34.ams2.redhat.com [10.36.116.34])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A9E5722C0;
 Mon, 18 Jan 2021 14:50:19 +0000 (UTC)
Date: Mon, 18 Jan 2021 14:50:16 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 9/9] gitlab-ci: Add alpine to pipeline
Message-ID: <20210118145016.GC1799018@redhat.com>
References: <20210118063808.12471-1-jiaxun.yang@flygoat.com>
 <20210118063808.12471-10-jiaxun.yang@flygoat.com>
 <20210118101159.GC1789637@redhat.com>
 <fb7308f2-ecc7-48b8-9388-91fd30691767@www.fastmail.com>
 <307dea8e-148e-6666-c6f1-5cc66a54a7af@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <307dea8e-148e-6666-c6f1-5cc66a54a7af@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 qemu-block@nongnu.org, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 kvm@vger.kernel.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 BALATON Zoltan via <qemu-devel@nongnu.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 18, 2021 at 03:44:49PM +0100, Thomas Huth wrote:
> On 18/01/2021 14.37, Jiaxun Yang wrote:
> > 
> > 
> > On Mon, Jan 18, 2021, at 6:11 PM, Daniel P. Berrangé wrote:
> > > On Mon, Jan 18, 2021 at 02:38:08PM +0800, Jiaxun Yang wrote:
> > > > We only run build test and check-acceptance as their are too many
> > > > failures in checks due to minor string mismatch.
> > > 
> > > Can you give real examples of what's broken here, as that sounds
> > > rather suspicious, and I'm not convinced it should be ignored.
> > 
> > Mostly Input/Output error vs I/O Error.
> 
> Right, out of curiosity, I also gave it a try:
> 
>  https://gitlab.com/huth/qemu/-/jobs/969225330
> 
> Apart from the "I/O Error" vs. "Input/Output Error" difference, there also
> seems to be a problem with "sed" in some of the tests.

The "sed" thing sounds like something that ought to be investigated
from a portability POV rather than ignored.

More worrying is the fact that there's a segv in there too when
running qemu-img, which does not give me confidence in use of
it with musl.



Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


