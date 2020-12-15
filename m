Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5232DB024
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:35:04 +0100 (CET)
Received: from localhost ([::1]:47662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCLv-0002Lq-Br
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:35:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kpCBs-0004bT-BN
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:24:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kpCBp-0002n1-5q
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:24:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608045876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tBLmXiJNPZf6vqRAMeJs2+gUQVFn/DapHkmZDk3cD9M=;
 b=PQqCHMWLw/ShOKRxSpXU9GBt3wxyF5Yo/TC3gu0O9hv4jBbrwND2amqZspLAT5EJT1T4uk
 evnC0XQvmvxNpDlMOUT2KVuEVR0CLhVZJcnT9Kf0IKC0iY/A47e5zS63TNPsg9wRy72gZy
 BSpH63g5dmimcPuOJlS5tcPWqfmxR2s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-5V9r-1TWMrqsUGXx82_BvQ-1; Tue, 15 Dec 2020 10:24:34 -0500
X-MC-Unique: 5V9r-1TWMrqsUGXx82_BvQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2AFF800D53;
 Tue, 15 Dec 2020 15:24:33 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-114-123.rdu2.redhat.com
 [10.10.114.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 152EB60873;
 Tue, 15 Dec 2020 15:24:31 +0000 (UTC)
Subject: Re: [PATCH] tests/docker: Remove the remainders of debian9 containers
 from the Makefile
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201215083318.92205-1-thuth@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <fd0541d2-2cc8-2abb-701f-079b55d227d9@redhat.com>
Date: Tue, 15 Dec 2020 12:24:30 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201215083318.92205-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 12/15/20 5:33 AM, Thomas Huth wrote:
> The Debian 9 containers have been removed a while ago, so we can
> delete the corresponding entries in the Makefile, too.
>
> Fixes: e3755276d1 ("tests/docker: Remove old Debian 9 containers")
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/docker/Makefile.include | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 02ec92830b..c254ac38d0 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -11,8 +11,7 @@ HOST_ARCH = $(if $(ARCH),$(ARCH),$(shell uname -m))
>   DOCKER_SUFFIX := .docker
>   DOCKER_FILES_DIR := $(SRC_PATH)/tests/docker/dockerfiles
>   # we don't run tests on intermediate images (used as base by another image)
> -DOCKER_PARTIAL_IMAGES := debian9 debian10 debian11
> -DOCKER_PARTIAL_IMAGES += debian9-mxe debian-bootstrap
> +DOCKER_PARTIAL_IMAGES := debian10 debian11 debian-bootstrap
>   DOCKER_IMAGES := $(sort $(notdir $(basename $(wildcard $(DOCKER_FILES_DIR)/*.docker))))
>   DOCKER_TARGETS := $(patsubst %,docker-image-%,$(DOCKER_IMAGES))
>   # Use a global constant ccache directory to speed up repetitive builds
> @@ -96,7 +95,6 @@ docker-binfmt-image-debian-%: $(DOCKER_FILES_DIR)/debian-bootstrap.docker
>   endif
>   
>   # Enforce dependencies for composite images
> -docker-image-debian9-mxe: docker-image-debian9
>   ifeq ($(HOST_ARCH),x86_64)
>   docker-image-debian-amd64: docker-image-debian10
>   DOCKER_PARTIAL_IMAGES += debian-amd64-cross
> @@ -104,8 +102,6 @@ else
>   docker-image-debian-amd64-cross: docker-image-debian10
>   DOCKER_PARTIAL_IMAGES += debian-amd64
>   endif
> -docker-image-debian-win32-cross: docker-image-debian9-mxe
> -docker-image-debian-win64-cross: docker-image-debian9-mxe
>   
>   # For non-x86 hosts not all cross-compilers have been packaged
>   ifneq ($(HOST_ARCH),x86_64)


