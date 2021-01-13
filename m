Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B002F4F20
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 16:49:04 +0100 (CET)
Received: from localhost ([::1]:53526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kziON-0008Sn-D8
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 10:49:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kziKc-0006Ed-F6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:45:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kziKa-0005jT-Dj
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 10:45:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610552707;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MjKsV9c2RNWdY4+Ev9u1Os7vQG1VqGWpqg1vMoaUzZA=;
 b=eD3wiHKbRjuJcJsDPlatvkCBgSprLfpmUkYidKwOH9WDHid1h3kp2z5PSKweXaMIIJKIWC
 l5PWuYrLsGCRhTXxwtL/vwVRoZZUK4FoexnFdN5nrPL/mZU8awLOxU3gUc0WTMiej4DGIL
 FCl4mJ8PtRAhHFXsfCk/22HxieCL6eQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-qCxigXKyPK2MLaE6fLCHFg-1; Wed, 13 Jan 2021 10:45:03 -0500
X-MC-Unique: qCxigXKyPK2MLaE6fLCHFg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C55E107ACF7;
 Wed, 13 Jan 2021 15:45:02 +0000 (UTC)
Received: from [10.3.113.36] (ovpn-113-36.phx2.redhat.com [10.3.113.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B4D06F976;
 Wed, 13 Jan 2021 15:44:56 +0000 (UTC)
Subject: Re: [PATCH 7/8] configure: quote command line arguments in
 config.status
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-8-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <e74351a2-3609-53ef-c2c6-efea6be4cc75@redhat.com>
Date: Wed, 13 Jan 2021 09:44:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107140039.467969-8-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, berrange@redhat.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 8:00 AM, Paolo Bonzini wrote:
> Make config.status generation a bit more robust.  (The quote_sh
> function will also be reused to parse configure's command line
> arguments in an external script driven by Meson build option
> introspection).
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  configure | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index d573058b16..41866cc38e 100755
> --- a/configure
> +++ b/configure
> @@ -89,6 +89,10 @@ printf " '%s'" "$0" "$@" >> config.log
>  echo >> config.log
>  echo "#" >> config.log
>  
> +quote_sh() {
> +    printf "%s" "$1" | sed "s,','\\\\'',g; s,.*,'&',"
> +}

printf %s does not append a newline, but POSIX does not require sed to
behave sanely when its input does not end in a newline.

But unless we hit a case where someone is actually using a sed that
complains, this works for me.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


