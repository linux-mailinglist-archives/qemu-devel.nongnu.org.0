Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4AE605941
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 10:03:35 +0200 (CEST)
Received: from localhost ([::1]:45486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQWY-0004q7-L4
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:03:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olQWX-0004K1-JS
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 04:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olQMH-0003dp-Sg
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:52:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1olQMF-00054i-Py
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 03:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666252368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sGyEIeRqURR5x6gOCkBRjm3o4X6mDaFqZTLRzImhrSU=;
 b=CLS8Y8FdEkvxL8atmkNeLX6qFfH9YR874HyDZAYiYS8ofzeA8Db33wNb/xejBpGgwU/zMP
 qtQM0UOuZvlY1H86IoKXz4UG/CRCfrL09oEGUguqyBfFoHOligqIROb++YjvuNGXVP/Xeh
 OEHqpuR+x9PCenYiCMwIuTC+yA3OzVc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-8RAHFdkwMU62Ztcynx424A-1; Thu, 20 Oct 2022 03:52:47 -0400
X-MC-Unique: 8RAHFdkwMU62Ztcynx424A-1
Received: by mail-qt1-f198.google.com with SMTP id
 f19-20020ac84713000000b00397692bdaecso14600995qtp.22
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 00:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sGyEIeRqURR5x6gOCkBRjm3o4X6mDaFqZTLRzImhrSU=;
 b=cWIVDIgL1KD5Ov3P4zyr8J0TexxbCtQcDZCSU8GOIzJqTzgzl+6qYeL1OR1gMuAE6g
 2hW+YlKsnDuIvX6olbdb7GKQ4XaWZZgsHRu32ctWJlpvYPcvrGXLPNWfyIx91G9WDtAE
 Q4dBgfKD1JyaJ5vf9a1vYvzj0SakPkBjzbH/yPlQQyXVp8E/LQCp7Z5vyZ5PP5y27kpo
 PQlQ6Qmrnuc9UMRK6EUvCKPt5DAtRxzayK8cGnrdKtMj6GNVadwvMQfEBtfbX+Ee+rym
 wEcwFygEQwzDZXZm1dYSptbKwTvFhtdNmOFiitsc73U9Q2WBleN+l+oyD+94RQTlZzYD
 q5zw==
X-Gm-Message-State: ACrzQf0JuRzyd00l/iuR70VS8jxAZqQxrxJyNuW8/CCexZq2ZRVh4jXV
 4uVzUZZ9rvFrNhcXkmVn/vAgGSOnqIPvNyi7ElqMFNoyHBFaMPkYRmc/yVHtnNtzP5YM5xL5Gow
 C+CeXrPA3h3xdYAE=
X-Received: by 2002:a0c:da07:0:b0:4b1:933b:57ed with SMTP id
 x7-20020a0cda07000000b004b1933b57edmr10061475qvj.93.1666252366703; 
 Thu, 20 Oct 2022 00:52:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5A3VvDWTXSJOskkM4Acb/KDoeVfx2Fbf4BBUofQClVrK8EgR6Sx2ulmBsnHmek5Wbwf51dWA==
X-Received: by 2002:a0c:da07:0:b0:4b1:933b:57ed with SMTP id
 x7-20020a0cda07000000b004b1933b57edmr10061458qvj.93.1666252366463; 
 Thu, 20 Oct 2022 00:52:46 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-247.web.vodafone.de.
 [109.43.177.247]) by smtp.gmail.com with ESMTPSA id
 q2-20020a05620a0d8200b006cf9084f7d0sm6620256qkl.4.2022.10.20.00.52.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 00:52:45 -0700 (PDT)
Message-ID: <12579dec-e80e-3489-79da-9bc93b68472a@redhat.com>
Date: Thu, 20 Oct 2022 09:52:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: has anybody looked at the long-standing intermittent raspi2
 avocado test failure?
Content-Language: en-US
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <CAFEAcA_hi1VHNVetOKkpUXuYtJ4akdVZxwBqSXf76Zvx=YB6Xg@mail.gmail.com>
 <CAFn=p-aoe1QQMXkgdu_yKxb4jCTahsM1K-Fo+vtXOwG=8=_=Lw@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAFn=p-aoe1QQMXkgdu_yKxb4jCTahsM1K-Fo+vtXOwG=8=_=Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 19/10/2022 22.38, John Snow wrote:
> On Tue, Oct 18, 2022 at 6:23 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> If you run this single avocado test:
>>
>> while ./build/x86/tests/venv/bin/avocado run
>> build/x86/tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
>> ; do true; done
>>
>> then on my machine it will fail within 4 or 5 iterations. Has anybody
>> looked into this? Looking at a log from a failed test
>> https://people.linaro.org/~peter.maydell/raspi-avocado-fail.log
>> what seems to happen is that the test sends the "halt" command to
>> the guest. The DEBUG log reports a transition from RUNNING to
>> DISCONNECTING and the QMP connection disconnects, so presumably
>> the guest really did exit -- or is that something the test framework
>> is doing from its end?
[...]
> "Thanks for the analysis, but, like, what are you going to do to fix
> any of this?"
> 
> Long term, an asyncio version of machine.py will help alleviate these
> kinds of race conditions when dealing with multiple sockets from
> Python as our testing requirements become more complex.
> 
> Short term, I'm not sure...

As a short term fix, what about simply changing the test
like this:

diff a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
                                                  'BCM2835')
          exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                  '/soc/cprman@7e101000')
-        exec_command(self, 'halt')
+        exec_command_and_wait_for_pattern(self, 'halt', 'System halted')
          # Wait for VM to shut down gracefully
          self.vm.wait()
  
By waiting for another console pattern that the guest sends
out after "halt", you can make sure that the connection is
not closed too early.

  Thomas


