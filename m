Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820A03468AB
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:13:56 +0100 (CET)
Received: from localhost ([::1]:42274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmTT-0004uj-Hg
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOlfS-0002u4-0e
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:22:14 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOlfP-0008AR-2I
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:22:12 -0400
Received: by mail-wr1-x429.google.com with SMTP id x16so21786361wrn.4
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=y/2u2hf1/r2GmUro4IMQhyppoET4z3PFvaikLmWoeqg=;
 b=faA6ZN6fM21lDmrZF3u6/EPJ0Zw+nphUg9UYgPfkgZ1IeqTN+qWe6jRNSWnNO1hayN
 lsE9fzVzi7u5OIQK4Iap8gIy0dTAzzlnFOViTa8pa/chOF84iJgLsSz2Tb2Jg2iKJem1
 +AC3pYUgCjydlZoNrxQ6C7U2ruLHl7p1NLsHE0QXyCg9PLflmO1uPEAOrlEvTH08xfPY
 EeTmdQkkfD4uddcWDnp/VvEEBZ9caZufDDJhXpXiMKOLi1q/PuxsMmfr3bzgcwsw5Rve
 8Fu4kzXbL5zdKHzkSAM/lyXr8mvoqPRlXv770X3hk9+WuUk2ipbdUBcaEBZuRtc/lEMt
 tYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y/2u2hf1/r2GmUro4IMQhyppoET4z3PFvaikLmWoeqg=;
 b=ggzqacXX/+VQwMSTvkeKS5Yv3FzzGffxe8XkEMQbNkmoOzk29ZLm1j22rqg7FC+JNC
 eTWZmb4HbaAJmXc1I+tCYGBZn0sjQbCKI0Nor041SRTk2ByFfyRfuU+rXIxpxCZZtytB
 oo5/0SHvuVjAg2tfzcm+tLdiGjRheyIINugPXBxsy6Bp88Z3WVdGqyEB7EwV/0i3kj7p
 8Ev0a+epedyYG2L5s/xVY+xMsOGpf6KTfoCTzT2UTmR6lKqFzilHemTm83WsScBDzNxM
 2wHDOBl8IsIpV1lLwgpH54D1Cms9pkQncR5u8EGmfO4mG9B35ymYjmHiospfNFaXAwDW
 7EAw==
X-Gm-Message-State: AOAM531txmOUhPyvfnEWQ0ls7FSy9t4YrOzYzNLipgNQL1omPJHfHzmu
 U6pr4C9zZudAmhxISW1Ty5I=
X-Google-Smtp-Source: ABdhPJxhotkkj0lkrnOEoyudXVFzhkjwrXFsarQx0xrRX/Sa0y5SHMbNAsYfdH/Fy0p6Boypn3wS8Q==
X-Received: by 2002:adf:8341:: with SMTP id 59mr5222981wrd.130.1616523728723; 
 Tue, 23 Mar 2021 11:22:08 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id o15sm18804050wra.93.2021.03.23.11.22.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 11:22:08 -0700 (PDT)
Subject: Re: [PATCH v3 2/3] exec: Extract 'page-vary.h' header
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210323161601.454996-1-richard.henderson@linaro.org>
 <20210323161601.454996-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ddf09d50-9bf6-c828-7fa7-896f9ceb38df@amsat.org>
Date: Tue, 23 Mar 2021 19:22:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323161601.454996-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: pbonzini@redhat.com, gshan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 5:16 PM, Richard Henderson wrote:
> In the next commit we will extract the generic code out of
> page-vary.c, only keeping the target specific code. Both
> files will use the same TargetPageBits structure, so make
> its declaration in a shared header.
> 
> As the common header can not use target specific types,
> use a uint64_t to hold the page mask value, and add a
> cast back to target_long in the TARGET_PAGE_MASK definitions.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Message-Id: <20210322112427.4045204-3-f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/exec/cpu-all.h   | 11 ++++-------
>  include/exec/page-vary.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 7 deletions(-)
>  create mode 100644 include/exec/page-vary.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

