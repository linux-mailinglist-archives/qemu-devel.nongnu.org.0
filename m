Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8125E320701
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 21:02:56 +0100 (CET)
Received: from localhost ([::1]:55302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDYSt-0003NW-4N
	for lists+qemu-devel@lfdr.de; Sat, 20 Feb 2021 15:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYRI-0002ss-R2
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:01:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lDYRF-0007J6-RB
 for qemu-devel@nongnu.org; Sat, 20 Feb 2021 15:01:15 -0500
Received: by mail-wr1-x436.google.com with SMTP id a4so12413593wro.8
 for <qemu-devel@nongnu.org>; Sat, 20 Feb 2021 12:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7hXfgK0E8khvJzksS41rdLJf1zwuSCsge+8eCW4yOdg=;
 b=UEJf4HzDdfBKWbzqHFNFDcwEWN/lNYWalQ1UCZO/TtV1kkz/3bgQXlpyzkZfI3gBLG
 VYE6nUnHIt/X8842mKf/Onbhl/Ex+lYXENJzq5WjD1xhPOVQ4lg5hIIbhDIUPktd2/Qh
 DSrGX2K8UJo7GyINDzo2bweLAaFzjR80s67eqK0sWesZeB0+QLGvouc2SV5YVCjhU8Y1
 S3mi8RlTByUDAUWS8+GPV9kh8uspwfQfELLLm0j1/X/P++mhMxPaJA7jabeMIWK/YQ9C
 6lmlTxh+N0ErizN55nJnAr3GgxPOP3YkxiNa6q3jDna1593+lo0QrvouFtufUwcqL+Oe
 w0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7hXfgK0E8khvJzksS41rdLJf1zwuSCsge+8eCW4yOdg=;
 b=mQkRvr8tpiRToU29AxJ2FoMPPedqsxr5eJucw9Sb8OvDsvTn/jhcXhMIhS34EfeWD7
 DDmjGpibaXGKGTvVeQ8iLDxuYAd9BNu6oCb4P4u3Lafb8hDDo5AZsHav0kuZ3/mBWrip
 QXG/xxCQQwWnUQYDIjNKEIlfngzaHJR0KrV6BGMQm6upgmBbVLyqCOher92Re/4Y1xXj
 ZX504BJgeW0E5WzfjZcmcGysG/dRgLTvUGPs35ZfHd7knlDDlxhuqezG6hfpeo+Ou5em
 q4T+6p0yiGovlXyIy4FVwB21znY7MBLiYByFZr+7AXOSRiY/vsQ2Aq9D6BuixrpqmBDe
 bqKA==
X-Gm-Message-State: AOAM531HqhUNnBz+JQP1eTCWpgE5rf7ngpIe1V5TwKovG1s4R2ykVIhD
 P1h37BpdN+lkBO3lmQ8DeOM=
X-Google-Smtp-Source: ABdhPJxObrjLvtlE0L9UXrd3c8stKz1qpdzqhlrGz4YCcHPfkNY9rFv//1V3yFwjR6e3FqSGU1EiRQ==
X-Received: by 2002:adf:de86:: with SMTP id w6mr14603830wrl.32.1613851271614; 
 Sat, 20 Feb 2021 12:01:11 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j23sm16715756wmo.18.2021.02.20.12.01.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Feb 2021 12:01:10 -0800 (PST)
Subject: Re: [RFC PATCH 32/42] docker: Add gentoo-mipsr5900el-cross image
To: Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210214175912.732946-1-f4bug@amsat.org>
 <20210214175912.732946-33-f4bug@amsat.org>
 <20210215115957.GG1542881@redhat.com> <YCp7Ce6ELbLFvRXZ@sx9>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ebbdecd9-e599-1a4b-60e8-3464afa4a20e@amsat.org>
Date: Sat, 20 Feb 2021 21:01:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCp7Ce6ELbLFvRXZ@sx9>
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/15/21 2:45 PM, Fredrik Noring wrote:
> On Mon, Feb 15, 2021 at 11:59:57AM +0000, Daniel P. Berrangé wrote:
>> On Sun, Feb 14, 2021 at 06:59:02PM +0100, Philippe Mathieu-Daudé wrote:
>>> Add a Docker image providing cross toolchain for the MIPS R5900 CPU
>>> (used on the Sony PS2).
>>>
>>> This image is based on Gentoo and the toolchain is built using crossdev.
>>
>> Is there any way we can do this with a distro that isn't Gentoo
>> so that we can get a container build that is fast enough to be
>> useful for CI ?
> 
> Is it necessary to rebuild the toolchain every time?

No.

> Also, perhaps a
> generic MIPS suite can be used; it shouldn't to necessary to have one
> specifically made for the R5900 (except libc, if needed, I guess).

We want it to build TCG tests. If we can link them, that should be OK.

> As an alternative, TobiX at Github made an R5900 Docker image last year
> <https://github.com/frno7/linux/issues/33#issuecomment-632284209>,
> perhaps it could be useful somehow?

Thanks, I'll have a look.

Regards,

Phil.

