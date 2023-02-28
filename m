Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18C46A5AE8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 15:35:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX13M-0003gU-Ry; Tue, 28 Feb 2023 09:34:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX13D-0003gH-9j
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:33:55 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pX13B-0005zE-Dz
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 09:33:54 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p26so6550738wmc.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gsTTVd8ms2cWlOoEtqbNNXxVnVJUKiJh8ITbyk1+Ivc=;
 b=v8fJOUn+TqjAQKsvxDPdoX8A7jlIMbb5HgxMJow87asaQpUqHq7cKOqFAelCO8oGoa
 SoHcjL6RMFkIIiBeVrSLFwTSnax0vJCrD6hmRqc0XZ3TZZP/d5+RrYYRAaqcROYZk075
 HpnAS89w3kywJ42H2Xmn6/+P3MbhaEpQMc87cuTMNOX7z+f2vyL8QhDeII1tpKWSBh3h
 rBfF5RcZfqp7sHGYndaa3mZMsmye4PgROtS+g9itg9vSjzZqCKl1qZlTnfrGkK5Mi6bW
 yfHAbLV8dblkj/0LycC7OzNqNNMgoM0JZfgBsM+O665UjKfR6mQgPTIAasWeBTNiTQWF
 hDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gsTTVd8ms2cWlOoEtqbNNXxVnVJUKiJh8ITbyk1+Ivc=;
 b=DbWZTQtZGAotfgb08pK44Dq3dLCOb1vnRy10KXwO/70gPt0vkkFSEclY0wdKStB5Lg
 b9jCvJL8g9mhI0uIRGrrCYT4CXteduSM1KQ4Gy8nZwTSuarzWeuxbrqRdDjXHQx/ONNV
 Ju+KkdWa/9AmDZxTPfiG6D2nKIJg4C7zNk1CVJ+bPZpH8NCMHT8Hgx2s3Saeb8GqbCL/
 3wKluW9yLrRXY1/W7nUXkwO7S2rhWMVUKIPajCNDfrOb34RJxrGYuuTpvnafum72wAnZ
 WwSdY9UcJGhAtnedx+hH5V1OO/Gp+TqvEhlfQcr8o/Nsne35fMffKj1+CAcH/W+KEPKI
 nYHw==
X-Gm-Message-State: AO0yUKWcU5kS15ZhOCbc/xII9TPAKSUnvL4gxJj7t5/7ucGBpInhJRu2
 HOQmTPEzb4wlF++cfm9jj0UUYQ==
X-Google-Smtp-Source: AK7set8WHAYZ2V4LZowaKMbZLo5DBUh17llCp/Zk8rAc5/StHXKqLk/DUlY/kOXjtZ7zJCMqEJnepQ==
X-Received: by 2002:a05:600c:4586:b0:3eb:376e:2ba5 with SMTP id
 r6-20020a05600c458600b003eb376e2ba5mr2314569wmo.3.1677594831455; 
 Tue, 28 Feb 2023 06:33:51 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l21-20020a1c7915000000b003e21ba8684dsm12305343wme.26.2023.02.28.06.33.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 06:33:50 -0800 (PST)
Message-ID: <134c78e8-8daf-0f8d-5a87-5c5ac4d73fce@linaro.org>
Date: Tue, 28 Feb 2023 15:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 John Snow <jsnow@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Hanna Reitz <hreitz@redhat.com>, Bandan Das <bsd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Darren Kenny
 <darren.kenny@oracle.com>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
 <Y/4C74k7QTuIwz7v@redhat.com> <87cz5tgaaj.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87cz5tgaaj.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

On 28/2/23 14:57, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daudé wrote:
>>> On 28/2/23 13:58, Daniel P. Berrangé wrote:
>>>> On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
>>>>> On 24/2/23 19:08, Alex Bennée wrote:
>>>>>> This series attempts to remove our dependence on the docker.py script
>>>>>> and build things directly with the appropriate tool. I've been
>>>>>> noodling around with how we build images on gitlab to see if they can
>>>>>> cache better because the normal case should be we don't need to
>>>>>> rebuild everything if the upstream distro hasn't updated its package
>>>>>> list.
>>>>>>
>>>>>> Anyway what do people think?
>>>>>
>>>>> Removing dind limitation is interesting.
>>>>>
>>>>> Unrelated, can we tag registry.gitlab.com/qemu-project's
>>>>> docker images along with releases?
>>>>
>>>> Can you elaborate on this ?
>>>>
>>>> We're only using the images for CI purposes and they must always reflect
>>>> the current state of git master. We're using a fixed docker tag 'latest',
>>>> as that avoids the container registry growing arbitrarily large.
>>>>
>>>> Our CI rules should prevent the pipelines running on stable branches,
>>>> so we shouldn't need container tags for stable.
>>>
>>> I'm not suggesting keeping jobs to build, but doing a snapshot of the
>>> released containers.
>>>
>>> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
>>> it again. This is useful when bisecting pre-v8, but also to build pre-v8
>>> and do performance comparison. One shouldn't have to upgrade such
>>> container (in particular when package mirror disappear), since it
>>> already contains all we need.
>>
>> The main risk with this is the impact on our storage quota. With the
>> OSS Program membership IIUC we get Ultimate level features which
>> is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
>> container registry.
>>
>> Currently they have no way to enforce that since their accounting of
>> usage is not accurate enough. They're working on fixing that so at
>> somepoint we'll be subject to the 250 GB limit.
>>
>> What I don't know is how much storage we're currently using across
>> the /qemu-project namespace, and what extra is implied by taking
>> a snapshot of our container registry 3 times a year. I'm expecting
>> it to probably be in the high 10's of GB though for the container
>> registry.

Maybe we can keep (a subset of) the stable release container images
and store them on a registry outside of gitlab. That would be nice,
but if I'm the only one interested and nobody felt this was useful
before, no need to spend more energy on this topic.

> Currently we are using:
> 
> 86.6 Gb of artefacts

^ transient

> 28.5 Gb of containers

^ constant

> 220 Mb of file uploads
> 24.8Mb of git repo
> 
> We could probably cut down a lot of usage of artefacts by either not
> building full fat ones with debug symbols and passing between layers or
> tweaking the build system to prevent re-building of object files if the
> final binary is present in the file system.
> 


