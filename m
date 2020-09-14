Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F024D269572
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 21:18:41 +0200 (CEST)
Received: from localhost ([::1]:38176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHtzt-00088Y-2M
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 15:18:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHtyd-0006vJ-3B
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 15:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kHtyb-0004Zy-80
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 15:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600111040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q0xYGmOZ8NQh/Lz8+ujlazBqg3OHt4dx5AP/gBYC12w=;
 b=ihb5G6bhmzQ+8YmlQpRQ6WLwWB+EPlHckMJ8YKJbUX0gVnDR+B8qrg5cR9BVcvuTTPq5fO
 JBeUW+C3mWODz6CD6x9NZz0hAgsZEMV80amWgE2Gjq+rcC3yVgjZu9TxknfUpKobIG2Px/
 gjOY8INt3Kr8JGsSm/cr8XIbPS1wBC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-BGMS26tfMbCecsR7Y12Kug-1; Mon, 14 Sep 2020 15:17:15 -0400
X-MC-Unique: BGMS26tfMbCecsR7Y12Kug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDFE31006700;
 Mon, 14 Sep 2020 19:17:14 +0000 (UTC)
Received: from [10.3.113.68] (ovpn-113-68.phx2.redhat.com [10.3.113.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 480F027BC5;
 Mon, 14 Sep 2020 19:17:11 +0000 (UTC)
Subject: Re: [PATCH 1/3] configure: quote command line arguments in
 config.status
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200913100534.22084-1-pbonzini@redhat.com>
 <20200913100534.22084-2-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <2be1eaef-a823-5b0e-47a6-783c7e1aacb0@redhat.com>
Date: Mon, 14 Sep 2020 14:17:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200913100534.22084-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 15:10:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: marcandre.lureau@redhat.com, berrange@redhat.com, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/13/20 5:05 AM, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 53723ace57..beae010e39 100755
> --- a/configure
> +++ b/configure
> @@ -89,6 +89,10 @@ printf " '%s'" "$0" "$@" >> config.log
>   echo >> config.log
>   echo "#" >> config.log
>   
> +quote_sh() {
> +    printf "'%s'" "$(echo "$1" | sed "s,','\\',")"

This is unsafe if $1 starts with - or contains \.  Better is using 
printf.  It also eats any trailing newlines in $1, although that may be 
less of a concern.

> +}
> +
>   print_error() {
>       (echo
>       echo "ERROR: $1"
> @@ -8061,7 +8065,7 @@ preserve_env WINDRES
>   
>   printf "exec" >>config.status
>   for i in "$0" "$@"; do
> -  test "$i" = --skip-meson || printf " '%s'" "$i" >>config.status
> +  test "$i" = --skip-meson || printf " %s" "$(quote_sh $i)" >>config.status

And this unquoted use of $i is wrong.

>   done
>   echo ' "$@"' >>config.status
>   chmod +x config.status
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


