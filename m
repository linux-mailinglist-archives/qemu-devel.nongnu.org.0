Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2297C6A682B
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 08:34:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXGxM-0006oH-5d; Wed, 01 Mar 2023 02:32:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXGwz-0006mx-Fl
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:32:33 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXGwx-000325-N4
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 02:32:33 -0500
Received: by mail-wr1-x435.google.com with SMTP id l25so12220108wrb.3
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 23:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677655950;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JTrpK5hPgoGiyYpqNs91jF/dKSneDnT+krWJxrVZ9AM=;
 b=CLcaQ1iX3K2cENTsi1z2YyOLo8fZxYN0Uc0k8neYrCvLe3z4guvU8Bw8HkQDQpqVSk
 h/Xej79IExhgM0Ll1snIq1/FqHNrUFpZouLXZbieOt3MrSJaBb118KnEKTcK+Meyu+Kn
 ye+YJzsGvqlfXErq9pVXwounCzLcbzpGneH0xYNiPAarz8YmHZM9ukLWkw4SKTBDsFHf
 pHN+ia+X2iZX1Hh4bQ/o773Yfc1r4HgG8fOjEv6zKMEnId06DakF+LfZyOYK+NQ5H/8w
 9EW2VrOWLBXkWP8LVfLQmH1Doh2OBhlrEtL2AjxcdigYCOO45j/dmhRL4CfL2SnvRDmd
 WxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677655950;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JTrpK5hPgoGiyYpqNs91jF/dKSneDnT+krWJxrVZ9AM=;
 b=11J2z55dj1Dwtzid/wCK5EkOhoNDkU9p+sJDRSNI2PXDGSsKblFMppstBtIXjLclZo
 mSbkFqnZx+2YqbkCIuj4saly3Btq+6fcWzqTLW+rCkbsa3A0QKK+2la8lbyA125vAlWP
 TMPKqd4yXk7Rt1T0cEy6UFPcTw4fN0It6P4YQbuGivs1VSBJuXhVoczZY/yzdQwci50L
 hBnqRG/CG1cSSvcunkLl6KeIbxhcBpxEeBAxu4VzqT6FSKHQ3BPpoIBih4uKYldx6B+1
 L8ft5RkRnFLRqEcMYenbuCKhoCVUwwGY0A23hINx3DBofyY7eOwA7+j9FhzxQqd662+i
 KLWg==
X-Gm-Message-State: AO0yUKUnmR9RJOvzvA6udPW+TPHVm27l0zAjNDmL/GVof6vgv6VKxbDN
 2DEIJUE3A8p/XRDclVVrjimQWA==
X-Google-Smtp-Source: AK7set9KXgNt8QtrHsmFXekecqcJy2CrSCvlR/IZmIJX7voN1q52G8JqysSXVmsWu8Yyi8rzY73kFQ==
X-Received: by 2002:a05:6000:18f:b0:2bd:d34e:5355 with SMTP id
 p15-20020a056000018f00b002bdd34e5355mr3708004wrx.20.1677655950000; 
 Tue, 28 Feb 2023 23:32:30 -0800 (PST)
Received: from [192.168.18.115] ([91.219.21.246])
 by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b002c7163660a9sm12146520wrs.105.2023.02.28.23.32.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 23:32:29 -0800 (PST)
Message-ID: <3aa65498-4d4e-429e-44f4-bbeb34a0e21e@linaro.org>
Date: Wed, 1 Mar 2023 08:32:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
 <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/3/23 07:51, Thomas Huth wrote:
> On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
>> On 28/2/23 20:06, Alex Bennée wrote:
>>> To avoid lots of copy and paste lets deal with artefacts in a
>>> template. This way we can filter out most of the pre-binary object and
>>> library files we no longer need as we have the final binaries.
>>>
>>> build-system-alpine also saved .git-submodule-status so for simplicity
>>> we bring that into the template as well.
>>>
>>> As an example the build-system-ubuntu artefacts before this patch
>>> where around 1.3 GB, after dropping the object files it comes to 970
>>> MB.
>>>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>>   2 files changed, 46 insertions(+), 51 deletions(-)
>>
>> This is still kludging the fact that 'make check-qtest' rebuild
>> the world even if QEMU binaries are present.
> 
> Did you try? ... if so, that would kill even more CI minutes, i.e. it 
> would IMHO be a show-stopper for this patch.

I remember we had to pass all build/ otherwise calling 'make
check-qtest check-tcg' would rebuild the same binaries, it it
was pointless to split the jobs in 2 stages. I might have missed
when that was fixed.

I haven't tried, however I see in Alex job:

$ scripts/git-submodule.sh update $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' 
build/config-host.mak)
sed: can't read build/config-host.mak: No such file or directory
$ cd build
/bin/bash: line 144: cd: build: No such file or directory
ERROR: Job failed: exit code 1

https://gitlab.com/stsquad/qemu/-/jobs/3847747769

