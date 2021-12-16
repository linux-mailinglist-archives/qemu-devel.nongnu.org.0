Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D26477ADD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 18:46:57 +0100 (CET)
Received: from localhost ([::1]:50444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxuqF-0002Yr-Sd
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 12:46:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxuo4-0008Hf-1e; Thu, 16 Dec 2021 12:44:40 -0500
Received: from [2a00:1450:4864:20::436] (port=45952
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mxuo2-0005h7-Ka; Thu, 16 Dec 2021 12:44:39 -0500
Received: by mail-wr1-x436.google.com with SMTP id o13so45501816wrs.12;
 Thu, 16 Dec 2021 09:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=lEsR+Rgn0vnkJc18JZZWnBdS0ycQWikcD+PRLSoXeew=;
 b=Q97++wfsfRdzAjrs8KLNgvnkmR9sFurzwBREKMuhcdiMu7/uU2juKuEyMKJ8bllY9A
 nAAF8IDtPFUl03sS6Dv9Vo58WguOmkSSApBwAtFiQrpM2Eh4rs5s9uiGQRyLBhnWqd97
 Btjg4abafB3T0Y9RsEo9OHwxMiBFtRVTrxQdUza+FmI5IZVVmOVZr2OexKMZWxwG0UAg
 Bnup00lRNAZaqFhAvXyGdub+jALjpSyaxR+Q0I/lP9Xd6kjlhOlzPOOqmGspFOa8yhHV
 lTz44rwbiG7A4l6SE0KycZICjqQ1ZRO0nMS+LRwHZYTxIgBl12XjDw77CK/ftnnC+Txa
 KxPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=lEsR+Rgn0vnkJc18JZZWnBdS0ycQWikcD+PRLSoXeew=;
 b=RJxCqeH5NEPr6Flbay3HE268UUMvX7EHnZflEdC4vlKCKmJuNONi/QHHpEy3+J1V3l
 FMJ6FplmeKi/IOIZItA5EwvirVxVqzQCf+/cPKxDuacJdwUHnvxRjrrBA6snn3YQph3e
 hsA7eH+Tje1rTTp9Yrop9rnHbvsyRcgEi5LFtVEiugzFig1OPZ+LDDPCgm4OyjyaFq7T
 OcdoMsGp7jCsrAvzm198go5M66JIje5UNu7Lwn+xSlJwLfsQXAbDCxHHBndB/T5k1uJZ
 ShNp1dpsXdbrNx26IbSO1QCl+iPno3/ujtqxdHA1teCDHBYMLOt4Jxk6lEM2A52BjgE+
 Pbng==
X-Gm-Message-State: AOAM531smV/oTyeyAYtIKk+DmJa/q6bobUpf45BdC5g7Dc3stn5ENohz
 /LW1jFYM3i7bui55XiULXhg=
X-Google-Smtp-Source: ABdhPJy7BHHmzRPY9VRY1nWXphJJYDfRhTNjr676DywSlsoU73lAjUOZiw83JpKyKPmr/4khIKNHQw==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr9879805wrd.420.1639676676586; 
 Thu, 16 Dec 2021 09:44:36 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f18sm5236222wre.7.2021.12.16.09.44.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 09:44:36 -0800 (PST)
Message-ID: <6b16b0e4-c0db-02de-1d95-ec831fdff938@amsat.org>
Date: Thu, 16 Dec 2021 18:44:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Exception return
Content-Language: en-US
To: abhijeet inamdar <abhijeetinamdar3005@gmail.com>,
 qemu-discuss <qemu-discuss@nongnu.org>
References: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <CAP4GjT1x=9z9jwRxUg-J_nyGQKiga=xcDddWzG5a9HCkiC2Tog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.034,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-arm developers.

On 12/16/21 18:31, abhijeet inamdar wrote:
> Hi,
> 
> I was running my .elf file on my custom machine(CM3) and was hit with
> this error when debugging and had the required -d flags and single stepping.
> 
> IN: Hal_MemFault
> 0x7004e794:  4770       bx       lr
> 
> Trace 0: 0x7f4faa471100 [00000000/7004e794/0x312000c1]  Hal_MemFault
> R00=7004938d R01=00000000 R02=7004938c R03=ffffffff
> R04=7005e410 R05=10020000 R06=e000eda0 R07=00000000
> R08=00000010 R09=1003f8e0 R10=e000ed94 R11=00000000
> R12=ffffffff R13=1003dbe0 R14=fffffff9 R15=7004e794
> XPSR=01000003 ---- T handler
> Taking exception 8 [QEMU v7M exception exit]
> Exception return: magic PC fffffff9 previous exception 3
> M profile return from interrupt with misaligned PC is UNPREDICTABLE on v7M
> ...successful exception return
> DRBAR[6]: 0xa0000000 misaligned to DRSR region size, mask = 0x3fffffff
> Taking exception 3 [Prefetch Abort]
> ...with CFSR.IACCVIOL
> ...taking pending nonsecure exception 3
> 
> I even check the CFSR its 0x1 by doing p/x *(uint32_t *) 0xE000ED28
> which gives me 0x1
> 
> Any help appreciated.
> 
> BR.
> Abhijeet.


