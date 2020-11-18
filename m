Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D52B7ABB
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 10:56:17 +0100 (CET)
Received: from localhost ([::1]:43918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfKCG-0002Pg-Ne
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 04:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfKB1-0001VC-Gk
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:54:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfKAz-0000b0-PJ
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 04:54:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605693296;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=79eO6gVuHz3XwCWLmTZoKfTupcl3b3U55TJw3Qgg3+M=;
 b=casW1JT7igYa/QFIirDHJe4rDejm+s5/fLeLy5C+bYIwpo+1flGsLAAWoZn8xyQ3rgHpbi
 lCa3AJILm2mefs4KuzSj+rZ5BSpNq8QaWL5DooBSiu0JV6qKT0+x96GvBL7+KdWeqhyhRX
 4MZcMwYlxxkraskKTPhNAFwg18DtV4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-KhzzecZgPSyy8et7uMXF2A-1; Wed, 18 Nov 2020 04:54:54 -0500
X-MC-Unique: KhzzecZgPSyy8et7uMXF2A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D41641882FAA;
 Wed, 18 Nov 2020 09:54:53 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6367E100238C;
 Wed, 18 Nov 2020 09:54:47 +0000 (UTC)
Subject: Re: [PATCH v1 6/6] gitlab-ci: Move trace backend tests across to
 gitlab
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201117173635.29101-1-alex.bennee@linaro.org>
 <20201117173635.29101-7-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7f383116-3974-bf41-66f1-23f884211257@redhat.com>
Date: Wed, 18 Nov 2020 10:54:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201117173635.29101-7-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: Fam Zheng <fam@euphon.net>, peter.maydell@linaro.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/11/2020 18.36, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Similarly to commit 8cdb2cef3f1, move the trace backend
> tests to GitLab.
> 
> Note the User-Space Tracer backend is still tested on
> Ubuntu by the s390x jobs on Travis-CI.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20201111121234.3246812-3-philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .gitlab-ci.yml | 18 ++++++++++++++++++
>  .travis.yml    | 19 -------------------
>  2 files changed, 18 insertions(+), 19 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b406027a55..d0173e82b1 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -415,6 +415,24 @@ check-crypto-only-gnutls:
>      IMAGE: centos7
>      MAKE_CHECK_ARGS: check
>  
> +# We don't need to exercise every backend with every front-end
> +build-trace-multi-user:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-trace-backends=log,simple,syslog --disable-system
> +
> +build-trace-ftrace-system:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-trace-backends=ftrace --target-list=x86_64-softmmu
> +
> +build-trace-ust-system:
> +  <<: *native_build_job_definition
> +  variables:
> +    IMAGE: ubuntu2004
> +    CONFIGURE_ARGS: --enable-trace-backends=ust --target-list=x86_64-softmmu

Hmmm, do we really need separate build jobs for this, or could we maybe
rather simply add the options to some existing jobs instead (to save some CI
cycles)?

 Thomas


