Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0173D3A61
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 14:43:10 +0200 (CEST)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6uWC-0006Ai-QA
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 08:43:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6uV4-0005VS-Tn
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m6uV0-00050M-5l
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 08:41:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627044112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HYtnu1g4tNlK7blBtCoZx9n8SGg00tPPYJhIm8VQWeE=;
 b=UOzaaLyIoGmlzcHDF7tMOZpRAgIUQzMLeaPA/dTSv4ZvF6YnvBQ/J2zxpCzXMen7unVT6A
 Zh7J0iz10/yEJLSRU1a9TEq4Ih3uKaeZViOUVD50iOhh909dtrbiBNxG+r6q5bGDcHuP1m
 K3aS/Eis25IuLY2+j+msm5eO5TO2//g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-53-JIPTCCksPK-2FiyGfXHXBw-1; Fri, 23 Jul 2021 08:41:50 -0400
X-MC-Unique: JIPTCCksPK-2FiyGfXHXBw-1
Received: by mail-wm1-f71.google.com with SMTP id
 i8-20020a1c54080000b02901e46e4d52c0so1375370wmb.6
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HYtnu1g4tNlK7blBtCoZx9n8SGg00tPPYJhIm8VQWeE=;
 b=mjkIsh0OCqmAZRc8KG07wThMp9cc4cejcEAETN3nC/1XkkG6St5Y6yVjY87IT6/pG+
 +Pzk2gWMF5FlOLPudQwjjGXPH//qJTms5sR7NlGg3AiwYub6CSet7sej7+gRcS/JXW/L
 lRH5TUuRaGTOmfEwlPxKpA1A/P5fRTQ28RG9RAHrS6y0ROznBI/jMMSYs4c10swiHQ6g
 NKY2/qGnqRMTK2lQ1mtndnUqlf9JPUCaHsiF594VdTqdHYOUD+PFoYhGMHr21qgRonfy
 O7815aAvuGysoOG8C0WU4OJ4LnfiKqWQASDv6cWBhL3Tj40kduUNmDCFVrLFq/bKx2wO
 3mkg==
X-Gm-Message-State: AOAM530Gg6ESVSWKT9ES7wpBNAwRkMasJQtS7CCE4S+yNlIcQAwWcxux
 2rh6LaXLM5ovM75fP+Du0qL2a24ciBqwegEcPtk3H48Wz4OtDDIJgc8dxWp3r/TF2bbWniCE2Ix
 CM9OK883XEYSp7K0=
X-Received: by 2002:adf:eec5:: with SMTP id a5mr5066420wrp.317.1627044109013; 
 Fri, 23 Jul 2021 05:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnp6EeD4T/NGnSs2BzLESdi53ApFPgVDqS5WdLnZlKzfDxlchOHDYNR8ZwcKkMT316grHfAQ==
X-Received: by 2002:adf:eec5:: with SMTP id a5mr5066393wrp.317.1627044108734; 
 Fri, 23 Jul 2021 05:41:48 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id y6sm27138289wma.48.2021.07.23.05.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jul 2021 05:41:48 -0700 (PDT)
Subject: Re: [PATCH v2] gitlab: only let pages be published from default branch
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210723113051.2792799-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7c669c1e-9c09-82b4-76e6-1b6bb6fce026@redhat.com>
Date: Fri, 23 Jul 2021 14:41:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723113051.2792799-1-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/23/21 1:30 PM, Daniel P. Berrangé wrote:
> GitLab will happily publish pages generated by the latest CI pipeline
> from any branch:
> 
> https://docs.gitlab.com/ee/user/project/pages/introduction.html
> 
>   "Remember that GitLab Pages are by default branch/tag agnostic
>    and their deployment relies solely on what you specify in
>    .gitlab-ci.yml. You can limit the pages job with the only
>    parameter, whenever a new commit is pushed to a branch used
>    specifically for your pages."
> 
> The current "pages" job is not limited, so it is happily publishing
> docs content from any branch/tag in qemu.git that gets pushed to.
> This means we're potentially publishing from the "staging" branch
> or worse from outdated "stable-NNN" branches
> 
> This change restricts it to only publish from the default branch
> in the main repository. For contributor forks, however, we allow
> it to publish from any branch, since users will have arbitrarily
> named topic branches in flight at any time.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
> index 89df51517c..80b57b7082 100644
> --- a/.gitlab-ci.d/buildtest.yml
> +++ b/.gitlab-ci.d/buildtest.yml
> @@ -663,6 +663,17 @@ build-tools-and-docs-debian:
>  
>  # Prepare for GitLab pages deployment. Anything copied into the
>  # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
> +#
> +# GitLab publishes from any branch that triggers a CI pipeline
> +#
> +# For the main repo we don't want to publish from 'staging'
> +# since that content may not be pushed, nor do we wish to
> +# publish from 'stable-NNN' branches as that content is outdated.
> +# Thus we restrict to just the default branch
> +#
> +# For contributor forks we want to publish from any repo so
> +# that users can see the results of their commits, regardless
> +# of what topic branch they're currently using
>  pages:
>    image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
>    stage: test
> @@ -681,3 +692,10 @@ pages:
>    artifacts:
>      paths:
>        - public
> +  rules:
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
> +      when: on_success
> +    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
> +      when: never
> +    - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
> +      when: on_success
> 

This is the same than:

  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH ==
$CI_DEFAULT_BRANCH'
  - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
  - when: never

But in your case defaults are explicit, so better.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


