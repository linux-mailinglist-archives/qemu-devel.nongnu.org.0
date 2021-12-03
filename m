Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165FE467F10
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 22:05:34 +0100 (CET)
Received: from localhost ([::1]:49488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtFkJ-0003dh-Sa
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 16:05:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mtFiU-0002kr-RF
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 16:03:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mtFiR-00007j-Ak
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 16:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638565413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hBbUIJbbDW3XXDbfkOt4lL8Sel3NJzp1CYKUXi6IIjg=;
 b=S/nzP7XqM2Y6rC08jue00qEjGMxeDLcAdZPOq3sWDpDieUSLnRkLE+c5rPGbHAvno1NWLg
 mBBW8EnubFf9oI8h2myxl7x98YrQc+S+NP67w32sHPQae7bg9pPFsv99PxEG4BiMZqWdho
 dcV8Kv7P6wAljFWAkzyD3s0bxhT5srI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-514-W8TzKBqYPQe1uVBaQdSsfw-1; Fri, 03 Dec 2021 16:03:28 -0500
X-MC-Unique: W8TzKBqYPQe1uVBaQdSsfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C44B58042E2;
 Fri,  3 Dec 2021 21:03:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 537D510016F7;
 Fri,  3 Dec 2021 21:03:26 +0000 (UTC)
Date: Fri, 3 Dec 2021 21:03:25 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eduardo Lima <elima@redhat.com>
Subject: Re: QEMU 6.2.0 and rhbz#1999878
Message-ID: <20211203210325.GG1127@redhat.com>
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
 <20211203193725.GB1127@redhat.com>
 <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Daniel Berrange <berrange@redhat.com>,
 sw@weilnetz.de, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 05:35:41PM -0300, Eduardo Lima wrote:
> 
> 
> On Fri, Dec 3, 2021 at 4:37 PM Richard W.M. Jones <rjones@redhat.com> wrote:
> 
>     On Fri, Dec 03, 2021 at 04:20:23PM -0300, Eduardo Lima wrote:
>     > Hi Rich,
>     >
>     > Can you confirm if the patch you added for qemu in Fedora has still not
>     been
>     > merged upstream? I could not find it on the git source tree.
>     >
>     > +Patch2: 0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
>     > +From 1331e4eec016a295949009b4360c592401b089f7 Mon Sep 17 00:00:00 2001
>     > +From: Richard Henderson <richard.henderson@linaro.org>
>     > +Date: Sun, 12 Sep 2021 10:49:25 -0700
>     > +Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON
> 
>     https://bugzilla.redhat.com/show_bug.cgi?id=1999878
>     https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01028.html
> 
>     The patch I posted wasn't correct (or meant to be), it was just a
>     workaround.  However I think you're right - I don't believe the
>     original problem was ever fixed.
>
> Yes, I saw that your original patch had been replaced by this new
> one I mentioned, so I thought it was the correct solution, but I
> could not find this new one on the repository as well.

Oh I see, it was indeed replaced by Richard Henderson's patch:

https://src.fedoraproject.org/rpms/qemu/blob/rawhide/f/0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch

> At the moment I kept it as part of 6.2.0 build, which I am just about to push
> to rawhide. It builds locally, and I am only waiting for the scratch-build to
> finish.

Yes looks like we need to keep it, and get it upstream too.

Thanks,

Rich.

> https://koji.fedoraproject.org/koji/taskinfo?taskID=79556515
> 
> Thanks, Eduardo.
> 
>  
> 
> 
>     Let's see what upstreams says ...
> 
>     Rich.
> 
>     --
>     Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/
>     ~rjones
>     Read my programming and virtualization blog: http://rwmj.wordpress.com
>     virt-p2v converts physical machines to virtual machines.  Boot with a
>     live CD or over the network (PXE) and turn machines into KVM guests.
>     http://libguestfs.org/virt-v2v
> 
> 

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


