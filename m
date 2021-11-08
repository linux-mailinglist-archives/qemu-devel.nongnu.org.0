Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BBB447CA9
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:20:00 +0100 (CET)
Received: from localhost ([::1]:53410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0oo-0000kg-QM
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:19:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0mE-0007NX-Mz
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:17:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58186)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0m8-000125-N6
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:17:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636363027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T6YR2vnWvvmxZ04z8QueECqXoO509J9NoOPYWuQ4O+Q=;
 b=DMfxz6EHj0R6Lur6iioclHHGmIZCAQfPtUDjo4OWCt4GHZ2GwJ6vIRnT2rj7nDApjy1A2x
 oEq8Z6s/h1yoQ2MpT0ct8ndbADiUxm7jK8QNU1LIhrhIwU2nbQzL4C1s50PIkU+DIr0Ly2
 aXis1YMMLohCX8ulKyPavRZ0fMa1g/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-3-xkLYLKMhSWsVQBVnZ6gA-1; Mon, 08 Nov 2021 04:17:06 -0500
X-MC-Unique: 3-xkLYLKMhSWsVQBVnZ6gA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84C9615722
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 09:17:05 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE8460657;
 Mon,  8 Nov 2021 09:17:04 +0000 (UTC)
Message-ID: <6bfad248-7a61-f8c5-0bb7-f2cede1646f4@redhat.com>
Date: Mon, 8 Nov 2021 10:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/4] configure: ignore preexisting QEMU_*FLAGS envvars
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-5-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211108084323.541961-5-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/11/2021 09.43, Paolo Bonzini wrote:
> User flags should be passed via CFLAGS/CXXFLAGS/LDFLAGS,
> or --extra-cflags/extra-cxxflags/--extra-ldflags on the
> command line.
> 
> QEMU_CFLAGS, QEMU_CXXFLAGS and QEMU_LDFLAGS are reserved
> for flags detected by configure, so do not add to them
> and clear them at the beginning of the script.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index 1ea26c67e5..2048a52b20 100755
> --- a/configure
> +++ b/configure
> @@ -158,7 +158,7 @@ update_cxxflags() {
>       # Set QEMU_CXXFLAGS from QEMU_CFLAGS by filtering out those
>       # options which some versions of GCC's C++ compiler complain about
>       # because they only make sense for C programs.
> -    QEMU_CXXFLAGS="$QEMU_CXXFLAGS -D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
> +    QEMU_CXXFLAGS="-D__STDC_LIMIT_MACROS -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS"
>       CONFIGURE_CXXFLAGS=$(echo "$CONFIGURE_CFLAGS" | sed s/-std=gnu11/-std=gnu++11/)
>       for arg in $QEMU_CFLAGS; do
>           case $arg in
> @@ -465,11 +465,13 @@ sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
>   # left shift of signed integers is well defined and has the expected
>   # 2s-complement style results. (Both clang and gcc agree that it
>   # provides these semantics.)
> -QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv $QEMU_CFLAGS"
> +QEMU_CFLAGS="-fno-strict-aliasing -fno-common -fwrapv"
>   QEMU_CFLAGS="-Wundef -Wwrite-strings -Wmissing-prototypes $QEMU_CFLAGS"
>   QEMU_CFLAGS="-Wstrict-prototypes -Wredundant-decls $QEMU_CFLAGS"
>   QEMU_CFLAGS="-D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE $QEMU_CFLAGS"
>   
> +QEMU_LDFLAGS=
> +
>   # Flags that are needed during configure but later taken care of by Meson
>   CONFIGURE_CFLAGS="-std=gnu11 -Wall"
>   CONFIGURE_LDFLAGS=
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


