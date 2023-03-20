Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796AB6C10C6
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 12:26:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peDdg-0007HT-6n; Mon, 20 Mar 2023 07:25:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peDdd-0007Gq-GS
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:25:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1peDdZ-0005RG-PL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 07:25:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679311510;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fTzYg673LX3aw+UZ8tnN9uyK1Ik+aTKah7XJjvR+gvw=;
 b=aixtIEwQbz8EZ0kKPe/Bgjhlz1mGc9q/8lKw4Rmbn2i73msXSyzaHHtqAefd3krmS4IpzV
 1yLzkXdybCbuWpf1QP0nbCIP3+bt5K+jJLVrhLD54rjsR4zk+SqfZajDG/K3G+LLEe4GBG
 IKOF+xwi0SJgjnC3CFJMY6w+02FTlRU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-260-SWQMa7p8N5CuuZWFaqDxaQ-1; Mon, 20 Mar 2023 07:25:07 -0400
X-MC-Unique: SWQMa7p8N5CuuZWFaqDxaQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ADAAA96DC81;
 Mon, 20 Mar 2023 11:25:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 48EAAC15BA0;
 Mon, 20 Mar 2023 11:25:05 +0000 (UTC)
Date: Mon, 20 Mar 2023 11:25:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Fontana <cfontana@suse.de>
Cc: fabiano.rosas@suse.com, Nikolay Borisov <nborisov@suse.com>,
 dgilbert@redhat.com, qemu-devel@nongnu.org, jfehlig@suse.com,
 Claudio.Fontana@suse.com, dfaggioli@suse.com
Subject: Re: [PATCH v3 00/14] File-based migration support and fixed-ram
 features
Message-ID: <ZBhCjpdhUPFmetYd@redhat.com>
References: <20221028103914.908728-1-nborisov@suse.com>
 <734376eb-0098-8885-190f-f328ddedf81b@suse.de>
 <Y+ZkKR+dry3aiynr@redhat.com>
 <650337f7-3433-c702-8d04-8f796a20bfe1@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <650337f7-3433-c702-8d04-8f796a20bfe1@suse.de>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

On Mon, Mar 20, 2023 at 12:14:53PM +0100, Claudio Fontana wrote:
> (adding Fabiano to the thread)
> 
> On 2/10/23 16:35, Daniel P. Berrangé wrote:
> > On Thu, Feb 09, 2023 at 02:32:01PM +0100, Claudio Fontana wrote:
> >> Hello Daniel and all,
> >>
> >> resurrecting this series from end of last year,
> >>
> >> do we think that this is the right approach and first step to
> >> be able to provide good performance for virsh save and virsh
> >> restore?
> > 
> > I've looked through the series in some more detail now and will
> > send review comments separately. Overall, I'm pretty pleased with
> > the series and think it is on the right path. The new format it
> > provides should be amenable to parallel I/O with multifd and
> > be able to support O_DIRECT to avoid burning through the host I/O
> > cache.
> 
> Just wanted to add a thought we had with Fabiano a few days ago:
> 
> experimentally, it is clear that fixed-ram is an optimization, but the actual scalability seems to come from the successive parallel I/O with multifd.
> 
> Since the goal is being able to transfer _to disk_ (fdatasync) the whole 30G memory in 5 seconds, the need to split the cpu-intensive work into smaller tasks remains,
> and the main scalability solution seems to come from the multifd part of the work (or another way to split the problem), combined with the O_DIRECT friendliness to avoid the trap of the cache trashing.
> 
> Not adding much, just highlighting that fixed-ram _alone_ does not seem to suffice, we probably need all pieces of the puzzle in place.

Agreed, the only thing that fixed-ram alone really does is to
ensure you have a finite file size if you're saving the state
while the VM is running, because successive dirtying of the
same block will write to the same location in file. Nice to
avoid wasting storage and gives a small speed up on restore.

It isn't going to give the massive speedup you're looking for
though. multifd + O_DIRECT is a critical followup piece to
achieve the major performance improvement. The fixed-ram
feature makes it practical to use multifd, without needing
to split content streams across many files, or have to invent
a way to splice multiple streams into the same file.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


