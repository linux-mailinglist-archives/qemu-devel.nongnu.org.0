Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3513F284F1B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Oct 2020 17:38:55 +0200 (CEST)
Received: from localhost ([::1]:54294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPp3G-0006rO-9P
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 11:38:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kPp0o-0005ZX-Qu
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 11:36:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kPp0m-0007Da-Cg
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 11:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601998579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCh4ickvhv/fi0cK0c0ZcprG+robtaW1/Re2f+LYxuU=;
 b=PKA5xleA57NPqH3F+gmlrgBDfHM1pQFpzIsyrajTbubQ+xp8++Sel38XtjE6BfIy6gGR4y
 YnO17FOSO9if39F4dJaGVBvK6bpSFktdRHk2qdt9dJpGc3ak6q4PIPvq89yoV3q3xjJySp
 WmBQSut7xxyz7Eoto9nhRiIo59YtfDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-lHlTVva4PbG0RCoS7It46w-1; Tue, 06 Oct 2020 11:36:18 -0400
X-MC-Unique: lHlTVva4PbG0RCoS7It46w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52FB9801F99;
 Tue,  6 Oct 2020 15:36:16 +0000 (UTC)
Received: from gondolin (ovpn-112-156.ams2.redhat.com [10.36.112.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9A0B855782;
 Tue,  6 Oct 2020 15:36:04 +0000 (UTC)
Date: Tue, 6 Oct 2020 17:36:01 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH v2 3/9] update-linux-headers: Add vfio_zdev.h
Message-ID: <20201006173601.745ab841.cohuck@redhat.com>
In-Reply-To: <1601669191-6731-4-git-send-email-mjrosato@linux.ibm.com>
References: <1601669191-6731-1-git-send-email-mjrosato@linux.ibm.com>
 <1601669191-6731-4-git-send-email-mjrosato@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: thuth@redhat.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 david@redhat.com, schnelle@linux.ibm.com, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  2 Oct 2020 16:06:25 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> vfio_zdev.h is used by s390x zPCI support to pass device-specific
> CLP information between host and userspace.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  scripts/update-linux-headers.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> index 29c27f4..9efbaf2 100755
> --- a/scripts/update-linux-headers.sh
> +++ b/scripts/update-linux-headers.sh
> @@ -141,7 +141,7 @@ done
>  
>  rm -rf "$output/linux-headers/linux"
>  mkdir -p "$output/linux-headers/linux"
> -for header in kvm.h vfio.h vfio_ccw.h vhost.h \
> +for header in kvm.h vfio.h vfio_ccw.h vfio_zdev.h vhost.h \
>                psci.h psp-sev.h userfaultfd.h mman.h; do
>      cp "$tmpdir/include/linux/$header" "$output/linux-headers/linux"
>  done

Obviously requires the kernel part to be merged first, but

Acked-by: Cornelia Huck <cohuck@redhat.com>


