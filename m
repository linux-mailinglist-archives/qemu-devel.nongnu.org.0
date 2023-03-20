Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1996C6C18E1
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHQZ-0006pI-Nu; Mon, 20 Mar 2023 11:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHQW-0006ou-MX
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:28:00 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHQV-0006rS-2k
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:28:00 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d17so2315540wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679326076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lPGLnNpZ74Hd11Sz0sYtbr1VEF2Zp5c0nJsnJKOhSLA=;
 b=kTKThtQX7TJqnCFU87C6VZT3im8vyriT0R/0cWp6H3eUSGgIpl0z+oJocgjoxj4MDH
 8TUl0NMhZc7x/mmO7XV3ZoRBxm6GAgI/26QMRyntTKK2pOHVSDLmxJzj0bHRE5qPdO+I
 KemdztX+EXysr4w+kpXdAoNbVEp+5H2/Us2EW7JINTHkN2I29AOwlITwncsAh49oA1Re
 NQC+LA3GoVtyc7VHnRJdww9ZSyHn5UApZANBKtejrE7sQ/6yjc1Jtc4lNUkQd5/capNL
 qjkii7s0ieHNE26G25v81HneJ9HZArhPME/MfjEd9545Ff56YCwy4nkH/2EwcxiPbqXb
 xePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679326076;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lPGLnNpZ74Hd11Sz0sYtbr1VEF2Zp5c0nJsnJKOhSLA=;
 b=HXMZvnS6M7/jVD4qADjzZm+kY9HZe+Ldoqs7/dp6GnHgO8eZ1bh+BVFSqo0xVocb0l
 E9KLMoqFcq7QAyTYhUY4cLLEz06vxWykb2jmYjV6yhPrVLZ20ncojiBybV+6patJefMp
 /fCf8Xx2OuXse0l70Lp8zIH7FtdivGxEUHX8KD5wzbsOPJVvDlpaclhLB65QP0C2mbMG
 Lfqi555hJ2riiQWsdKBKW+M3mfvGcaPxoqDct1kzGxNh6Qset37ww4Q6w/7LS/nlQ7Hx
 wcksadHnsTCnI2RCHryRiVGrcpNlGSNFZTe4nwKvIKIBMC2NTinveYMSzijdQdTxjDpZ
 WvPg==
X-Gm-Message-State: AO0yUKUSi4PGAqIT71K6lZSUYvGkSlzCBiB8al1Q8YI3vq+O5qd4p/Jp
 K9OpF55XzQ7HWfVGU1RdmLLKFw==
X-Google-Smtp-Source: AK7set8x/Bf0YU58X9vnY9F8tKU6vKvdlAEO2JJViknCTaoHhWjxbDI/TRLfhUAeZ3Ssd4M2fLm3xg==
X-Received: by 2002:adf:e987:0:b0:2cf:f141:c647 with SMTP id
 h7-20020adfe987000000b002cff141c647mr9371402wrm.18.1679326076539; 
 Mon, 20 Mar 2023 08:27:56 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 v15-20020a5d590f000000b002cfec8b7f89sm9246166wrd.77.2023.03.20.08.27.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 08:27:56 -0700 (PDT)
Message-ID: <5dfd8515-3e51-b861-3dc5-02c29c699b05@linaro.org>
Date: Mon, 20 Mar 2023 16:27:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PULL 00/24] s390x and misc patches for 8.0-rc1
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Bernhard Beschow <shentey@gmail.com>
References: <20230320130330.406378-1-thuth@redhat.com>
 <539ae95e-7e81-586c-b1d3-e8e41145cc42@redhat.com>
 <CAFEAcA9_1Yyg=X6mNOyMn0NeGnJs4xj0m6VrkjOb=J-LZmVL1A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA9_1Yyg=X6mNOyMn0NeGnJs4xj0m6VrkjOb=J-LZmVL1A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/3/23 16:10, Peter Maydell wrote:
> On Mon, 20 Mar 2023 at 14:02, Thomas Huth <thuth@redhat.com> wrote:
>>
>> On 20/03/2023 14.03, Thomas Huth wrote:
>>>    Hi Peter!
>>>
>>> The following changes since commit 74c581b6452394e591f13beba9fea2ec0688e2f5:
>>>
>>>     Merge tag 'trivial-branch-for-8.0-pull-request' of https://gitlab.com/laurent_vivier/qemu into staging (2023-03-17 14:22:01 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>     https://gitlab.com/thuth/qemu.git tags/pull-request-2023-03-20
>>>
>>> for you to fetch changes up to 48805df9c22a0700fba4b3b548fafaa21726ca68:
>>>
>>>     replace TABs with spaces (2023-03-20 12:43:50 +0100)
>>
>>    Hi Peter,
>>
>> FYI, since you likely did not put this into your CI branch yet, I did a
>> small fix on top: I replaced the patch that fixes osdep.h with the one by
>> Philippe, since it was slightly better (removing the "extern" keyword
>> instead of swapping it).
>>
>> New commit ID for the tag is now: c29e73f7e65299ed9261abce3950710d89c64724
>>
>> I hope that's ok, if not, please let me know.
> 
> Ah, I've already merged the old tag into staging for the CI
> run. I could drop it and re-do, but we'd burn another lot of
> CI minutes on it. Is that worth doing?

Nah, what is worth is getting CI green and saving minutes :)

