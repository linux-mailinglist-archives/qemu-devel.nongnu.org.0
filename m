Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8D29D22C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 21:58:14 +0100 (CET)
Received: from localhost ([::1]:43364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXsWL-0007XM-FT
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 16:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXsUx-0006xB-PF
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 16:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kXsUs-0004bt-Ny
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 16:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603918600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nbju9wvpFHvGtSNtcdQyfREsNeYR0h+o55WEJg+slig=;
 b=iHXNkR9mtHWyY/ktqCrQYFZNywG6Tsk7X4GJugouAGKbtI9eYXxRnkmyH9zrEVOWhqBMev
 w1Lif5wijAGa+q17zq8GebonNBLKes7eo8RWPZq0U2Y4Z1b+LS5ARFSgIwU9DYwHTrGDMe
 nUKR0ejT6Df51rxqZVZfDs3Tzw1ToAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-6Q1x66ohNWa6T1suw-VYKw-1; Wed, 28 Oct 2020 16:56:33 -0400
X-MC-Unique: 6Q1x66ohNWa6T1suw-VYKw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F0FB1007464;
 Wed, 28 Oct 2020 20:56:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-124.ams2.redhat.com [10.36.112.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B6CAA5C1D0;
 Wed, 28 Oct 2020 20:56:31 +0000 (UTC)
Subject: Re: [PATCH] MAINTAINERS: update my email address
To: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20201027060253.353054-1-michael.roth@amd.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eea1f171-5e62-f241-be13-53c44fc4987f@redhat.com>
Date: Wed, 28 Oct 2020 21:56:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20201027060253.353054-1-michael.roth@amd.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:51:10
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 27/10/2020 07.02, Michael Roth wrote:
> I've recently switched employers and the current email address is out
> of date.
> 
> Signed-off-by: Michael Roth <michael.roth@amd.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ef6f5c7399..c72af7c2f5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2395,7 +2395,7 @@ F: scripts/simplebench/
>  
>  QAPI
>  M: Markus Armbruster <armbru@redhat.com>
> -M: Michael Roth <mdroth@linux.vnet.ibm.com>
> +M: Michael Roth <michael.roth@amd.com>
>  S: Supported
>  F: qapi/
>  X: qapi/*.json
> @@ -2439,7 +2439,7 @@ F: tests/data/qobject/qdict.txt
>  T: git https://repo.or.cz/qemu/armbru.git qapi-next
>  
>  QEMU Guest Agent
> -M: Michael Roth <mdroth@linux.vnet.ibm.com>
> +M: Michael Roth <michael.roth@amd.com>
>  S: Maintained
>  F: qga/
>  F: docs/interop/qemu-ga.rst
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


