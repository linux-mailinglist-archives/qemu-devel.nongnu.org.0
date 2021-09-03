Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A372E40040A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:22:47 +0200 (CEST)
Received: from localhost ([::1]:56038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCtq-0008VT-NQ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:22:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCrU-0005gX-2j
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:20:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mMCrS-0004L7-H9
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:20:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630689617;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IyVcbt2DLjjnm8f2DP3MXgG6g41ne9VWIH1CMxdRyM4=;
 b=csP2Iry9S0e6gsIo7z0Zdibh3BJ3ZilxR8Th+mOrFuMz8jBqU3Ha7dvS58hQiS8lAlOFOu
 va0sKrEVMqth+UKDOCfNg6XqNf43pVmX0IpaFmRElOq4f4uDuQ1OKvTqwY1sR2uMaXWo1K
 fx6P/Q0zj6oQ0VyAF+oWdj/vanCJ8a0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-Epd5Tjk8PbWMn3T0pRGi0g-1; Fri, 03 Sep 2021 13:20:16 -0400
X-MC-Unique: Epd5Tjk8PbWMn3T0pRGi0g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2968814315
 for <qemu-devel@nongnu.org>; Fri,  3 Sep 2021 17:20:15 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CABCE10013D7;
 Fri,  3 Sep 2021 17:20:07 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:20:06 -0500
From: Eric Blake <eblake@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 4/5] configure: Get help text from meson_options.txt
Message-ID: <20210903172006.wnxgkdlasainghtl@redhat.com>
References: <20210903081358.956267-1-thuth@redhat.com>
 <20210903081358.956267-5-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903081358.956267-5-thuth@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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

On Fri, Sep 03, 2021 at 10:13:57AM +0200, Thomas Huth wrote:
> It's cumbersome to maintain the option help texts twice, once in the
> "configure" script and once in meson_options.txt. So let's add some logic to
> the configure script to read most of the help texts from meson_options.txt.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  configure | 95 ++++++++++++++++++-------------------------------------
>  1 file changed, 31 insertions(+), 64 deletions(-)
> 

> +
> +# Read remaining options and help text from meson_options.txt:
> +current_feature=""
> +while read first rest ; do
> +    case "$first" in
> +    option*)
> +        case "$rest" in
> +        *type*:*"'feature'"*)
> +            current_feature=${first%\'*}
> +            current_feature=${current_feature#*\'}
> +        ;;
> +        *)
> +            current_feature=""
> +        ;;
> +        esac
> +    ;;
> +    description:)
> +        if [ -n "$current_feature" ]; then
> +            rest=${rest%\'*}
> +            printf "  %-15s %s\n" "$current_feature" "${rest#\'}"
> +        fi
> +    ;;
> +    *)
> +        current_feature=""
> +    ;;
> +    esac
> +done < "$source_path/meson_options.txt" | sort

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


