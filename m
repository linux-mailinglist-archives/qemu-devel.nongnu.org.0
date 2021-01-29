Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FBF308A13
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 16:51:01 +0100 (CET)
Received: from localhost ([::1]:59828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5W33-0004vg-0g
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 10:51:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5W1l-0004Vd-CC
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:49:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l5W1j-0003xY-Lp
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 10:49:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611935379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VWXPkVSclrrISBKpX4euqltsFgcnW8S98YBJU1uO3Mg=;
 b=U3JUtIXpQDsSEbMFpV+HC+AfjqUQ83Gg1eBTfEpGc9iYORVQwyI8wjO4OoWeZ39xhRlz10
 hLoEjL9NPU295k+ICmM7xYxKzJWBqklwuMsQX1Mf0dKgDIFh9Ob2A3JQ5ABFV1KSjKk2Gu
 LDlqysESySOZudbA5d22+qu35drkD7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-Tj8G9c_FN6ejvB8O3JGIUg-1; Fri, 29 Jan 2021 10:49:35 -0500
X-MC-Unique: Tj8G9c_FN6ejvB8O3JGIUg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1861C180A098;
 Fri, 29 Jan 2021 15:49:34 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-110.ams2.redhat.com [10.36.112.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CE7F60CC5;
 Fri, 29 Jan 2021 15:49:32 +0000 (UTC)
Subject: Re: [PATCH v2 5/8] tests/docker: alias docker-help target for
 consistency
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210122181854.23105-1-alex.bennee@linaro.org>
 <20210122181854.23105-6-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <6dad8429-472b-b5c0-3280-8a9f53455f86@redhat.com>
Date: Fri, 29 Jan 2021 16:49:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122181854.23105-6-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
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
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 19.18, Alex Bennée wrote:
> We have a bunch of -help targets so this will save some cognitive
> dissonance. Keep the original for those with muscle memory.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/Makefile.include | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index bdc53ddfcf..a5c1e4a615 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -1,6 +1,6 @@
>   # Makefile for Docker tests
>   
> -.PHONY: docker docker-test docker-clean docker-image docker-qemu-src
> +.PHONY: docker docker-help docker-test docker-clean docker-image docker-qemu-src
>   
>   NULL :=
>   SPACE := $(NULL) #
> @@ -218,6 +218,8 @@ endif
>   	@echo '                         Specify which container engine to run.'
>   	@echo '    REGISTRY=url         Cache builds from registry (default:$(DOCKER_REGISTRY))'
>   
> +docker-help: docker
> +
>   # This rule if for directly running against an arbitrary docker target.
>   # It is called by the expanded docker targets (e.g. make
>   # docker-test-foo@bar) which will do additional verification.
> 

Do you also want to rename it in the main Makefile:

  $(call print-help,docker,Help about targets running tests inside containers)

?

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>


