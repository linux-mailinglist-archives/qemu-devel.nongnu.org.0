Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FF7322D16
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 16:05:51 +0100 (CET)
Received: from localhost ([::1]:37654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEZG2-0006hp-Bj
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 10:05:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEZDd-00056q-NX
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEZDZ-0000sg-MU
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 10:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614092596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ot7EK6qi6+9Y2dz3IIaGdnIANt5HvsYrgr8JMTujJ5s=;
 b=D7FeF/do3FVQMiksRgDE8eKrsjg1JnXRMOkXr6VUBwZDjqwMwJF89u5n9qRlZhprYOiJ0p
 /rIUvBrEi2nxMRyQy+YqPIOVj2bD1CZ33ojuFvA4pqes3ZIoZoVYOSWLAahCf4lc0q3TrN
 CY45HZjTCuamdxsqkZRtTxo4V1PkBwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-546-aPWQIL1fPym4OApip5lO0Q-1; Tue, 23 Feb 2021 10:03:13 -0500
X-MC-Unique: aPWQIL1fPym4OApip5lO0Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26751006783;
 Tue, 23 Feb 2021 15:03:11 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7A7A39A66;
 Tue, 23 Feb 2021 15:03:05 +0000 (UTC)
Subject: Re: [PATCH 1/2] gitlab-ci.yml: Allow custom make parallelism
To: Daniele Buono <dbuono@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20210222230106.7030-1-dbuono@linux.vnet.ibm.com>
 <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <bff68508-d78b-b771-e3fb-26fc6c2c00a1@redhat.com>
Date: Tue, 23 Feb 2021 12:03:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222230106.7030-2-dbuono@linux.vnet.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/22/21 8:01 PM, Daniele Buono wrote:
> Currently, make parallelism at build time is defined as #cpus+1.
> Some build jobs may need (or benefit from) a different number.
>
> An example is builds with LTO where, because of the huge demand
> of memory at link time, gitlab runners fails if two linkers are
> run concurrently
>
> This patch retains the default value of #cpus+1 but allows setting
> the "JOBS" variable to a different number when applying the template
>
> Signed-off-by: Daniele Buono <dbuono@linux.vnet.ibm.com>
> ---
>   .gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 8b6d495288..5c198f05d4 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -17,7 +17,7 @@ include:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
>     before_script:
> -    - JOBS=$(expr $(nproc) + 1)
> +    - JOBS=${JOBS:-$(expr $(nproc) + 1)}
>     script:
>       - mkdir build
>       - cd build


