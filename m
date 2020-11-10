Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB61B2AE0DF
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 21:44:20 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcaV1-0008LG-Q9
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 15:44:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaTC-0007PK-Qe
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:42:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kcaTB-00015K-3x
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 15:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605040944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p0liZPXJkUQAjrMa5cIljGrgwZmvvaMXSmn5OfIbNEY=;
 b=drFI7isbzjeOlGsTNxn9JGXVhWa2V/XNkRyHj539G+W/6sguTfEzvqPcOTcoIMsvJeAhAh
 J4668i8/aaofXH1en7wE51w4KuLlKwYcHstHFhjFp+wHF6Ndh8S/wZ6+VB5SIQmpqOEKXm
 MRTBToB6O36059ZlIwr1/4gnO+qtGsw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-BlSvCbEOOvKek7DBdliGOQ-1; Tue, 10 Nov 2020 15:42:21 -0500
X-MC-Unique: BlSvCbEOOvKek7DBdliGOQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AD571007278;
 Tue, 10 Nov 2020 20:42:20 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-220.rdu2.redhat.com
 [10.10.120.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CAC65C629;
 Tue, 10 Nov 2020 20:42:16 +0000 (UTC)
Subject: Re: [PATCH v3 06/11] gitlab-ci: Rename acceptance_test_job ->
 integration_test_job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20201108221925.2344515-1-philmd@redhat.com>
 <20201108221925.2344515-7-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <579650f6-e8a1-fa8c-c28c-566d15ef2088@redhat.com>
Date: Tue, 10 Nov 2020 18:42:09 -0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20201108221925.2344515-7-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Once Cleber said "acceptance" wasn't  a good name for those tests. 
Indeed "integration" is widely used, so okay for this renaming.

On 11/8/20 8:19 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 0ef814764a0..d4526323169 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -42,7 +42,7 @@ include:
>       - find . -type f -exec touch {} +
>       - make $MAKE_CHECK_ARGS
>   
> -.acceptance_test_job:
> +.integration_test_job:
>     extends: .native_test_job
>     cache:
>       key: "${CI_JOB_NAME}-cache"
> @@ -89,8 +89,8 @@ check-system-ubuntu:
>       IMAGE: ubuntu2004
>       MAKE_CHECK_ARGS: check
>   
> -acceptance-system-ubuntu:
> -  extends: .acceptance_test_job
> +integration-system-ubuntu:
> +  extends: .integration_test_job
>     needs:
>       - job: build-system-ubuntu
>         artifacts: true
> @@ -119,8 +119,8 @@ check-system-debian:
>       IMAGE: debian-amd64
>       MAKE_CHECK_ARGS: check
>   
> -acceptance-system-debian:
> -  extends: .acceptance_test_job
> +integration-system-debian:
> +  extends: .integration_test_job
>     needs:
>       - job: build-system-debian
>         artifacts: true
> @@ -150,8 +150,8 @@ check-system-fedora:
>       IMAGE: fedora
>       MAKE_CHECK_ARGS: check
>   
> -acceptance-system-fedora:
> -  extends: .acceptance_test_job
> +integration-system-fedora:
> +  extends: .integration_test_job
>     needs:
>       - job: build-system-fedora
>         artifacts: true
> @@ -181,8 +181,8 @@ check-system-centos:
>       IMAGE: centos8
>       MAKE_CHECK_ARGS: check
>   
> -acceptance-system-centos:
> -  extends: .acceptance_test_job
> +integration-system-centos:
> +  extends: .integration_test_job
>     needs:
>       - job: build-system-centos
>         artifacts: true


