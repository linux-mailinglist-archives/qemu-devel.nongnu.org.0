Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA3747E100
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 10:52:02 +0100 (CET)
Received: from localhost ([::1]:51336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0KlV-00059j-QR
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 04:52:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0KjR-0003o6-FN
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:49:53 -0500
Received: from [2a00:1450:4864:20::333] (port=53838
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n0KjP-0002U7-MV
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 04:49:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id l4so3243276wmq.3
 for <qemu-devel@nongnu.org>; Thu, 23 Dec 2021 01:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9bsYxWB0k6BJi23M4Ft/l58q6k4u1Y595CbcJ47qvKY=;
 b=W0QJjNM9rZEazbEtQOWFMIaI8bBWujKuJe61KRmXXQGBjjOP+kzE0ObWgTz6V3tErY
 6KG7FVVKp+JZg68KCIvgQFEwFMfSSChxjxGchRyqUae+4UPcs6DJoa12bsL2x4fxV+ri
 rBrqEHYJie0iUJxcb7Av8HGnrzg2ObWfZoPWgrHIHHxwDpokvdUodSA8uMYEoOpimFAm
 MTWv5tBvhX6mj7P10/6T4sSr/C/U846ggvc16slahgzAz9Fv7fIvLDR/YqwCDrU3h8yR
 EeGFKSv9U65Lq8ViIWTr3Qkzgt7dydm+r/Vk9bdFG4zrCQwLJxbuwO3Wev0zkcW/QJQ8
 olVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=9bsYxWB0k6BJi23M4Ft/l58q6k4u1Y595CbcJ47qvKY=;
 b=5IaGR2Y8+6NRSwk+B42mS9mVCdw9sH/Bmns2Gu9P/kFAdFFtvwT1N53v+Sg7vwSh4/
 Gr442ICrMbWd1HmZkz2Fg+o/2fzAvu8Pnd80Rgq54tNj64cprfGu1HLrjnFdIfaLj6P0
 Ut8rFskRh/eVXRvQlz1VP8htQ/kfZ4InbtjfaLr3oIZrpcUz5vjeEV1VVjSBkMAqBILH
 CCj7IuvWTOj5wMwn33yadb4NPYSUljG2gfXU+b/WulvwdDD3vtY6wCioYtdBW7Aj/zmd
 Nm5Pu02eRQ283vZusu/N8IVNWTgIQmSU7UwTPiXMdv6+XWDzPxrSguC5APQZKSCDZdEK
 woPg==
X-Gm-Message-State: AOAM531cuQ0zJHRHbtpKB2xWTlzapA7vynO6v/4S5sidxIEHFEMNex32
 XhaGjeXbZ+w2uG6Q4CHGwUY=
X-Google-Smtp-Source: ABdhPJzWDxQOCjEDFVMe8Qky1c0+ebkHxoVSA8I4OdJ+3YGj1m6t+foDnnepzP6A3OZuhZ/TdXXtHg==
X-Received: by 2002:a1c:1f88:: with SMTP id f130mr1204669wmf.91.1640252990017; 
 Thu, 23 Dec 2021 01:49:50 -0800 (PST)
Received: from [192.168.43.238] (33.red-193-152-124.dynamicip.rima-tde.net.
 [193.152.124.33])
 by smtp.gmail.com with ESMTPSA id m10sm4299467wms.25.2021.12.23.01.49.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Dec 2021 01:49:49 -0800 (PST)
Message-ID: <c2efa7d0-906b-21bc-bcee-d9f79a2e2064@amsat.org>
Date: Thu, 23 Dec 2021 10:49:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Building QEMU as a shared library
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Amir Gonnen <amir.gonnen@neuroblade.ai>
References: <PA4PR09MB4880FF47C3A6E249E55B80E2EB769@PA4PR09MB4880.eurprd09.prod.outlook.com>
 <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAFEAcA8m0M2+=ZuBAXcRmyGMzjHdjCYWM+_KzFK_eoPdwX-vpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.264,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Peter,

On 12/15/21 11:10, Peter Maydell wrote:
> On Wed, 15 Dec 2021 at 08:18, Amir Gonnen <amir.gonnen@neuroblade.ai> wrote:
>> My goal is to simulate a mixed architecture system.
>>
>> Today QEMU strongly assumes that the simulated system is a *single architecture*.
>> Changing this assumption and supporting mixed architecture in QEMU proved to be
>> non-trivial and may require significant development effort. Common code such as
>> TCG and others explicitly include architecture specific header files, for example.
> 
> Yeah. This is definitely something we'd like to fix some day. It's
> the approach I would prefer for getting multi-architecture machines.

Am I understanding correctly your preference would be *not* using shared
libraries, but having a monolithic process able to use any configuration
of heterogeneous architectures?

What are your thoughts on Daniel idea to where (IIUC) cores can are
external processes wired via vhost-user. One problem is not all
operating systems supported provide this possibility.

>> Instead, I would like to suggest a new approach we use at Neuroblade to achieve this:
>> Build QEMU as a shared library that can be loaded and used directly in a larger simulation.
>> Today we build qemu-system-nios2 shared library and load it from qemu-system-x86_64 in order
>> to simulate an x86_64 system that also consists of multiple nios2 cores.
>> In our simulation, two independent "main" functions are running on different threads, and
>> simulation synchronization is reduced to synchronizing threads.
> 
> I agree with Stefan that you should go ahead and send the code as
> an RFC patchset, but I feel like there is a lot of work required
> to really get the codebase into a state where it is a clean
> shared library...
> 
> -- PMM
> 


