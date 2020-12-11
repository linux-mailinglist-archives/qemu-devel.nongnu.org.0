Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D84C2D700D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:16:31 +0100 (CET)
Received: from localhost ([::1]:41290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbjC-0001J6-Ek
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:16:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knbho-0000PL-5H
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:15:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knbhl-0005iH-S3
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607667301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uy31IL9OjQZEprkCpzQctCsXOjxuG4z1BPC22jBHWAU=;
 b=BCWtj2sWOQZFodvPMyYkeVtPTye++UAp8KES6qacbcCt4ocfeSbenHZFCEy889RnlDtEIp
 xUCPeLQQ+bM71oJkBLVeyO/C8Xw/GstfDmuaa/ll/dUToUpJay5vJlnint94OUlUv5rNdr
 KQOAmgfYMKRyTLz6Ohs0CrKK+Q4rQmY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-XDkqZRHWNUqX2HZJqWsr1Q-1; Fri, 11 Dec 2020 01:14:58 -0500
X-MC-Unique: XDkqZRHWNUqX2HZJqWsr1Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E7F7802B78;
 Fri, 11 Dec 2020 06:14:56 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE4505C8B8;
 Fri, 11 Dec 2020 06:14:42 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] gitlab: include aarch64-softmmu and ppc64-softmmu
 cross-system-build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7d8b898-8ede-5608-76e4-105d39331d41@redhat.com>
Date: Fri, 11 Dec 2020 07:14:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 20.04, Alex Bennée wrote:
> Otherwise we miss coverage of KVM support in the cross build. To
> balance it out add arm-softmmu (no kvm, subset of aarch64),
> cris-softmmu and ppc-softmmu to the exclude list which do get coverage
> elsewhere.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index bd6473a75a..fcc1b95290 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -7,9 +7,9 @@
>      - cd build
>      - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
>        ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
> -        --target-list-exclude="aarch64-softmmu i386-softmmu microblaze-softmmu
> -          mips-softmmu mipsel-softmmu mips64-softmmu ppc64-softmmu sh4-softmmu
> -          xtensa-softmmu"
> +        --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
> +          microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
> +          ppc-softmmu sh4-softmmu xtensa-softmmu"
>      - make -j$(expr $(nproc) + 1) all check-build

Reviewed-by: Thomas Huth <thuth@redhat.com>


