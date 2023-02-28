Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D103A6A5980
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 13:53:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWyzx-0005Tf-0l; Tue, 28 Feb 2023 07:22:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyzL-0005Sx-Fq
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:21:49 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWyzH-0008PL-W5
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 07:21:47 -0500
Received: by mail-wm1-x335.google.com with SMTP id az36so6276258wmb.1
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 04:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=91GaZzjlTl0Bu/cPlQuB4+9xK993xopmGcPom33VZ3M=;
 b=b6GJ1L6ifW9AJhpyombrp6CGk1cFX38s4MU+H2qfvF+zAnpTSYa4ByiL4pJIA5stRC
 KgdUqBKBbEnNQHqCOfpbQQJS1B7wiGz+Pvtc8wAs1iKrT7XrJYLw/wtYuPONEsoSi0x+
 RIV+YKpHxmOF52CavE3PMaKVmwnqtJAZLft5tIbN+MSik5h/3lbI6d+zVxLzY3BtP44Y
 w510j0EF0y4mT27WSzJrGqAuQGRYjJDHibAvcAxYDD7eIKAVVqcKigKaWNbRoqGVoJMI
 j7tLkWcHU7903Cp7t+MSaghy1IVBZM7HSr8/11l/rpMPTZqoyFJzOWWfhH9Za7imQq0v
 oVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=91GaZzjlTl0Bu/cPlQuB4+9xK993xopmGcPom33VZ3M=;
 b=WrjSlDgEjO0xIKLH1MMjURUIfaOz+cBzv7TXXPQMTaJp7heCj2G7xEh3djIlm+iyR+
 KvKjwqZqIHUPbzqIJ2wkdlhxgRjxhKqxCxhMJa8HVQzqyTiwZ6aOBiJx7sxP++XdsL8j
 8HHKmU3QMExB7iyV+ZFlcvuJKTcmzSwPTZXyXOkogTDswauquyXmqtTUuOeE8hB0FhGh
 Bm3ONJoNZ7aIZDx7cs74ZPrN7htvg2Ghn2pgcSKr7YGCBpopBt/qW0Te52qqIvpEpyul
 jJjs/Bwg2wBsY/0xxJV/ynqA0pZnPczqs75CVG42pFD6sldB9IfbK3GfdGa5Fnk5Tf61
 rePg==
X-Gm-Message-State: AO0yUKU1l8dARcF7q/Vs2mKV+T/o9WolkfQt8HEjnY8wFtFcXN6W434D
 du7rhOgLqesO9+PRopIp/B3pyQ==
X-Google-Smtp-Source: AK7set8PoN2e8CdgeoCxubbO4BCfoXW8vLQBJfHsjcuUHU4W35GaN1/4aFPkF1RrWXd6UgKnfkxCfg==
X-Received: by 2002:a05:600c:4510:b0:3e2:19b0:887d with SMTP id
 t16-20020a05600c451000b003e219b0887dmr2259700wmo.25.1677586895925; 
 Tue, 28 Feb 2023 04:21:35 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n4-20020a7bcbc4000000b003dc3f3d77e3sm11589858wmi.7.2023.02.28.04.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 04:21:35 -0800 (PST)
Message-ID: <fee4a91c-3a66-e35a-2663-2565b4103549@linaro.org>
Date: Tue, 28 Feb 2023 13:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Cleber Rosa <crosa@redhat.com>,
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
 <20230224180857.1050220-5-alex.bennee@linaro.org>
 <6a0a7246-e9fd-abfc-283e-b591000cfec7@linaro.org> <87h6v6f0db.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87h6v6f0db.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 28/2/23 13:18, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 24/2/23 19:08, Alex Bennée wrote:
>>> These are flat but not generated by lcitool so we need to manually
>>> update them with the `useradd` stanza.
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> ---
>>>    tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
>>>    tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
>>>    tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
>>>    tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
>>>    tests/docker/dockerfiles/debian-native.docker             | 5 +++++
>>>    tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
>>>    tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
>>>    tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
>>>    tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
>>>    tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
>>>    tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
>>>    tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++
>>>    tests/docker/dockerfiles/python.docker                    | 5 +++++
>>>    20 files changed, 100 insertions(+), 1 deletion(-)
>>> diff --git a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> index 8dc5e1b5de..981e9bdc7b 100644
>>> --- a/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> +++ b/tests/docker/dockerfiles/debian-all-test-cross.docker
>>> @@ -61,3 +61,8 @@ RUN DEBIAN_FRONTEND=noninteractive eatmydata \
>>>      ENV QEMU_CONFIGURE_OPTS --disable-system --disable-docs
>>> --disable-tools
>>>    ENV DEF_TARGET_LIST aarch64-linux-user,alpha-linux-user,arm-linux-user,hppa-linux-user,i386-linux-user,m68k-linux-user,mips-linux-user,mips64-linux-user,mips64el-linux-user,mipsel-linux-user,ppc-linux-user,ppc64-linux-user,ppc64le-linux-user,riscv64-linux-user,s390x-linux-user,sh4-linux-user,sparc64-linux-user
>>> +# As a final step configure the user (if env is defined)
>>> +ARG USER
>>> +ARG UID
>>> +RUN if [ "${USER}" ]; then \
>>> +  id ${USER} 2>/dev/null || useradd -u ${UID} -U ${USER}; fi
>>
>> Is that intended for local image building?
> 
> For building tests. When we run the compilers inside the docker
> container we want to ensure the final binary is visible and accessible
> outside the container.
> 
>> Personally I only use the image built by gitlab and mount the containers
>> with -u $UID -v $HOME/.ccache -v $HOME/source/qemu. Would that still
>> keep working, or do I have to map from gitlab user to mine?
> 
> Its only added on for local builds so in theory you should cache all the
> layers apart from the last one.

OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



