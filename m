Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25B322BC5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 14:56:58 +0100 (CET)
Received: from localhost ([::1]:38276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYBM-0003CF-Rs
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 08:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEYA7-0002LL-1s
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lEYA5-0003fN-DY
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 08:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614088536;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OTePrErs7VX+o2B5/o7igoCIpna6DyIlUzuG9ZKg2iA=;
 b=bsD7TauT+7xY7/Pb3vKCLrw5n9RUjGwlZYRVwK2K6AaZQv6zG2bnBQL9NjJM8sPp19fWQL
 1Nyof2DEzw4Da/6aH/tmbUS9NDFcsdw4bI3hfgD7SIrIyY/ARfmtYAJlosRK2Nh6gkMJPE
 TIr1TtkTjcfoZYk5b0E/YBSXxojA7M0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-OakmqOl9M-aLXEj6gf0FTQ-1; Tue, 23 Feb 2021 08:55:11 -0500
X-MC-Unique: OakmqOl9M-aLXEj6gf0FTQ-1
Received: by mail-ed1-f71.google.com with SMTP id t18so6873001edr.19
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 05:55:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OTePrErs7VX+o2B5/o7igoCIpna6DyIlUzuG9ZKg2iA=;
 b=QxK1DDKAGcZP9nI7o11keXbkxFf5u0uLH0rT3AHbmwiAsXPfVzsM8B9Rw3Ji/0etik
 QIJPgk7+rCti5J+wrt0TLXLFRZ0qAfvBC+fiNAQcs9biL8DkEY/+18eM0vodonNajYSD
 04EjEBhzko+ZHE6O9kwQmqcPJXQqZIc8GA7VJChZh3mkRqzfrcXP6xD1dQ2s9/tiu9Xo
 ofuRrYosZQFNSiT0vWM7VmBHmQNeV0bIO6WoBR6rCqzXBX/7OOc1KMBIb8u7H8UV+mKT
 s/hb5ypV2WeCWvxKx9CgKGX94mZsVx16shLRTI8zT7FvOggfm2HPU+cmjyqCYjY+I6M1
 MXbw==
X-Gm-Message-State: AOAM533Hdolq+gh3NjDML7FOdYKCx46T5a5QfttvOVqKRKGKwMHnhqPa
 U8so67CNrO5h0/kyGCnKywdxicCmLxW3SfEe5J0QY4ZaWZa7daPkD1VWIF+jZiJxGxAn62I+HW0
 D0HCXy1zJjoASpgw=
X-Received: by 2002:a17:906:1956:: with SMTP id
 b22mr27110493eje.114.1614088510670; 
 Tue, 23 Feb 2021 05:55:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJE9oPwpEIwpOhkTVL9iRkJCMbQs46VFre8A0/+bY/yApFbNp2gCSRnGQb+NlSM+OgNL8wkg==
X-Received: by 2002:a17:906:1956:: with SMTP id
 b22mr27110458eje.114.1614088510311; 
 Tue, 23 Feb 2021 05:55:10 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y11sm12163686edw.18.2021.02.23.05.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Feb 2021 05:55:09 -0800 (PST)
Subject: Re: [PATCH v5 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210219215838.752547-1-crosa@redhat.com>
 <20210219215838.752547-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <76021b6c-6d87-5c21-e388-df0836c8462e@redhat.com>
Date: Tue, 23 Feb 2021 14:55:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210219215838.752547-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/19/21 10:58 PM, Cleber Rosa wrote:
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
> 
> The playbook introduced here covers a number of different Linux
> distributions and FreeBSD, and are intended to provide a reproducible
> environment.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  docs/devel/ci.rst                  | 58 ++++++++++++++++++++++++++
>  scripts/ci/setup/.gitignore        |  1 +
>  scripts/ci/setup/gitlab-runner.yml | 65 ++++++++++++++++++++++++++++++
>  scripts/ci/setup/vars.yml.template | 13 ++++++
>  4 files changed, 137 insertions(+)
>  create mode 100644 scripts/ci/setup/.gitignore
>  create mode 100644 scripts/ci/setup/gitlab-runner.yml
>  create mode 100644 scripts/ci/setup/vars.yml.template

> +    - name: Create a user for the gitlab-runner service
> +      user:
> +        user: gitlab-runner
> +        group: gitlab-runner
> +        comment: GitLab Runner
> +        home: /home/gitlab-runner
> +        shell: /bin/bash
> +
> +    - name: Remove the .bash_logout file when on Ubuntu systems
> +      file:
> +        path: /home/gitlab-runner/.bash_logout
> +        state: absent
> +      when: "ansible_facts['distribution'] == 'Ubuntu'"

Can we have a {{gitlab_runner_homedir}} in vars.yml?


