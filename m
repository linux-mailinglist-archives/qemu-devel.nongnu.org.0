Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21071567B14
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 02:17:46 +0200 (CEST)
Received: from localhost ([::1]:33896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8sjg-0003sb-Ld
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 20:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o8shR-000338-Ev
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 20:15:25 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:53867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcx4c70@gmail.com>) id 1o8shO-00023K-Pg
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 20:15:25 -0400
Received: by mail-pj1-x102c.google.com with SMTP id ju17so8590428pjb.3
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 17:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=6+6XSmU8sjudJyrG0avY/k6YyeZbJUzbEuHZ1Xe3dNw=;
 b=jnrnyPKrI89H9KbrjZDcuEbZXMcBTXaxIWii9gX48IGcKunXe/eE6Cgk9AEUKPOrxl
 3smhC+2Ai3BCMOLBpGSDpi45HhPNX15d+yjjl3DcCCTaSRE6Us9xU9mSk6zQ5NnxxFEX
 Cm+z+IJk4/MBZxscc2vpdTDQY09R/Zz4VQ1AgBaiCWUE3UG3fEOBjRbopeyqz1vlFtod
 LM8DkVD/H3Bys9RtPbHSC4UHFwgQ6CbhqyMJYagNaKy4deS9NNLm1llGAfV9qLRbXITE
 MpQun+Nd91n4oH71p+8jK8dBf4Gq4QOOSAB7XsFs2vF5uG8/Z6zJjv6nzcDlZsBRF19V
 nAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6+6XSmU8sjudJyrG0avY/k6YyeZbJUzbEuHZ1Xe3dNw=;
 b=IqYaP6mcten+HnNzQ3ThQq9Lw0qysTlHrn9ffm4ls/FtAHnDDh4kJzp0lmkxP8UvqB
 Lu8IRpnXP/TSEcHOczYfkui0Lszv33HV86vIsekxaF7IkgLUZtI+H9Q/NK5zAG+xTMqq
 vU8DkkvZYg77eSu5ifrExToEbTs9Il2T6ObI2GtY0KUGpQt24zDan+vhGBCdrx2yiP91
 MSIBFCSA0pasviwSKFTksc8VZJFz6fzlKR814rE6apLuhQkenSch6Ynj8AdGS0g66lLq
 hEIi9gtI8ePF4NPG+Z/JnN65cb6I0timhZThbFRuKp28oTWgoCXrDMiD6/wpM6Bdqw/1
 Uz+A==
X-Gm-Message-State: AJIora8v0z1hsjCZdVeglCAliwlIGg5xePaplyC0eA1EkYfXLHiPsPwT
 MYgjNJ0wbMNwH46gADv1MHs=
X-Google-Smtp-Source: AGRyM1vMC9Q3zCvEr3K/AavgvACIa4R3ivU9HvRkGMcPCF/NvBK66M6ilIj+ouv2d1vXbyi0dOovcA==
X-Received: by 2002:a17:902:ea0e:b0:16b:f92b:a3c3 with SMTP id
 s14-20020a170902ea0e00b0016bf92ba3c3mr3624959plg.10.1657066519709; 
 Tue, 05 Jul 2022 17:15:19 -0700 (PDT)
Received: from ?IPV6:2404:f801:0:5::ce? ([2404:f801:9000:1a:6fea::ce])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a170902768b00b001637997d0d4sm23928338pll.206.2022.07.05.17.15.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 17:15:19 -0700 (PDT)
Message-ID: <20a9104e-f91c-78f9-b55d-2197c6ab3364@gmail.com>
Date: Wed, 6 Jul 2022 08:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH V8 20/39] cpr: restart mode
Content-Language: en-US
To: Steven Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Mark Kanda <mark.kanda@oracle.com>,
 Guoyi Tu <tugy@chinatelecom.cn>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-21-git-send-email-steven.sistare@oracle.com>
 <2533a4a5-e117-5ea2-c62f-db7fed3d64b1@gmail.com>
 <24166b92-f96b-7eda-f480-c654d5e93e63@oracle.com>
From: Peng Liang <tcx4c70@gmail.com>
In-Reply-To: <24166b92-f96b-7eda-f480-c654d5e93e63@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=tcx4c70@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On 7/6/2022 2:29 AM, Steven Sistare wrote:
> On 7/3/2022 4:15 AM, Peng Liang wrote:
>> On 6/15/2022 10:52 PM, Steve Sistare wrote:
>>> Provide the cpr-save restart mode, which preserves the guest VM across a
>>> restart of the qemu process.  After cpr-save, the caller passes qemu
>>> command-line arguments to cpr-exec, which directly exec's the new qemu
>>> binary.  The arguments must include -S so new qemu starts in a paused state.
>>> The caller resumes the guest by calling cpr-load.
>>>
>>> To use the restart mode, guest RAM must be backed by a memory-backend-file
>>> with share=on.  The '-cpr-enable restart' option causes secondary guest
>>> ram blocks (those not specified on the command line) to be allocated by
>>> mmap'ing a memfd.  The memfd values are saved in special cpr state which
>>> is retrieved after exec, and are kept open across exec, after which they
>>> are retrieved and re-mmap'd.  Hence guest RAM is preserved in place, albeit
>>> with new virtual addresses in the qemu process.
>>>
>>> The restart mode supports vfio devices and memory-backend-memfd in
>>> subsequent patches.
>>>
>>> cpr-exec syntax:
>>>   { 'command': 'cpr-exec', 'data': { 'argv': [ 'str' ] } }
>>>
>>> Add the restart mode:
>>>   { 'enum': 'CprMode', 'data': [ 'reboot', 'restart' ] }
>>>
>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>> ---
>>>  migration/cpr.c   | 35 +++++++++++++++++++++++++++++++++++
>>>  qapi/cpr.json     | 26 +++++++++++++++++++++++++-
>>>  qemu-options.hx   |  2 +-
>>>  softmmu/physmem.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>>>  trace-events      |  1 +
>>>  5 files changed, 107 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/migration/cpr.c b/migration/cpr.c
>>> index 1cc8738..8b3fffd 100644
>>> --- a/migration/cpr.c
>>> +++ b/migration/cpr.c
>>> @@ -22,6 +22,7 @@ static int cpr_enabled_modes;
>>>  void cpr_init(int modes)
>>>  {
>>>      cpr_enabled_modes = modes;
>>> +    cpr_state_load(&error_fatal);
>>>  }
>>>  
>>>  bool cpr_enabled(CprMode mode)
>>> @@ -153,6 +154,37 @@ err:
>>>      cpr_set_mode(CPR_MODE_NONE);
>>>  }
>>>  
>>> +static int preserve_fd(const char *name, int id, int fd, void *opaque)
>>> +{
>>> +    qemu_clear_cloexec(fd);
>>> +    return 0;
>>> +}
>>> +
>>> +static int unpreserve_fd(const char *name, int id, int fd, void *opaque)
>>> +{
>>> +    qemu_set_cloexec(fd);
>>> +    return 0;
>>> +}
>>> +
>>> +void qmp_cpr_exec(strList *args, Error **errp)
>>> +{
>>> +    if (!runstate_check(RUN_STATE_SAVE_VM)) {
>>> +        error_setg(errp, "runstate is not save-vm");
>>> +        return;
>>> +    }
>>> +    if (cpr_get_mode() != CPR_MODE_RESTART) {
>>> +        error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>>> +        return;
>>> +    }
>>> +
>>> +    cpr_walk_fd(preserve_fd, 0);
>>> +    if (cpr_state_save(errp)) {
>>> +        return;
>>> +    }
>>> +
>>> +    assert(qemu_system_exec_request(args, errp) == 0);
>>> +}
>>> +
>>>  void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
>>>  {
>>>      QEMUFile *f;
>>> @@ -189,6 +221,9 @@ void qmp_cpr_load(const char *filename, CprMode mode, Error **errp)
>>>          goto out;
>>>      }
>>>  
>>> +    /* Clear cloexec to prevent fd leaks until the next cpr-save */
>>> +    cpr_walk_fd(unpreserve_fd, 0);
>>> +
>>>      state = global_state_get_runstate();
>>>      if (state == RUN_STATE_RUNNING) {
>>>          vm_start();
>>> diff --git a/qapi/cpr.json b/qapi/cpr.json
>>> index 11c6f88..47ee4ff 100644
>>> --- a/qapi/cpr.json
>>> +++ b/qapi/cpr.json
>>> @@ -15,11 +15,12 @@
>>>  # @CprMode:
>>>  #
>>>  # @reboot: checkpoint can be cpr-load'ed after a host reboot.
>>> +# @restart: checkpoint can be cpr-load'ed after restarting qemu.
>>>  #
>>>  # Since: 7.1
>>>  ##
>>>  { 'enum': 'CprMode',
>>> -  'data': [ 'none', 'reboot' ] }
>>> +  'data': [ 'none', 'reboot', 'restart' ] }
>>>  
>>>  ##
>>>  # @cpr-save:
>>> @@ -38,6 +39,11 @@
>>>  # issue the quit command, reboot the system, start qemu using the same
>>>  # arguments plus -S, and issue the cpr-load command.
>>>  #
>>> +# If @mode is 'restart', the checkpoint remains valid after restarting
>>> +# qemu using a subsequent cpr-exec.  Guest RAM must be backed by a
>>> +# memory-backend-file with share=on.
>>> +# To resume from the checkpoint, issue the cpr-load command.
>>> +#
>>>  # @filename: name of checkpoint file
>>>  # @mode: @CprMode mode
>>>  #
>>> @@ -48,6 +54,24 @@
>>>              'mode': 'CprMode' } }
>>>  
>>>  ##
>>> +# @cpr-exec:
>>> +#
>>> +# Restart qemu by directly exec'ing @argv[0], replacing the qemu process.
>>> +# The PID remains the same.  Must be called after cpr-save restart.
>>> +#
>>> +# @argv[0] should be the path of a new qemu binary, or a prefix command that
>>> +# in turn exec's the new qemu binary.  The arguments must match those used
>>> +# to initially start qemu, plus the -S option so new qemu starts in a paused
>>> +# state.
>>> +#
>>> +# @argv: arguments to be passed to exec().
>>> +#
>>> +# Since: 7.1
>>> +##
>>> +{ 'command': 'cpr-exec',
>>> +  'data': { 'argv': [ 'str' ] } }
>>> +
>>> +##
>>>  # @cpr-load:
>>>  #
>>>  # Load a virtual machine from the checkpoint file @filename that was created
>>> diff --git a/qemu-options.hx b/qemu-options.hx
>>> index 6e51c33..1b49360 100644
>>> --- a/qemu-options.hx
>>> +++ b/qemu-options.hx
>>> @@ -4484,7 +4484,7 @@ SRST
>>>  ERST
>>>  
>>>  DEF("cpr-enable", HAS_ARG, QEMU_OPTION_cpr_enable, \
>>> -    "-cpr-enable reboot    enable the cpr mode\n",
>>> +    "-cpr-enable reboot|restart    enable the cpr mode\n",
>>>      QEMU_ARCH_ALL)
>>>  SRST
>>>  ``-cpr-enable reboot``
>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>> index 822c424..412cc80 100644
>>> --- a/softmmu/physmem.c
>>> +++ b/softmmu/physmem.c
>>> @@ -44,6 +44,7 @@
>>>  #include "qemu/qemu-print.h"
>>>  #include "qemu/log.h"
>>>  #include "qemu/memalign.h"
>>> +#include "qemu/memfd.h"
>>>  #include "exec/memory.h"
>>>  #include "exec/ioport.h"
>>>  #include "sysemu/dma.h"
>>> @@ -1962,6 +1963,40 @@ static void dirty_memory_extend(ram_addr_t old_ram_size,
>>>      }
>>>  }
>>>  
>>> +static bool memory_region_is_backend(MemoryRegion *mr)
>>> +{
>>> +    return !!object_dynamic_cast(mr->parent_obj.parent, TYPE_MEMORY_BACKEND);
>>> +}
>>
>> Maybe or mr->owner is more readable?
> 
> Maybe OBJECT(mr)->parent.

Yes. I meaned "OBJECT(mr)->parent or mr->owner" originally, but "OBJECT(mr)" was missing
(maybe I deleted it mistakely).

[...]

