Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A18A044239A
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 23:54:35 +0100 (CET)
Received: from localhost ([::1]:36752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhgCI-00029E-Ge
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 18:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhg0B-00080v-Vs; Mon, 01 Nov 2021 18:42:03 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhg0A-000597-AE; Mon, 01 Nov 2021 18:42:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso624412wmh.0; 
 Mon, 01 Nov 2021 15:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RgDdsgLklMz6z4o8iyUI5puXxSVAMsXfZzKmALZeDqM=;
 b=UnO0hGrPSHNy5EskmD+hN7xirmF9mPH0BeYxNpvUgVWRWL6HsNxUFNWhGuGWhCEbhm
 c+hUXmRHpKLKqOb/N/u2Cqh6LNsmPov+dO35OdC98Dzf04sq01mQXmz0h8CtLe1sGVQc
 vmB+z4UE6Z1ET9t7J1uN6qw4iweUhInvyis6tN6KbNvpr4MtS59BbS6d4JjNaB6UnA7S
 fy7CSg+JBhYHeAq97KUvb1Nnwo4Q59q+oc7oQW/1nmtG0LiD5qArTYooYraFWeNouQOI
 qLMIrlAo1JTtVoulakr8GzxapUa+wbUE1RE2FEpZyucuI592af2rACEMs4zhptHty/PF
 D+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RgDdsgLklMz6z4o8iyUI5puXxSVAMsXfZzKmALZeDqM=;
 b=PDFJffM8wh4iFIqwCm5QlWaWqinBSrkfX/M3uBoHgFUaNIEMkxVy0ZVUdzX8fyEOz7
 AsbEtGBcgDcwZMWiz1WFZd7RhPXQ5Ld9Dzh0cUU4T1kuXFEGEMDfVkrLblfctEKKkfAU
 RYIo6jNMufJv8A96OmyyEHejTGESQ1eYUXMCek/p/Cwd0Gxq4xFUwmPUiHAOLD9XmzXh
 GZat7ttiFYy9fBNvQFyhXpCzzLtobjrZ4HKikxdjGGmI8YyqKhox8BKVSi64J+1YUmfT
 Di34+yM/GOEhUMgd6PBn5lSupUlw5IQUunx6eIwiCClVkmQDpOBYK1axRfwiDyZI/HjL
 Aj5Q==
X-Gm-Message-State: AOAM533RAyIJvHOweyVonHNJ7O2HFrtB3hmjX6HJ5lb3OfMSWfBbDKpK
 w7jWN/gmJ2QY49GqkXRBtxk=
X-Google-Smtp-Source: ABdhPJyMi++VJo1Ef5a/QDKUVLnGSjSnhe7PNb5+Bh6vlKZS3BB9e6XNLmWMdCzhw67o3ZHNxC8OIA==
X-Received: by 2002:a1c:770e:: with SMTP id t14mr2049110wmi.173.1635806519910; 
 Mon, 01 Nov 2021 15:41:59 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id a4sm666841wmb.39.2021.11.01.15.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Nov 2021 15:41:59 -0700 (PDT)
Message-ID: <243f4bb4-7d74-635d-de5c-6485e558c09f@amsat.org>
Date: Mon, 1 Nov 2021 23:41:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 5/6] tests/acceptance: Add bFLT loader linux-user test
Content-Language: en-US
To: Willian Rampazzo <wrampazz@redhat.com>
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-6-f4bug@amsat.org>
 <CAKJDGDb81ST8YyYw-8KV+jx0mjaqdd9siKL2sFM4yaFwG5769w@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAKJDGDb81ST8YyYw-8KV+jx0mjaqdd9siKL2sFM4yaFwG5769w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.14,
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
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Warner Losh <imp@bsdimp.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 18:51, Willian Rampazzo wrote:
> Hi, Phill,
> 
> On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Add a very quick test that runs a busybox binary in bFLT format:
>>
>>   $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
>>     avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
>>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>   JOB TIME   : 0.54 s
>>
>> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
>>  1 file changed, 54 insertions(+)
>>  create mode 100644 tests/acceptance/load_bflt.py
>>
>> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
>> new file mode 100644
>> index 00000000000..f071a979d8e
>> --- /dev/null
>> +++ b/tests/acceptance/load_bflt.py
>> @@ -0,0 +1,54 @@
>> +# Test the bFLT loader format
>> +#
>> +# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
>> +#
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +
>> +import os
>> +import bz2
>> +import subprocess
>> +
>> +from avocado import skipUnless
>> +from avocado_qemu import QemuUserTest
>> +from avocado_qemu import has_cmd
>> +
>> +
>> +class LoadBFLT(QemuUserTest):
>> +
>> +    def extract_cpio(self, cpio_path):
>> +        """
>> +        Extracts a cpio archive into the test workdir
>> +
>> +        :param cpio_path: path to the cpio archive
>> +        """
>> +        cwd = os.getcwd()
>> +        os.chdir(self.workdir)
>> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
>> +            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
>> +                           stderr=subprocess.DEVNULL)
>> +        os.chdir(cwd)
>> +
>> +    @skipUnless(*has_cmd('cpio'))
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
>> +    def test_stm32(self):
>> +        """
>> +        :avocado: tags=arch:arm
>> +        :avocado: tags=linux_user
>> +        :avocado: tags=quick
>> +        """
>> +        # See https://elinux.org/STM32#User_Space
>> +        rootfs_url = ('https://elinux.org/images/5/51/'
>> +                      'Stm32_mini_rootfs.cpio.bz2')
>> +        rootfs_hash = '9f065e6ba40cce7411ba757f924f30fcc57951e6'
>> +        rootfs_path_bz2 = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
>> +        busybox_path = self.workdir + "/bin/busybox"
> 
> If there are other changes to this patch, also, change this to use the
> `os` library:
> 
> busybox_path = os.path.join(self.workdir, "/bin/busybox")

OK, I'll update.

