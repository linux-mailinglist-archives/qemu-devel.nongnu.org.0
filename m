Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05931760AA
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Mar 2020 18:03:27 +0100 (CET)
Received: from localhost ([::1]:35504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j8oTW-0002bF-J3
	for lists+qemu-devel@lfdr.de; Mon, 02 Mar 2020 12:03:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j8oQt-0007cA-Vo
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:00:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j8oQp-0003GF-4f
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:00:43 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:42058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j8oQo-0003Fo-Sl
 for qemu-devel@nongnu.org; Mon, 02 Mar 2020 12:00:39 -0500
Received: by mail-pg1-x544.google.com with SMTP id h8so93328pgs.9
 for <qemu-devel@nongnu.org>; Mon, 02 Mar 2020 09:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3vVT2JT1q6CZ5+QQmZemp+xWla5xDqktDRGl38dcfPo=;
 b=FP85tpGyQeIA1E0wB/KzwnKscUnAEqkcwQtz6JC8p3YkIjhazdfTM7ZxnQK539iZ2o
 S7sLdqGqrzzDFcfZm0CnTL9Sx1QvQDcjQhqV3AjQp4IWahuEYbWYL4xcvSMZyISWoe30
 VcRMR/E85FRjj9DAtM3Nisry+1uOBK/PyIDGa587BxtRUgzjilLT5RfxiHXzi6pRj+3E
 XDL7YucFNrVyDfeERsiksIBtXfQrW3Fud/niqvmo1UN4pLLOgTtBgPy6gi0ixB0c5bw/
 GM2VkWmmJ2dwp+UtGHbbqh4GbDAtF5n5JoNJACYgntTnaeP/L3TjH2tWmvIrWbuvSJdL
 jYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3vVT2JT1q6CZ5+QQmZemp+xWla5xDqktDRGl38dcfPo=;
 b=Klifiy0XAZoDsOJyQkneUvHXEei5z855zvol5+ssb/eVSU0FbT6CaMVU0EidHZVOad
 dt+rAZ7Ls5y+CymgVhvqr9RN9R5pdHjn/b9xXO6DunV1G4ZDnSR60WX0m1YwIgqLPrb+
 EYjOnA5F920k7ModPDc0g52+yvbqxgDq4L/KXDK6BYxwTuijm2WJWNX6HryFOXsswrMc
 X0B+RniXp6yws76g11RMCOoennhsnpcTIvcE6EK+ix55iBIri1QoZbVFwut5OP+lxz7h
 7E6GSyOghDiU7sVbol/0rbqzQtJ2A0gzLJWcgW9hwjh2j5fSH9NDXXsuIz0UVBT6fHYZ
 7lkw==
X-Gm-Message-State: APjAAAWmDVQp7B2VZkBKzSN/iwqkXpC+cWFWHZ0WhePyHcoP+XbCMOL3
 1dKIaqwwFZZR0j7C66rwatiLBA==
X-Google-Smtp-Source: APXvYqxtGP64x8whmyUAcwhh05X9qTBmF0qBQu9qm/333Rn8LybVAFc7R21DbXgtPVSReQi5Uj49Tw==
X-Received: by 2002:a63:120f:: with SMTP id h15mr20964581pgl.235.1583168437896; 
 Mon, 02 Mar 2020 09:00:37 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm13446842pfc.3.2020.03.02.09.00.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 09:00:37 -0800 (PST)
Subject: Re: [PATCH v3 2/6] hw/arm/virt: Introduce VirtGICType enum type
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200302105516.5972-1-eric.auger@redhat.com>
 <20200302105516.5972-3-eric.auger@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e3b8d9c2-d5c3-e266-caad-1050ae843024@linaro.org>
Date: Mon, 2 Mar 2020 09:00:35 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200302105516.5972-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: maz@kernel.org, drjones@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/2/20 2:55 AM, Eric Auger wrote:
> We plan to introduce yet another value for the gic version (nosel).
> As we already use exotic values such as 0 and -1, let's introduce
> a dedicated enum type and let vms->gic_version take this
> type.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---
> 
> v2 -> v3:
> - replaced defines by enum VirtGICType
> - use that new type for vms->gic_version
> ---
>  hw/arm/virt.c         | 30 +++++++++++++++---------------
>  include/hw/arm/virt.h | 11 +++++++++--
>  2 files changed, 24 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

