Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3002C6C09
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:38:25 +0100 (CET)
Received: from localhost ([::1]:40966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kijZY-00009Y-Hq
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kijYE-00089J-QI
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1kijYB-0004GA-Sn
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 14:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606505818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EgMQ9ItV6Y3puCV7zYEStOR2JoM/Dhp4IQ8iqCe/vjw=;
 b=D1MJQeS9jISiaekQWDS9MqBz4zShm/VsgAjr2y017UnCVZucbr/CXC+3OfUL3zDRvg6GkF
 P1H5Ns7nJhR4hhlzKlVwPAssXV3QHnnVZm6QzlWIJi9YL+h9/c3+RSIgTJ/22+cx1xMgao
 DPs2nAnANePnHhQ/fTwAhF234+LCfAI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-nSeAR6-xNx-dq6bllcUOOw-1; Fri, 27 Nov 2020 14:36:55 -0500
X-MC-Unique: nSeAR6-xNx-dq6bllcUOOw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78C21E719B;
 Fri, 27 Nov 2020 19:36:54 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-119.gru2.redhat.com
 [10.97.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A9D766085D;
 Fri, 27 Nov 2020 19:36:46 +0000 (UTC)
Subject: Re: [RFC PATCH-for-5.2] gitlab-ci: Do not automatically run Avocado
 integration tests anymore
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20201127174110.1932671-1-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e30a9acc-5fc2-97d0-0de4-c3eb02851571@redhat.com>
Date: Fri, 27 Nov 2020 16:36:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201127174110.1932671-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
 virt-ci-maint-team@redhat.com, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Phil,

On 11/27/20 2:41 PM, Philippe Mathieu-Daudé wrote:
> We lately realized that the Avocado framework was not designed
> to be regularly run on CI environments. Therefore, as of 5.2
> we deprecate the gitlab-ci jobs using Avocado. To not disrupt
> current users, it is possible to keep the current behavior by
> setting the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE variable
> (see [*]).


Could you please detail where have you seen the avocado based tests 
failing that much to justify their removal of CI?

See below some data that I generated from the pipelines for 
https://gitlab.com/qemu-project/qemu/. It seems that jobs which failed 
due timeout are marked as 'skip' and that explain why some pipelines 
don't have a list of failed jobs.

---

Failed 21 out of 99
Pipeline -- 221617704 (staging)
check-patch
Pipeline -- 219276598 (master)
pages
Pipeline -- 218121424 (master)
Pipeline -- 217995873 (staging)
acceptance-system-fedora
Pipeline -- 217995872 (master)
build-tci
Pipeline -- 217551771 (v5.2.0-rc2)
Pipeline -- 217503505 (master)
Pipeline -- 217362429 (master)
Pipeline -- 217328707 (master)
check-crypto-old-nettle
Pipeline -- 216770735 (staging)
acceptance-system-fedora
check-patch
Pipeline -- 215772908 (master)
Pipeline -- 215715025 (staging)
check-crypto-old-gcrypt
Pipeline -- 215715024 (master)
check-crypto-old-nettle
Pipeline -- 214944520 (master)
acceptance-system-debian
Pipeline -- 214460230 (v5.2.0-rc1)
Pipeline -- 214438601 (master)
check-crypto-only-gnutls
Pipeline -- 214273938 (master)
Pipeline -- 214183970 (master)
Pipeline -- 214140305 (master)
Pipeline -- 213892224 (master)
Pipeline -- 213871132 (master)
>  From now on, using these jobs (or adding new tests to them)
> is strongly discouraged.
>
> Tests based on Avocado will be ported to new job schemes during
> the next releases, with better documentation and templates.
>
> [*] https://docs.gitlab.com/ee/ci/variables/README.html#create-a-custom-variable-in-the-ui
>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index d0173e82b16..2674407cd13 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -66,6 +66,15 @@ include:
>       - cd build
>       - python3 -c 'import json; r = json.load(open("tests/results/latest/results.json")); [print(t["logfile"]) for t in r["tests"] if t["status"] not in ("PASS", "SKIP", "CANCEL")]' | xargs cat
>       - du -chs ${CI_PROJECT_DIR}/avocado-cache
> +  rules:
> +  # As of QEMU 5.2, Avocado is not yet ready to run in CI environments, therefore
> +  # the jobs based on this template are not run automatically (except if the user
> +  # explicitly sets the QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE environment
> +  # variable). Adding new jobs on top of this template is strongly discouraged.
> +  - if: $QEMU_CI_INTEGRATION_JOBS_PRE_5_2_RELEASE == null
> +    when: manual
> +    allow_failure: true
> +  - when: always
>   
>   build-system-ubuntu:
>     <<: *native_build_job_definition


The script I used to generate the above metrics:

$ pip install --user python-gitlab

$ cat gitlab-stats
#!/bin/env python3

import gitlab

gl = gitlab.Gitlab('http://gitlab.com')
qemu_project = gl.projects.get(11167699)
pipelines = qemu_project.pipelines.list()

total=0
failed=[]
for pipeline in qemu_project.pipelines.list(page=1, per_page=300):
     if pipeline.status == 'running':
         continue
     elif pipeline.status == 'failed':
         failed.append(pipeline)
     total += 1

print("Failed %d out of %d" % (len(failed), total))
for pipeline in failed:
     print('Pipeline -- %d (%s)' % (pipeline.id, pipeline.ref))
     jobs_failed=[]
     for job in pipeline.jobs.list():
         if job.status == 'failed':
             print(job.name)


