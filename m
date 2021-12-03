Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10575467E62
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 20:40:30 +0100 (CET)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtEQ0-0008Vd-7S
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 14:40:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mtENN-0006vX-GS
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:37:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37785)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1mtENG-0003jX-Om
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 14:37:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638560256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I9eTs1b8+fLyQvtsIPgYxtT9WRkikjmlpzEdsmcyXhY=;
 b=fyBWO3fQwp4GtkUVZ3jxqPfBAKk0jPFJ0agX1RE5c4QkHYnjB4HKXuX36iqjVYN9PaycJa
 DsN3Cge8UiMEcWZ6awZfhOCowXtroNvLsh9xAAgxRlVx3LZee9ZR5rw+lxBD3hWH6jBuMN
 YiDr3ixA5+f5HZoY9W5z8HSpvCIZrMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-159-bEZc349mPpOOoYMgkL6rhw-1; Fri, 03 Dec 2021 14:37:31 -0500
X-MC-Unique: bEZc349mPpOOoYMgkL6rhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11C1D802925;
 Fri,  3 Dec 2021 19:37:30 +0000 (UTC)
Received: from localhost (unknown [10.39.193.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65E1419C79;
 Fri,  3 Dec 2021 19:37:26 +0000 (UTC)
Date: Fri, 3 Dec 2021 19:37:26 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Eduardo Lima <elima@redhat.com>
Subject: Re: QEMU 6.2.0 and rhbz#1999878
Message-ID: <20211203193725.GB1127@redhat.com>
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, sw@weilnetz.de,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 03, 2021 at 04:20:23PM -0300, Eduardo Lima wrote:
> Hi Rich,
> 
> Can you confirm if the patch you added for qemu in Fedora has still not been
> merged upstream? I could not find it on the git source tree.
> 
> +Patch2: 0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
> +From 1331e4eec016a295949009b4360c592401b089f7 Mon Sep 17 00:00:00 2001
> +From: Richard Henderson <richard.henderson@linaro.org>
> +Date: Sun, 12 Sep 2021 10:49:25 -0700
> +Subject: [PATCH] tcg/arm: Reduce vector alignment requirement for NEON

https://bugzilla.redhat.com/show_bug.cgi?id=1999878
https://lists.nongnu.org/archive/html/qemu-devel/2021-09/msg01028.html

The patch I posted wasn't correct (or meant to be), it was just a
workaround.  However I think you're right - I don't believe the
original problem was ever fixed.

Let's see what upstreams says ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v


