Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 742AD410CF2
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 20:45:26 +0200 (CEST)
Received: from localhost ([::1]:57530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mS1ob-0006ih-E4
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 14:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1mY-0004RX-Sd
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:43:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mS1mX-0000sD-Gb
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 14:43:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id d21so24625536wra.12
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cmbsv52UypSrrFragVy3KnNKK9dGwHyFqZsZx3RHdF0=;
 b=oYchNg5mQuK5hQveA7DwNkRW0UQt1bEbSm86h/FDB0lahtofk9ZeUjmMxZNb5l7KeQ
 8+wRe34eDPY5ptv2Ybs09yJQ99UC/z462ESUe+b06hh/gajlidL0BnsQco0usHmAKCxo
 1dRKEcczSDKwu8xEVz4mBA6v5YWA6SFTRvWfQP4h62wXOl2ClFX7fbSrHyzk2TRBoJAd
 imwfNXvcI6Sqjl6dzPRUG7EwDWEwtRfLcr3MHqa9IqnRPebqBRlkuEaQOxDw9QZ2Yins
 F4PvDQZDd19nVF24M/4GdaP5pVhSA9oJbfgqnEKHJjMG00kQGCtpPxqKTmVu8HcFAMS3
 Hb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Cmbsv52UypSrrFragVy3KnNKK9dGwHyFqZsZx3RHdF0=;
 b=72jdRlmS5Ja6ErCENHmz9IWXumF1SAnow1oUNfyFiD9eyz++/F3Zg3k3p6GnFQYnY/
 iQ6mVknhnfGq9V+FysFK02zqsZdsNMEJxMORezxfCVZx3dCkJ35QLbpMJH+lkIid1EsZ
 dM/ja+UDAKZ1kbH/qX7wirmUOMUV3dg4BbkAJ7qZwUFQs0qyzThhlqBx6D3WwVk9o7qy
 PlnLpPjb/gxny+YB2Uioyz5xmTD00/3lkcTo1KD/1HESBeTMMu3/Srld58fa/njZM2JO
 NQghQ9Qi4oOF+p4GCNtW77EpC6AiZXdTFLevyRABm8feqyYJ22E5ScU1W+/r1D89lA7N
 xYfA==
X-Gm-Message-State: AOAM533Yktg3dtc5VtFhjYgdAeYs111fKZqZ9cd7LzFSWKTcMIsMjljV
 Ph5OsbV0Uhps1siyt14MM6g=
X-Google-Smtp-Source: ABdhPJzGO4osbCq2IrxcFRCBWO2aIpSdIyNYL/KQxIFkAqbhe6pAtwTyib01PLEzGc0a90j8Rr66eQ==
X-Received: by 2002:a05:6000:1844:: with SMTP id
 c4mr438281wri.355.1632076995957; 
 Sun, 19 Sep 2021 11:43:15 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id h15sm13084505wrc.19.2021.09.19.11.43.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 11:43:15 -0700 (PDT)
Message-ID: <30b30a40-8edc-92a4-7140-cf7e37fa5ab6@amsat.org>
Date: Sun, 19 Sep 2021 20:43:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 20/41] linux-user: Add raise_sigsegv
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210918184527.408540-1-richard.henderson@linaro.org>
 <20210918184527.408540-21-richard.henderson@linaro.org>
 <425a941d-5f7f-e875-dc62-24d8973c4a23@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <425a941d-5f7f-e875-dc62-24d8973c4a23@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/19/21 20:35, Richard Henderson wrote:
> On 9/18/21 11:45 AM, Richard Henderson wrote:
>> +/**
>> + * raise_sigsegv:
>> + * @cpu: the cpu context
>> + * @addr: the guest address of the fault
>> + * @access_type: access was read/write/execute
>> + * @maperr: true for invalid page, false for permission fault
>> + * @ra: host pc for unwinding
>> + *
>> + * Use the TCGCPUOps hook to record cpu state, do guest operating system
>> + * specific things to raise SIGSEGV, and jump to the main cpu loop.
>> + */
>> +void QEMU_NORETURN raise_sigsegv(CPUState *cpu, target_ulong addr,
>> +                                 MMUAccessType access_type,
>> +                                 bool maperr, uintptr_t ra);
> 
> FYI, something to bikeshed here is the name of the function.  Should it
> in fact be cpu_loop_exit_raise_sigsegv?

That or cpu_loop_exit_segv() which is explicit enough IMO.

> Because it can't be used outside of the running cpu context.  (E.g.
> there are a couple of instances where it's tempting to use this from
> within cpu_loop itself, processing pseudo-syscalls.)
> 
> 
> r~
> 


