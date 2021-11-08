Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE51447C9B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 10:15:37 +0100 (CET)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk0ka-0003mH-O1
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 04:15:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0go-00089m-Oq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:11:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mk0gm-0005m0-9d
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 04:11:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636362699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F9yNjjDi7rRjtPx8Gbo3IVLmMifL63DyoQrZgst1zVI=;
 b=AEDSsCjbwl6JDzspDOKlUt0aPzlT27rdDJHV+UIje2Qqf2iZN+XPQXAkT4JHyff57qK9yi
 pVkEQukfH3YfsgVaKOaVUyRacmb/tkAi4con8cpL7s19PJkUC4nmxO9zZHdxt7gPnnz/15
 VkraFGlvVlxY5FiRLob26Xe2+hVURiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-S5gKkYTOOV6ZfkGIb12OfQ-1; Mon, 08 Nov 2021 04:11:38 -0500
X-MC-Unique: S5gKkYTOOV6ZfkGIb12OfQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 594C01006AA0
 for <qemu-devel@nongnu.org>; Mon,  8 Nov 2021 09:11:37 +0000 (UTC)
Received: from [10.39.192.185] (unknown [10.39.192.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5742E18432;
 Mon,  8 Nov 2021 09:11:34 +0000 (UTC)
Message-ID: <cad11e05-9a0a-fca4-08aa-a0ad31e13496@redhat.com>
Date: Mon, 8 Nov 2021 10:11:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/4] configure: propagate --extra-cflags and
 --extra-ldflags to meson compile tests
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211108084323.541961-1-pbonzini@redhat.com>
 <20211108084323.541961-4-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211108084323.541961-4-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> Meson (intentionally) does not add QEMU_CFLAGS to cc.compiles/cc.links
> tests, as they are supposed to be independent of the specific sets of
> compilation flags used to build the programs.  However, the user can
> still use CFLAGS or the toolchain file's LANG_args/LANG_link_args option
> to specify -I or -L options that apply to cc.compiles/cc.links as well.
> 
> This is also the intended use of configure's --extra-cflags,
> --extra-cxxflags and --extra-ldflags options.  For example, if
> one has netmap's header in a nonstandard directory, up to commit
> 837b84b1c078bf3e909 it used to work fine to do:
> 
> .../configure --enable-netmap \
>       --extra-cflags=-I/path/to/netmap/sys
> 
> but since the test was converted to meson, this does not work anymore.
> 
> Pass these options to meson via the toolchain file instead of via
> config-host.mak, since the toolchain file's variables have the
> same purpose as configure's --extra-*flags arguments.
> 
> Reported-by: Owen LaGarde
> Reported-by: Thomas Huth <thuth@redhat.com>
> Fixes: 47b30835e4 ("configure: consistently pass CFLAGS/CXXFLAGS/LDFLAGS to meson", 2020-10-06)
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 36 ++++++++++++++++++++----------------
>   1 file changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/configure b/configure
> index d268f59246..1ea26c67e5 100755
> --- a/configure
> +++ b/configure
> @@ -174,14 +174,14 @@ update_cxxflags() {
>   
>   compile_object() {
>     local_cflags="$1"
> -  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
> +  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -c -o $TMPO $TMPC
>   }
>   
>   compile_prog() {
>     local_cflags="$1"
>     local_ldflags="$2"
> -  do_cc $CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
> -      $LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
> +  do_cc $CFLAGS $EXTRA_CFLAGS $CONFIGURE_CFLAGS $QEMU_CFLAGS $local_cflags -o $TMPE $TMPC \
> +      $LDFLAGS $EXTRA_LDFLAGS $CONFIGURE_LDFLAGS $QEMU_LDFLAGS $local_ldflags
>   }
>   
>   # symbolically link $1 to $2.  Portable version of "ln -sf".
> @@ -286,6 +286,10 @@ for opt do
>     esac
>   done
>   
> +EXTRA_CFLAGS=""
> +EXTRA_CXXFLAGS=""
> +EXTRA_LDFLAGS=""
> +
>   xen_ctrl_version="$default_feature"
>   xfs="$default_feature"
>   membarrier="$default_feature"
> @@ -394,13 +398,13 @@ for opt do
>     ;;
>     --cpu=*) cpu="$optarg"
>     ;;
> -  --extra-cflags=*) QEMU_CFLAGS="$QEMU_CFLAGS $optarg"
> -                    QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
> +  --extra-cflags=*)
> +    EXTRA_CFLAGS="$EXTRA_CFLAGS $optarg"
> +    EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"

I'd rather drop that EXTRA_CXXFLAGS line here - I think that calls for 
trouble otherwise if a user is trying to add a C compiler option that is not 
supported in C++ mode.
If the users have some options that need to be passed to both, C and C++, 
they should simply use --extra-cxxflags in addition instead.

  Thomas

> +    ;;
> +  --extra-cxxflags=*) EXTRA_CXXFLAGS="$EXTRA_CXXFLAGS $optarg"
>     ;;
> -  --extra-cxxflags=*) QEMU_CXXFLAGS="$QEMU_CXXFLAGS $optarg"
> -  ;;
> -  --extra-ldflags=*) QEMU_LDFLAGS="$QEMU_LDFLAGS $optarg"
> -                     EXTRA_LDFLAGS="$optarg"
> +  --extra-ldflags=*) EXTRA_LDFLAGS="$EXTRA_LDFLAGS $optarg"
>     ;;
>     --enable-debug-info) debug_info="yes"
>     ;;


