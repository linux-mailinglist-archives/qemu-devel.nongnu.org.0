Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD8E4B8C4E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 16:21:35 +0100 (CET)
Received: from localhost ([::1]:54988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKM7Z-0008JQ-VH
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 10:21:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM63-0006rw-7S
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:19:59 -0500
Received: from [2607:f8b0:4864:20::533] (port=35784
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nKM5y-0005iX-UR
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 10:19:56 -0500
Received: by mail-pg1-x533.google.com with SMTP id p23so2433608pgj.2
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 07:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fxf8Q7A+u/RHPuNU4v2o8/71t306Wi91gBMY6Nw2lAY=;
 b=ZzaQ/PaG+tRcAXnUhQv3m/d2FIe1JlHyU3YD+wuTwzXhupaC8Znik7EqHS/itTJdlG
 k+tgIb2UHiE7aUB5vx1MzrsaAGq7okZAaDFnk8whCF1vfkYG5IX+5dgUDnm5+p1VEgL9
 jW5nC0MBvK/euKK1gF71TkH8AoS6WspP1ugvWvfM3QMeyqwIDx+M2wBE6YvMtHRvzxWu
 6JkjYX51aqGwU2yLDX38FwvRQhNyANN6ReYAgiYyh0qfuqhJH4udOKoBUrVBFF3JuUkK
 CcTQbX+RZJ/eai3XU9SZpqyGlt+pojJg/CdHk0NWynvhFux8qOc2Ksf/C52sPF8WCvgF
 jFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Fxf8Q7A+u/RHPuNU4v2o8/71t306Wi91gBMY6Nw2lAY=;
 b=6adBVyerMSwExJqd5QcgcSa1xBkj202o/cUBJIt9/DglK2ZQNa04khrqS2TT5fu5Eh
 iOmfGQEdCExzb2SGc9/O2FYia8qjhG6WkLPLjOCLyd4mFthOz1CtupeXjaiDM7IA+5pb
 GdtIZasHT0rr8aAdZEx1iRxDHGEw9A0JNg65D5Xxg/KDADdHbWAU7mevxTKx8QtYreHJ
 lZwRQBVx1kP8ExXP65Q/JbWFLfXDPro6qhMj7Ep/Jw4EzpE85GOgn5UBDJ8U3o++NFdi
 uL1OcRPzAPeZgRJ3PJ5/ie+6RLER43piRJLckG8U29p34OGBS0N+XQTZ+fYNNDzdJhub
 J86g==
X-Gm-Message-State: AOAM532DIjwnd55iNBOTbRJkNjxGsQ23BJ8lqmNuk7QkMJoHIZW5jV/f
 en57aYJE54JGPDMg/+Xx/HQ=
X-Google-Smtp-Source: ABdhPJwBxtTGCxUGaL5pwxxHzPxC4ncX43k0aC5mKJj40V5ma+ni0aVZ/TE3cFf3VnCoISlYR6PhPA==
X-Received: by 2002:a63:a17:0:b0:364:9963:851f with SMTP id
 23-20020a630a17000000b003649963851fmr2703180pgk.402.1645024785190; 
 Wed, 16 Feb 2022 07:19:45 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id x14sm5559124pgc.60.2022.02.16.07.19.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 07:19:44 -0800 (PST)
Message-ID: <b49dd3a5-259d-2379-0125-9d3b52a0d975@amsat.org>
Date: Wed, 16 Feb 2022 16:19:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Vitaly Chikunov <vt@altlinux.org>,
 Peter Maydell <peter.maydell@linaro.org>, "Dmitry V . Levin"
 <ldv@altlinux.org>
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <20220214144351.dp57o6jyfvliwkos@altlinux.org>
 <20220215080137.021f6938@bahia> <1736989.e8qiMhLugc@silver>
In-Reply-To: <1736989.e8qiMhLugc@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: 3
X-Spam_score: 0.3
X-Spam_bar: /
X-Spam_report: (0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 16/2/22 11:30, Christian Schoenebeck wrote:
> On Dienstag, 15. Februar 2022 08:01:37 CET Greg Kurz wrote:
>> On Mon, 14 Feb 2022 17:43:51 +0300
>>
>> Vitaly Chikunov <vt@altlinux.org> wrote:
>>> Why g_new0 and not just g_malloc0? This is smallest code change, which
>>> seems appropriate for a bug fix.
>>
>> I prefer g_new0() for the exact reasons that are provided in QEMU's
>> official coding style docs/devel/style.rst:
> [...]
>> I'm fine with the acceptable version as well. The only important thing is
>> to fix the synth backend.
>>
>> Cheers,
> 
> Hi, is anybody working on a v5 of this patch? If not I will send one this
> evening to bring this issue forward, because it is blocking my queue.

If a patch blocks your tree queue, you can simply drop it, ask the
contributor to rework it, and keep merging your tree...

