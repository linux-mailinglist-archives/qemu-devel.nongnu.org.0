Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F743E501C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 01:48:49 +0200 (CEST)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDF0i-0001CA-FG
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 19:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDEzy-0000WB-AS
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 19:48:02 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:46927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDEzw-0000ms-LY
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 19:48:01 -0400
Received: by mail-pl1-x62b.google.com with SMTP id k2so18422941plk.13
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 16:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TgwFwo2mJ+KQBbAkWgFh1rZqSYpgGgJ6Sjihl3UcWHA=;
 b=IQbMBsfTuNTWjjkVQf8U/88u14R42Q1oNu9GNR83GJAmAr9jcezJ4pMj3k8nnzQWM1
 DcGw7QjM7RxIpt2G9UM38+KelzGOWDrzE4kGFl6775Zab56T9F04tTqh779jG9P1DA6i
 OmQ5psXdtvuzi+5O7ZKuohtvDlGCw36KwdIwAZZhkRxSuliLVrQN7QmRk+jLh1Fj6vmF
 MuVak5EnKMuGW0QnrW6a4UM2nIiOYmjfo7ClGOIlZwCaCCp88/txAGh9gRhXFgGVtjyZ
 EJqh5qSXUtQlqS9MyBvUjVuKPYztnuw7p+6KKB8mSjD1HuITXRy9DJzAUOC1lkkDHZ3W
 OBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TgwFwo2mJ+KQBbAkWgFh1rZqSYpgGgJ6Sjihl3UcWHA=;
 b=reVMy0qrpI81B099kZMLG1o2Zl1YO7zoeZjhl/DwRKTIr0tzbi7YlSifbWKmkpna2C
 7DHygteWyKqXLAVzu5+U5BjiURFmwUEQNmbFKRMuj0M8izkpszcvdYr3fvz9bkYiU81s
 CszhkAOJZ/guu5Gy5CDjgG2EF7K6f7x5b7f11fSh8aa2kFKq//nNx1IjYwoCwwadQXyO
 0+bg8sZ7PtbeqnlZlh/t7n8unpBg7k1ECYlWcjteFixb5oFLbhBqxqaDkYzxAUdjNnyH
 Gc1i8Tvp/2Uj8Xz4hHJaVzhmjDduYPUOhahjGcSM6Gr63dLdhxguiwfrrT1S2Sqruf8u
 1iCg==
X-Gm-Message-State: AOAM530Nl/XOWz7NphC7pbVYX42us1fcGyoon/Q62v5fEWTQ7L3Lj0kM
 jdEieMcwdK8CdeJwJ0VDfSM4Vw==
X-Google-Smtp-Source: ABdhPJxmy4G/sD+cwbonubASlTRjUpp2iaNFVCfcPRzrLs9j4VYc1liNlMCFHnCvxcy7XrLZxwsctQ==
X-Received: by 2002:a62:7bd4:0:b029:3b7:29bf:b0f with SMTP id
 w203-20020a627bd40000b02903b729bf0b0fmr26662377pfc.15.1628552878891; 
 Mon, 09 Aug 2021 16:47:58 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id f1sm21984980pfk.115.2021.08.09.16.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 16:47:58 -0700 (PDT)
Subject: Re: [PATCH for 6.2 30/49] bsd-user: elf cleanup
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210807214242.82385-1-imp@bsdimp.com>
 <20210807214242.82385-31-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <709ad6e0-f1ae-e0d5-4ca4-faf4ad41742c@linaro.org>
Date: Mon, 9 Aug 2021 13:47:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807214242.82385-31-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
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
Cc: Alexander Kabaev <kan@FreeBSD.ORG>, Kyle Evans <kevans@FreeBSD.org>,
 Warner Losh <imp@FreeBSD.org>, Stacey Son <sson@FreeBSD.org>,
 Justin Hibbits <chmeeedalf@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/7/21 11:42 AM, Warner Losh wrote:
> From: Warner Losh<imp@FreeBSD.org>
> 
> Move OS-dependent defines into target_os_elf.h. Move the architectural
> dependent stuff into target_arch_elf.h. Adjust elfload.c to use
> target_create_elf_tables instead of create_elf_tables.
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Kyle Evans<kevans@FreeBSD.org>
> Signed-off-by: Justin Hibbits<chmeeedalf@gmail.com>
> Signed-off-by: Alexander Kabaev<kan@FreeBSD.ORG>
> 
> Sponsored by:		Netflix
> ---
>   bsd-user/elfload.c               | 190 ++++---------------------------
>   bsd-user/freebsd/target_os_elf.h | 149 ++++++++++++++++++++++++
>   bsd-user/netbsd/target_os_elf.h  | 143 +++++++++++++++++++++++
>   bsd-user/openbsd/target_os_elf.h | 143 +++++++++++++++++++++++
>   bsd-user/qemu.h                  |   1 +
>   5 files changed, 459 insertions(+), 167 deletions(-)
>   create mode 100644 bsd-user/freebsd/target_os_elf.h
>   create mode 100644 bsd-user/netbsd/target_os_elf.h
>   create mode 100644 bsd-user/openbsd/target_os_elf.h

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

