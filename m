Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4089254D37
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Aug 2020 20:41:29 +0200 (CEST)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kBMq0-0007mD-Um
	for lists+qemu-devel@lfdr.de; Thu, 27 Aug 2020 14:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBMp3-0007C5-K5
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 14:40:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45446
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kBMp1-0002rx-5G
 for qemu-devel@nongnu.org; Thu, 27 Aug 2020 14:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598553625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PbBwcjAq5BmuJef5unLPjNpqAAzb+5rg0e7HEsBL02U=;
 b=YluiMMBZ5mKRNv8rzqrEs1PLXAHSQiimNOixpWHlyNb/TeMHRTT+URj9nL8X3GYXpISKXw
 oQjkIH2cTPT2EBusuMQP9Ln750L88gI/BdBPED0g/T47aq7rtWHKJFGZK9yYRzdTIjAIyo
 kKwTrthsJspV6/PfQlAfRZPH/x+1uig=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-jshoRrNRPVia0IufJYrYmQ-1; Thu, 27 Aug 2020 14:40:23 -0400
X-MC-Unique: jshoRrNRPVia0IufJYrYmQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD839189E616
 for <qemu-devel@nongnu.org>; Thu, 27 Aug 2020 18:40:22 +0000 (UTC)
Received: from work-vm (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58CC9196F3;
 Thu, 27 Aug 2020 18:40:15 +0000 (UTC)
Date: Thu, 27 Aug 2020 19:40:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v2 0/3] virtiofsd: allow virtiofsd to run in a container
Message-ID: <20200827184013.GG2837@work-vm>
References: <20200727190223.422280-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200727190223.422280-1-stefanha@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/27 00:13:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.959,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: vromanso@redhat.com, Daniel Walsh <dwalsh@redhat.com>,
 qemu-devel@nongnu.org, rmohr@redhat.com, virtio-fs@redhat.com,
 mpatel@redhat.com, vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> v2:
>  * Update virtiofsd.rst documentation on sandboxing modes
>  * Change syntax to -o sandbox=namespace|chroot
>  * Add comment explaining that unshare(CLONE_FS) has no visible side-effect
>    while single-threaded
>  * xfstests and pjdfstest pass. Did not run tests on overlayfs because required
>    xattrs do not work without CAP_SYS_ADMIN.
> 
> Mrunal and Dan: This patch series adds a sandboxing mode where virtiofsd relies
> on the container runtime for isolation. It only does
> chroot("path/to/shared-dir"), seccomp, and drops Linux capabilities. Previously
> it created a new mount, pid, and net namespace but cannot do this without
> CAP_SYS_ADMIN when run inside a container. pivot_root("path/to/shared-dir") has
> been replaced with chroot("path/to/shared-dir"), again because CAP_SYS_ADMIN is
> unavailable. The point of the chroot() is to prevent escapes from the shared
> directory during path traversal. Does this ring any alarm bells or does it
> sound sane?
> 
> Container runtimes handle namespace setup and remove privileges needed by
> virtiofsd to perform sandboxing. Luckily the container environment already
> provides most of the sandbox that virtiofsd needs for security.
> 
> Introduce a new "virtiofsd -o sandbox=chroot" option that uses chroot(2)
> instead of namespaces. This option allows virtiofsd to work inside a container.
> 
> Please see the individual patches for details on the changes and security
> implications.
> 
> Given that people are starting to attempt running virtiofsd in containers I
> think this should go into QEMU 5.1.

I've queued 1 and 3; waiting for someone with better knowledge of chroot
to review 2.

Dave

> Stefan Hajnoczi (3):
>   virtiofsd: drop CAP_DAC_READ_SEARCH
>   virtiofsd: add container-friendly -o sandbox=chroot option
>   virtiofsd: probe unshare(CLONE_FS) and print an error
> 
>  tools/virtiofsd/fuse_virtio.c    | 16 +++++++++
>  tools/virtiofsd/helper.c         |  8 +++++
>  tools/virtiofsd/passthrough_ll.c | 58 ++++++++++++++++++++++++++++++--
>  docs/tools/virtiofsd.rst         | 32 ++++++++++++++----
>  4 files changed, 104 insertions(+), 10 deletions(-)
> 
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


