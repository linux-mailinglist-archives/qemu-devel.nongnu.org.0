Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73F63240EB
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:46:35 +0100 (CET)
Received: from localhost ([::1]:37748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwN0-00051k-TH
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:46:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@codewreck.org>)
 id 1lEwKr-00045S-77
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:44:21 -0500
Received: from nautica.notk.org ([91.121.71.147]:38100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@codewreck.org>)
 id 1lEwKo-0005Uw-Et
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:44:20 -0500
Received: by nautica.notk.org (Postfix, from userid 108)
 id B8C09C01E; Wed, 24 Feb 2021 16:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1614181454; bh=ZV8jkMbY8El7E5ZFbA9docIbSkA9tEpu7hmt+4Awjko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VsE5jdr/5aZpQH+iy7jVXAIurhi3NlE749qCFkpkQQXTKLZ7EcdbMytdAVWvGLbO4
 yrQl2sg3Ro42bSA3PZ21pohotim5n/cZtc3ZFmh09AqaoDUTXHVcRFeVW6yGo2By7D
 dcRGux1GlLIY/yihtuj76PwQ1QCHm7YwA5wkVwI4Mw8OsuLfI2J2PX/dRALFf2NZ7b
 LwBfghtJh8qE6qYp8dlWFJYbyYBSmGt09FUpPGOrt8vqt2ravJT4MUWgNLOBh+zQUr
 +JXEiAqK+//aafD2H/UazGLSU64xrLP7QUUo5fTTfZh+4yenAAjlYn+cOIf3pGANRC
 gyXblOwR/IiYg==
Received: from tyr.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTP id 99CC2C009;
 Wed, 24 Feb 2021 16:44:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1614181453; bh=ZV8jkMbY8El7E5ZFbA9docIbSkA9tEpu7hmt+4Awjko=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Cg4V6oqyH5eIpG+vlgHKbC/pIbonfhxTTuPNEM6WTJnR05IOLD9CkddT/7KkI5nDu
 f+oBz98aOjF7gyK2dZ942PyqTnmoTfh+l90ies6b/vyeHlujKtk4Y7svX2SlRSLGRd
 4IaQuFgM++MFYG/UMgGN5/wZ2xPwuzzOa2t1UMIrosD/6qDRgj54Z9svWmf2AtXOHJ
 CpOlGz9izTLCorDbl+RwbVIPlLtnzpc2vRe0IiKyjFghHep3Eg9Wzb3d7+IBGOFqkM
 vh2I58M9ZaHrZK++A8EtEZUzmCudlJxJP+t7J0A7Qo9pwTzEoEwlo06iKsFvNIZK+D
 MQqJZQwLAoMVg==
Received: from tyr.codewreck.org (localhost [127.0.0.1])
 by tyr.codewreck.org (Postfix) with SMTP id 8618A281001;
 Thu, 25 Feb 2021 00:44:12 +0900 (JST)
Received: (from asmadeus@codewreck.org)
 by tyr.codewreck.org (mini_sendmail/1.3.9 19Oct2015);
 Thu, 25 Feb 2021 00:44:12 JST (sender asmadeus@tyr.codewreck.org)
Date: Thu, 25 Feb 2021 00:43:57 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: Can not set high msize with virtio-9p (Was: Re: virtiofs vs 9p
 performance)
Message-ID: <20210224154357.GA12207@tyr>
References: <20200918213436.GA3520@redhat.com> <6115734.fQeFoySBn5@silver>
 <20210223090531-mutt-send-email-mst@kernel.org>
 <2006960.IAZaadA1hq@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2006960.IAZaadA1hq@silver>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=91.121.71.147;
 envelope-from=asmadeus@codewreck.org; helo=nautica.notk.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "cdupontd@redhat.com" <cdupontd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>, Greg Kurz <groug@kaod.org>,
 qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 v9fs-developer@lists.sourceforge.net, "Shinde,
 Archana M" <archana.m.shinde@intel.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck wrote on Wed, Feb 24, 2021 at 04:16:52PM +0100:
> Misapprehension + typo(s) in my previous message, sorry Michael. That's 500k 
> of course (not 5k), yes.
> 
> Let me rephrase that question: are you aware of something in virtio that would 
> per se mandate an absolute hard coded message size limit (e.g. from virtio 
> specs perspective or maybe some compatibility issue)?
> 
> If not, we would try getting rid of that hard coded limit of the 9p client on 
> kernel side in the first place, because the kernel's 9p client already has a 
> dynamic runtime option 'msize' and that hard coded enforced limit (500k) is a 
> performance bottleneck like I said.

We could probably set it at init time through virtio_max_dma_size(vdev)
like virtio_blk does (I just tried and get 2^64 so we can probably
expect virtually no limit there)

I'm not too familiar with virtio, feel free to try and if it works send
me a patch -- the size drop from 512 to 500k is old enough that things
probably have changed in the background since then.


On the 9p side itself, unrelated to virtio, we don't want to make it
*too* big as the client code doesn't use any scatter-gather and will
want to allocate upfront contiguous buffers of the size that got
negotiated -- that can get ugly quite fast, but we can leave it up to
users to decide.
One of my very-long-term goal would be to tend to that, if someone has
cycles to work on it I'd gladly review any patch in that area.
A possible implementation path would be to have transport define
themselves if they support it or not and handle it accordingly until all
transports migrated, so one wouldn't need to care about e.g. rdma or xen
if you don't have hardware to test in the short term.

The next best thing would be David's netfs helpers and sending
concurrent requests if you use cache, but that's not merged yet either
so it'll be a few cycles as well.


Cheers,
-- 
Dominique

