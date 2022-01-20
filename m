Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6E6495485
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 19:59:21 +0100 (CET)
Received: from localhost ([::1]:41862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAceV-00055q-DU
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 13:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAXZY-0000Zz-Sv
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:33:58 -0500
Received: from [2607:f8b0:4864:20::832] (port=36855
 helo=mail-qt1-x832.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nAXZX-0003mt-6K
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 08:33:52 -0500
Received: by mail-qt1-x832.google.com with SMTP id c19so5897438qtx.3
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 05:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z43JSH4hTIktjEmnW7ht59HKcOhxEzBoOUI91X3DPFE=;
 b=drugnLwx8AtkxARUqs4+yswExg1m0Zk4fBV7qHGSgKs4afXup/z7ikjzQxwf1/aDdX
 QZ75ZOcOFM53G0EiMn5u0cvelz37MqWGjRXNeckNasw6TbYMtowc3L8r1wsbLPTMqeJe
 vQbM4L99GIXQCaNirlhFcGL3LfaKKfLtYOn2E2BSmGundwA5SYdxxNoomGjTrmhJY5Re
 kuWhsDf5KfzxE2qbxrbus903mX8TC6NrYU7a3EQLAdGN3TX/vWE7XvVL6CfIlK+FrzQi
 oKppoAhpRYvUDU8ffOiYGajAVjpXUvPTlSuh9gwsrFQYdfaPXmTglcl2fjo2hXVnQo8U
 UEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Z43JSH4hTIktjEmnW7ht59HKcOhxEzBoOUI91X3DPFE=;
 b=7Gvctp2udoj2uRdyG7rzfEWK83iWkYvopMn0D8YQqK+G7ux58QoHIYr1hynnPkO9xY
 meIislAOgUJDmS7ZTJ+lpfTV6Kr+omrELYAtok7Sfm7BqL1uaiBXoEINguqHZnBgX+Jc
 qJYZ8BVamHKqtdVxteqRS28wy1k52oXEuw9oq84TdPmmPWGBl3NVCSywu7QMU8Lr04px
 F0PKeigPhLMhCBtb7mCq36Y06eq9KzRADdOJRT6ryr3cPsVtofN32oPXsGEBt90lu/s5
 xxMPdU1e/l3867V2o7dPP5opgjhJ0VlHKzY3wTKNEzbItySLEa4l3y9JdxPEdAy3fXuy
 eN3A==
X-Gm-Message-State: AOAM533MHlLsUTMObPjwLsCPEysz1UdQ4+XHtlS0Moou59oaL4FaHsmC
 ty0kpwStBm9WjAgqgr3+juI=
X-Google-Smtp-Source: ABdhPJwPysrj3NXG/yDs4/fHP05udWZyszcU8lxdA4hwYTE+rjDkS/H1/kE7x6s1yWFFUJ54kRD1Jw==
X-Received: by 2002:a05:622a:c7:: with SMTP id
 p7mr16066206qtw.270.1642685630149; 
 Thu, 20 Jan 2022 05:33:50 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id n9sm1374056qtx.85.2022.01.20.05.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 05:33:49 -0800 (PST)
Message-ID: <a82daf05-24d0-f871-185e-3588e4c91dea@amsat.org>
Date: Thu, 20 Jan 2022 14:33:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
 <YeaRJF3tqMjipU3o@redhat.com>
 <CAFn=p-ZS247FdLySHMcBTpqKzV=eTgsQQMAXyU5CwNEWdZQusQ@mail.gmail.com>
In-Reply-To: <CAFn=p-ZS247FdLySHMcBTpqKzV=eTgsQQMAXyU5CwNEWdZQusQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::832
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::832;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qt1-x832.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 18/1/22 19:04, John Snow wrote:
> On Tue, Jan 18, 2022 at 5:06 AM Daniel P. Berrangé <berrange@redhat.com> wrote:

>> It would be nice to just have this integrated into 'make check' so we
>> don't need to remember to run a special command.
> 
> The CI will run it, but 'make check' doesn't. To add it to make check,
> I need to figure out how to insert a venv-building step into 'make
> check' such that the venv gets deposited into the build dir instead of
> the source dir.
> I think I may also need yet another set of package dependencies that
> pin on precise dependencies for testing purposes to prevent random
> regressions during 'make check' when nobody has touched the Python
> code.
> 
> Overall, I felt like maybe it was more hassle than it was worth if I
> can just nudge people touching the python to run a 'make check-dev'
> every so often.
> 
> Patches welcome, etc. My overall strategy with the python tests so far has been:
> 
> (1) Keep python tests fully separate from the QEMU build system to
> allow them to be split out into new repositories easily.
> (2) Use the pipenv test to lock the very oldest dependencies the code
> and tests support, using the very oldest python we support (3.6) This
> test is used as the gating test in GitLab CI, as it is very repeatable
> and the GitLab CI setup ensures I can always have the exact Python
> packages it requires available.
> (3) Use the tox test to test against a wide variety of Python
> interpreters (3.6 through 3.10 inclusive) using the very latest python
> packages to detect regressions on cutting-edge environments
> (4) Use the widest possible range of versions for dependent packages
> in setup.cfg such that QEMU packages are unlikely to cause versioning
> conflicts in environments that decide to integrate our code.
> 
> Overall, I test on 3.6 through 3.10, and against the "oldest" and
> "newest" dependencies. It's a good, wide matrix.
> 
> However, It's #4 there that runs me into trouble with tests that are
> guaranteed to pass -- the linters update all the time and cause new
> problems. I use pipenv to lock to specific versions, but that tool
> wants to run against Python 3.6 *explicitly*, so it isn't suitable for
> a generic purpose 'make check' because not everyone will have a Python
> 3.6 interpreter available. I need something kind of halfway between,
> where I can lock against specific versions but not against the Python
> interpreter version, and that's what could be used for a decent 'make
> check' test.
> 
> Of course, I don't want to maintain like 10 versions of a dependent
> packages list, either.
> 
> (I really, really wish pip had an --use-oldest flag for dependency
> resolution, but it doesn't.)

Could we simply use a virtualenv for all QEMU testing tasks (packages
consumed by QEMU tests), and only deal with installed Python packages
for regular non-testing QEMU uses (things exposed via pyqemu that we
want stable)?

