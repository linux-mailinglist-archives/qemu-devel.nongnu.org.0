Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D092A7D6D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 12:44:59 +0100 (CET)
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kadhK-0003rq-Ik
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 06:44:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kadg5-0002rl-4L
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:43:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kadg3-0005CS-CX
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 06:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604576618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qTZzZzWLn/FZdMkyI2nUrLhCYWz1MiQBlHlJNJTXJA=;
 b=ioQQN1/TRbJT3SlE7OZLEAsPMMXdlBjzYfKoHb3tJkvh0vP2aNZE4zTZM4HHedSlWUpBur
 AC5lra6MaY23nMK5/k7GA+HY28mlTBvhHRanSR9Ear4UziZvNDSKUXNUf3yXNd936DVCUs
 8zL6ynz0E/n2L5u8zITvo/2QR4k3ixk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-MtHgZaF2PwWO9fIG61tFYw-1; Thu, 05 Nov 2020 06:43:25 -0500
X-MC-Unique: MtHgZaF2PwWO9fIG61tFYw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAA7D100746B;
 Thu,  5 Nov 2020 11:43:23 +0000 (UTC)
Received: from dresden.str.redhat.com (ovpn-114-31.ams2.redhat.com
 [10.36.114.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BC476198D;
 Thu,  5 Nov 2020 11:43:22 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] block: enable libnfs on msys2/mingw in cirrus.yml
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20201013001545.1958-1-luoyonggang@gmail.com>
 <20201013001545.1958-3-luoyonggang@gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <2e501256-001e-a9c4-305c-f178d1b53137@redhat.com>
Date: Thu, 5 Nov 2020 12:43:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201013001545.1958-3-luoyonggang@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13.10.20 02:15, Yonggang Luo wrote:
> At the begging libnfs are not enabled because of compiling error,
> now it's fixed so enable it
> 
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>   .cirrus.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f42ccb956a..2c6bf45e6d 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -109,6 +109,7 @@ windows_msys2_task:
>             mingw-w64-x86_64-cyrus-sasl \
>             mingw-w64-x86_64-curl \
>             mingw-w64-x86_64-gnutls \
> +          mingw-w64-x86_64-libnfs \
>             "
>           bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND `
>             https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz `

I’d love to test this, unfortunately git.qemu.org has some issues now 
and so I can’t run Cirrus tests. :/

I suppose I’ll retry when git.qemu.org works again.

Max


