Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D697945A45D
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 15:04:25 +0100 (CET)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpWPI-0003nw-It
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 09:04:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpWNL-0002ER-EE
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:02:24 -0500
Received: from [2a00:1450:4864:20::332] (port=43684
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mpWNJ-0006dW-5C
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 09:02:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so2679114wmc.2
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 06:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wY6nv+Kynp5tHJnVmMoXk2Fn2pBqrvGMUGqDfbESL3A=;
 b=LpC+RgMWLxbP3G2kREzOeq2ryT3MalxevzEedWswxz1ypbQ5XeXrBtZHg6U55KY2K4
 C3VLfuKgCDDc2DkexICpYy8ERbJQ+38o7Nr2CMOfh7jhwAiqPQxk6vFC3gvjP1bihQi/
 b8+qwvY1AtNeOzg/XN7WQCc8zfFZMM3XOJMF1764eXZW5Ghp2sGOBHYEuc9X0LVOVoKo
 JSOb+z1TFtWGElJ4HdSSJO8uVc1a1uT6+I4rrGiVK0Q36A7OzEEU6Km7k7XCWH5vk8IP
 enKA2/r3sc/Wwdax1aRdp0SVHkvHqdPNMYP2AggBv65ytYddGNucAulezybvvPwkkIbv
 iDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wY6nv+Kynp5tHJnVmMoXk2Fn2pBqrvGMUGqDfbESL3A=;
 b=tRksUMK1RIu7DobLm/0GOJrXWvW8B2EzW1Q++1KEoC/1jK2zWUbzalGRM9fgV4W9Gd
 q8dUfk24utiVMLvNM2dxvWDC3IP4p58C/F6H9fBsITYD3XVscZY21l3OEfA3uBrhu+5f
 dvAXH1sO/kTLcGXdLvnNZzPiqO8E3r9kSabDlEcHtwkgBj7Le9niObm2pfa8f8C9TKk2
 yUvfNgFJrxGHSvKNlqQRPfVqGZ7fUYtHUvFvXITw/vb9B5a2OLA3wJmZ7Y8j52/+H0oM
 /sItnRFwzEUVP024W02L4EN6raMsQi7QZkiiv0pD1z8qaT6sz/qQE0f6eLMkoGQWqhai
 NWZg==
X-Gm-Message-State: AOAM530DlDib/ErAsNCilOHZn2+u+cZqrxp8P/orNiuXW3fT9bBGKYTs
 lx7aOsH3cOeuLLcAQRgqkYE=
X-Google-Smtp-Source: ABdhPJxnaXP5N9Fo12KxJf4dL81JxJhZ3nWnfA7E2GuLjNqsSVcAT7gMOot5kL7okTxcdbd4vUkurA==
X-Received: by 2002:a1c:8:: with SMTP id 8mr3458599wma.106.1637676139472;
 Tue, 23 Nov 2021 06:02:19 -0800 (PST)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id d15sm16850920wri.50.2021.11.23.06.02.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 06:02:18 -0800 (PST)
Message-ID: <ad18c444-6d08-8886-8f8a-4e866bc61ed1@redhat.com>
Date: Tue, 23 Nov 2021 15:02:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH-for-6.2 0/2] hw/scsi/lsi53c895a: Fix guest-triggerable
 assert() in lsi_do_dma()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211123111732.83137-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211123111732.83137-1-philmd@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.515,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Vadim Rozenfeld <vrozenfe@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/21 12:17, Philippe Mathieu-Daudé wrote:
> Trivial fix for this long due bug.
> 
> Philippe Mathieu-Daudé (2):
>    hw/scsi/lsi53c895a: Do not abort when DMA requested and no data queued
>    tests/qtest: Add fuzz-lsi53c895a-test
> 
>   hw/scsi/lsi53c895a.c               |  3 +-
>   tests/qtest/fuzz-lsi53c895a-test.c | 52 ++++++++++++++++++++++++++++++
>   MAINTAINERS                        |  1 +
>   tests/qtest/meson.build            |  1 +
>   4 files changed, 55 insertions(+), 2 deletions(-)
>   create mode 100644 tests/qtest/fuzz-lsi53c895a-test.c
> 

Queued, thanks.

Paolo

