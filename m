Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76B43A247D
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 08:25:24 +0200 (CEST)
Received: from localhost ([::1]:43112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrE83-0006M4-RW
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 02:25:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrE6m-0005hK-40
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:24:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lrE6k-0004Zv-Dj
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 02:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623306241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQyz8huXm0b4Ok/YQR4K22sP52qrsMEAHd7p7PTS3CM=;
 b=aXUZi8+3WtgAh25yWrMZDtIJd5EiRAbqOiKOlQn/rqR5kicytBnNR3qW8IXGBs2yb2NdGK
 S05J2ys3/n/yzici4xsoDfZcFkho1iDvohECbECFlWUWtJ8qN1Qifm9qf9qClbPV+3P9dC
 Tv/WH4LemFhPla1Dnqe7SrPshErPMHc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-EHRvGNO-M3GXHetdeiBkPw-1; Thu, 10 Jun 2021 02:23:58 -0400
X-MC-Unique: EHRvGNO-M3GXHetdeiBkPw-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020adfffc90000b02901178add5f60so407280wrs.5
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 23:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yQyz8huXm0b4Ok/YQR4K22sP52qrsMEAHd7p7PTS3CM=;
 b=aw/bcekJkTBGThn5RUNqdmiR+iHC3YE8YbC8cfPjgQBR+cgGRIv0aidzeR4uTngaii
 wSHVB9RoHDeKJ7E8kVIDLQxZU/JiTHHmyfxfuR6fMNZxvs9JJy+DSfZ0OKk3vONI6lYV
 KyJ+t/CGwHZDIVrj/uRxYlK0crccdIkYlu0HHxeDk7SyXhwn4lpgJktIMyCOC6UpPqY4
 EfBu9X3nTHPef0MlBmugy4OaZrp8W8lZtVBrEusISAO7WA/TvYuxVAbHYTE+Hued1AiW
 sqNa9qkYCyg5W3lYAXQ0q1yfVEmDEyKo9SR+CbdjkNwhF6JAAZ0QEJsr/XV+67NKqc6V
 ZkVQ==
X-Gm-Message-State: AOAM531zCqFY5UFxZ5yG4ImsuiiXgj3CaYX/EBycdgr9sIf9wkxV4O9T
 eZVWqLRUPkBMHXz0RnAozWEBVWGCsFCqEq6yUCks7Lf0/4GDib6d2408oNm0gdJNZYLpMnpmvcf
 Mm/0OsNnyal64yF4=
X-Received: by 2002:a7b:c750:: with SMTP id w16mr3319958wmk.69.1623306237787; 
 Wed, 09 Jun 2021 23:23:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUyUTZ128mdZShPCwHrMFa2HuUHku53MQ6x2ZsBnCruXX5PK/oGVR2AF1e8sfYlGUDNZoE2w==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr3319932wmk.69.1623306237540; 
 Wed, 09 Jun 2021 23:23:57 -0700 (PDT)
Received: from thuth.remote.csb (pd9e839fb.dip0.t-ipconnect.de.
 [217.232.57.251])
 by smtp.gmail.com with ESMTPSA id v16sm2284442wrr.6.2021.06.09.23.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 23:23:57 -0700 (PDT)
Subject: Re: [PATCH v6 3/4] Jobs based on custom runners: docs and
 gitlab-runner setup playbook
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-4-crosa@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <be9840a8-09d7-cdd8-7ab4-a6acf185eede@redhat.com>
Date: Thu, 10 Jun 2021 08:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210608031425.833536-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/06/2021 05.14, Cleber Rosa wrote:
> To have the jobs dispatched to custom runners, gitlab-runner must
> be installed, active as a service and properly configured.  The
> variables file and playbook introduced here should help with those
> steps.
> 
> The playbook introduced here covers the Linux distributions and
> has been primarily tested on OS/machines that the QEMU project
> has available to act as runners, namely:
> 
>   * Ubuntu 20.04 on aarch64
>   * Ubuntu 18.04 on s390x
> 
> But, it should work on all other Linux distributions.  Earlier
> versions were tested on FreeBSD too, so chances of success are
> high.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   docs/devel/ci.rst                  | 57 ++++++++++++++++++++++++++++
>   scripts/ci/setup/.gitignore        |  1 +
>   scripts/ci/setup/gitlab-runner.yml | 61 ++++++++++++++++++++++++++++++
>   scripts/ci/setup/vars.yml.template | 12 ++++++
>   4 files changed, 131 insertions(+)
>   create mode 100644 scripts/ci/setup/.gitignore
>   create mode 100644 scripts/ci/setup/gitlab-runner.yml
>   create mode 100644 scripts/ci/setup/vars.yml.template
[...]
> diff --git a/scripts/ci/setup/.gitignore b/scripts/ci/setup/.gitignore
> new file mode 100644
> index 0000000000..f112d05dd0
> --- /dev/null
> +++ b/scripts/ci/setup/.gitignore
> @@ -0,0 +1 @@
> +vars.yml
> \ No newline at end of file

Add a newline, please.

> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> new file mode 100644
> index 0000000000..98dab92bb5
> --- /dev/null
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -0,0 +1,61 @@
> +---
> +- name: Installation of gitlab-runner
> +  hosts: all
> +  vars_files:
> +    - vars.yml
> +  tasks:
> +    - debug:
> +        msg: 'Checking for a valid GitLab registration token'
> +      failed_when: "gitlab_runner_registration_token == 'PLEASE_PROVIDE_A_VALID_TOKEN'"

Could you please add a comment at the top of the file or name it differently 
so that it is clear from a quick glance that this is an ansible playbook? 
Poeple might later wonder otherwise...

  Thomas


