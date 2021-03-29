Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFD334CF37
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:41:00 +0200 (CEST)
Received: from localhost ([::1]:53358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQqGQ-00066w-Rh
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQqCn-0005LF-7V
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33296)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQqCk-0007nb-LF
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:37:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617017829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYYZA4wHQFdVBq2Cr+U0MUJXcxGbxD4dFo+Q0alCaFo=;
 b=SfZcyf8SoaA5FP1RX287ZfFvytlw27OB0Nz9ePXk766KWMBu/bCy2p44Cu3v4USX45s9PF
 s8+wfWE2HA1KgcS4yLmwWgD26Wk5/LfVYtt/J4QmlUaGM6S/EZwA4eG45HOuEFer0WdS5S
 10maoc39ZW1MpYEWwaQB3EYoyQRD8v4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-X64RlU94NE6CMAymYp27jg-1; Mon, 29 Mar 2021 07:37:07 -0400
X-MC-Unique: X64RlU94NE6CMAymYp27jg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44E07501FE;
 Mon, 29 Mar 2021 11:37:06 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C55E619D9F;
 Mon, 29 Mar 2021 11:36:56 +0000 (UTC)
Subject: Re: [PATCH v1 2/6] tests/docker: don't set DOCKER_REGISTRY on
 non-x86_64
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210329110303.15235-1-alex.bennee@linaro.org>
 <20210329110303.15235-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f0e56d71-6bfb-5890-2167-2285434187aa@redhat.com>
Date: Mon, 29 Mar 2021 13:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210329110303.15235-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/03/2021 13.02, Alex Bennée wrote:
> Currently our gitlab registry is x86_64 only so attempting to pull an
> image from it on something else will end in tears.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 7cab761bf5..9f464cb92c 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -16,7 +16,10 @@ DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.doc
>   DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>   # Use a global constant ccache directory to speed up repetitive builds
>   DOCKER_CCACHE_DIR := $$HOME/.cache/qemu-docker-ccache
> -DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),registry.gitlab.com/qemu-project/qemu)
> +ifeq ($(HOST_ARCH),x86_64)
> +DOCKER_DEFAULT_REGISTRY := registry.gitlab.com/qemu-project/qemu
> +endif
> +DOCKER_REGISTRY := $(if $(REGISTRY),$(REGISTRY),$(DOCKER_DEFAULT_REGISTRY))

Reviewed-by: Thomas Huth <thuth@redhat.com>


