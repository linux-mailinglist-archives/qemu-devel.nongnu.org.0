Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C653219E5
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:14:37 +0100 (CET)
Received: from localhost ([::1]:34760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEByu-0002aL-Cn
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:14:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBxe-00024y-OL; Mon, 22 Feb 2021 09:13:18 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEBxd-00008i-3m; Mon, 22 Feb 2021 09:13:18 -0500
Received: by mail-ej1-x631.google.com with SMTP id k13so27741977ejs.10;
 Mon, 22 Feb 2021 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7PdLgiMFWoEOGj++6sqxs2/4bwCc4s79eU/iEwj4/y0=;
 b=NP1H4bvZT2ndby5018zmwyOHVM+j4M8P6hgMaYE423e9RTr0hARPKKHo1J6P0MZ2MH
 us7DB0SVen8aalLSoQwKgkQHe8j7CNO5uWSpmTnp8E1jpFedIDEzQb2ZeHqHDv81Q9Vp
 +MOS6lPnvgV9771836Mr8rnWNKHZQO9dJ9R5+f/rygG95X86tK9zmIk6jNnU+2A3SDAu
 9cXRkPJ048oDCHd+HrF3SAL/Y8LtKwI728T3ZqU19a0RWVgaVmJkcA+OKvVpay0Gltjl
 IEbIktfeppOhzcVO1gOgqZKp1iSQMBxNhAh95tvxnkM+RhbPVZuS7fMu8box1p3tXQkV
 BqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PdLgiMFWoEOGj++6sqxs2/4bwCc4s79eU/iEwj4/y0=;
 b=qq+GzLwMl3maAv2Jj2oIuXaCuv0fvnpX++IBmXOQ5qBtMclXPM8PS/IRSaQ2aKbIh9
 SctgIlJNzX7AP2BPoyzbIpI7Gy9cXiRWu+ROOTlHVvJIKWhAvL1sxVunGlLMEtiR3pDk
 MELSIHwGsvaIthAFZC9zGcNnRe8hA/fiCFJDmdSE5ZQ6EQ8owmwW6uKNDwmqdLgapu09
 6embkzPKZFkg6pq5+aKdRW7mxkOmPLXqcRF/PfGrGYD3TA2hDfcm+QGgREI3UF+Lpkm0
 xWYQS0T7nWYhesHqHdRb86wfH6cGxlHEO6BPo89fw2AFtfj7toEEgLa+8ALo00qaslhQ
 Neqw==
X-Gm-Message-State: AOAM532+sbh4izy9jFpMEAEtgs+Aidqg1G7i7dLnJW3AlCzr1STB/jme
 HH3TWX27RzgoZA7K2jrcDdk=
X-Google-Smtp-Source: ABdhPJz7P5ayVF1yUNNOiagQXf7ESP9pYz1OEscTvNZLHoFEnxugu/GvbzWupB0zWjhdHjELgDxuUA==
X-Received: by 2002:a17:906:5905:: with SMTP id
 h5mr19615616ejq.531.1614003195040; 
 Mon, 22 Feb 2021 06:13:15 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f20sm8582799ejx.16.2021.02.22.06.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 06:13:14 -0800 (PST)
Subject: Re: [PATCH v3 1/8] hw/sh4: Add missing license
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210221215915.2568943-1-f4bug@amsat.org>
 <20210221215915.2568943-2-f4bug@amsat.org>
 <CAFEAcA8myJg96kdcMX+aQJm=ngPdW564=b46N=knFCO-dGkiYg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f243ee8c-39de-5b48-b329-9440594a3f2a@amsat.org>
Date: Mon, 22 Feb 2021 15:13:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8myJg96kdcMX+aQJm=ngPdW564=b46N=knFCO-dGkiYg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Samuel Tardieu <sam@rfc1149.net>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 2:55 PM, Peter Maydell wrote:
> On Sun, 21 Feb 2021 at 21:59, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> This code was introduced in commit 27c7ca7e775,
>> ("SHIX board emulation (Samuel Tardieu)"). Use
>> the same license.
>>
>> Cc: Samuel Tardieu <sam@rfc1149.net>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  include/hw/sh4/sh.h | 12 +++++++++---
>>  hw/block/tc58128.c  |  7 +++++++
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/sh4/sh.h b/include/hw/sh4/sh.h
>> index 93f464bf4cd..33dde7a56dd 100644
>> --- a/include/hw/sh4/sh.h
>> +++ b/include/hw/sh4/sh.h
>> @@ -1,6 +1,12 @@
>> -#ifndef QEMU_SH_H
>> -#define QEMU_SH_H
>> -/* Definitions for SH board emulation.  */
>> +/*
>> + * Definitions for SH board emulation
>> + *
>> + * Copyright (c) 2005 Samuel Tardieu
>> + *
>> + * SPDX-License-Identifier: MIT
>> + */
> 
> I thought it wasn't generally recommended to convert
> a license text to a single SPDX line? The sh7750.c file
> has a full 3-para license text.

Yes you are right, sorry. I'll respin.

Phil.

