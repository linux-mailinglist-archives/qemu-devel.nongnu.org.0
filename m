Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4310630F7EC
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 17:31:46 +0100 (CET)
Received: from localhost ([::1]:39792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7hXk-0005dh-Mi
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 11:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7h5e-0001DR-Di
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:02:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l7h5Z-0003w1-P5
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:02:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612454555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z8Ir0mpnwtV9EsLi7olepo9AAPQtsvkCG8tl4/eMszw=;
 b=JFRLc2IKy0bFNYgGPk2bjICRoDSPzHDOI6AYKSTVov8Fjo8G5Bl5EirSb9T4AzfbLG6h0H
 qHh78dU/rawT3Z0BXZ4Mvc0l6SIy3ZNRvplqLN829DvpqpcNCsbjeW/jyTL5m8UuajHWFp
 5EUlR1KMbSbOhDA4jXwXMkD0r8BVhOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-iWB7xs_KPgeO4faEFj6T-w-1; Thu, 04 Feb 2021 11:02:31 -0500
X-MC-Unique: iWB7xs_KPgeO4faEFj6T-w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5144B801960;
 Thu,  4 Feb 2021 16:02:28 +0000 (UTC)
Received: from [10.3.112.103] (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F135C541;
 Thu,  4 Feb 2021 16:02:27 +0000 (UTC)
To: Doug Evans <dje@google.com>, qemu-devel@nongnu.org
References: <20210203233539.1990032-1-dje@google.com>
 <20210203233539.1990032-2-dje@google.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v3 1/3] slirp: Placeholder for libslirp ipv6 hostfwd
 support
Message-ID: <93a6cf6b-bb53-7b05-20a7-f2976c093f0e@redhat.com>
Date: Thu, 4 Feb 2021 10:02:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210203233539.1990032-2-dje@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 5:35 PM, dje--- via wrote:
> This commit is intended to only contain the slirp submodule change
> that adds ipv6 hostfwd support.


Missing your signed-off-by, and as written, your authorship would be
based on the From: dje--- via <qemu-devel@nongnu.org> header (that looks
like our mailing list rewrote things due to SPF policies, but that it
botched your name in the process), rather than your Reply-to: Doug Evans
<dje@google.com> header.  To fix the latter, you can convince git to
include a From: line in the first line of the body that will override
whatever is in the headers even after mailing list rewrites.

> ---
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/slirp b/slirp
> index 8f43a99191..358c0827d4 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


