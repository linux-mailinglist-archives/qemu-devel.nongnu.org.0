Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8F2B8572
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 21:21:44 +0100 (CET)
Received: from localhost ([::1]:33650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfTxX-0006KJ-KC
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 15:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kfTvb-0005nC-Ey
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kfTvY-0001JR-Ro
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 15:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605730777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zfPq3vq6RNoSELUlYulTD9cjKf3SK0MEkwGrcnqoEo4=;
 b=fH0yCjfq/XghGFrKV1QXlbx9F9EJHWCBw4Da0f8otWw6w/E8wK/a39zJRPINRemW0Glhc/
 nN/Znu6CiZawmNUtST8NBk6gOCCVrQtiMGPmR4JmIwx3YzzQmJnXmJ6GwTRpX3o2n7dtiq
 gOiZbMSpbhd3f76gqMupGyxDWeGJO70=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-2JdUrC6vPnupA0xDiqVKQA-1; Wed, 18 Nov 2020 15:19:35 -0500
X-MC-Unique: 2JdUrC6vPnupA0xDiqVKQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F35D51084D6D;
 Wed, 18 Nov 2020 20:19:33 +0000 (UTC)
Received: from horse.redhat.com (ovpn-117-157.rdu2.redhat.com [10.10.117.157])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB5F45C1A3;
 Wed, 18 Nov 2020 20:19:30 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 318B3220203; Wed, 18 Nov 2020 15:19:30 -0500 (EST)
Date: Wed, 18 Nov 2020 15:19:30 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Use --thread-pool-size=0 to mean
 no thread pool
Message-ID: <20201118201930.GC111728@redhat.com>
References: <20201105194416.GA1384085@redhat.com>
 <20201105195253.GB1384085@redhat.com>
 <D9233684-9B76-468E-A5F1-B35DA3F3C091@intel.com>
 <20201106223524.GG1436035@redhat.com>
 <CAOssrKcJr9a_5EUTU19BTp1UaST64Shh9w0UeR6TXPLqkN7bBw@mail.gmail.com>
 <CAOssrKeyRVSxCCyvPJvjoXgPYd3Dkkwn5fwAzxeyj-h3g8FqqA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOssrKeyRVSxCCyvPJvjoXgPYd3Dkkwn5fwAzxeyj-h3g8FqqA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, "Shinde,
 Archana M" <archana.m.shinde@intel.com>, "Venegas Munoz,
 Jose Carlos" <jose.carlos.venegas.munoz@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 12, 2020 at 10:57:11AM +0100, Miklos Szeredi wrote:
[..]
> 
> Another performance issue with virtiofs could be due to the strict
> page writeback rules in fuse that are meant to prevent misuse of
> kernel memory by unprivileged processes.   Since virtiofs isn't
> subject to that limitation, these could be relaxed.

Hi Miklos,

I tried this patch with some of the write mmap workloads and it seems
to help. I ran virtiofsd with following options.

$ virtiofsd --socket-path=/tmp/vhostqemu -o source=/mnt//virtiofs-source -o no_posix_lock  -o cache=auto --thread-pool-size=0 --daemonize

Note, these workloads are not doing any fsync after write. So
they are effectively testing how fast one can do cached writes.

NAME                    WORKLOAD                Bandwidth       IOPS
limit-bdi               seqwrite-mmap           201.4mb         50.3k
nolimit-bdi             seqwrite-mmap           253.4mb         63.3k

limit-bdi               seqwrite-mmap-multi     386.7mb         96.6k
nolimit-bdi             seqwrite-mmap-multi     752.2mb         188.0k

limit-bdi               randwrite-mmap          53.5mb          13.3k
nolimit-bdi             randwrite-mmap          60.6mb          15.1k

limit-bdi               randwrite-mmap-multi    206.3mb         51.5k
nolimit-bdi             randwrite-mmap-multi    255.5mb         63.8k

seqwrite-mmap-multi seems to see the biggest jump.

So it might be a good idea to apply this patch.

> 
> Attaching a patch that does one half of this.  The other half is
> getting rid of the page copying, that's a bit more involved, but
> shouldn't be too difficult.  Just need to duplicate the cached
> writeback callbacks for virtiofs and do away with the complex temp
> page stuff.

Aha..., so we don't need all the complexity related to allocating
those temporary pages and then keeping track of writes in rb tree
and waiting for writes to finish etc. And it could be more like
a regular filesystem where lot of this stuff could be taken care
by common code for the case of virtiofs. That will be really nice.
Less code complexity to deal with. Also might provide performance
improvement.

Thanks
Vivek


