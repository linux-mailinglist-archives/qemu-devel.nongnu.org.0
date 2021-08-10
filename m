Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE863E7C5B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 17:33:42 +0200 (CEST)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDTl7-0002EX-Bc
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 11:33:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDTju-0001HZ-4D; Tue, 10 Aug 2021 11:32:26 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mDTjs-00032a-AR; Tue, 10 Aug 2021 11:32:25 -0400
Received: by mail-wr1-x436.google.com with SMTP id q11so8664254wrr.9;
 Tue, 10 Aug 2021 08:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1nsDhva592hSjNdM6mLCuobGDvVI0bNTGzvMMGuOGA0=;
 b=WcEeOMqeNqZe4v4MNqjNf4PGCRuBrRG22YTdUz0XxlnCBbLElkjA0u/MvsrwsYkppz
 KjJoq/yRD25kQ80AtMEIf1Eg7sWzKOy63AOBjZnVe21kY8hTRRxdGQeMFFpKTxJ7Y6Ws
 LycS5OSiGqoNNEWBABmY/17hpW0YUBEmZLlvPd5vyD3hLPFfAexktF4/5pDECYrulZw3
 PNNBlegZfdb8C7X7SSv0ADou1Mrt8zT3mFl2TYhmXZ/+FL5fDzCrtw1OUTZkamsH8Og9
 0Ur89JWSFS2pEJTgR+JGFCHv3O8hOQ9nGfhCntYChVbfQ6jO43b4gnj0fgok9JPSzQOV
 6Kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1nsDhva592hSjNdM6mLCuobGDvVI0bNTGzvMMGuOGA0=;
 b=tVokMVsXW6m/9RJ9BG6S3YR+NBzhfHB/MEymX/qOLUmj4Wz5pVwVVwaUQ1ca3Syw71
 4MrwdplBKMSv/CZ1/1jTnGGzL9szp76ClDKWmBZbcQeGO7zEwt6kL4IhJBydCdXeCkUy
 p1EUlNuL8s7U0rRGjFcEA1zoFgqzbpuOKEMHd4xU/y5ucdE+LmPkPQonZSDCDINfwkZ7
 5gNcj22yVv7mHsZggwaxTHe5oH3nlHr7eqzJCgijJun8SFIJiup9iXFiexEl70T7CBsY
 7znv7Y0h+qSOxSjeca+987pQSgfcdofpRIr4hA/Lp2fsVDW9TWm5+qFMwC4SDiTLmlpl
 KBsA==
X-Gm-Message-State: AOAM531W0SuSjKyEIdxhmltiMgEeB+vvjv+6IfvLWBFF6ZqInZpamwbU
 nR9bzBEVXA8lWBqsouL3MBkiLIME4jI=
X-Google-Smtp-Source: ABdhPJxJw9hQFm/u0zeFm78xjWkoTDp3herc43AwZloJBbHKD/JfHEcG4p9ACC7QPZs+hUxuZ93oqA==
X-Received: by 2002:a5d:508d:: with SMTP id a13mr10033645wrt.172.1628609542309; 
 Tue, 10 Aug 2021 08:32:22 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id f10sm2777695wrx.40.2021.08.10.08.32.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 08:32:21 -0700 (PDT)
Subject: Re: [PULL ppc] powernv queue
To: Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goate?=
 =?UTF-8?Q?r?= <clg@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
References: <20210810124403.771769-1-clg@kaod.org>
 <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b840d4f3-efca-feaa-3834-375c8e51eb8a@amsat.org>
Date: Tue, 10 Aug 2021 17:32:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9aHX53JkEW3hbjWfeK=LL8QKxWopRAx4pcV6V=PKv3QQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/10/21 5:17 PM, Peter Maydell wrote:
> On Tue, 10 Aug 2021 at 13:46, Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The following changes since commit bccabb3a5d60182645c7749e89f21a9ff307a9eb:
>>
>>   Update version for v6.1.0-rc2 release (2021-08-04 16:56:14 +0100)
>>
>> are available in the Git repository at:
>>
>>   https://github.com/legoater/qemu/ tags/pull-powernv-20210810
>>
>> for you to fetch changes up to 91a6b62df830d51f2b6b2ea00b3c92231d0ba9dc:
>>
>>   ppc/pnv: update skiboot to commit 820d43c0a775. (2021-08-10 14:18:51 +0200)
>>
>> ----------------------------------------------------------------
>> ppc/pnv: update skiboot image
>>
>> ----------------------------------------------------------------
>> Cédric Le Goater (1):
>>       ppc/pnv: update skiboot to commit 820d43c0a775.
> 
> That skiboot changelog lists a massive set of changes, which
> is correspondingly a larger risk that something in there turns
> out to be a must-fix-for-release regression.

There might be a misunderstanding here, per
https://www.mail-archive.com/qemu-devel@nongnu.org/msg828857.html
I understand this pull request is targetting David PPC tree,
not the mainstream one. David first queued this patch for 6.2,
and later confirmed by Cédric:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg829160.html

> For future release cycles, can you try to get guest bios
> blob updates in earlier rather than on the day we're trying
> to get rc3 out, please?
> 
> thanks
> -- PMM
> 


