Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DDD2F43E9
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 06:34:43 +0100 (CET)
Received: from localhost ([::1]:42444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzYnq-0000S4-9K
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 00:34:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzYme-0008RT-Oi
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 00:33:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzYmd-0006BQ-0g
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 00:33:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610516005;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x0oyDfprfBEj+sNP/vkSHmMVaTNrjKk1Rsh4jAVj0+4=;
 b=LkbJP/tHpU3JBOObHoKQjbXQu3mW5JqHoxU4ueXTV6f7vj5K3QwMuOFw46xVmSL+/0MfrG
 okBFObKKdSnM6QXorCpzgExQYvQZ1jCJpXBk3xuITQ17dXZQmlQYPVetv7IbDGgXT8whT1
 mxHRrLRg3cU+do6sLp8ICIDimmojJKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-CpMgYlvJMTez4KEx3nopOQ-1; Wed, 13 Jan 2021 00:33:23 -0500
X-MC-Unique: CpMgYlvJMTez4KEx3nopOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21A8B107ACF7;
 Wed, 13 Jan 2021 05:33:22 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 169C21001B2C;
 Wed, 13 Jan 2021 05:33:20 +0000 (UTC)
Subject: Re: [PATCH v2] configure: MinGW respect --bindir argument
To: Joshua Watt <jpewhacker@gmail.com>, qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
 <20210112210239.28836-1-JPEWhacker@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8c52fcc8-eb2e-c068-9187-1d007e15d1af@redhat.com>
Date: Wed, 13 Jan 2021 06:33:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210112210239.28836-1-JPEWhacker@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, pbonzini@redhat.com,
 luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/2021 22.02, Joshua Watt wrote:
> There are two cases that need to be accounted for when compiling QEMU
> for MinGW32:
>   1) A standalone distribution, where QEMU is self contained and
>      extracted by the user, such as a user would download from the QEMU
>      website. In this case, all the QEMU executable files should be
>      rooted in $prefix to ensure they can be easily found by the user
>   2) QEMU integrated into a distribution image/sysroot/SDK and
>      distributed with other programs. In this case, the provided
>      arguments for bindir/datadir/etc. should be respected as they for a
>      Linux build.
> 
> Restructures the MinGW path configuration so that all of the paths
> except bindir use the same rules as when building for other platforms.
> This satisfies #2 and #1 since these files do not need to be directly in
> $prefix anyway.
> 
> The handling for --bindir is changed so that it defaults to $prefix on
> MinGW (maintaining the compatibility with #1), but if the user specifies
> a specific path when configuring it can also satisfy #2.
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   configure | 17 ++++++-----------
>   1 file changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/configure b/configure
> index 5860bdb77b..092e2926bc 100755
> --- a/configure
> +++ b/configure
> @@ -1571,20 +1571,15 @@ libexecdir="${libexecdir:-$prefix/libexec}"
>   includedir="${includedir:-$prefix/include}"
>   
>   if test "$mingw32" = "yes" ; then
> -    mandir="$prefix"
> -    datadir="$prefix"
> -    docdir="$prefix"
> -    bindir="$prefix"
> -    sysconfdir="$prefix"
> -    local_statedir="$prefix"
> +    bindir="${bindir:-$prefix}"
>   else
> -    mandir="${mandir:-$prefix/share/man}"
> -    datadir="${datadir:-$prefix/share}"
> -    docdir="${docdir:-$prefix/share/doc}"
>       bindir="${bindir:-$prefix/bin}"
> -    sysconfdir="${sysconfdir:-$prefix/etc}"
> -    local_statedir="${local_statedir:-$prefix/var}"
>   fi
> +mandir="${mandir:-$prefix/share/man}"
> +datadir="${datadir:-$prefix/share}"
> +docdir="${docdir:-$prefix/share/doc}"
> +sysconfdir="${sysconfdir:-$prefix/etc}"
> +local_statedir="${local_statedir:-$prefix/var}"
>   firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
>   localedir="${localedir:-$datadir/locale}"

Yes, I think this makes most sense, thanks for the update!

Reviewed-by: Thomas Huth <thuth@redhat.com>


