Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F9B363AFE
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 07:28:21 +0200 (CEST)
Received: from localhost ([::1]:58336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYMSK-0006uu-Nh
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 01:28:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMRA-0006Kq-RI
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lYMR9-0007T9-6D
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 01:27:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618810026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A6PsxJm8CTA4x2o6jpI5Li2v+1WBkGV2I3Wjs7AvFQI=;
 b=BNA4Vnv7ureAKztKxlQFx36r8tNG3wq45yj0kiTSmviIX1WwueBQQ/SjnyCaxTr/xc/nVu
 OHpQoSlK1oC1O+74cM0ikLgXSRA4gEeEwtGlUfbXGS/2pKBEZJofKdRmF99jIJCb8jpGCE
 Ytl8WJS8ALOzxNj4RLehozxUhEdqbh4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-iQK4AEU5Pj-Y5FW1W41wlg-1; Mon, 19 Apr 2021 01:27:04 -0400
X-MC-Unique: iQK4AEU5Pj-Y5FW1W41wlg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A8041006C81;
 Mon, 19 Apr 2021 05:27:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-129.ams2.redhat.com [10.36.112.129])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF33919D61;
 Mon, 19 Apr 2021 05:26:54 +0000 (UTC)
Subject: Re: [PATCH 08/15] gitlab-ci: Extract DCO/style check jobs to
 checks.yml
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418233448.1267991-1-f4bug@amsat.org>
 <20210418233448.1267991-9-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <61a57a93-2bd6-bd1c-1826-de9c679a0f87@redhat.com>
Date: Mon, 19 Apr 2021 07:26:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210418233448.1267991-9-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/04/2021 01.34, Philippe Mathieu-Daudé wrote:
> Extract the DCO / checkpatch jobs to a new file (checks.yml)
> to be able to run them without having to run all the jobs
> included in the default .gitlab-ci.yml, which are mainly useful
> for mainstream CI.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   .gitlab-ci.d/checks.yml | 24 ++++++++++++++++++++++++
>   .gitlab-ci.yml          |  1 +
>   2 files changed, 25 insertions(+)
>   create mode 100644 .gitlab-ci.d/checks.yml
> 
> diff --git a/.gitlab-ci.d/checks.yml b/.gitlab-ci.d/checks.yml
> new file mode 100644
> index 00000000000..f695627b7cd
> --- /dev/null
> +++ b/.gitlab-ci.d/checks.yml
> @@ -0,0 +1,24 @@
> +check-patch:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> +  needs:
> +    job: amd64-centos8-container
> +  script: .gitlab-ci.d/check-patch.py
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +  variables:
> +    GIT_DEPTH: 1000
> +  allow_failure: true
> +
> +check-dco:
> +  stage: build
> +  image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
> +  needs:
> +    job: amd64-centos8-container
> +  script: .gitlab-ci.d/check-dco.py
> +  except:
> +    variables:
> +      - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
> +  variables:
> +    GIT_DEPTH: 1000
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index bf4862a78de..ba35b3917e7 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -12,6 +12,7 @@ include:
>     - local: '/.gitlab-ci.d/opensbi.yml'
>     - local: '/.gitlab-ci.d/containers.yml'
>     - local: '/.gitlab-ci.d/crossbuilds.yml'
> +  - local: '/.gitlab-ci.d/checks.yml'
>   
>   .native_build_job_template:
>     stage: build
> 

You added the new file, but it looks like you did not remove the jobs from 
the main .gitlab-ci.yml file ? ... that looks like a mistake?

Also, "checks.yml" sounds a little bit too generic. Maybe rather name it 
"style-check.yml" or something similar?

  Thomas


