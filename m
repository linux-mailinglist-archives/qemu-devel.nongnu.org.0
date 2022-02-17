Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F864BA5A4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 17:22:32 +0100 (CET)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKjY6-0000Aw-JT
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 11:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nKjTJ-0006vL-G5
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:17:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nKjT6-0001K7-Nu
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 11:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645114638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VvgyeHpBbeyyYyYbUIlc8nH4e6Oq03opJdxevyXXEps=;
 b=NBTGhTqBn9zqyT/3HO1kcesLY8b60+T92wEmf/3jtK4eru3XjnU5LPNZlwKBJt8j++rh1B
 MnkkN4QIrx/qRSEDFPPlkF2rxEQwPpksSsspTCPqdZOIt0vmFdhghQPGPLnvsGfIDixe0k
 xUjDrx9uWidLHfoXX6J77P/btxB5pBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-eUflDCzdMpqWGPkc-zpo4w-1; Thu, 17 Feb 2022 11:17:14 -0500
X-MC-Unique: eUflDCzdMpqWGPkc-zpo4w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8163B814243;
 Thu, 17 Feb 2022 16:17:13 +0000 (UTC)
Received: from paraplu (unknown [10.39.192.127])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E62E747B4;
 Thu, 17 Feb 2022 16:17:12 +0000 (UTC)
Date: Thu, 17 Feb 2022 17:17:09 +0100
From: Kashyap Chamarthy <kchamart@redhat.com>
To: Ben Smith <ben.ellis.smith@gmail.com>
Subject: Re: qemu crash 100% CPU with Ubuntu10.04 guest (solved)
Message-ID: <Yg51BXhm5h5KUft8@paraplu>
References: <CAK7yb4TeKr2br6RthdQwiU2+JGrWcs3ZgWbWHOYGEJ=Ae2z36Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7yb4TeKr2br6RthdQwiU2+JGrWcs3ZgWbWHOYGEJ=Ae2z36Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kchamart@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 17, 2022 at 12:07:15PM +1100, Ben Smith wrote:
> Hi All,
Hi,

> I'm cross-posting this from Reddit qemu_kvm, in case it helps in some
> way. I know my setup is ancient and unique; let me know if you would
> like more info.
> 
> Symptoms:
> 1. Ubuntu10.04 32-bit guest locks up randomly between 0 and 30 days.
> 2. The console shows a CPU trace dump, nothing else logged on the guest or host.
> 3. Host system (Ubuntu20.04) 100% CPU for qemu process.
> 
> Solution:
> When using virt-install, always use the "--os-variant" parameter!
> e.g. --os-variant ubuntu10.04
> 
> From the man page "--os-variant... Optimize the guest configuration
> for a specific operating system".
> In this case, "optimize" apparently means "stop the crashing".

The "--os-variant" will use virtio devices where applicable, recommended
machine type, guest resources (e.g. CPU, memory, disk size) and other
things that'll improve performance.

> I was deliberately avoiding the option because the VM was already
> performing much better than expected and I didn't want to complicate
> the configuration.

Using it is always recommended when using `virt-install`.  The command
`osinfo-query os` will list all the OSes that you can use with
"--os-variant".  Note: even if you don't find the latest version of $OS
in `osinfo-query`, just using the most recent version still suffices.


> This was very, very painful to troubleshoot; Involving spinning up 60
> VMs simultaneously, waiting for a failure, changing one parameter,
> repeat. :(

Yikes!  Kudos for having the high threshold for frustration.

I think providing a clear reproducer can still be useful.  E.g. your
full guest QEMU command-line and your QEMU version.  (The
libvirt-generated QEMu log contains the version info.)


-- 
/kashyap


