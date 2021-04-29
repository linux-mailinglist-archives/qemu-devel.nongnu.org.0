Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5AE536EB3D
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 15:21:23 +0200 (CEST)
Received: from localhost ([::1]:58320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc6ba-0005ar-Fz
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 09:21:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lc6Xj-00046q-5Q
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:17:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lc6Xh-0005Yf-1V
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 09:17:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619702239;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4cKkxcNTW6upAaEcRg9fBkzUueLfadtEbH+tm4QmXg0=;
 b=igQFKJnz6XngmLJVrK91ZRhTkPVrwLy9zfjE1AT0UHTitAFy5mtPsCOedQbDMVZhLhswW4
 4wBx//J6G8h34HXxJqEAZQEIREp/IyLtU/loRYagen+pzwdFHdV8Cg3cs+nLgw8hTfCXwM
 YsQbFPXbTYcJiaemopAjggu0B1oSJkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-V0s4VHikM_O7tFrp-2re7w-1; Thu, 29 Apr 2021 09:17:15 -0400
X-MC-Unique: V0s4VHikM_O7tFrp-2re7w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 516456D269;
 Thu, 29 Apr 2021 13:17:14 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-86.gru2.redhat.com
 [10.97.116.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E182519C44;
 Thu, 29 Apr 2021 13:16:59 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] gitlab-ci: Add a job to build virtiofsd standalone
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210429083346.61030-1-philmd@redhat.com>
 <20210429083346.61030-3-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d64aa1d2-6fc3-4c4b-fa0d-2f3721ab7e9a@redhat.com>
Date: Thu, 29 Apr 2021 10:16:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210429083346.61030-3-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 4/29/21 5:33 AM, Philippe Mathieu-Daudé wrote:
> Add a job which builds virtiofsd without any emulation or tool.
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> https://gitlab.com/philmd/qemu/-/jobs/1222007991
> Duration: 7 minutes 48 seconds
> ---
>   .gitlab-ci.yml | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 52d65d6c04f..ba3c7ade6ca 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -800,6 +800,19 @@ build-libvhost-user:
>       - meson
>       - ninja
>   
> +build-virtiofsd-fedora:
> +  <<: *native_build_job_definition
> +  needs:
> +    job: amd64-fedora-container
> +  variables:
> +    IMAGE: fedora
> +    CONFIGURE_ARGS: --enable-virtiofsd
> +        --disable-system --disable-user --disable-tools --disable-docs
> +  artifacts:
> +    expire_in: 2 days
> +    paths:
> +      - build/tools/virtiofsd/virtiofsd
> +

Why it needs the executable archived?

- Wainer

>   # No targets are built here, just tools, docs, and unit tests. This
>   # also feeds into the eventual documentation deployment steps later
>   build-tools-and-docs-debian:


