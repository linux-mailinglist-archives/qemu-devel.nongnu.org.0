Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B71E3B6B2A
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 01:08:43 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly0Ms-0007tj-3w
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 19:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ly0Ls-0007F8-9z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:07:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1ly0Lp-000289-VA
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 19:07:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624921656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1cQBw572fZ2xAOfPwf32a/pTfmdbLMuKLAXD0Ppk3WM=;
 b=dNWsh3MqtnNt7KkYSaWenr/2Y0+DisX7/qhG4mXFj5vj6wMOJyqGrOoZ2uPpzhYP981/iQ
 hOMLWnHzAweUlvcp9dXEsxiOGOtNpqU3H2XeEiU7PIeoQ1OFyp90YVAcqIk1XnC6/sKXIP
 YQZPlrc6s9GAzHZwIws9tH5SOuRy1V4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-N4S-yj_FOIiXTAbuc1lQwA-1; Mon, 28 Jun 2021 19:07:33 -0400
X-MC-Unique: N4S-yj_FOIiXTAbuc1lQwA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d7-20020ac811870000b02901e65f85117bso14029465qtj.18
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 16:07:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=1cQBw572fZ2xAOfPwf32a/pTfmdbLMuKLAXD0Ppk3WM=;
 b=esPHuBLSJn9urBMjV9L3ZIW9KhKARAmxDA4G7DW7QiN9k39OfUezkZaL7fjxOydP/9
 zo1UdPBfM+we9mGTJuo82an3Rmhz5ftc5P3o124ACJenaLwZptrZ0MCftVE5M7SdbTcU
 VWxcH86nPUJ9wRojusvjuyjq/tZznsEIvBinali0PDcJ/BVn1U+YgkKt40KJuSTR49Iw
 qzPHFf/U5m66TcJyhLysQnPxw2QGFH9CV7NVK6kCsBU9QKdjZv8sqvqc5RgxS0qLHdZT
 UOH385WVaWq80/40dm/HXnU6fI0bDYWfCwPG5xRLbAk1QbfO6ky0Yg5VlE+FlnVWC2aR
 UnPQ==
X-Gm-Message-State: AOAM530I2LJxiDkw9FVGVR1EHY95xj4W7WY599NS+U7uE6LiqecY3GIt
 0LdPOaw2QBVfY4uLNqwEm/gdc063RXElvsXN+NosOGAjKe18zyUru4IO0bz/jgbNXLYDPcp+FYE
 d9NSfXcQerfBjNQY=
X-Received: by 2002:a05:620a:294d:: with SMTP id
 n13mr9138934qkp.135.1624921653402; 
 Mon, 28 Jun 2021 16:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzznujnWnuPlktEZoRZ+FCUNXIdjG7vz5u7ROn6iFdNDyfIJhL7xZtp7yzoVxQ+KBXANE4f7w==
X-Received: by 2002:a05:620a:294d:: with SMTP id
 n13mr9138914qkp.135.1624921653201; 
 Mon, 28 Jun 2021 16:07:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:18d:8a00:ab70:168b:43e0:32fd:16c7])
 by smtp.gmail.com with ESMTPSA id o5sm11094308qkl.25.2021.06.28.16.07.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 16:07:32 -0700 (PDT)
Subject: Re: [PATCH v6 2/4] Jobs based on custom runners: build environment
 docs and playbook
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-3-crosa@redhat.com> <87wnr3i2hy.fsf@linaro.org>
 <CA+bd_6JO2URtPSAe4faWx_0ybWAXVki45ho7vh1oHo2jyi59zw@mail.gmail.com>
 <87tum7hxdz.fsf@linaro.org>
 <CA+bd_6KUCZp=v8p5GOiajdAZ+F5iRsAeC7Xcmvv=3Vxd5y0_Tw@mail.gmail.com>
 <87fsxoisyu.fsf@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Message-ID: <4902f219-8868-c14f-fd8a-e27d41d4f0e1@redhat.com>
Date: Mon, 28 Jun 2021 19:07:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87fsxoisyu.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.375,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/11/21 6:40 AM, Alex Bennée wrote:

> Cleber Rosa Junior <crosa@redhat.com> writes:
>
>> On Wed, Jun 9, 2021 at 11:26 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>   Cleber Rosa Junior <crosa@redhat.com> writes:
>>
>>   > On Wed, Jun 9, 2021 at 9:36 AM Alex Bennée <alex.bennee@linaro.org> wrote:
>>   >
>>   >  Cleber Rosa <crosa@redhat.com> writes:
>>   >
>>   >  > To run basic jobs on custom runners, the environment needs to be
>>   >  > properly set up.  The most common requirement is having the right
>>   >  > packages installed.
>>   >  >
>>   >  > The playbook introduced here covers the QEMU's project s390x and
>>   >  > aarch64 machines.  At the time this is being proposed, those machines
>>   >  > have already had this playbook applied to them.
>>   >  >
>>   >  > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>   >  > ---
>>   >  >  docs/devel/ci.rst                      | 30 ++++++++
>>   >  >  scripts/ci/setup/build-environment.yml | 98 ++++++++++++++++++++++++++
>>   >  >  scripts/ci/setup/inventory.template    |  1 +
>>   >  >  3 files changed, 129 insertions(+)
>>   >  >  create mode 100644 scripts/ci/setup/build-environment.yml
>>   >  >  create mode 100644 scripts/ci/setup/inventory.template
>>   >  >
>>   >  > diff --git a/docs/devel/ci.rst b/docs/devel/ci.rst
>>   >  > index 585b7bf4b8..35c6b5e269 100644
>>   >  > --- a/docs/devel/ci.rst
>>   >  > +++ b/docs/devel/ci.rst
>>   >  > @@ -26,3 +26,33 @@ gitlab-runner, is called a "custom runner".
>>   >  >  The GitLab CI jobs definition for the custom runners are located under::
>>   >  >
>>   >  >    .gitlab-ci.d/custom-runners.yml
>>   >  > +
>>   >  > +Machine Setup Howto
>>   >  > +-------------------
>>   >  > +
>>   >  > +For all Linux based systems, the setup can be mostly automated by the
>>   >  > +execution of two Ansible playbooks.  Create an ``inventory`` file
>>   >  > +under ``scripts/ci/setup``, such as this::
>>   >  > +
>>   >  > +  fully.qualified.domain
>>   >  > +  other.machine.hostname
>>   >  > +
>>   >  > +You may need to set some variables in the inventory file itself.  One
>>   >  > +very common need is to tell Ansible to use a Python 3 interpreter on
>>   >  > +those hosts.  This would look like::
>>   >  > +
>>   >  > +  fully.qualified.domain ansible_python_interpreter=/usr/bin/python3
>>   >  > +  other.machine.hostname ansible_python_interpreter=/usr/bin/python3
>>   >  > +
>>   >  > +Build environment
>>   >  > +~~~~~~~~~~~~~~~~~
>>   >  > +
>>   >  > +The ``scripts/ci/setup/build-environment.yml`` Ansible playbook will
>>   >  > +set up machines with the environment needed to perform builds and run
>>   >  > +QEMU tests.  It covers a number of different Linux distributions and
>>   >  > +FreeBSD.
>>   >  > +
>>   >  > +To run the playbook, execute::
>>   >  > +
>>   >  > +  cd scripts/ci/setup
>>   >  > +  ansible-playbook -i inventory build-environment.yml
>>   >
>>   >  I tried this to re-update aarch64.ci.qemu.org and another ubuntu box I
>>   >  have up and running as a VM and I got a failure when checking facts:
>>   >
>>   >    14:26:26 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|✚1…(+1/-1) + ansible-playbook -i inventory
>>   build-environment.yml
>>   >
>>   >    PLAY [Installation of basic packages to build QEMU]
>>   >  *************************************************************************************************************************
>>   >
>>   >    TASK [Gathering Facts]
>>   >
>>   ******************************************************************************************************************************************************
>>   
>>   >
>>   >    ok: [aarch64.ci.qemu.org]
>>   >    ok: [hackbox-ubuntu-2004]
>>   >
>>   >    TASK [Update apt cache]
>>   >
>>   *****************************************************************************************************************************************************
>>   
>>   >
>>   >    fatal: [aarch64.ci.qemu.org]: FAILED! => {"msg": "The conditional check 'ansible_facts['distribution'] == 'Ubuntu'' failed. The
>>   error
>>   >  was: error while evaluating conditional (ansible_facts['distribution'] == 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
>>   >  error appears to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml': line 5, column 7, but may\nbe
>>   >  elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Update
>>   apt
>>   >  cache\n      ^ here\n"}
>>   >    fatal: [hackbox-ubuntu-2004]: FAILED! => {"msg": "The conditional check 'ansible_facts['distribution'] == 'Ubuntu'' failed. The
>>   error
>>   >  was: error while evaluating conditional (ansible_facts['distribution'] == 'Ubuntu'): 'dict object' has no attribute 'distribution'\n\nThe
>>   >  error appears to have been in '/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.yml': line 5, column 7, but may\nbe
>>   >  elsewhere in the file depending on the exact syntax problem.\n\nThe offending line appears to be:\n\n  tasks:\n    - name: Update
>>   apt
>>   >  cache\n      ^ here\n"}
>>   >            to retry, use: --limit @/home/alex/lsrc/qemu.git/scripts/ci/setup/build-environment.retry
>>   >
>>   >    PLAY RECAP
>>   >
>>   ******************************************************************************************************************************************************************
>>   
>>   >
>>   >    aarch64.ci.qemu.org        : ok=1    changed=0    unreachable=0    failed=1
>>   >    hackbox-ubuntu-2004        : ok=1    changed=0    unreachable=0    failed=1
>>   >
>>   > Hi Alex,
>>   >
>>   > Thanks for checking this version out.  It looks like this is similar to what happened to you during v5 and hackmox-ubuntu-2004.
>>   Because I
>>   > had no issues running the playbook against aarch64.ci.qemu.org, I am now betting that this is an issue with the ansible installation
>>   on the
>>   > "controller" machine, that is, the one that drives the playbook execution (the "zen" host, according to your output).
>>   >
>>   > About the error, the syntax itself is correct[1], but I bet there may be differences between ansible versions.  Could you please share
>>   the
>>   > output of "ansible --version" on that machine?
>>
>>   15:41:21 [alex@zen:~/l/q/s/c/setup] review/custom-runners-v6|✚1…(+1/-1) 4 + ansible --version
>>   ansible 2.7.7
>>     config file = /etc/ansible/ansible.cfg
>>     configured module search path = ['/home/alex/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
>>     ansible python module location = /usr/lib/python3/dist-packages/ansible
>>     executable location = /usr/bin/ansible
>>     python version = 3.7.3 (default, Jan 22 2021, 20:04:44) [GCC 8.3.0]
>>
>>   My machine is Debian stable (aka Buster)
>>
>> Hi Alex,
>>
>> I found out, the hard way, that one will need ansible 2.8.x.  I'll
>> make a note about that in the documentation. Long version:
> OK - yes please and I'll test with a local installed version. Is it
> possible for the playbook to error out with a useful warning if the
> version of ansible isn't new enough?


Hi Alex,


Yes, I'll add the version check on v7.  The planned error message will be:


"Unsuitable ansible version, please use version 2.8.0 or later"


- Cleber.


