Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E1491ECA
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 06:17:10 +0100 (CET)
Received: from localhost ([::1]:47074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9grl-0008Po-DU
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 00:17:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9gof-0007NG-FW
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 00:13:59 -0500
Received: from [2607:f8b0:4864:20::102a] (port=52782
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n9god-00021O-PP
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 00:13:57 -0500
Received: by mail-pj1-x102a.google.com with SMTP id e13so118494pjl.2
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 21:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DxT43eXMSnwkpBFZdpQ+eOs+Y7HjS9cHvbPwiok3JJ8=;
 b=E7x2XmF3feKcQbWkoIHcCae7nynaIoWMcFj7fE8JqqKKvtLoEPkWoZNKisgNkckUmq
 u1XfyVPlxa69E2dpvznF66/2Iiev9cYLiRNVk84+T6GxjHw5t/h5kd4KLItx2jlvOzhQ
 pU+mfm8E/qeoKwCy2pCooXXZ0Kc4bkpBDGnHkMGLRBTnBYQBCwbo8NZRS686hELFShz6
 gbaEhjInrvbda1q6LeGVqawQ54m46lGLK0Z1MsFtJmnBKR2VxsMTwXPzQtVTds5pIscd
 g80T+UkjnexE4P198YmimOXSZsIkyRWFSZiMJPsmqW6Tzs8bjxF2Xaq5FPLFDIWSyB4G
 yKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=DxT43eXMSnwkpBFZdpQ+eOs+Y7HjS9cHvbPwiok3JJ8=;
 b=kc5+Sg2+/21BOy6ODszFHxUBuL4q7pEJfFVy4UEq76SoaROuEsS2iCkif01eWTzF+j
 S21W5uddd/8qSUkIVCpY0DhHYqMzDT+s0DKc5uIpl7tBW7zkdVSCJE+KV7/WutmD/mj/
 Whj6kr1EKfZejbs7pgfTUHuzI/6lp6egogu7525vX5hl2KUEwXZ/lEZieypW+897LGBd
 WGT+hcaDcw1J+alMhmVbVZiDxPUHTI7l+qsIDZGdHD29KjVGJUNkBeDtu0qhiV1zkq6O
 R//YDCNvx7q7HuBhL8CA43AaofuKDB+2vBFKQXfzvSNZDbsLc1sDe9lhaUe2jM39Aske
 omVQ==
X-Gm-Message-State: AOAM533XNF9Mvjergg4HfA+irhQ4bNXIzZkA7aOmkxH2FLbVFw+9BG31
 cTfte5IQYTdr9BDjYt36g5U=
X-Google-Smtp-Source: ABdhPJyno3SwWLnzHVouGNn5qVkmKnFj/BNmsfCaFur20urvPHorYtu6F+hYL9XxlVPYMRf1IAB9dQ==
X-Received: by 2002:a17:90a:5d8d:: with SMTP id
 t13mr29084302pji.47.1642482833837; 
 Mon, 17 Jan 2022 21:13:53 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id om7sm1006002pjb.47.2022.01.17.21.13.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 21:13:53 -0800 (PST)
Message-ID: <f2c56e2d-572a-09f9-8f46-6410275e347b@amsat.org>
Date: Tue, 18 Jan 2022 06:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
 <20220117141103.157288-2-berrange@redhat.com>
 <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
In-Reply-To: <CAFn=p-Z4sn94+i18JjEnXgPTJK1H0GBqjCA3kwxtHdrELcOc5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 18/1/22 00:27, John Snow wrote:
> On Mon, Jan 17, 2022 at 9:11 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
>>
>> With the current 'qmp-shell' tool developers must first spawn QEMU with
>> a suitable -qmp arg and then spawn qmp-shell in a separate terminal
>> pointing to the right socket.
>>
>> With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
>> just pass the QEMU command and arguments they want. The program will
>> listen on a UNIX socket and tell QEMU to connect QMP to that.
>>
>> For example, this:
>>
>>   # qmp-shell-wrap -- qemu-system-x86_64 -display none
>>
>> Is roughly equivalent of running:
>>
>>   # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
>>   # qmp-shell qmp-shell-1234
>>
>> Except that 'qmp-shell-wrap' switches the socket peers around so that
>> it is the UNIX socket server and QEMU is the socket client. This makes
>> QEMU reliably go away when qmp-shell-wrap exits, closing the server
>> socket.
>>
>> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>   python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++---
>>   scripts/qmp/qmp-shell-wrap   | 11 +++++++
>>   2 files changed, 68 insertions(+), 4 deletions(-)
>>   create mode 100755 scripts/qmp/qmp-shell-wrap

>> diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
>> new file mode 100755
>> index 0000000000..9e94da114f
>> --- /dev/null
>> +++ b/scripts/qmp/qmp-shell-wrap
>> @@ -0,0 +1,11 @@
>> +#!/usr/bin/env python3
>> +
>> +import os
>> +import sys
>> +
>> +sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
>> +from qemu.qmp import qmp_shell
>> +
>> +
>> +if __name__ == '__main__':
>> +    qmp_shell.main_wrap()
>> --
>> 2.33.1
>>
> 
> Adds some new failures to the python linters; try "make check-dev" in
> the python sub-dir.
> 
> ... Though, due to a bug in avocado, this helpfully doesn't actually
> show you the failure output right now ...
> 
> making this little edit should fix that, sorry for the inconvenience here.
> 
> diff --git a/python/avocado.cfg b/python/avocado.cfg
> index c7722e7ecd..a460420059 100644
> --- a/python/avocado.cfg
> +++ b/python/avocado.cfg
> @@ -1,5 +1,5 @@
>   [run]
> -test_runner = runner
> +test_runner = nrunner

Cc'ing Beraldo, Willian once told me the nrunner switch was scheduled
for QEMU next release.

