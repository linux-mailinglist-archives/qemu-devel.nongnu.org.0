Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7862D701A
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 07:20:08 +0100 (CET)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knbmg-0003Vd-CD
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 01:20:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knbjG-0002DK-IL
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:16:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1knbjE-0006ZY-V7
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 01:16:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607667391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsP3EqZtsRig9B97BwTKjz6ao1B2svKnFMlNkUIxi5c=;
 b=TqnWAkODyIdrc751MsdT5Q2uNQeOCD7SxiJUrZkDwbZdRGOsYWagKOMWohL/8ilWybTq+J
 Gp3eVEC97QeH8zYOjTJOWeoK/+ixTZ8LSPmsXfW5By4BBAaeY9D8EwxdYjzXNj31gt+A9K
 1Z/uA5/eh0xaCa0ySnPq0AHlVZ/bmOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-jjXG0k4GOSq-Z6CR21ZTcQ-1; Fri, 11 Dec 2020 01:16:30 -0500
X-MC-Unique: jjXG0k4GOSq-Z6CR21ZTcQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2182180E46A;
 Fri, 11 Dec 2020 06:16:28 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0256A5D9CC;
 Fri, 11 Dec 2020 06:16:15 +0000 (UTC)
Subject: Re: [PATCH v2 7/8] gitlab: add --without-default-features build
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201210190417.31673-1-alex.bennee@linaro.org>
 <20201210190417.31673-8-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8ae95524-01ae-0dc6-72e4-a574b820ebc4@redhat.com>
Date: Fri, 11 Dec 2020 07:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201210190417.31673-8-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: fam@euphon.net, berrange@redhat.com, stefanb@linux.vnet.ibm.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, cota@braap.org,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/2020 20.04, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - swap with centos8, don't include --without-default-devuces
> ---
>  .gitlab-ci.yml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 2134453717..229545bc03 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -521,6 +521,13 @@ build-without-default-devices:
>      IMAGE: centos8
>      CONFIGURE_ARGS: --without-default-devices --disable-user
>  
> +build-without-default-features:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: debian-amd64
> +    CONFIGURE_ARGS: --without-default-features --disable-user
> +    MAKE_CHECK_ARGS: check-unit
> +
>  check-patch:
>    stage: build
>    image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


