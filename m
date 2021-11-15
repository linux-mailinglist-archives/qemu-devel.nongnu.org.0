Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2A450A61
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 17:59:29 +0100 (CET)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmfKK-0000dj-Ui
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 11:59:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brak@vultr.com>) id 1mmfIj-0007SG-3c
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:57:49 -0500
Received: from [2607:f8b0:4864:20::82f] (port=39872
 helo=mail-qt1-x82f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brak@vultr.com>) id 1mmfIg-00088K-NH
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 11:57:48 -0500
Received: by mail-qt1-x82f.google.com with SMTP id l8so16208202qtk.6
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 08:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vultr.com; s=google;
 h=from:message-id:date:mime-version:user-agent:reply-to:subject
 :content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=qTdgt6s8fofsYEltV9WeXHRdD7evrMMFYkFyMqtPmq4=;
 b=TDwCtxYEK5S9hE291jPuyJEk6AcG9X9wHmLpgUyL6H4235sqM0FfhiNjWQd1Cc3oda
 7X9jMMt6uKFGB0NnELXAXOjCmIsyf2tsW4DADSD8XtlnDS0QRZQqKWRRlqdaJFUjgPj+
 FYCiTR1T+WyC8t/hM2EuCg3at0vPls9zcOEg5gGDk08S5ySeqSAP0Gt1M1Lt4NETyTIr
 UvfZNHwd86V1tmxNf81851ZsfZ8nPrHELhxzzbHt12n2xUOFUBEaQtNqJr8/taKCI12l
 GD3pCX4v34n7CHNhadNSJtS3a6CIDfQhoQbAbnfE20XvkGwZ+sJpQl2Ey06XQpG+6wxo
 zKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:message-id:date:mime-version:user-agent
 :reply-to:subject:content-language:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=qTdgt6s8fofsYEltV9WeXHRdD7evrMMFYkFyMqtPmq4=;
 b=TjrLgzTSzNbJTVsjD+T8bh3TcGmt2rLojDLq7FUD09flJ9jDFoZi1GYeCYNuSK+gAw
 q+9dACeMGdH2C0N2beByrvUepAB+xqpSPCgjO2niJ2zPZOpNvICPu98G+kvIKOvGGBUK
 9iYP7jyVxaj6LI1jpoQM6HH04MdYO5B1RhceNX/XEfi/e2vw2gVF3iWPM59MbYWBxP+R
 CbQ2ACfnOyfizoEWmEJrjMYxc7nad4IM2u78q5ksmxRr0vH/jAMCLSvZraGPJIfejUBu
 lN1hP2ihDb+aEkjZI4hb3JxwsWVdqqCBf0CHVYQjRQEeYUlkUJVq6uJv7acRnHG6147K
 oSmA==
X-Gm-Message-State: AOAM533aUEWleRIPif6t3qNVRzwmaVnMHioeYnRnbCitWrEUEJuHEcw6
 N1MX2GvuXnYDcroXtI9tKGASiQ==
X-Google-Smtp-Source: ABdhPJwUV1mHVF3EJ9JSGQ8fn3Ku1jP0lGdPNXxADf3x0kz5UEfZt2WceDxPWMMB6f7cXF+ZeFa9Tw==
X-Received: by 2002:ac8:1c6:: with SMTP id b6mr413819qtg.221.1636995465115;
 Mon, 15 Nov 2021 08:57:45 -0800 (PST)
Received: from [192.168.5.229] (ool-44c536c3.dyn.optonline.net.
 [68.197.54.195])
 by smtp.gmail.com with ESMTPSA id k23sm7538778qtm.49.2021.11.15.08.57.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 08:57:44 -0800 (PST)
From: Brian Rak <brak@vultr.com>
X-Google-Original-From: Brian Rak <brak@gameservers.com>
Message-ID: <7ffcc650-0d75-f327-6508-ec3805316a6c@gameservers.com>
Date: Mon, 15 Nov 2021 11:57:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.0
Subject: Re: Guests wont start with 15 pcie-root-port devices
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
References: <abff2095-9ac8-c115-bc7f-6a19b9defe51@gameservers.com>
 <YY6qJt0lXEc2SAtc@redhat.com> <20211112215111.6f854f7a@redhat.com>
In-Reply-To: <20211112215111.6f854f7a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::82f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=brak@vultr.com; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.278,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Reply-To: brak@gameservers.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will this fix make it into 6.2?

On 11/12/2021 3:51 PM, Igor Mammedov wrote:
> On Fri, 12 Nov 2021 17:53:42 +0000
> Daniel P. Berrangé <berrange@redhat.com> wrote:
>
>> On Fri, Nov 12, 2021 at 12:35:07PM -0500, Brian Rak wrote:
>>> In 6.1, a guest with 15 empty pcie-root-port devices will not boot properly
>>> - it just hangs on "Guest has not initialized the display (yet).".  As soon
>>> as I remove the last pcie-root-port, the guest begins starting up normally.
>> Yes, QEMU 6.1 has a regression
>>
>>    https://gitlab.com/qemu-project/qemu/-/issues/641
>>
>>
>>> commit e2a6290aab578b2170c1f5909fa556385dc0d820
>>> Author: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
>>> Date:   Mon Aug 2 12:00:57 2021 +0300
>>>
>>>      hw/pcie-root-port: Fix hotplug for PCI devices requiring IO
>>>
>>> Although I can't say I really understand why that commit triggered it.
>> It caused the firmware to always allocate I/O space for every port
>> and there's limited total I/O space, so it runs out at 15 devices.
> alternatively instead of reverting to native PCIe hotplug as in the issue
> Daniel's mentioned, you can apply following fix
>   https://patchew.org/QEMU/20211112110857.3116853-1-imammedo@redhat.com/
>
>> Regards,
>> Daniel

