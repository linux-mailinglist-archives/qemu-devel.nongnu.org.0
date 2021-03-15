Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 813AE33C5F0
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:43:17 +0100 (CET)
Received: from localhost ([::1]:41682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsBQ-0008QA-7y
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrt6-0002G4-6I
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:24:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lLrsx-0000Tx-Ve
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:24:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615832649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fup3eJyNzaXQlEvxHV1wSFhVClomuTLqDYcv8uHns+8=;
 b=VEPWAY06DHLS4+dAo03pBMivWoaDywxJTzzJM2b0FlrrfmMhpgZUhztxpEc2KpPR0fjCkR
 o+Kpti6jwa4rVX4w2CJWKT3KqW9SrWo2fx/IKylc4OYxNC/9t1AEPlj+SS4//x7b8tltNL
 Banzhd5vjXj5olLz2yOggOYy5Gmhu2E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-353-U2Mz6BG-NkGBVdKCe5vJUQ-1; Mon, 15 Mar 2021 14:24:06 -0400
X-MC-Unique: U2Mz6BG-NkGBVdKCe5vJUQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35E0019057A4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:24:05 +0000 (UTC)
Received: from [10.3.113.66] (ovpn-113-66.phx2.redhat.com [10.3.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E4C3B5D751;
 Mon, 15 Mar 2021 18:24:04 +0000 (UTC)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210315135410.221729-1-thuth@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [RFC PATCH] configure: Poison (almost) all target-specific
 #defines
Message-ID: <1a8dc3e5-0d8e-e52b-897d-69d0b2e28fd4@redhat.com>
Date: Mon, 15 Mar 2021 13:24:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315135410.221729-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 8:54 AM, Thomas Huth wrote:
> We are generating a lot of target-specific defines in the *-config-devices.h
> and *-config-target.h files. Using them in common code is wrong and leads
> to very subtle bugs since a "#ifdef CONFIG_SOMETHING" is not working there
> as expected. To avoid these issues, we are already poisoning some of the
> macros in include/exec/poison.h - but maintaining this list manually is
> cumbersome. Thus let's generate the list of poisoned macros automatically
> instead.
> Note that CONFIG_TCG (which is also defined in config-host.h) and
> CONFIG_USER_ONLY are special, so we have to filter these out.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  RFC since the shell stuff in "configure" is quite ugly ... maybe there's
>  a better way to do this via meson, but my meson-foo is still lacking...
> 

> +++ b/configure
> @@ -6441,6 +6441,11 @@ if test -n "${deprecated_features}"; then
>      echo "  features: ${deprecated_features}"
>  fi
>  
> +cat *-config-devices.h *-config-target.h | grep '^#define '  \
> +    | grep -v CONFIG_TCG | grep -v CONFIG_USER_ONLY \
> +    | sed -e 's/#define //' -e 's/ .*//' | sort -u \
> +    | sed -e 's/^/#pragma GCC poison /' > config-poison.h

Most times, a 'grep | sed' pipeline can be rewritten in pure sed.  In
this case:

cat *-config-devices.h *-config-target.h | \
  sed -n -e '/^#define / { s///; /CONFIG_TCG/d; /CONFIG_USER_ONLY/d;' \
         -e 's/ .*//; s/^/#pragma GCC poison /p; }' | \
  sort -u > config-poison.h

But as you say, doing it in meson might be even nicer (and that is also
beyond my meson-foo)

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


