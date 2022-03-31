Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E3C4ED7E3
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:43:41 +0200 (CEST)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZsHE-0005Ls-IG
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:43:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZsFv-0004et-DZ
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:42:19 -0400
Received: from [2a00:1450:4864:20::430] (port=44605
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nZsFt-0003tK-S6
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:42:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id b19so33125586wrh.11
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=29NLbaPzDB1Ky22Dt9BERt8tFaZTC2txAFxoQ9Bag8k=;
 b=lOolo4jsnyYVJS04NdxXDvYFzUHjZkdrqTkvIL0dXbiUUVIW2+pVcpaXB9AvZUwBPZ
 mf0H/WzII7y2eWeJzbij70z0QmoxJJ2z+tITMu+OLWY8mt04DWGBXLRzxzylHfGCT4cT
 6+AUSkTIi8F36F0zyCvSQkvCEDaf0VB3yjX8dKSr9GsxaKCmq14sVDKTjsF8xAqUU7sA
 Z4W0waFA/QBxhJV3npA5VhVFDa5RzDLC0FgwoFPzWOEcB0oETAYm2+5r3/UMhbsHk4aj
 RyjXeXG5Ifds7nMjGXNDpa/wtyVHAZqShJD0IscMOEfxawworzJVXNjrPS79sK1d9aJ4
 LizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=29NLbaPzDB1Ky22Dt9BERt8tFaZTC2txAFxoQ9Bag8k=;
 b=TLK02T4ZpTjdYTdt8BdP8UUzurm0Y5t/MxWUgzme5B6luSdm0H4jHxUPVGbkLM0yLo
 8N2Ss+FlgVP+7US81VerJ98rHuh/Jj3DDFRE/B0PovDviuv5MPZPfIJcCOznDu7NgagO
 RYCfAx/Fn6To+7MTBBwUZNOium9XrDZVHYQyVuGLValMd+2TBO3KsyxPTrIT7/EPDOEA
 xCmCYaQIGquKhGf7V2jFot7lFVhVdMj87Q6TMgY5FbWew4yABXAZTLnvTrjwdnaZUUvc
 kf+HofzxVGp0k/iE/zM5rHRfqNQix7R35EKyo2yXjEpOenF2R9SxKkMPh/TOgHWN12to
 yY5w==
X-Gm-Message-State: AOAM530veVJfN52QJrx6sbOjL848DSf2XuDA74n5F1lOxViqlFe38Xlv
 yr7m+RJ2lRMBpa2lYYimFag=
X-Google-Smtp-Source: ABdhPJxkALLPZNbzMOoi8rdE+xX3a49hkB6bI+Mo9SFgbiqh6O8HRXrx2lMCmnGuXlQmGRmulNMgVg==
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr3656611wrs.301.1648723336333; 
 Thu, 31 Mar 2022 03:42:16 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:49f5:f512:3c8e:a801?
 ([2600:70ff:f07f:0:49f5:f512:3c8e:a801])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm18896016wrv.49.2022.03.31.03.42.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 03:42:15 -0700 (PDT)
Message-ID: <192d78ca-d3e0-13d9-91d5-9f2c7cac33e6@gmail.com>
Date: Thu, 31 Mar 2022 12:42:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH-for-7.1] hw/tpm/tpm_tis: Avoid eventual read overrun
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>
References: <20220330235723.68033-1-philippe.mathieu.daude@gmail.com>
 <CAJ+F1CJ3eWn1iZ1VWBRyG+pbybQ=8EEHX7movkHb6Qgs-b=kZQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAJ+F1CJ3eWn1iZ1VWBRyG+pbybQ=8EEHX7movkHb6Qgs-b=kZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 09:50, Marc-André Lureau wrote:
> Hi
> 
> On Thu, Mar 31, 2022 at 4:02 AM Philippe Mathieu-Daudé 
> <philippe.mathieu.daude@gmail.com 
> <mailto:philippe.mathieu.daude@gmail.com>> wrote:
> 
>     From: Philippe Mathieu-Daudé <f4bug@amsat.org <mailto:f4bug@amsat.org>>
> 
>     The TPMState structure hold an array of TPM_TIS_NUM_LOCALITIES
>     TPMLocality loc[], having TPM_TIS_NUM_LOCALITIES defined as '5'.
> 
>     tpm_tis_locality_from_addr() returns up to 3 bits, so 7.
> 
>     While unlikely, Coverity is right to report an overrun. Assert
>     we are in range to fix:
> 
>        *** CID 1487240:  Memory - illegal accesses  (OVERRUN)
>        hw/tpm/tpm_tis_common.c: 298 in tpm_tis_dump_state()
>        294         int idx;
>        295         uint8_t locty = tpm_tis_locality_from_addr(addr);
>        296         hwaddr base = addr & ~0xfff;
>        297
>        >>>     CID 1487240:  Memory - illegal accesses  (OVERRUN)
>        >>>     Overrunning array "s->loc" of 5 24-byte elements at
>     element index 7 (byte offset 191) using index "locty" (which
>     evaluates to 7).
>        298         printf("tpm_tis: active locality      : %d\n"
>        299                "tpm_tis: state of locality %d : %d\n"
>        300                "tpm_tis: register dump:\n",
>        301                s->active_locty,
>        302                locty, s->loc[locty].state);
> 
>     Fixes: Coverity CID 1487240
>     Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org
>     <mailto:f4bug@amsat.org>>
> 
> 
> Maybe that assert should be in tpm_tis_locality_from_addr(), as various 
> callers could produce the same report.

OK I see, tpm_tis_memory_ops handlers are safe because mapped as:

     memory_region_init_io(&s->mmio, obj, &tpm_tis_memory_ops,
                           s, "tpm-tis-mmio",
                           TPM_TIS_NUM_LOCALITIES <<
                           TPM_TIS_LOCALITY_SHIFT);

So invalid addresses are impossible from guest.

