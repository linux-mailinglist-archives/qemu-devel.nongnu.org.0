Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8802D7F78
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:38:25 +0100 (CET)
Received: from localhost ([::1]:33042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knoFD-0001Q9-T9
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:38:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnUg-0006T4-BA
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:50:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1knnUY-0002y5-D6
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 13:50:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607712609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pneDAKBPPY7tT/QfJzdsEbuvlh8jMDAk6jrkOjy3Np0=;
 b=ImbWG10izfxNcQKx9GIOLkDVyZdETW3lC3xLUZoUONFUmN5Ffj2BLB6FHGD8gjSo7zKQCM
 rxPYs4dU9Vg+UvYlAHtkmTMubkiyIzxBw9w13BPuF1FiCaTLN3C+eAkXgV6aP7dvLIKrFl
 Gbp6Jbsi3T/ih3wnHHAccAleuf4iPlQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-v9_H3RGQNoadvt9hrk2xsA-1; Fri, 11 Dec 2020 13:50:06 -0500
X-MC-Unique: v9_H3RGQNoadvt9hrk2xsA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43D31100D69E;
 Fri, 11 Dec 2020 18:49:55 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E96406F99D;
 Fri, 11 Dec 2020 18:49:43 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-3-alex.bennee@linaro.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <4be373ac-4193-2876-94a0-d1460eff2f63@redhat.com>
Date: Fri, 11 Dec 2020 15:49:42 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 stefanb@linux.vnet.ibm.com, richard.henderson@linaro.org, f4bug@amsat.org,
 cota@braap.org, stefanha@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/10/20 4:04 PM, Alex Bennée wrote:
> Otherwise we miss coverage of KVM support in the cross build. To
> balance it out add arm-softmmu (no kvm, subset of aarch64),
> cris-softmmu and ppc-softmmu to the exclude list which do get coverage
> elsewhere.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/crossbuilds.yml | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

>
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index bd6473a75a..fcc1b95290 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -7,9 +7,9 @@
>       - cd build
>       - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>         ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
> -        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
> -          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
> -          xtensa-softmmu"
> +        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
> +          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
> +          ppc-softmmu sh4-softmmu xtensa-softmmu"
>       - make -j$(expr $(nproc) + 1) all check-build
>   
>   # Job to cross-build specific accelerators.


