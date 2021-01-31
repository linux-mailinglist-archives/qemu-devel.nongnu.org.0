Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C243309E85
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 21:04:40 +0100 (CET)
Received: from localhost ([::1]:41394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Ixb-0005dL-02
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 15:04:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6IwK-0005Cj-01
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 15:03:20 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6IwI-0005VJ-Cy
 for qemu-devel@nongnu.org; Sun, 31 Jan 2021 15:03:19 -0500
Received: by mail-wr1-x42e.google.com with SMTP id s7so11395169wru.5
 for <qemu-devel@nongnu.org>; Sun, 31 Jan 2021 12:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vDz8x+uUIGycRuMf/j6iddscUzR+hpfGpdlAyS7FbcA=;
 b=dF4pfAjLHuAgs1UgjExWjWNBH1HbqvmjN7y3RV30Y/rC7nBfeoIVHUxYSP+ass9eoH
 if6Wro9WHQ60yQyrflO/CBg49SqihyNp06d50S/XHvD4eTbI30QXgRvYDZgVUAc55myj
 EQEW8Do4MxhImJ3te41vBG8oetCeBdBP5ILmGGkgvkesX/8u/aHnYg9VAuVdR96CtpYE
 A5+hg7wwLIGZCxjRBjatGEnt1OMm1Bop8z14poGx4AqkRPdCUKbXZaEpqlon3tPaPqEU
 ImGnDWnfhruAEIKg2AgohWcojYah63wIT1NM0a9VhxNomY5lHTNI6BLgRUm/qQjW14iA
 DlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vDz8x+uUIGycRuMf/j6iddscUzR+hpfGpdlAyS7FbcA=;
 b=qFvUWUSO1cTYVWWfmxUYTAw00K8xsfX+77KCDvj67n9jJ0oEaAbwiijfBnJxx8mg0A
 jYYrrwIWqST0pbtaI2wMLsKreBuDE2mFMmFu8SNPVZuJdl8gNhDkWtE1XuL/x2mP0zRH
 tlJ0mpec21jPEFi3hanHN5fwppF33KVOv/1cx7Eu/Ud3UKR8BIMoFRfsv1rSlK4dbARA
 s+aUcLmhwf9fFPV67PWW9VYdbD42JoaD9d43HNIRsXf67RaCQjCaYqdysfhL8drCPMhY
 PJ6fCkNj0xELbnjHtbKODj04KiwWc450qsI/hCQWGG0eyp57h/NrTtr/JXyMmsz2lqU4
 48hg==
X-Gm-Message-State: AOAM5324YVZR/g9dARC0NQKTkq1xJyjQox46Aa6NGx5h1ZqfNkzC3hOb
 sy4V9lwEpkmEqITGJJHKWabNvLoB498=
X-Google-Smtp-Source: ABdhPJytTGrrUUasWhUUhuyP+7YHVft0R1KKmR033l++baQXeB0MwcRUg7SmSwA/0erWD2+uNCtMXg==
X-Received: by 2002:a5d:6842:: with SMTP id o2mr15157018wrw.310.1612123396373; 
 Sun, 31 Jan 2021 12:03:16 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id y6sm23833511wrp.6.2021.01.31.12.03.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 Jan 2021 12:03:15 -0800 (PST)
Subject: Re: [PATCH v3 13/24] tcg/sparc: Split out target constraints to
 tcg-target-con-str.h
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210129201028.787853-1-richard.henderson@linaro.org>
 <20210129201028.787853-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ab485d66-fd00-6eec-6606-cd3355fc637e@amsat.org>
Date: Sun, 31 Jan 2021 21:03:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129201028.787853-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.079,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/29/21 9:10 PM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc/tcg-target-con-str.h | 23 ++++++++++
>  tcg/sparc/tcg-target.h         |  5 +--
>  tcg/sparc/tcg-target.c.inc     | 81 +++++++++++++---------------------
>  3 files changed, 55 insertions(+), 54 deletions(-)
>  create mode 100644 tcg/sparc/tcg-target-con-str.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

