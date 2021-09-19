Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1E410CBE
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 19:56:11 +0200 (CEST)
Received: from localhost ([::1]:35942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS12w-0003ep-9J
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 13:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS10x-0002CN-0n; Sun, 19 Sep 2021 13:54:07 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS10v-0000uz-En; Sun, 19 Sep 2021 13:54:06 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso10427920wmd.5; 
 Sun, 19 Sep 2021 10:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=a0FVIp7ZjrtU9oF9wNU71qlGyNymejo1sxyNFUsrvgw=;
 b=apTHyQGf4mDGiNO4J+B9Yj08osOKknfdzS8DJuTgodf+bK3y1SxD+ZGZ2sMOnhnJcp
 JSF96/W2KhRQ7VDLojspN4YYT0TvHR2P9peC2nQXDvN3IJ2EK4wTEdiitxNrLVoI0F2f
 jQQR3qu77MjhseRLX6xh7ccp7fTuUjseI6ZfOu/bODd8Jv6TkrsAcnaisF08TDFhyVzq
 CjR8a/zj5JAUnJLmPROH5UszesDi4jcGWppI54FCv4JievHISJ4zCUKFg/rhglFiFMfR
 dhzkaoC+th8eNEDJyba2/HNGHoFR8egEqD2MeHezC4DTZBBMf9IDOKTT/QAzcJ7pbJpX
 g8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=a0FVIp7ZjrtU9oF9wNU71qlGyNymejo1sxyNFUsrvgw=;
 b=LiQjsFv1L2GjPglluPXVOZHQwCzpT8FgQ2dCDDpXs4v5i0VbcesxYmg48UcshzZJHV
 RzWqkiwAPNWjphd+Og5CzqPvopV/6Cs2sMV9WuwU9LGhKVtvy6ypoMnWsUFPnmChcvjE
 D8fHh5d4wZpqrSfVkql0QjeHnIC9Z8qy83e2n2jH6mnSwOZUlDjSimKosN5vzM/t3Czl
 x2bF8AbAoi3PW6H8QEPu8v2qqWY8Y82hLBWF9NBWUHrtfkeGnrcywxKtPLKfx/Qsults
 cctrDs6vXRMaTuSMjDfWySNLKIE1Pd+MQL7b1fSFHODgeHZE65w9AnTsJBv4ZNE1F9tb
 Vz3Q==
X-Gm-Message-State: AOAM533FOP5eOgMbcA4E/yVQ3XoVN0X26Q62WynmG3InSRU14MdrcP6L
 P4d7poASPQkDlUFGoRthgbM=
X-Google-Smtp-Source: ABdhPJydZaYBkCGDBWHq+gAHWZmfYSuy5ImrD8Z54xrMVwNW/Ed/lXfl88i8UBAd1npMhGHxdaFg9w==
X-Received: by 2002:a7b:c766:: with SMTP id x6mr20575959wmk.53.1632074043024; 
 Sun, 19 Sep 2021 10:54:03 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id l2sm17439748wmi.1.2021.09.19.10.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 10:54:02 -0700 (PDT)
Message-ID: <6ab9eb4d-5835-df61-b27f-932af7e64889@amsat.org>
Date: Sun, 19 Sep 2021 19:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Range of vcpu_index to plugin callbacks
Content-Language: en-US
To: Robert Henry <rrh.henry@gmail.com>, qemu-discuss@nongnu.org
References: <CAEYr_8=uH3=BGbVQrbjijoE5xB7jRch=35hjD0g0v91u_cXUog@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAEYr_8=uH3=BGbVQrbjijoE5xB7jRch=35hjD0g0v91u_cXUog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Cc'ing qemu-devel@ mailing list since this is a development question).

On 9/19/21 19:44, Robert Henry wrote:
> What is the range of the values for vcpu_index given to callbacks, such as:
> 
> typedef void (*qemu_plugin_vcpu_udata_cb_t)(unsigned int vcpu_index,
> void *userdata);
> 
> Empirically, when QEMU is in system mode, the maximum vcpu_index is 1
> less than the -smp cpus=$(NCPUS) value.
> 
> Empirically, when QEMU is in user mode, the values for vcpu_index slowly
> increase without an apparent upper bound known statically (or when the
> plugin is loaded?).

Isn't it related to clone() calls? I'd expect new threads use
a new vCPU, incrementing vcpu_index. But that is just a guess
without having looked at the code to corroborate...

Regards,

Phil.

