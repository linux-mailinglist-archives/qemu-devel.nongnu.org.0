Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8D81F1C88
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jun 2020 17:59:12 +0200 (CEST)
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiKB5-00043B-8z
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 11:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jiK9w-0003bY-TS
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 11:58:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47321
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jiK9v-0006qM-Tm
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 11:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591631878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=p/p126GTKMaHxIEPAxlcVREXk9kp5NAWlHIKlUp1NQ0=;
 b=avsooFPulfPfmBTdvJxHSPbh/1tKcYRuzNN9IlotFXs4KTyC/HEL7wUmPUPZ65Y4/Cwclu
 PXk3MQ/2b8XI+EPaPJLDfEgdHlukQQ/duUuGJDgHIjCoFLFQOs7OwZOBKMYDcInFIyzMLO
 NTfS8lgvdDUPHDzsHQ/b/1eigq25exs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-thu-BdZ_MNqPdSD3yz8DkA-1; Mon, 08 Jun 2020 11:57:56 -0400
X-MC-Unique: thu-BdZ_MNqPdSD3yz8DkA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C1A218FF660;
 Mon,  8 Jun 2020 15:57:55 +0000 (UTC)
Received: from work-vm (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E65212B4D3;
 Mon,  8 Jun 2020 15:57:48 +0000 (UTC)
Date: Mon, 8 Jun 2020 16:57:46 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH] virtiofsd: Whitelist fchmod
Message-ID: <20200608155746.GC2845@work-vm>
References: <20200608093111.14942-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200608093111.14942-1-mreitz@redhat.com>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 01:05:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Nicely found!


Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

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
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


