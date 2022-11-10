Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B02624AB0
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 20:31:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otDF3-0005n5-55; Thu, 10 Nov 2022 14:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otDF1-0005mn-9S
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:29:35 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1otDEz-0004ug-3J
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 14:29:35 -0500
Received: by mail-oi1-x231.google.com with SMTP id q186so2851818oia.9
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 11:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=we8A1NXWbfN6hBQBpX3agaKDKyWENomvRQ+fZ5zD5Nk=;
 b=lmvUDXv3ZVhLNajEDqsghDItGOcP37Y/unTi7zrOS/ZPfOpEr9PSCq9K1Wg+qSBfFJ
 vgiYrMGaGxrYZR4XyDQKJ1eLqLAuYOQeT0JEr7cZ/uE4S/zJfZvxtRFKAB74gmwa3FQr
 5LruJMnWSzQTESvBQn+pU7yZAkrkTmvwLz0weACQae6VNqVLWbZojjEfoP6xTzruDx+h
 7pne5TlMXu0D8MfjCUXX78WVwbopF7BhghyhS6KDOv8dryNI7pI8yLalEtP/IrCblLbR
 8v2nnRjVqMEy0qacQRKUfEvRJ22j6amnVfErSOvxyEyjQKqWObIVyxiRXHHtoXPO1XBp
 YnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=we8A1NXWbfN6hBQBpX3agaKDKyWENomvRQ+fZ5zD5Nk=;
 b=B6UekNbrzwU1ONfv6HVuusz9n3cBQDccONplQWKEwauVLFOzmZZui4eJtZF9YhZV43
 NtB4lNUDG6rP7ezgLc1OsZK4ZJm8U1MY9VnSl5Adz+IMVqxuXvL71aLbe/YJd9D/BVYc
 vJjCSq/nvtuQ8EojYuNZkP5rEC6OC48Iw8URzi+gQDqIKSF8LTAOAaWBHp4Fkq3EnLy9
 W2EYShFjvQMZn6iriWSFL7iBacoOz6TLvFRmmByeaY2aAgYDMqJWvury90F85U/Xd8lA
 AoDxvtKQGM9gE/fzMOAAPArlsqrj+OwCY4gXD9TZwMvReSk2x2BT+Jy80ZtkH28Wxst4
 2lzg==
X-Gm-Message-State: ACrzQf3L4dvyhiq5bZovI1re9WS3nap/FjWuJ6wMNQzJKSQ5EwoQwWPq
 MvP6mYn+A0/lHnCEIo8i5LY=
X-Google-Smtp-Source: AMsMyM4dY0O1W5VYLzOkKDPyTzHodh0aB4/mhxC193CsMrJrZG/UPZAIkhKGohcNrCa7u5vaRv74MA==
X-Received: by 2002:a54:4612:0:b0:342:ff90:1867 with SMTP id
 p18-20020a544612000000b00342ff901867mr1959232oip.297.1668108571386; 
 Thu, 10 Nov 2022 11:29:31 -0800 (PST)
Received: from [192.168.10.102] ([187.34.29.120])
 by smtp.gmail.com with ESMTPSA id
 bh39-20020a056808182700b0035ab03d9153sm88700oib.47.2022.11.10.11.29.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 11:29:31 -0800 (PST)
Message-ID: <d3cb269a-183c-4e74-587f-93ad9ee41f44@gmail.com>
Date: Thu, 10 Nov 2022 16:29:25 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] avocado: use sha1 for fc31 imgs to avoid first time
 re-download
To: Jan Richter <jarichte@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221022170350.936685-1-danielhb413@gmail.com>
 <Y1ZUsauC6F3yDuny@redhat.com>
 <8d2d7c90-288f-387f-e474-7eefe47005e8@redhat.com>
 <Y1pI2Tg9VTNwrrEE@redhat.com>
 <2a26f704-cfbe-8965-a7c4-24ab62c1a651@gmail.com>
 <2964d2a7-7fa4-3d2a-e101-28cd788c14dd@linaro.org>
 <f80d495b-43bf-af54-8fc0-2e6d11ec4330@redhat.com>
Content-Language: en-US
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <f80d495b-43bf-af54-8fc0-2e6d11ec4330@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
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



On 11/10/22 11:57, Jan Richter wrote:
> 
> 
> On 11/10/22 00:26, Philippe Mathieu-Daudé wrote:
>> On 9/11/22 16:39, Daniel Henrique Barboza wrote:
>>> On 10/27/22 06:01, Daniel P. Berrangé wrote:
>>>> On Thu, Oct 27, 2022 at 09:46:29AM +0200, Thomas Huth wrote:
>>>>> On 24/10/2022 11.02, Daniel P. Berrangé wrote:
>>>>>> On Sat, Oct 22, 2022 at 02:03:50PM -0300, Daniel Henrique Barboza wrote:
>>>>>>> 'make check-avocado' will download any images that aren't present in the
>>>>>>> cache via 'get-vm-images' in tests/Makefile.include. The target that
>>>>>>> downloads fedora 31 images, get-vm-image-fedora-31, will use 'avocado
>>>>>>> vmimage get  --distro=fedora --distro-version=31 --arch=(...)' to
>>>>>>> download the image for each arch. Note that this command does not
>>>>>>> support any argument to set the hash algorithm used and, based on the
>>>>>>> avocado source code [1], DEFAULT_HASH_ALGORITHM is set to "sha1". The
>>>>>>> sha1 hash is stored in a Fedora-Cloud-Base-31-1.9.{ARCH}.qcow2-CHECKSUM
>>>>>>> in the cache.
>>>>>>
>>>>>>> For now, in QEMU, let's use sha1 for all Fedora 31 images. This will
>>>>>>> immediately spares us at least one extra download for each Fedora 31
>>>>>>> image that we're doing in all our CI runs.
>>>>>>>
>>>>>>> [1] https://github.com/avocado-framework/avocado.git @ 942a5d6972906
>>>>>>> [2] https://github.com/avocado-framework/avocado/issues/5496
>>>>>>
>>>>>> Can we just ask Avocado maintainers to fix this problem on their
>>>>>> side to allow use of a modern hash alg as a priority item. We've
>>>>>> already had this problem in QEMU for over a year AFAICT, so doesn't
>>>>>> seem like we need to urgently do a workaround on QEMU side, so we
>>>>>> can get Avocado devs to commit to fixing it in the next month.
>>>>>
>>>>> Do we have such a commitment? ... The avocado version in QEMU is completely
>>>>> backlevel these days, it's still using version 88.1 from May 2021, i.e.
>>>>> there hasn't been any update since more than a year. I recently tried to
>>>>> bump it to a newer version on my own (since I'm still suffering from the
>>>>> problem that find_free_port() does not work if you don't have a local IPv6
>>>>> address), but it's not that straight forward since the recent versions of
>>>>> avocado changed a lot of things (e.g. the new nrunner - do we want to run
>>>>> tests in parallel? If so it breaks a lot of the timeout settings, I think),
>>>>> so an update needs a lot of careful testing...
> 
> Hi Daniel,
> 
> if the problem of migrating avocado to latest version on qemu is only in parallel run, I would suggest to disable it with `nrunner.max_parallel_tasks` [1]. Even that the differences between avocado legacy runner and nrunner is huge, the migration should be straight forward. So if you have more issues with migration to the nrunner, I would be happy to help you with that.
> 
> [1] https://avocado-framework.readthedocs.io/en/latest/config/index.html#nrunner-max-parallel-tasks


Thanks Jan and Phil for the infos. I didn't manage to do a successful
Avocado run with the QEMU test though.

What I did, aside from the changes that Phil mentioned in
tests/requirements.txt:

- created a /etc/avocado/avocado.conf to store the settings
- copied python/avocado.cfg from QEMU to avocado.conf
- added the following in avocado.conf:

[nrunner]
max_parallel_tasks  = 1


This allowed me to set Avocado as it would be if running with QEMU
avocado, but even then I had no success. The test get stuck indefinitely
at this point:

(...)
2022-11-10 16:00:20,758 avocado.test INFO | Temporary dir: /var/tmp/avocado_tmp_znhvpbh0/avocado_job_ywyf7v30
2022-11-10 16:00:20,758 avocado.test INFO |
2022-11-10 16:00:20,758 avocado.test INFO | Job ID: 4bb3e2a12c05d84a0a06849ecef435d547a198a0
2022-11-10 16:00:20,758 avocado.test INFO |
2022-11-10 16:00:21,041 avocado.core.task.statemachine DEBUG| <Worker spawner="<avocado.plugins.spawners.process.ProcessSpawner object at 0x7fdad5da5840>" max_triaging=12 max_running=1 task_timeout=None> has been initialized
2022-11-10 16:00:21,041 avocado.core.task.statemachine DEBUG| Task "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": requested -> triaging
2022-11-10 16:00:21,042 avocado.core.task.statemachine DEBUG| Task "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": requirements OK (will proceed to check dependencies)
2022-11-10 16:00:21,042 avocado.core.task.statemachine DEBUG| Task "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": about to be spawned with "<avocado.plugins.spawners.process.ProcessSpawner object at 0x7fdad5da5840>"
2022-11-10 16:00:21,043 avocado.core.task.statemachine DEBUG| Task "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": spawned successfully

No error is provided. Tried to run the test for 10+ minutes and nothing
happens. Hitting CTRL+C aborts the test:

$ make check-avocado AVOCADO_TESTS='tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg'
   GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 dtc
   AVOCADO Downloading avocado tests VM image for ppc64le
The image was downloaded:
Provider Version Architecture File
fedora   31      ppc64le      /home/danielhb/avocado/data/cache/by_location/d73d707673a941f5892e4bb0fa7fabaf0d41fd58/Fedora-Cloud-Base-31-1.9.ppc64le.qcow2
   AVOCADO tests/avocado
JOB ID     : 4bb3e2a12c05d84a0a06849ecef435d547a198a0
JOB LOG    : /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a/job.log
^C
RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 1 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB HTML   : /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a/results.html
JOB TIME   : 396.78 s
make: *** [/home/danielhb/kvm-project/qemu/tests/Makefile.include:142: check-avocado] Error 8

And the log registers the following:

2022-11-10 16:00:21,043 avocado.core.task.statemachine DEBUG| Task "1-tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg": spawned successfully
2022-11-10 16:06:54,071 avocado.test INFO |
2022-11-10 16:06:54,123 avocado.test INFO | Test results available in /home/danielhb/kvm-project/qemu/build/tests/results/job-2022-11-10T16.00-4bb3e2a
2022-11-10 16:06:55,694 avocado.sysinfo DEBUG| Not logging /proc/slabinfo (lack of permissions)
2022-11-10 16:06:55,696 avocado.sysinfo DEBUG| Not logging /proc/pci (file not found)
2022-11-10 16:06:55,712 avocado.sysinfo DEBUG| Not logging /sys/kernel/debug/sched_features (file not found)
[---end of log---]


I'm probably missing more settings.


Daniel


> 
> - Jan
> 
>>>>
>>>> That it is so difficult to update Avocado after barely more than
>>>> 1 year is not exactly a strong vote of confidence in our continued
>>>> use of Avocado long term :-(
>>>
>>>
>>> By the way, Avocado just provided a fix for the problem this patch is trying
>>> to amend:
>>>
>>> https://github.com/avocado-framework/avocado/pull/5515#issuecomment-1308872846
>>
>> Thanks Jan!
>>
>>> Is there an easy way to plug upstream Avocado into QEMU? I would like to test
>>> tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg to see if the problem
>>> is fixed by Avocado upstream.
>>
>> See https://lore.kernel.org/qemu-devel/20200403172919.24621-9-philmd@redhat.com/
>>
>> For your case:
>>
>> -- >8 --
>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>> index 0ba561b6bd..e17bc3972c 100644
>> --- a/tests/requirements.txt
>> +++ b/tests/requirements.txt
>> @@ -4,3 +4,3 @@
>>   # Note that qemu.git/python/ is always implicitly installed.
>> -avocado-framework==88.1
>> +-e git+https://github.com/avocado-framework/avocado.git@b31b868c882d4650d3b7d2fbfc9b8ac0f2c3672b#egg=avocado-framework
>>   pycdlib==1.11.0
>> ---
>>
>> Regards,
>>
>> Phil.
>>
> 

