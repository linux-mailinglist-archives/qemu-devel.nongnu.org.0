Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 252083497B0
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:16:48 +0100 (CET)
Received: from localhost ([::1]:56028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTbD-0004lc-28
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:16:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTXC-0002Tp-Ey
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:12:38 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:43603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTX9-0001Zk-GY
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:12:38 -0400
Received: by mail-oi1-x22b.google.com with SMTP id n8so2830987oie.10
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i1B2w9Y5j2VsE6xDRD+YTVIDRvaUUzU32GTGHKFyOyg=;
 b=BgUt/ebgYIGCrrlUMx7/ErDRQ6h8co/G1V/bmyJhBOx1I3rBqL7lVwG47J0FxKfmSo
 Fw0HbI2JBSQ9zJ6n8daQlV1N2UiR8tSHjVsmYZHxmtQpxhDXohwW/DTPePvrV/lyCTed
 4eCOpAp9O382OYxxLQtMNLL2S5lrsZtqYEcAk6Ep7qxMVR7bHaEBgsrz5jEyprO1LgIi
 Iv8eH9kBAsSr+NyMNBla00UVFp7HnWlUjtPbufCUDOsdE1YUzRAimIPyzeT/lVI1P3/O
 Z4UzNAf0XBOes15cMUtYKDmyVxNl6OY58hLKTeHEdXs13kdnShTNJrcXR4KmZfNMHZf+
 wEig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i1B2w9Y5j2VsE6xDRD+YTVIDRvaUUzU32GTGHKFyOyg=;
 b=CUW8WhmCJE1TcRtdQM0oVSpmv5Z63OBaE1GP3QP6xmMPj/GccQzSW9f+ql5w2EXx5+
 wotLbBaHq00B75BA2lijk3VpVOYcuRNjtXwAmbRpf1sgH6RbHW1G2J4U9dXO1iv5Ixqa
 hpiaUgRVd6RoVrLjHxpQ3XbIaBsZj1M56QNM7m7e0rFceBptDPoguvIsp5nsn4CMxpQ2
 JYwWJNbVcqD2pSE5NGLgUQzJLFNWCGSqY3eZTy5VRZD01qgwDBXqTj00MLMY8Znn9R4Y
 z3zkSFu7qukiq7FgefZ6FOe8NaNBdzuluQdILrzG/uIAQCvKUaIsadiIMe8H+0NYsaYe
 I8ZA==
X-Gm-Message-State: AOAM530dmO25Fi/8YWwqU0E2ZrQIpjOThEIkB1wDUwv88je9p+Y2gVpr
 R2k8i0VKYI6B14tHjTBJ4OpZaA==
X-Google-Smtp-Source: ABdhPJz1IP0GK65N85s7afyJXukg3RigYg6B/FUg47W6BfXruc53yRlNV7JyLqhmGvEWQq1v5F4hlg==
X-Received: by 2002:aca:c3c8:: with SMTP id t191mr6901822oif.171.1616692351351; 
 Thu, 25 Mar 2021 10:12:31 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id e15sm1428375otk.64.2021.03.25.10.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:12:31 -0700 (PDT)
Subject: Re: qemu-system-aarch64 crashes with device ich9-usb-ehci1
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
References: <2542a79a-c143-1db4-de97-6b04929158db@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e6588c95-0df9-2a86-af4d-0ef128eb05de@linaro.org>
Date: Thu, 25 Mar 2021 11:12:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <2542a79a-c143-1db4-de97-6b04929158db@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 10:58 AM, Thomas Huth wrote:
> 
> In case anybody is interested, ich9-usb-ehci1 can be used to crash QEMU:
> 
> $ ./qemu-system-aarch64 -M virt -device ich9-usb-ehci1,help
> qemu-system-aarch64: ../../devel/qemu/softmmu/physmem.c:1154: phys_section_add: 
> Assertion `map->sections_nb < TARGET_PAGE_SIZE' failed.
> Aborted (core dumped)

That's because

#14 0x0000555555afad47 in usb_ehci_init (s=0x555556ee54b0, dev=0x555556ee4bb0)
     at ../qemu/hw/usb/hcd-ehci.c:2585

is doing stuff at init time that should be done at realize.

The virt board has not yet set the system page size, which is currently at 0.


r~

