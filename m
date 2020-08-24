Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C925018A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Aug 2020 17:56:59 +0200 (CEST)
Received: from localhost ([::1]:56410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAEqA-00071B-NP
	for lists+qemu-devel@lfdr.de; Mon, 24 Aug 2020 11:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kAEp4-0006DS-Iz
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:55:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:60452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kAEp2-0000He-NK
 for qemu-devel@nongnu.org; Mon, 24 Aug 2020 11:55:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598284547;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJEn5DTX3cHPdVC+AClq1vNLSDsLMDOs4NSSgbIJwNg=;
 b=VeWvLvzxuCcnmN6FBim4GWN0ABLDc2vYqv8hEM9RpuHqc7Wry/tuML8UQnFv+C9p3kX8f9
 3/EC4OQhEfb4p8Jd82Axd5mdV53i5PO0H29QiwyDyg7GjWcKHvIiiIUVkx/+5FZr4iedEe
 2+gQA9hXByLEjWng0L33BWbDbcEiMZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-IFePE3hWOsiVyn1A6pAmAg-1; Mon, 24 Aug 2020 11:55:44 -0400
X-MC-Unique: IFePE3hWOsiVyn1A6pAmAg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61F57425CD;
 Mon, 24 Aug 2020 15:55:43 +0000 (UTC)
Received: from [10.3.112.126] (ovpn-112-126.phx2.redhat.com [10.3.112.126])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 111BA50B44;
 Mon, 24 Aug 2020 15:55:42 +0000 (UTC)
Subject: Re: [PATCH] meson: Fix shell script syntax in qemu-version.sh
To: Bruce Rogers <brogers@suse.com>, qemu-devel@nongnu.org
References: <20200824155111.789466-1-brogers@suse.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <bdf0d7f1-f48f-3a78-8c97-78b995ee780a@redhat.com>
Date: Mon, 24 Aug 2020 10:55:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200824155111.789466-1-brogers@suse.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/24 05:21:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.956,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/20 10:51 AM, Bruce Rogers wrote:
> There needs to be a space before the closing bracket.
> 
> Signed-off-by: Bruce Rogers <brogers@suse.com>
> ---
>   scripts/qemu-version.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Duplicate of 
https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg05549.html

> 
> diff --git a/scripts/qemu-version.sh b/scripts/qemu-version.sh
> index 4847385e42..03128c56a2 100755
> --- a/scripts/qemu-version.sh
> +++ b/scripts/qemu-version.sh
> @@ -6,7 +6,7 @@ dir="$1"
>   pkgversion="$2"
>   version="$3"
>   
> -if [ -z "$pkgversion"]; then
> +if [ -z "$pkgversion" ]; then
>       cd "$dir"
>       if [ -e .git ]; then
>           pkgversion=$(git describe --match 'v*' --dirty | echo "")
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


