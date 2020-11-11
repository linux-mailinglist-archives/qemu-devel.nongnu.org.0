Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C592AED60
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 10:22:26 +0100 (CET)
Received: from localhost ([::1]:39336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcmKf-0004RK-I3
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 04:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmGz-00019l-Tr
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:18:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcmGv-0004yi-UY
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 04:18:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605086312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OJsyXjb6SFp9QpHX9c2gS4yFAbBojfcTRi4MW6jZNs4=;
 b=WS2VR/mDFYctGPH6FS0CWmuFYqqzgxTjGAZ1nlreU13s1CJ7usXADN7gtYxceoCCLFbEuD
 O4t2l3MRS2CbEClT1dnJeVeEDA0+Ez63T/2zTFGsi7zAFIXWGrJn5PYpdZa8vKEMyYh/vv
 mQ9/R2Q5BopAYA0jVVK+9pqF4YVKRCc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-R0NdORdjPb6goPuDaEKn1g-1; Wed, 11 Nov 2020 04:18:30 -0500
X-MC-Unique: R0NdORdjPb6goPuDaEKn1g-1
Received: by mail-wr1-f72.google.com with SMTP id v5so393532wrr.0
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 01:18:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OJsyXjb6SFp9QpHX9c2gS4yFAbBojfcTRi4MW6jZNs4=;
 b=ZO0Td9CorYNiQY6yEtujb5K2svI/bCZ2nPWSjDiZEsmhIMJ+TQZmudSGw7x+LjF5yb
 NZNFxCLDUoj9Wm2wAfUpK3i5iotmg4VzUEhniENvhoJFkTHZ3lu9cHAfmxyCdekwzeJF
 TbHDnF8hlow0j4sCULXO/yGMPTpsZUVG9Otq/XvF+iRZ4DNPYWPlvoVm84wxqw74ecia
 dqL/8xo8bOS/YyMFKw0lXu8ejEOGREORAeLTGmGDfDgj1rz8hkbDcgTamR8z9H2OadU+
 FJ6py8ee64BU8l8iGES+GkA8DSuUteoU67DIxRtPx9Grsf8gzvh6B6/fBMJ3vCCMYRaP
 t+Aw==
X-Gm-Message-State: AOAM530Hjs9oIfstKyd1msiHMvFdejM0iAIY9O4b5CVyuv8fVEFWxYrx
 dGMUWhZmxwKxFUsa7KZdKqKZw2+m1EDS7HSex0kGRD61/Y/2M0SLeteHbOqYg2NcAy/PF7ifoSF
 /GFXtpT4BduuJK2M=
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr2896999wmc.176.1605086309520; 
 Wed, 11 Nov 2020 01:18:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxetf7ri9HbHzg5ocn88CDEiDrlIyrDmnYrsQb3Nhv+h6rrHbee9TjJBDlRUUuGMs2rNKYZMw==
X-Received: by 2002:a1c:7e87:: with SMTP id z129mr2896971wmc.176.1605086309331; 
 Wed, 11 Nov 2020 01:18:29 -0800 (PST)
Received: from [192.168.1.36] (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id a17sm1801980wra.61.2020.11.11.01.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2020 01:18:28 -0800 (PST)
Subject: Re: [PATCH-for-5.2 2/2] gitlab-ci: Avoid running the EDK2 job when
 not necessary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20201110121606.2792442-1-philmd@redhat.com>
 <20201110121606.2792442-3-philmd@redhat.com>
 <20201110153505.GH869656@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3ec6bc01-906b-2e34-b760-76138bbff7cb@redhat.com>
Date: Wed, 11 Nov 2020 10:18:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201110153505.GH869656@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
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
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/20 4:35 PM, Daniel P. Berrangé wrote:
> On Tue, Nov 10, 2020 at 01:16:06PM +0100, Philippe Mathieu-Daudé wrote:
>> The EDK2 jobs use the 'changes' keyword, which "makes it
>> possible to define if a job should be created based on files
>> modified by a Git push event." (see [1]). This keyword comes
>> with a warning:
>>
>>   Caution:
>>
>>     In pipelines with sources other than the three above
>>     changes can’t determine if a given file is new or old
>>     and always returns true."
>>
>> In commit 922febe2af we moved the YAML config file from the
>> repository root directory to the .gitlab-ci.d/ directory.
>>
>> We didn't respect the previous warning and disabled the
>> 'changes' filter rule, as the files are now in a (directory)
>> three above the YAML config file.
> 
> This description is a bit wierd. I don't see how the location
> in the directory tree has any relevance here.
> 
> IIUC the caution docs quoted above are referring to what triggered 
> the pipeline. They're saying that if the trigger was not a "branch", 
> "merge request", or "external pull request", then the "changes" rule 
> always evaluates true.
> 
> The "branch" source us a bit wierd though, as I'm not seeing
> how gitlab figures out which commits are "new" to the pipeline
> and thus whether the files were modified or not.
> 
> Strangely qemu-project/qemu CI for master seems to be behaving
> correctly and skipping the jobs.

What about this one?

https://gitlab.com/berrange/qemu/-/jobs/827459510

> 
> Something is fishy here and clearly not working, so clearly
> changes are needed, but the commit message is not explaining
> it for me.
> 
>> This jobs takes ~40min, and needlessly burns the 2000 minutes
>> available to GitLab free users. Follow the recommendations in
>> [3] and disable this job by default (except if we push a tag
>> or the branch contains 'edk2'). Note we do not remove the job
>> from the pipeline, it can still be triggered manually from the
>> WebUI.


