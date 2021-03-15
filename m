Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9011733B136
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 12:34:12 +0100 (CET)
Received: from localhost ([::1]:49094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLlUB-0002U7-GE
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 07:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLlQs-0000T6-GJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:30:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lLlQo-0005Dq-8o
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 07:30:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615807839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cP0BACdI23ahBtG0WzSoXD8RnBI0wEAFglPKu/uN4OM=;
 b=UjV7OlBxcVXMyn032yzJi3KuZt7wuIJAN8JgU78zGobAX6gFBxJF/n1wHfq3ga+iyeo3WL
 Byj1dhmDyUgoRy+PMM8k6xyBulPbRcjPnNtOJ84npfvaYU2fg10zUH6dXSsPW0CZ0JRCLX
 SejocdoL1Sw0mnLV4saCF2Ohreg/CIs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-yFl1CQRsNC-U7pNIR9RGWw-1; Mon, 15 Mar 2021 07:30:37 -0400
X-MC-Unique: yFl1CQRsNC-U7pNIR9RGWw-1
Received: by mail-ej1-f72.google.com with SMTP id sa29so11826682ejb.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 04:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cP0BACdI23ahBtG0WzSoXD8RnBI0wEAFglPKu/uN4OM=;
 b=ly3hJb8sZhIUvFXQXtrgE+kSUHqMxTja530MG9gbkcReuirok+NhBH38mxwsMP1sRL
 tsdOsR6a9j5kI1BVzT+5I4S73yz/JzJdcdohcdT1EHdrn9hV3rahiLCKvylB18cZHd4R
 a1hnpYrdZEPmPZy+snBUnW9E8x9sPh2VDxlEi1KvQV4CPW9AM1/AbNifwgYqa46VVVxJ
 AnmFRKrcs14znrVRPPqb8ckV6JX4g/YP5pDK17WA1qm0lo1W3Vh0jvlU6xc1dR7X5qqE
 vKsqbt2RqEU3BdCsMZ4MvCrRc4kIg58V9iQYSdLzAef1TWbgHWDU2NPRHokVH7GFteX4
 gd4g==
X-Gm-Message-State: AOAM533htV4lr8xf68iVqF5vhtCexlESwqja/2DQInZ0H4QYFELniM/S
 rdMgYrqZfD6DY8xyzvjMcroAKbgXL1WxDhywJjP6q+M5B4Z2sbR5qQmQUsyuATbFtgw3KksLdUo
 kYFdspfG1KSj7xqk=
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr22465226ejj.204.1615807834453; 
 Mon, 15 Mar 2021 04:30:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynvA5k6/x1t1rCXzhSthvxfNELyPrE+adW7TxlJ7O7fEhuH+0SRwwj+ajv81wozbXkC6c40A==
X-Received: by 2002:a17:906:f44:: with SMTP id
 h4mr22465168ejj.204.1615807833866; 
 Mon, 15 Mar 2021 04:30:33 -0700 (PDT)
Received: from ?IPv6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.gmail.com with ESMTPSA id y2sm7275394ejf.30.2021.03.15.04.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 04:30:33 -0700 (PDT)
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210307222625.347268-1-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
Date: Mon, 15 Mar 2021 12:30:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210307222625.347268-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/03/21 23:26, Philippe Mathieu-Daudé wrote:
> TYPE_PFLASH_CFI01 is a TYPE_SYS_BUS_DEVICE which registers its romd
> MemoryRegion with sysbus_init_mmio(), so we can use the generic
> sysbus_mmio_get_region() to get the region, no need for a specific
> pflash_cfi01_get_memory() helper.
> 
> First replace the few pflash_cfi01_get_memory() uses by
> sysbus_mmio_get_region(), then remove the now unused helper.

Why is this an improvement?  You're replacing nice and readable code 
with an implementation-dependent function whose second argument is a 
magic number.  The right patch would _add_ more of these helpers, not 
remove them.

Paolo

> Philippe Mathieu-Daudé (4):
>    hw/i386/pc: Get pflash MemoryRegion with sysbus_mmio_get_region()
>    hw/mips/malta: Get pflash MemoryRegion with sysbus_mmio_get_region()
>    hw/xtensa/xtfpga: Get pflash MemoryRegion with
>      sysbus_mmio_get_region()
>    hw/block/pflash_cfi01: Remove pflash_cfi01_get_memory()
> 
>   include/hw/block/flash.h | 1 -
>   hw/block/pflash_cfi01.c  | 5 -----
>   hw/i386/pc_sysfw.c       | 2 +-
>   hw/mips/malta.c          | 2 +-
>   hw/xtensa/xtfpga.c       | 3 ++-
>   5 files changed, 4 insertions(+), 9 deletions(-)
> 


