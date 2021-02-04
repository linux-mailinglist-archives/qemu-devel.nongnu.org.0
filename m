Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7130EF0D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 09:54:06 +0100 (CET)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aOq-0002j3-VD
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 03:54:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7aNk-0001au-0b; Thu, 04 Feb 2021 03:52:56 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:46229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7aNi-000457-Gs; Thu, 04 Feb 2021 03:52:55 -0500
Received: by mail-ed1-x535.google.com with SMTP id y18so3080710edw.13;
 Thu, 04 Feb 2021 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YRBwtqdmkvWWALcEF2e/qcXfAT8b2ppuWWtWSMJDD6E=;
 b=p1dk5Bar7sbghU+d0sAZMGwiU15aGlZutR3Yid83BugkjVRO8o4N8i5T2Sr4AnU53z
 fd/8mie3CmXNnt7n3uarAH6BhSZtvLUHcHlKmX88P94GMts0JkhrYOyA3GLYgwqUWIKW
 N/6BtEyY3+9OY7CNvt3NC3pLvlVR5y5QzYI64sfhbsjeqLmVP1ut+KGDZcbHcHYdoI4Y
 PRLqN6HHX0DtTjEHel97DjQvj9tslufIUovdNtegs45jYVl5yr0WoMGd7y885ZwD8Ij5
 KuoYVkTf7JO6SUyhJ3h4AX0BpCp/gMOaEFb5FTa2RMuf8iXSKidoCE8/NYz8u87JGaen
 0wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YRBwtqdmkvWWALcEF2e/qcXfAT8b2ppuWWtWSMJDD6E=;
 b=eaDDNMKZzxGT4pq9iaNuIK42xYqpeJwDOSLcJwj0LqZRGkwPyuz4m2Ox0MkUfUTneo
 DKYFQ6ob8VEtoNhJwGZeFzma+HxxzxyJIOYf0i+/mA8ldD7HXo3s+7gbUnsUFYTr+xK7
 TXYmlmVp0p5rkGAeOCj5t2iy7BUm/MtRBRTyA+f5Ix7K9qmiWe39u74Rxm/ZgNgverjW
 D4ZbEMKq0uSkT+RIrbcBMJbkHxK51VzT7p2hJLL/mr9w2NUvVgK/7KWMOOJBJQHuaDQr
 8JN1Qje+EpiWlPrDk+2ksheM3WRb0F0/4zmcm+nhlKEckseVL+5xr49AVRTL7JnKp/Z6
 QQkg==
X-Gm-Message-State: AOAM530DUc5h12Q0NI+1lEqoTmzjfkcHxiVO9Cd4aaSTaeOSWI/1cDAH
 1SaHYpiTVvnqVWbURfubk9I=
X-Google-Smtp-Source: ABdhPJznKOWrw0Gdm3gMKfDtxcznpuV/clvi8xq+cuR1GCY0DFwHzOHP59BYJWV2lHpK529kk+w2Fg==
X-Received: by 2002:a05:6402:2707:: with SMTP id
 y7mr6760289edd.5.1612428772565; 
 Thu, 04 Feb 2021 00:52:52 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id bo12sm2108935ejb.93.2021.02.04.00.52.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 00:52:51 -0800 (PST)
Subject: Re: [PATCH 1/3] tests/acceptance: Move the pseries test to a separate
 file
To: Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
References: <20210112164045.98565-1-thuth@redhat.com>
 <20210112164045.98565-2-thuth@redhat.com>
 <6cb6f7dd-2f9e-05c3-0efe-8f7f9f75fe84@redhat.com>
 <67dde2d9-1d87-35fa-9233-9264b0731e28@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <23ca4afc-97a9-7438-0182-93cd49271d4e@amsat.org>
Date: Thu, 4 Feb 2021 09:52:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <67dde2d9-1d87-35fa-9233-9264b0731e28@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x535.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Thomas,

On 1/13/21 6:30 AM, Thomas Huth wrote:
> On 12/01/2021 19.50, Wainer dos Santos Moschetta wrote:
>> Hi,
>>
>> On 1/12/21 1:40 PM, Thomas Huth wrote:
>>> Let's gather the POWER-related tests in a separate file.
>>
>>
>> Did you consider having others ppc/ppc64 boot tests together too?
>>
>> Some candidates:
>>
>> tests/acceptance/boot_linux.py:BootLinuxPPC64.test_pseries_tcg
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc64_e500
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_g3beige
>> tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ppc_mac99
> 
> The e500, g3beige and mac99 tests are depending on the
> do_test_advcal_2018() function in that file, so I think they should
> rather stay there.
> 
>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_factory_firmware_and_netbsd
>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_192m
>> tests/acceptance/ppc_prep_40p.py:IbmPrep40pMachine.test_openbios_and_netbsd
>>
> 
> That's a good point, I did not notice that file when writing my patches.
> Philippe, since you've created this ppc_prep_40p.py file, what do you
> think, should it be merged with the other ppc tests, or shall we rather
> keep this separate?

The choice was deliberate: the PReP machine has a different set of
maintainers. If possible when we have a particular section in
MAINTAINERS I'd like to use it as separation, to let the maintainers
track changes in tests.

In this example, Hervé is interested to look for PReP related files,
but doesn't have bandwidth to look at all PPC patches.

If this doesn't scale, I suggested (was it on the list or directly
to Willian?) to add a Python script to map Avocado test tags to
MAINTAINERS entry, so 1/ maintainers could run all tests linked to
their subsystem by naming the subsystem, and 2/ when a test fails
we know which maintainer to contact.

Regards,

Phil.

