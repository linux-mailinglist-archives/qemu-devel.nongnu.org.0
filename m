Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 232532EEDDB
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 08:27:43 +0100 (CET)
Received: from localhost ([::1]:50486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxmBR-0008Db-Ng
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 02:27:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxm9C-0007gy-W4
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:25:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxm95-0003nf-3U
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 02:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610090711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BUczPeGITrcyHJwqS/HoHzQWWpNMt0hmqKuG6wL8gis=;
 b=A3bllhMDlhPYQFgQZUBn4aqapR8mYQIm5kyxdBVTZbzEgBj11fWU5y36VLnV4zv8r53wk1
 T/CTW5XsZTKlMYRRDEKVQnFD0lcI4O9QEYAYyRgnuLLdpV4rBf9mqPHzopA4qtCdJIaUFi
 C6f3fNq8yx4JIh7Ze8Uexo4qVwmK/yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536--EqD4VC1Opaf0ZzSRtBGuw-1; Fri, 08 Jan 2021 02:25:09 -0500
X-MC-Unique: -EqD4VC1Opaf0ZzSRtBGuw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 442E2805F01;
 Fri,  8 Jan 2021 07:25:08 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-213.ams2.redhat.com [10.36.112.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3EFD860C4D;
 Fri,  8 Jan 2021 07:25:02 +0000 (UTC)
Subject: Re: [PATCH] configure: Add flags for MinGW32 standalone build
To: Joshua Watt <jpewhacker@gmail.com>, qemu-devel@nongnu.org
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8ea87ea1-093d-81b0-13d6-60caa9fcdad4@redhat.com>
Date: Fri, 8 Jan 2021 08:25:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210107213856.34170-1-JPEWhacker@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, Yonggang Luo <luoyonggang@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2021 22.38, Joshua Watt wrote:
> There are two cases that need to be accounted for when compiling QEMU
> for MinGW32:
>   1) A standalone distribution, where QEMU is self contained and
>      extracted by the user, such as a user would download from the QEMU
>      website. In this case, all of the QEMU files should be rooted in
>      $prefix to ensure they can be easily packaged together for
>      distribution
>   2) QEMU integrated into a distribution image/sysroot/SDK and
>      distributed with other programs. In this case, the provided
>      arguments for bindir/datadir/etc. should be respected as they for a
>      Linux build.
> 
> Add a configure time flags --enable-standalone-mingw and
> --disable-standalone-mingw that allows the user to control this
> behavior. The flag defaults to "enabled" if unspecified to retain the
> existing build behavior
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   configure | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 5860bdb77b..5c83edb502 100755
> --- a/configure
> +++ b/configure
> @@ -358,6 +358,7 @@ strip_opt="yes"
>   tcg_interpreter="no"
>   bigendian="no"
>   mingw32="no"
> +mingw32_standalone="yes"
>   gcov="no"
>   EXESUF="$default_feature"
>   HOST_DSOSUF=".so"
> @@ -1558,6 +1559,10 @@ for opt do
>     ;;
>     --disable-fuse-lseek) fuse_lseek="disabled"
>     ;;
> +  --enable-standalone-mingw) mingw32_standalone="yes"
> +  ;;
> +  --disable-standalone-mingw) mingw32_standalone="no"
> +  ;;
>     *)
>         echo "ERROR: unknown option $opt"
>         echo "Try '$0 --help' for more information"
> @@ -1570,7 +1575,7 @@ libdir="${libdir:-$prefix/lib}"
>   libexecdir="${libexecdir:-$prefix/libexec}"
>   includedir="${includedir:-$prefix/include}"
>   
> -if test "$mingw32" = "yes" ; then
> +if test "$mingw32" = "yes" && test "$mingw32_standalone" = "yes"; then
>       mandir="$prefix"
>       datadir="$prefix"
>       docdir="$prefix"
> @@ -1897,6 +1902,7 @@ disabled with --disable-FEATURE, default is enabled if available
>     libdaxctl       libdaxctl support
>     fuse            FUSE block device export
>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
> +  standalone-mingw  Build for standalone distribution on MinGW
>   
>   NOTE: The object files are built at the place where configure is launched
>   EOF

I think this should maybe be done independently from MinGW, so that it could 
be used on other systems, too. Thus maybe rather name the switch 
"--enable-standalone-distribution" or "--enable-standalone-installation" or 
something like this? On MinGW, the value of the switch could then default to 
"yes" while on other systems it would be "no" by default.

  Thomas


