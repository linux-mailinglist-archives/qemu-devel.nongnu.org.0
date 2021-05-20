Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D7638B5C5
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 20:08:44 +0200 (CEST)
Received: from localhost ([::1]:46662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljn6B-0002lV-QS
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 14:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ljmyD-00008B-Rr
 for qemu-devel@nongnu.org; Thu, 20 May 2021 14:00:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ljmyA-0001oY-RK
 for qemu-devel@nongnu.org; Thu, 20 May 2021 14:00:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GRZ1zQ2yjYPHi/KSa7gUGHUOZuAxRqSFGIt9oP0iRRA=;
 b=AN3I9waNFGy+hroSqQlhEIS73zgYgjRWm2nMex8x23Ot3qtNBlilK6ClJ4dCOcaUgBtybB
 KLLwj6qEcrN6czDoVRaQA/pPnq4ZE4R/RHUaJS3cNCLTadeIH0uDHBv3rC2urgk1TWs1Ok
 h5J3LOjr6yUxmhKTZSjCearOY73gHSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-ZgFoigqsOFirr6My7Twyfg-1; Thu, 20 May 2021 14:00:23 -0400
X-MC-Unique: ZgFoigqsOFirr6My7Twyfg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D37D1802690;
 Thu, 20 May 2021 18:00:21 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-139.gru2.redhat.com
 [10.97.116.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 69471100238C;
 Thu, 20 May 2021 18:00:13 +0000 (UTC)
Subject: Re: [PATCH v3 1/6] gitlab-ci: Extract &environment_variables template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210519184549.2192728-1-f4bug@amsat.org>
 <20210519184549.2192728-2-f4bug@amsat.org>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <58b5f591-7463-9e21-827e-b08a763e2694@redhat.com>
Date: Thu, 20 May 2021 15:00:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210519184549.2192728-2-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 5/19/21 3:45 PM, Philippe Mathieu-Daudé wrote:
> To be able to set the same environment variables to multiple jobs,
> extract what we currently have as a template.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/buildtest-template.yml | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
> index 32aaef1a213..58b01744751 100644
> --- a/.gitlab-ci.d/buildtest-template.yml
> +++ b/.gitlab-ci.d/buildtest-template.yml
> @@ -1,8 +1,11 @@
> +.environment_variables_template:
> +  before_script:
> +    - JOBS=$(expr $(nproc) + 1)
> +

I wish we could wrap environment variables definitions in `variables` 
(https://docs.gitlab.com/ee/ci/yaml/README.html#variables) instead of 
`before_scripts`, but it wouldn't evaluate the shell expressions.

Unless I am wrong, if the job definition has its own `before_script` 
then including `.environment_variables_template` won't take effect. 
Shouldn't it be documented?

- Wainer

>   .native_build_job_template:
>     stage: build
>     image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
> -  before_script:
> -    - JOBS=$(expr $(nproc) + 1)
> +  extends: .environment_variables_template
>     script:
>       - if test -n "$LD_JOBS";
>         then


