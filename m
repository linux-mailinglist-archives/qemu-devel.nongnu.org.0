Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70801FC9F9
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Jun 2020 11:37:25 +0200 (CEST)
Received: from localhost ([::1]:38556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlUVY-0006Ao-AU
	for lists+qemu-devel@lfdr.de; Wed, 17 Jun 2020 05:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jlUUg-0005cc-Un
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 05:36:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30378
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jlUUf-0007JQ-DT
 for qemu-devel@nongnu.org; Wed, 17 Jun 2020 05:36:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592386588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LORuVsaMJaZBEz6fVO2FT+emKJHiiUzjQvRsPh5m260=;
 b=i5DulbhBBVwCWsySMtMmMPMTALVQ13aWlVxGsgtoa9lzn9zsjfV825L5uX+upPxl+YKikA
 9Yf4tU+JUvAejxlbxf8fPlHW2O8t34aEJKL+l5PxFlQJJOi4YH0RGjEhZ97zqYhQURW1sh
 lBWX7Wy3wU2VYC3oJd6Ys++o9d3zw6Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-ocem7ynmOQOAetOAYsIA_Q-1; Wed, 17 Jun 2020 05:36:24 -0400
X-MC-Unique: ocem7ynmOQOAetOAYsIA_Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B3C9835B90;
 Wed, 17 Jun 2020 09:36:23 +0000 (UTC)
Received: from work-vm (ovpn-115-47.ams2.redhat.com [10.36.115.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56B5D5D9D3;
 Wed, 17 Jun 2020 09:36:16 +0000 (UTC)
Date: Wed, 17 Jun 2020 10:36:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] virtiofsd: Whitelist fchmod
Message-ID: <20200617093613.GA7075@work-vm>
References: <20200608093111.14942-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608093111.14942-1-mreitz@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/16 23:30:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Max Reitz (mreitz@redhat.com) wrote:
> lo_setattr() invokes fchmod() in a rarely used code path, so it should
> be whitelisted or virtiofsd will crash with EBADSYS.
> 
> Said code path can be triggered for example as follows:
> 
> On the host, in the shared directory, create a file with the sticky bit
> set and a security.capability xattr:
> (1) # touch foo
> (2) # chmod u+s foo
> (3) # setcap '' foo
> 
> Then in the guest let some process truncate that file after it has
> dropped all of its capabilities (at least CAP_FSETID):
> 
> int main(int argc, char *argv[])
> {
>     capng_setpid(getpid());
>     capng_clear(CAPNG_SELECT_BOTH);
>     capng_updatev(CAPNG_ADD, CAPNG_PERMITTED | CAPNG_EFFECTIVE, 0);
>     capng_apply(CAPNG_SELECT_BOTH);
> 
>     ftruncate(open(argv[1], O_RDWR), 0);
> }
> 
> This will cause the guest kernel to drop the sticky bit (i.e. perform a
> mode change) as part of the truncate (where FATTR_FH is set), and that
> will cause virtiofsd to invoke fchmod() instead of fchmodat().
> 
> (A similar configuration exists further below with futimens() vs.
> utimensat(), but the former is not a syscall but just a wrapper for the
> latter, so no further whitelisting is required.)
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1842667
> Reported-by: Qian Cai <caiqian@redhat.com>
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Queued.

> ---
>  tools/virtiofsd/seccomp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/virtiofsd/seccomp.c b/tools/virtiofsd/seccomp.c
> index bd9e7b083c..3b1522acdd 100644
> --- a/tools/virtiofsd/seccomp.c
> +++ b/tools/virtiofsd/seccomp.c
> @@ -42,6 +42,7 @@ static const int syscall_whitelist[] = {
>      SCMP_SYS(exit_group),
>      SCMP_SYS(fallocate),
>      SCMP_SYS(fchdir),
> +    SCMP_SYS(fchmod),
>      SCMP_SYS(fchmodat),
>      SCMP_SYS(fchownat),
>      SCMP_SYS(fcntl),
> -- 
> 2.26.2
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


