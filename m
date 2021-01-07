Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7412ECCC6
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 10:30:09 +0100 (CET)
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxRcO-0006V5-96
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 04:30:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxRbe-0005xM-6K
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:29:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31151)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kxRba-0006MO-Ff
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 04:29:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610011756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ePiS5njrGQXJmP5U9dtCR81sH3mKJKWuWZGlsaqcKs=;
 b=gryn00eOUUw6/S3+sZvbCpbG2SrchWbniLXGzClb7YIu/eIJRqh7ab02Kz1te7K31j8pcZ
 NzqJebgka07qtDat9ZBGmfgrn67b4hneywqrkVteIUEOCVPlFzJ2mIyr3l/JUPqHueOECV
 Bnuu7EmSdGqNiK0e0iQXRhQnnYj7zA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-mPbEZdgNMzS0y2XHebMcxg-1; Thu, 07 Jan 2021 04:29:15 -0500
X-MC-Unique: mPbEZdgNMzS0y2XHebMcxg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8825E10766BD;
 Thu,  7 Jan 2021 09:29:13 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-114-16.ams2.redhat.com [10.36.114.16])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8541E60BF1;
 Thu,  7 Jan 2021 09:29:11 +0000 (UTC)
Subject: Re: [PATCH] tests/docker: Remove Debian 9 remnant lines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210107072933.3828450-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <eb1e395c-a7fb-c7fd-a670-ece13326412a@redhat.com>
Date: Thu, 7 Jan 2021 10:29:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210107072933.3828450-1-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/2021 08.29, Philippe Mathieu-Daudé wrote:
> Debian 9 base container has been removed in commits
> e3755276d1f and c9d78b06c06. Remove the last remnants.
> 
> Fixes: e3755276d1f ("tests/docker: Remove old Debian 9 containers")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   tests/docker/Makefile.include | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index c254ac38d0a..0779dab5b96 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -108,7 +108,6 @@ ifneq ($(HOST_ARCH),x86_64)
>   DOCKER_PARTIAL_IMAGES += debian-mips-cross debian-mipsel-cross debian-mips64el-cross
>   DOCKER_PARTIAL_IMAGES += debian-ppc64el-cross
>   DOCKER_PARTIAL_IMAGES += debian-s390x-cross
> -DOCKER_PARTIAL_IMAGES += debian-win32-cross debian-win64-cross
>   DOCKER_PARTIAL_IMAGES += fedora travis
>   endif
>   
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


