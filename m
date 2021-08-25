Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DEE3F7401
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 13:05:34 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIqim-0007DR-El
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 07:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqMm-0006wl-HK
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:42:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mIqMg-0001Uw-2R
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 06:42:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629888156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VzrMdMPASI8I1Edhtl1bHZc4JooM5N1zZUUJRj9RkGM=;
 b=XjTe6/x1fGG+khdtGllYhAYiK/hPN0g8OxByj4Vzs4bIY60u/UCOGGzE1p2xgJUoCIRboK
 aZDbg0E7ikjr/avHveLvXSUB9ROmVGu4UdE47kLMsE3nmz2N2NcGBvkSiwbxKwqGJucKCB
 rLWsE7epDFYjpMrkeyGl58v4W/N4PvI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-BlUAowi7P7iS_pGb3t3uDQ-1; Wed, 25 Aug 2021 06:42:35 -0400
X-MC-Unique: BlUAowi7P7iS_pGb3t3uDQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso6467573wrw.22
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 03:42:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzrMdMPASI8I1Edhtl1bHZc4JooM5N1zZUUJRj9RkGM=;
 b=CS1UUJt4ufKkI8yDRKAis58DMV8c+u1YBPXeREbCisUCr6RZT6nlLmvp5xxI48nb8J
 3VOhlCFU83dqI17WuXnyIkylFhbc5v4WAkGVoiiU8Rn/Cl/ba85gmRqildJ2np8tr3EY
 BGyahQbgLSmE1ALkg6ZcLX3nDPwjpQvXw0sdayVt+BKOx+QUrj+ivhiQDgweunwUDbwV
 A6Fw0nhZZWephUuFOs6Llu+DUPBNTwP1Xnm/FpCY94bp8ZBeKOLjd1osynf2Ln+/aZog
 2ACIzRaI3MJ/cnvNXlpN9MsH2xiQA7Z8Jt4+dhWP739ug98yUpeUmRUIiHAug7SXQw0V
 tZkg==
X-Gm-Message-State: AOAM532fFYhylVkaYOlHRdHhEKhP3X9pap892Q2sPAyAbmES73BQPQ0+
 bC76lMxqzeCjB3QM14BwUTtEZPyoH36/AUGIIVmRehYkX9rzmNsy+HhcVzuQSEsiDkKSqgLFD/O
 wSmKtQysHRJ7XO8U=
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr8599674wmq.175.1629888154369; 
 Wed, 25 Aug 2021 03:42:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNKjFFD9hP87t4f53vDapIOlxDPwuDwItoTEMh5RuAv7jL7aZhj7ulAICK0OR78tWYNycdmw==
X-Received: by 2002:a05:600c:35d1:: with SMTP id
 r17mr8599660wmq.175.1629888154087; 
 Wed, 25 Aug 2021 03:42:34 -0700 (PDT)
Received: from thuth.remote.csb (p5791d7bc.dip0.t-ipconnect.de.
 [87.145.215.188])
 by smtp.gmail.com with ESMTPSA id u10sm20733844wrt.14.2021.08.25.03.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 03:42:33 -0700 (PDT)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210812180403.4129067-1-berrange@redhat.com>
 <20210812180403.4129067-3-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user
 forks
Message-ID: <627a5199-c92d-b002-e7cf-8b5258c3aac8@redhat.com>
Date: Wed, 25 Aug 2021 12:42:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210812180403.4129067-3-berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


(meta note: patch does not apply anymore and needs to be refreshed)

On 12/08/2021 20.04, Daniel P. Berrangé wrote:
[...]
> diff --git a/.gitlab-ci.d/rules.yml b/.gitlab-ci.d/rules.yml
> new file mode 100644
> index 0000000000..3399722ca9
> --- /dev/null
> +++ b/.gitlab-ci.d/rules.yml
> @@ -0,0 +1,116 @@
> +
> +# This defines rules used to control individual job execution
> +# See docs/devel/ci-jobs.rst for an explanation of the various
> +# variables and branch naming conventions applied here.
> +#
> +.job_rules:
> +  rules:
> +    # ======================================================================
> +    # Rules that apply regardless of whether the primary qemu repo or a fork
> +    # ======================================================================
> +
> +    # Skip any cirrus job if either repo or api token are missing
> +    # as we won't be able to talk to cirrus
> +    - if: '$CIRRUS_VM_INSTANCE_TYPE && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
> +      when: never
> +
> +    # Any jobs marked as manual, never get automatically run in any scenario
> +    # and don't contribute to pipeline status
> +    - if: '$QEMU_JOB_MANUAL'
> +      when: manual
> +      allow_failure: true
> +
> +    # For the main repo, tags represent official releases.
> +    # The branch associated with the release will have passed
> +    # a CI pipeline already
> +    #
> +    # For user forks, tags are tyically added by tools like

s/tyically/typically/

> +    # git-publish at the same time as pushing the branch prior
> +    # to sending out for review
> +    #
> +    # In neither case do we wish to run CI pipelines for tags
> +    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_TAG'
> +      when: never

Not sure whether I like this rule ... First, tags are very seldom compared 
to normal pushes to branches, so this should not affect us that much. 
Second, I think it might be good for "documentation" purposes to be able to 
say that the CI ran properly for a certain tag. Ok, you could still look it 
up in the push to a branch that might have happened before, but that's 
cumbersome. Just my 0.02 €.

> +
> +    # ====================================
> +    # Rules for running jobs in user forks
> +    # ====================================
> +
> +    # Part 1: gating jobs
> +    # -------------------
> +
> +    # If on a branch with name prefix 'ci-acceptance-', then run
> +    # everything, just as a gating job on 'staging' branch would
> +    - if: '$CI_COMMIT_BRANCH =~ /^ci-gating-/'
> +      when: on_success
> +
> +    # If user set QEMU_CI_GATING=1, then run everything just as
> +    # a gating job on 'staging' branch would
> +    - if: '$QEMU_CI_GATING'
> +      when: on_success
> +
> +    # Otherwise never run jobs marked as gating, but allow manual trigger
> +    # without affecting pipeline status
> +    - if: '$QEMU_JOB_GATING'
> +      when: manual
> +      allow_failure: true

IMHO if it's "gating", then we should not use "allow_failure: true", no 
matter whether the job is manual or not. Otherwise this is very confusing.

I guess the problem is rather whether the "acceptance" tests should be 
called "gating" or not. Currently they are in a rather gray area in the 
gitlab-CI...

> +
> +    # =============================================
> +    # Part 2: opt-in for all CI, except gating jobs
> +    # =============================================
> +
> +    # If pushing to a branch with name prefix 'ci-all', then run all jobs
> +    - if: '$CI_COMMIT_BRANCH =~ /^ci-all/'
> +      when: on_success
> +
> +    # If user QEMU_CI_ALL=1, then run all jobs
> +    - if: '$QEMU_CI_ALL'
> +      when: on_success

Uh, so "all" is not running all jobs? ... that's confusing, too. Could you 
come up with some better naming? QEMU_CI_CORE maybe?

[...]
> +Set variable manually when pushing to git
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>   
>   Variables can be set manually when pushing a branch or tag, using
> -git-push command line arguments.
> +git-push command line arguments. This is useful for fine tuning the
> +jobs on an adhoc basis.

s/adhoc/ad hoc/ (I think)

  Thomas


