Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89A62D7F54
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:28:05 +0100 (CET)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kno5E-0002Kx-Lu
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:28:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnRe-0003gA-JJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:47:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnRO-0001vU-4G
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:47:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607712413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/5S6cZfs6Ry41D4beaM8qPjLAhe4enifAH5CpTnvRM=;
 b=W77Sq+1aVJmDHeb6u3mV5I7p39m7kAbMH7vxdMUEsl3VZvGjqw/3V0yLEhWB0UMfrkxNpZ
 i3J6WmXpiXY7EJQJRDpA3r7iwHT8ih1ophFfa1BsI9t2KxlW1s9QsEb5SI9woJt/DDGQuH
 6psVc/oDZj3yHtDNQp/bbMX3u6sNTec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-Eko2SCedOV-jqYfJAZ5N4g-1; Fri, 11 Dec 2020 13:46:51 -0500
X-MC-Unique: Eko2SCedOV-jqYfJAZ5N4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E68B8030A0;
 Fri, 11 Dec 2020 18:46:49 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CCB85C8AA;
 Fri, 11 Dec 2020 18:46:38 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] configure: include moxie-softmmu in
 deprecated_targets_list
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-2-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <cfd97659-f7b9-3979-1527-b9d3dc465432@redhat.com>
Date: Fri, 11 Dec 2020 15:46:37 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-2-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/10/20 4:04 PM, Alex Bennée wrote:
> We still build it but there is no point including it in the normal
> builds as it is ushered out of the door.
>
> Fixes: 4258c8e221 ("docs/system/deprecated: Mark the 'moxie' CPU as deprecated")
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure      | 2 +-
>   .gitlab-ci.yml | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/configure b/configure
> index 18c26e0389..8f2095a2db 100755
> --- a/configure
> +++ b/configure
> @@ -1610,7 +1610,7 @@ if [ "$ARCH" = "unknown" ]; then
>   fi
>   
>   default_target_list=""
> -deprecated_targets_list=ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
> +deprecated_targets_list=moxie-softmmu,ppc64abi32-linux-user,tilegx-linux-user,lm32-softmmu,unicore32-softmmu
>   deprecated_features=""
>   mak_wilds=""
>   
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 98bff03b47..b3bcaacf7b 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -355,7 +355,7 @@ build-deprecated:
>       IMAGE: debian-all-test-cross
>       CONFIGURE_ARGS: --disable-docs --disable-tools
>       MAKE_CHECK_ARGS: build-tcg
> -    TARGETS: ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
> +    TARGETS: moxie-softmmu ppc64abi32-linux-user tilegx-linux-user lm32-softmmu
>         unicore32-softmmu
>     artifacts:
>       expire_in: 2 days


