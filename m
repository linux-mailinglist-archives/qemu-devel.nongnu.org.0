Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A94D3FB905
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 17:32:42 +0200 (CEST)
Received: from localhost ([::1]:39572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKjH7-0002vP-1C
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 11:32:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjF8-0001gC-58
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:30:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mKjF4-0001Mv-LE
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 11:30:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630337432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nuzGt9ls6e4tsTKYZBoADgx+8XqPfYVFq5QDYfjVs4E=;
 b=AtSXkLS/3BYrSuyy23Abo8fEvSt0kspiEIAbruprncgjuPSnXs+ffoy7iVlyLwhTRCuOlm
 /0yhKxAae2WQxKmdnfpphlpZh9Bzbl8wp1DFAsoG5/n4YlGyypA8j38gaZLdeP0AWwL4XI
 KVDsFOdu+uWYqvFR4oxRC4cYkPo3otQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-EVSybloZMc-mfThqm1-BfA-1; Mon, 30 Aug 2021 11:30:29 -0400
X-MC-Unique: EVSybloZMc-mfThqm1-BfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98B1802929
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 15:30:28 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 81A2E2C011;
 Mon, 30 Aug 2021 15:30:24 +0000 (UTC)
Date: Mon, 30 Aug 2021 10:30:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 3/3] configure: Get help text from meson_options.txt
Message-ID: <20210830153022.3yywyrpynoiss6nr@redhat.com>
References: <20210829173210.39562-1-thuth@redhat.com>
 <20210829173210.39562-4-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210829173210.39562-4-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Aug 29, 2021 at 07:32:10PM +0200, Thomas Huth wrote:
> It's cumbersome to maintain the option help texts twice, once in the
> "configure" script and once in meson_options.txt. So let's add some logic to
> the configure script to read most of the help texts from meson_options.txt.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 89 ++++++++++++++++---------------------------------------
>  1 file changed, 25 insertions(+), 64 deletions(-)
> 
> diff --git a/configure b/configure
> index cb125c3f84..8446b7b3ea 100755
> --- a/configure
> +++ b/configure

> +
> +current_feature=""
> +current_desc=""

current_desc is unused below.

> +while read word1 word2 ; do

A bit misleading in the variable names.  As a sample, you are parsing:

option('malloc_trim', type : 'feature', value : 'auto',
       description: 'enable libc malloc_trim() for memory optimization')

which read then splits into:

word1="option('malloc_trim'," word2="type : 'feature', value : 'auto',"
or
word1="description:" word2="'enable libc malloc_trim() for memory optimization')"

Better might be the names $first and $rest.  You could also play with
$IFS for more precise splitting, but your hack is good enough for the
current usage.

> +   case "$word1" in
> +   option*)
> +       if echo "$word2" | grep -q "type[ ]*: 'feature'"; then

Unlike my complaint in patch 1 about using echo on user-supplied text,
here you are using it on test in meson_options.txt which is presumably
not going to contain \ or leading -.

> +           current_feature=$(echo $word1 | sed -e "s/option('//" -e "s/',.*$//")
> +       else
> +           current_feature=""
> +       fi

If desired, you can save some fork()ing by doing:

case "$word2" in *type*:*"'feature'")
    current_feature=${word1%\'*}
    current_feature=${current_feature#*\'}
  *) current_feature=""
esac

> +   ;;
> +   description:)
> +       if [ -n "$current_feature" ]; then
> +           printf "  %-15s %s\n" "$current_feature" \
> +                  "$(echo "$word2" | sed -e "s/^'//" -e "s/'.*$//")"

Similarly,

if [ "$current_feature" ]; then
  word2=${word2%\'*}
  printf "  %-15s %s\n" "$current_feature" "${word2#\'}"
fi

> +           current_feature=""
> +       fi
> +   ;;
> +   esac

Missing a *) catchall case (probably a good idea to reset
current_feature back to "" on lines that don't match the two forms you
care about).

> +done < $source_path/meson_options.txt | sort
> +
> +echo
> +echo "NOTE: The object files are built at the place where configure is launched"
> +
>  exit 0
>  fi
>  
> -- 
> 2.27.0
> 
>

Overall pretty clever.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


