Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 754FA4083DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 07:41:34 +0200 (CEST)
Received: from localhost ([::1]:57406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPeij-0006yw-IF
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 01:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPefs-0005tz-5y
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mPefp-0002El-9Z
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 01:38:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631511512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b6BLoJizkDen2/V1xJpgMMTm79AcS7lGYmHYZJ4ZwgM=;
 b=VofMv4o2+rn/LXCa0zJ+juGGTK7VmBxEG04FOHHBIPxUy2aUU5nU1H0f/3XNDD18Rfbog1
 8s9O4JPtoY09+oM61id+QaRkHkizlt9QN5MS3JTelt1VZhdXM3iY9wi1q6GVw8cTeHLFYe
 7BGTtl0JIOZC9YoLV8LYnqm2f1Lv8hM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-Z0fcE_u0MciU6x0CwV-5Qg-1; Mon, 13 Sep 2021 01:38:30 -0400
X-MC-Unique: Z0fcE_u0MciU6x0CwV-5Qg-1
Received: by mail-wm1-f71.google.com with SMTP id
 k29-20020a05600c1c9d00b00304e40495b2so1834331wms.9
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 22:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b6BLoJizkDen2/V1xJpgMMTm79AcS7lGYmHYZJ4ZwgM=;
 b=D736Wl1PkEqfdfwSHynv4sXgHw4B/ywqikc8dvzQGz2TYEmlswb2kF+UKmNKeWefba
 q6lC4JX32iuixAFY7dhNb64+3WrDYL+zXOb2JS2MZdRdprjCYLCT+ZfFrsakRqo5UaQX
 sic9UyjN+r7g9jDBO7UESFwy5iSPXcvrfG2j4G8BwcqCPm8JS4RhURYV5/2PCuKFbtVA
 fyb8kBHCENgqJRyaiWbk8vb+s85Iy3VRvH/epnR5/Ggd4d319W8pzpTj4pk0eB/FU04V
 Fe/8lIfBLkjp38PR2QQzpGQbig4QGElHdfyc9pXhVsT0o6ccbLX5d1wIwqUhMBIsb3tW
 BXPg==
X-Gm-Message-State: AOAM530s+TQjBOZ0vKBeGSmiZ39zObCIlhCTp7OedWw2ifNcs2wVmgbj
 4rZwQzJi6ZBof7UIsoL8Y2vs1eTJfr2nlzvdwgTaRIlQXyxKr2xcCP/H34tJlWj4WkLmcHgJhek
 LRLaUGWMTEZ5tD6Y=
X-Received: by 2002:a05:6000:34a:: with SMTP id
 e10mr10606662wre.421.1631511509562; 
 Sun, 12 Sep 2021 22:38:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEURoxVvlAD6ukzG+SVq590CpATSAQEV+HNQm3TaCh5YSqDnt3lqwckQXgYk+bQuqpQLSMRw==
X-Received: by 2002:a05:6000:34a:: with SMTP id
 e10mr10606643wre.421.1631511509303; 
 Sun, 12 Sep 2021 22:38:29 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-149-033.46.114.pool.telefonica.de. [46.114.149.33])
 by smtp.gmail.com with ESMTPSA id c2sm6376158wrs.60.2021.09.12.22.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 22:38:28 -0700 (PDT)
To: Jag Raman <jag.raman@oracle.com>, qemu-devel <qemu-devel@nongnu.org>
References: <2CFBCC64-910E-43DF-8A57-8F20671DD7D4@oracle.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: Help adding package to gitlab runners
Message-ID: <98c9bdc9-dceb-1444-abf4-64b919e642d4@redhat.com>
Date: Mon, 13 Sep 2021 07:38:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2CFBCC64-910E-43DF-8A57-8F20671DD7D4@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.584, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/09/2021 03.14, Jag Raman wrote:
> Hi,
> 
> I'm wondering about the best way to install a dependency package on
> GitLab runners.
>
> I'm adding libvfio-user [1] as a submodule to QEMU. libvfio-user depends
> on the availability of the "json-c" package. As such, we need to install this
> package to build the library as part of QEMU.
> 
> I saw that we could add a "before_script" section to the jobs in
> ".gitlab-ci.d/buildtest.yml" - this section could have commands to install the
> "json-c" package before running the job. However, this option is specific to
> a job.
> 
> I wonder if there is a way to do this for all jobs. I saw that
> "scripts/ci/setup/build-environment.yml" has a list of packages needed to
> build QEMU - this one seems Ubuntu-specific.
> 
> How long does it take for changes made to this file (build-environment.yml)
> to propagate? Are all QEMU's GitLab runners Ubuntu-based?

No, this file (build-environment.yml) is only used to prepare the non-shared 
custom runners (see .gitlab-ci.d/custom-runners.yml), which only run on the 
staging branch of the qemu-project (or if you supply your own non-x86 runners).

I think in your case, you likely want to modify the shared runners instead. 
For this, we're using containers that are prepared in the first two stages 
of the CI pipelines. You can modify the container definitions in 
tests/docker/dockerfiles/. Once you add your package there, it should get 
used directly the next time you push a branch with the modification to gitlab.

  HTH,
   Thomas


