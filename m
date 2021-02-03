Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8430330E08C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:09:55 +0100 (CET)
Received: from localhost ([::1]:60524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Lf8-0006hK-HZ
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:09:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7LRC-00045F-Tl
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:55:30 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7LRA-0007qQ-8c
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 11:55:30 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s3so388335edi.7
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 08:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rdQk+eIjIosFe3lA0HWQLkoRyPUWQfrmiHw+EPxDHsY=;
 b=qLOvbwt8MxcazHxQiqyLbDBcUi3fIvxcU6GreIUY098dcXsjE/B5M08FYnsz3WIn0j
 P9auXuD0Tp3mcjdn7CIYmCSnFtU17OhyLKxn/8EREN6qLWLXXjx8Hc8lTHylcb4HlZ6Y
 DMSOmCbpvXkhC8fe6+hKqALnc/ERhm6Dk59ADwTHV9BSd/gDCt4qeYjtsMd3Zjuv1eb2
 IKUHj5xr8Y6IXXQ85YkOvfPRLZoJZT6HM7AeTN4iCPhJ+PNQtV2+ZGXlYScI6HXliVNu
 OhVZwHBnEUvfDGd0mGo4HCv4cQoE4k7uSpnT+ZdDjMCdu5HTE4NMHRk2igXG/xYnDIRG
 aazQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rdQk+eIjIosFe3lA0HWQLkoRyPUWQfrmiHw+EPxDHsY=;
 b=tOHrs76+RlkDpZh/CJtYQ0Fsu4u9bzVipGtAqMuk8C27QIo3awgq1eGrf/Bgl1J98W
 wJl5TG0R+aoAtkKovlBMY0OBcevKUFu1vZr9hePOUxo0ldRszWrzXs6Z8mcyGtwxtXZT
 MhYHPrGG5v2PnJKREL9i5LZPf+uEv2iqlwMbGF7DgZt5Rifv7W6YfuKJdM92xxjUvZtc
 b3KWw60Up2QDnQzitpHeF7yTdDuOdo4fYwc1RmcMV9sOB3ZE0EsquDcT+zqqGjYG6N9n
 CCD0RPN/wyR4g2eCu24081XhmPOeup1XdFHXJBN/RwjM4yN9GnzA1jlwSb6T8U4eDfzw
 +Xtg==
X-Gm-Message-State: AOAM531HWFiwcyLZewqaNpbwloGzUlXRTYMfANFqNbbqfkbX5qDVy6d3
 w8EzzslIJphU06eBsl+itNY=
X-Google-Smtp-Source: ABdhPJw/n8+XohUVhhp9ONMJC35AQPy8Z47SJubn6Voo803F/cwg8S/W15+q5P2SGRc1kaAr/HuGng==
X-Received: by 2002:aa7:d401:: with SMTP id z1mr3975958edq.213.1612371324471; 
 Wed, 03 Feb 2021 08:55:24 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id bm2sm1226511ejb.87.2021.02.03.08.55.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 08:55:23 -0800 (PST)
Subject: Re: About creating machines on the command line
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org,
 Nikos Dragazis <ndragazis@arrikto.com>,
 Maxime Coquelin <maxime.coquelin@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Andra-Irina Paraschiv <andraprs@amazon.com>,
 "John G. Johnson" <john.g.johnson@oracle.com>,
 Jan Kiszka <jan.kiszka@siemens.com>, Alexander Graf <graf@amazon.com>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <93e41283-ec7c-4c2b-dcfd-9e0e7a2e435c@amsat.org>
Date: Wed, 3 Feb 2021 17:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, sam.grove@sifive.com,
 Mark Burton <mark.burton@greensocs.com>, richard.fuhler@sifive.com,
 armbru@redhat.com, edgar.iglesias@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/11/21 3:50 PM, Luc Michel wrote:
> Hi,
> 
> We would like to work on improving QEMU to be able to create custom
> machines from the command line. The goal here is to get feedback from
> the community and shape the future developments.

Cc'ing John who is working on command line, and some developers from
the "inter-VM device emulation interface" call.
https://www.mail-archive.com/qemu-devel@nongnu.org/msg723252.html

> 
> The use case mainly comes from people working with tools to customize
> their designs, such as SiFive Core Designer
> (https://scs.sifive.com/core-designer). This kind of tools may allow
> creation or customization of a whole SoC, from the number of cores, to
> the memory and IRQ mapping of peripherals etc.
> 
> The ultimate goal would be to be able to create any kind of machine on
> the command line. However we are aware that this is a substantial amount
> of changes in QEMU.
> 
> In its current state, QEMU allows for very limited customization of
> existing machines on the command line. We identified the following
> limitations (feel free to add to the list):
> 
>   - Most devices are not user creatable. Moreover, sysbus devices must
> be explicitly allowed by a machine to be creatable through `-device`,
> 
>   - Memory regions cannot be created on the command line,
> 
>   - Device MMIO regions cannot be mapped on a bus from the command line,
> 
>   - GPIOs and clocks cannot be wired from the command line,
> 
>   - CPUs are not sysbus devices (and not user-creatable). They need
> special care when creating them regarding system reset. Not being on a
> bus means that they must be reset manually on system reset. This is done
> in machines by registering a QEMU reset handler.
> 
>   - Machine specific boot code is usually hard-coded into the machine
> itself.  Some architectures (e.g. ARM) do factorize bootloader related
> code, but there is no standard way of doing that in QEMU.
> 
> We don't want to address all those limitations at once. We plan to start
> with the following scenario:
> 
>   - Start with a base machine that would handle CPU creation and
> bootloader stuff. Note that the "none" machine is probably not
> sufficient in its current shape. It does allow only one CPU and
> obviously does not handle the boot process.
> 
>   - Allow for this machine every sysbus devices we want to be user
> command-line creatable (and mark them user_creatable if needed)
> 
>   - Add command line options to create memory regions (probably ram ones
> at first)
> 
>   - Add command line options to map a memory region (including sysbus
> device MMIO regions) onto another (memory_region_add_subregion)
> 
>   - Add command line options to connect GPIOs and clocks.
> 
> This would hopefully allow for simple machines creation. We would then
> be able to use either the command line or the `-readconfig` option to
> create the machine.
> 
> Note that we are not planning to use QMP/HMP for now. From our
> understanding, a `device_add` request is always considered as hot-plug,
> which is not what we want here.
> 
> Please tell us what do you think about this plan. Any feedback is
> appreciated.  Then we can discuss the details of how to do this properly.
> Thanks!
> 
> -- 
> Luc
> 

