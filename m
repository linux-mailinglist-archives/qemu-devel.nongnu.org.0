Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A52A32998D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 11:23:56 +0100 (CET)
Received: from localhost ([::1]:42818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH2C2-0000H5-LU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 05:23:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lH2BI-0008Hc-AP
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:23:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lH2BF-0005qN-Hp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 05:23:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614680583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2F8uc0XVg4EnGqO/DtN9i8uCo3x30KV9SlWUsIEC4b8=;
 b=jRNlAYKDD+MclSYKPqVWutALHTVhBA6gUOGMdkYMirl+TGnxicaM7j/cmke27BdbAAxRSc
 AtROg0uykKUgL0Sy5OvuHWkH4kIb+SWMksrLxpNwl5phYJy0RTIV0ZG2H8WqusZa0tcv4r
 vK0+QuB+nic1ciRchzyLSqGEGb5c314=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-05yH86EnMKaSObFZ1sLuyg-1; Tue, 02 Mar 2021 05:23:00 -0500
X-MC-Unique: 05yH86EnMKaSObFZ1sLuyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 758ED801983;
 Tue,  2 Mar 2021 10:22:59 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75C2F5D9E2;
 Tue,  2 Mar 2021 10:22:58 +0000 (UTC)
Subject: Re: [PATCH] meson: add tests option
To: Romain Naour <romain.naour@gmail.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20210226220715.3103110-1-romain.naour@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eabd866e-71c5-3ac3-7688-0318fc758f94@redhat.com>
Date: Tue, 2 Mar 2021 11:22:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226220715.3103110-1-romain.naour@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/02/2021 23.07, Romain Naour wrote:
> tests/fp/fp-bench.c use fenv.h that is not always provided
> by the libc (uClibc).

For such  problem it might be better to check for the availability of the 
header and then to only disable the single test that depends on it if the 
header is not available.

Anyway, a switch to disable the tests completely could still be handy in 
some cases, so FWIW:

Acked-by: Thomas Huth <thuth@redhat.com>

> To workaround this issue, add an new meson option to
> disable tests while building Qemu.
> 
> Fixes:
> http://autobuild.buildroot.net/results/53f5d8baa994d599b9da013ee643b82353366ec3/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>   configure         | 7 +++++++
>   meson.build       | 6 +++++-
>   meson_options.txt | 3 +++
>   3 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index a79b3746d4..cd114f4b9e 100755
> --- a/configure
> +++ b/configure
> @@ -464,6 +464,7 @@ gettext="auto"
>   fuse="auto"
>   fuse_lseek="auto"
>   multiprocess="no"
> +tests="auto"
>   
>   malloc_trim="auto"
>   
> @@ -1562,6 +1563,10 @@ for opt do
>     ;;
>     --disable-multiprocess) multiprocess="no"
>     ;;
> +  --disable-tests) tests="disabled"
> +  ;;
> +  --enable-tests) tests="enabled"
> +  ;;
>     *)
>         echo "ERROR: unknown option $opt"
>         echo "Try '$0 --help' for more information"
> @@ -1915,6 +1920,7 @@ disabled with --disable-FEATURE, default is enabled if available
>     fuse            FUSE block device export
>     fuse-lseek      SEEK_HOLE/SEEK_DATA support for FUSE exports
>     multiprocess    Multiprocess QEMU support
> +  tests           build tests
>   
>   NOTE: The object files are built at the place where configure is launched
>   EOF
> @@ -6428,6 +6434,7 @@ NINJA=$ninja $meson setup \
>           -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi \
>           $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
>   	-Dtcg_interpreter=$tcg_interpreter \
> +        -Dtests=$tests \
>           $cross_arg \
>           "$PWD" "$source_path"
>   
> diff --git a/meson.build b/meson.build
> index 05a67c20d9..2d7cbc0fbd 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2341,7 +2341,11 @@ subdir('scripts')
>   subdir('tools')
>   subdir('pc-bios')
>   subdir('docs')
> -subdir('tests')
> +
> +if get_option('tests').enabled()
> +  subdir('tests')
> +endif
> +
>   if gtk.found()
>     subdir('po')
>   endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 675a9c500a..be30ad5450 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -114,6 +114,9 @@ option('virtfs', type: 'feature', value: 'auto',
>   option('virtiofsd', type: 'feature', value: 'auto',
>          description: 'build virtiofs daemon (virtiofsd)')
>   
> +option('tests', type : 'feature', value : 'auto',
> +       description: 'Tests build support')
> +
>   option('capstone', type: 'combo', value: 'auto',
>          choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
>          description: 'Whether and how to find the capstone library')
> 


