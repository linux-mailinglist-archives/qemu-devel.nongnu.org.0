Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2E93027E4
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 17:32:55 +0100 (CET)
Received: from localhost ([::1]:41854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44nO-0008V0-JM
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 11:32:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l44jv-0006uY-P7
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:29:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l44js-00008U-S2
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 11:29:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611592155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9O2VNfivp2jcuDGuk8KDF0+7roEZoG3xh5Rvx1QFdiI=;
 b=KILRvan+KOCdNUmDkTIPUWSkHj+iXA3JMrAZBmU0MtXlJpjNH+WwEwQGrsly9gX00/Vv5u
 VfROxPowses4uuRnRU6GXe+w8XuqhqsCThukkjzfUqwf3CErNqeredXMLCD9/oOXsKJQoY
 AXYLOkUdwPfgpgVSIaRyor87Shsvyys=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-IJhAnMKQOFOcTCLwjQbPeg-1; Mon, 25 Jan 2021 11:29:13 -0500
X-MC-Unique: IJhAnMKQOFOcTCLwjQbPeg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3324F19611A3;
 Mon, 25 Jan 2021 16:29:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-127.ams2.redhat.com [10.36.112.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 897365D9E2;
 Mon, 25 Jan 2021 16:29:10 +0000 (UTC)
Subject: Re: [PATCH v2] configure: Only build s390-ccw BIOS when system
 emulation is built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210125153719.2863349-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <97317bd1-03a1-acd2-2eeb-795666edac58@redhat.com>
Date: Mon, 25 Jan 2021 17:29:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210125153719.2863349-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/01/2021 16.37, Philippe Mathieu-Daudé wrote:
> It is pointless to build the s390-ccw BIOS when only user-mode
> emulation is built. Only build it when s390 system mode emulation
> is selected.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> v2: Restrict to s390x-softmmu (thuth)
> 
> We could move the whole block into the case(), but
> 1/ it doesn't look nice
> 2/ it doesn't match the rest of this file code style
> 
> Supersedes: <20210124161740.2502786-1-f4bug@amsat.org>
> ---
>   configure | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index dcc5ea7d630..997fb0761a5 100755
> --- a/configure
> +++ b/configure
> @@ -461,6 +461,7 @@ skip_meson=no
>   gettext="auto"
>   fuse="auto"
>   fuse_lseek="auto"
> +s390_ccw_bios="no"
>   
>   malloc_trim="auto"
>   
> @@ -5373,7 +5374,11 @@ if { test "$cpu" = "i386" || test "$cpu" = "x86_64"; } && \
>   fi
>   
>   # Only build s390-ccw bios if we're on s390x and the compiler has -march=z900
> -if test "$cpu" = "s390x" ; then
> +case $target_list in
> +  *"s390x-softmmu"*) s390_ccw_bios=yes
> +  ;;
> +esac
> +if test "$s390_ccw_bios" = yes; then

Why did you drop the test for the host CPU? ... the s390-ccw bios currently 
only compiles on a s390x box...

  Thomas


