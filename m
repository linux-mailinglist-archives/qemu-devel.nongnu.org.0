Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FF64298CD
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 23:25:20 +0200 (CEST)
Received: from localhost ([::1]:54478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ma2nP-0008Cj-Hn
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 17:25:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma2jh-0005Hf-3A
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:21:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:46644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ma2jf-0004tt-7L
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 17:21:28 -0400
Received: by mail-pl1-x62f.google.com with SMTP id 21so5948793plo.13
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AF1yk6WxSFGDihLvpOe0ms/umalnAaUFCQT6GrFvPQU=;
 b=t2x0WaEsjotrAryUl+1jJncSOY3YUdVuMTYn4YgZy77fwPUgO9jlLPMLt4/kQFKOyC
 rdDUVrODMMcqxZE5WSB+k9V5r3J0TNq3t7Zc2ExEbR4saucNlD3zvdrF73I93t+XtxnZ
 psGAAi++p4yc8UPXXvFgrz1imIcgJBhR4eIM8CzrLt10FYySGA656o6NKyWzUtf24Sr0
 FSZvx3kUarPF2SSaZvFX1P5BgkX+uUAw7T+ZFAkSgN2GW2A0i+aYf6xDTcxnd3gff53Z
 UWk56Zj0Xhavj4rjD4b7T2x+i7AD+vSzhjIkOi3O1DQUMC1YaKGz1nLhW1/UUf3jNIFA
 4SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AF1yk6WxSFGDihLvpOe0ms/umalnAaUFCQT6GrFvPQU=;
 b=c/2qU694lBnpSk02JMTEJZA9U+MK1BcgBavhLI6HC0khnKnRaXNXUawiGfYxs0FdfH
 qrimmXpTEUndsWP1INXYJo9ELJ/M/iVjoDcoNm9NZWuvt0CFtcpZ7DtZcSjGQQmSdKcM
 y/Q8+a/8wvzVM4Zm3AOTrTaicsbnsXhRqneT59HKQLhJwT4TGyICsV5INzMl24hhbjAB
 WDdoBNI+0n7kb6xjKJrnnnUacSkF8kvB9lfaGuEaTT+OyThsO0BEuWrojUyyPhx0Tu0M
 SgH0+fq3Nywbo5cz6sDUPfe1uG1dFZBvyyHqKWFcP/RIPzqZdvqNJY1V+B88lcI0ocND
 X3Hg==
X-Gm-Message-State: AOAM531utCODv7GFkncgJmkhMG+w5CmcTXgJy9mNhXPD77sXkI9mQSne
 stD+hsZQ7YU8eN8sJG0aSpTvfA==
X-Google-Smtp-Source: ABdhPJyzJPNqad8UrSbBaWsO6U2deJYiEFJsKllOUZldKfS0g957vgXVTJFDB4YvOXd71EviEg2nPA==
X-Received: by 2002:a17:903:2303:b0:13f:e63:e27d with SMTP id
 d3-20020a170903230300b0013f0e63e27dmr22854169plh.84.1633987285499; 
 Mon, 11 Oct 2021 14:21:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id h2sm327558pjk.44.2021.10.11.14.21.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:21:25 -0700 (PDT)
Subject: Re: [PATCH v1 2/2] memory: Update description of
 memory_region_is_mapped()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20211011174522.14351-1-david@redhat.com>
 <20211011174522.14351-3-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <93dead18-5ea5-0afe-18c1-de9a06773687@linaro.org>
Date: Mon, 11 Oct 2021 14:21:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011174522.14351-3-david@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/21 10:45 AM, David Hildenbrand wrote:
>   /**
>    * memory_region_is_mapped: returns true if #MemoryRegion is mapped
> - * into any address space.
> + * into another #MemoryRegion directly. Will return false if the
> + * #MemoryRegion is mapped indirectly via an alias.

Hmm.  I guess.  It kinda sorta sounds like a bug, but I don't know the interface well 
enough to tell.

r~

