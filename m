Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA0C69F771
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 16:13:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqmh-0002o9-ED; Wed, 22 Feb 2023 10:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqmf-0002mu-4t
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:11:53 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUqmc-0007pw-Pi
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 10:11:52 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v3so8004251wrp.2
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 07:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aExpmLsIH+crBTBLT+vBRt1VOr2oWqSO1aMVLO7WXrs=;
 b=Hm9DLcoFzsrhThhwbwymQZkgFKBKjAc4qyNwGD6bALVrzdyxcZ4ADgroO1uJb4z8Kq
 OSHPk7zSTlr2bop7wjleOCqkSQ/LOI7GXNP/4qTdAA2mHaSCKmV4FoAl6YwEVTABA89Q
 6xLjmOeH83M9qFGt/71TlYexOYlRm+Yi0Y8/cX3QHPSlK0kDRzUH7ddnITll9L/OKhhr
 z1VhvBO0hDn8MRw+ZBsFof5Pox53BA8wMF7bpjYCFYb665xi9msUeE7c1lHfcJNf8XGS
 IJop5fp3QEjDVrBW+FWTrtNYFMbhb+P/r2HUyYCyyyJWRu9CJdqm8EcR81I+kIYoPsM5
 Aewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aExpmLsIH+crBTBLT+vBRt1VOr2oWqSO1aMVLO7WXrs=;
 b=j09EeMxcn3Ab5C+UdWmiAYJKv5p73qIb54QVPP4Tl/Q7bSyx/P49QvzGyHpAl4hsF1
 54owiUG9YzUWQBFiYudXj0L4PVo/9orG0h33SS3VSQCVrY4OF3k3R1CuXb64zRp+8k1M
 PfSGBrkzAlsbb7kZc1dV5xoosV7PooIyMs6V4ZTMu1+0wA6lyWw43AiR9bS7j2y9rNzb
 eKN5HwuT1r+BRVksa+FTe+4byhs8oO2v2tKYi4KYlB4Q1GfOJpjW9EpRfA9/kgxEDMnd
 ykLwmO3hN0Mqi5v5eC1Sw+gGY12NF5BvzhhXTexcRAOYKt6kPbDAGnufNi9W7W3sli1x
 tj6g==
X-Gm-Message-State: AO0yUKX8DpSBFRbXUifzXoMH4bOkz8NqbInVCKVQOIYGd9tRJgieaAKb
 7AlFyiTWNN9J6fA+l85ikFE5cA==
X-Google-Smtp-Source: AK7set9tnLa88Q7NP73ZNHtbWKFgSmpt4iOJVPvkvlYnnHxQWZ49Q1DgMlPr9FgRCPshWyxAC6TORw==
X-Received: by 2002:a5d:49c5:0:b0:2c5:519b:57b6 with SMTP id
 t5-20020a5d49c5000000b002c5519b57b6mr7446517wrs.66.1677078708777; 
 Wed, 22 Feb 2023 07:11:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adffb90000000b002c54c92e125sm6557402wrr.46.2023.02.22.07.11.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 07:11:48 -0800 (PST)
Message-ID: <a7a76dd3-2c2f-7499-a44e-396456deee81@linaro.org>
Date: Wed, 22 Feb 2023 16:11:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 07/12] testing: update ubuntu2004 to ubuntu2204
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>,
 Alexander Bulekov <alxndr@bu.edu>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
 <20230215192530.299263-8-alex.bennee@linaro.org>
 <CAFn=p-b18P0oOhiYPkoQvVzQfqVu4XLprp4-JMbPRF4y72-svQ@mail.gmail.com>
 <Y+6HjEUG2fpalQWv@redhat.com>
 <CAFn=p-b8nK8pNWk3WZgVqjUMx27E4ekeypjGpyk2nrRz=UmNJg@mail.gmail.com>
 <Y++2AK5cDgCGkpVN@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y++2AK5cDgCGkpVN@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.102,
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

On 17/2/23 18:14, Daniel P. Berrangé wrote:
> On Fri, Feb 17, 2023 at 11:35:44AM -0500, John Snow wrote:

>> However, would it be possible to keep the older Ubuntu test as a manual
>> execution that we could invoke at will, only during RC testing phase? If
>> it's not a lot of work, I could even check that in myself as a follow-up if
>> it isn't unwanted.
>>
>> I find that "oldest version of x" is quite useful to me for testing Python
>> stuff in particular, as that ecosystem moves pretty fast. It'd be mighty
>> convenient to me in particular to keep an old Ubuntu test around to run
>> manually as needed.
>>
>> (Heck, even if it wasn't on CI at all but was just a container I could run
>> locally, that would still be quite useful.)
>>
>> Whaddaya think?
> 
> It would be pretty trivial to have tests/docker/dockerfiles contain
> Dockerfiles for *every* supported distro version we have, and then
> only build & test a subset in CI. It would merely suggest that we

That would be great! Could be added as byte-sized issue.

> change our naming convention so the dockerfiles in that dir include
> the version. Basically adopting the standard libvirt-ci naming
> convention for targets of $OSNAME-$OSVERSION:
> 
> $ lcitool targets
> almalinux-8
> almalinux-9
> alpine-315
> alpine-316
> alpine-edge
> centos-stream-8
> centos-stream-9
> debian-10
> debian-11
> debian-sid
> fedora-36
> fedora-37
> fedora-rawhide
> freebsd-12
> freebsd-13
> freebsd-current
> macos-12
> macos-13
> opensuse-leap-153
> opensuse-leap-154
> opensuse-tumbleweed
> ubuntu-1804
> ubuntu-2004
> ubuntu-2204
> 
> Contributors can then use 'make docker-XXXX' to run build tests
> locally on specific distros when they need to test something
> that isn't covered by default in out gating CI
> 
> 
> With regards,
> Daniel


