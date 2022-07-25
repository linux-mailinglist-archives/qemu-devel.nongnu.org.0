Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAB358010C
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:54:12 +0200 (CEST)
Received: from localhost ([::1]:50026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFzTH-0007sn-TH
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFzQI-0004Cv-VU
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:51:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oFzQF-0007TV-HP
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:51:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658760662;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34GV7iAiKSqgfFYQjoojrPXFohftVfwo0lXgXy6ldQk=;
 b=NxOCclJD75BijkfEOAv7trUHLGXP0vDKoQlLgPPVtp68kbgtzAAHdIhTyXmzgxLMeOkht/
 HfplDh5y0nUHEfrB6LDcIXRl2Sui0Wv22tF6OmF6zeieWM5HNDJvItBKEXKBpuBoAN22uy
 tcKOwMGQpPW41Puo9ZtlelMNYc5sCyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-632-hDNGSTpbMievzdhr2BcUtg-1; Mon, 25 Jul 2022 10:50:59 -0400
X-MC-Unique: hDNGSTpbMievzdhr2BcUtg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F255480418F;
 Mon, 25 Jul 2022 14:50:58 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 060C290A11;
 Mon, 25 Jul 2022 14:50:54 +0000 (UTC)
Date: Mon, 25 Jul 2022 15:50:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jag Raman <jag.raman@oracle.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "virtio-fs@redhat.com" <virtio-fs@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eric Blake <eblake@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Bandan Das <bsd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Julia Suvorova <jusual@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>
Subject: Re: [PULL 06/18] vfio-user: build library
Message-ID: <Yt6tzDw0R/UZL3NF@redhat.com>
References: <20220615155129.1025811-1-stefanha@redhat.com>
 <20220615155129.1025811-7-stefanha@redhat.com>
 <Ytkpiao5Zk8Pj5Lq@redhat.com>
 <97E1536C-58CF-4DDD-94C9-D44EF63C5AA5@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <97E1536C-58CF-4DDD-94C9-D44EF63C5AA5@oracle.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, Jul 25, 2022 at 02:45:09PM +0000, Jag Raman wrote:
> Hi Daniel,
> 
> We’ve created the following issue to update QEMU’s libvfio-user mirror
> to the latest:
> https://gitlab.com/qemu-project/libvfio-user/-/issues/1
> 
> Will update QEMU’s submodule once this mirror is updated.

That sounds good, thank you. We should be fine to get the
submodule reefreshed even in soft freeze, given that it is
fixing a test failure bug.

Oh and I just noticed I messed up your name in my message
below. I'm very sorry about that.

With regards,
Daniel 

> On Jul 21, 2022, at 6:25 AM, Daniel P. Berrangé <berrange@redhat.com<mailto:berrange@redhat.com>> wrote:
> 
> Hi Jay / Stefan,
> 
> We've got a non-determinsitic hang in QEMU CI since this series
> merged, which we tracked down to a libvfio-user test that is
> flakey:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/1114
> 
> John Levon has proposed a PR to libvfio-user to turn off the
> test, but we'll need one of you to update the git submodule
> for libvfio-user on the QEMU side, as I can't find a nice way
> to selectively skip the test from QEMU side alone.
> 
> With regards
> Daniel
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


