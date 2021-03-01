Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C29327F9B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:36:44 +0100 (CET)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGij5-0008JD-68
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGicZ-0003eZ-9x
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:30:00 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:41535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGicX-0007LQ-Ks
 for qemu-devel@nongnu.org; Mon, 01 Mar 2021 08:29:58 -0500
Received: by mail-wr1-x433.google.com with SMTP id f12so12351286wrx.8
 for <qemu-devel@nongnu.org>; Mon, 01 Mar 2021 05:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RNZ2KkIDlCwchPQIhoZILiyKmFHSNBZRx4/9xi4g8VE=;
 b=u9Amie2oDzBDSNBeyntkfRAOD12rYB1q6Hu/fzdw3nhmCTUpMY22SCXbQOkZFHvFpT
 +qfhU8v4XEvq6Oh/u4OheoqRWMSehSimVMmONFb6wcAMKIQI7ExKHQu9Ha+OzAbsa/vf
 pWrQS4v2Mfb3wEHR7TG+reegpnGOnuDXoPCBZvy+02pS2MkcdF4etv0c6M6BzXzABREu
 vj4iSpxEDHndp367q0/eDqp/b7e5V/nicPuX09AHZbq9kQMv6DOAEUytcVXiDqa2fzf/
 16boM4yZvFKqvM0WOS2tR5qcGv17o9Ka7ZalQJP8ZeIapXxRDBjdCNK6IQfb2fNw63mn
 MvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNZ2KkIDlCwchPQIhoZILiyKmFHSNBZRx4/9xi4g8VE=;
 b=QmMHEjR/uHQMvwlZGzl+Pwu3DDnmPWhfXZKG7cF0790rI0vOXsASThyZfjvx3pmZmv
 EsMnVk8sTAsVNRG2PZUMtN2vKzy882WW6iZZbEuguePoyWHjB0cRN+EykEkluBXu+D3V
 q41DLLSnaQzZdlVuxUIQMXnIuDJ4D8o6si2vwAYzqzha1e5fR10mjJOhjO0eQUUPWg0U
 v8c4pKWvWeLODQzeSSkzbawO3oigzi78/97XtXMIEIsvCb9JDRUnbv4wEF/ACW5yhOpI
 A6jI65vSruumPIKW49QsB6cUFxnCvuH+iEnmsTw71z22wZLYr2Jr/MqUbOYOHBd6LyFo
 OdXw==
X-Gm-Message-State: AOAM5308lVfdvj+rfg4P9CW32b4ma367KcWksp8KqYPuGGXk6QHxqJ4j
 wxoK5omnL1hX2wtHz8g+4a4=
X-Google-Smtp-Source: ABdhPJzN0j+H1o92tGOxwFPxa6VLpyWmrQ1iVQ6Aflc69BzHC8e4xJbtHwU4g51FErueOmyN2IovvA==
X-Received: by 2002:adf:b611:: with SMTP id f17mr16400050wre.8.1614605396022; 
 Mon, 01 Mar 2021 05:29:56 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o124sm21857354wmo.41.2021.03.01.05.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 05:29:55 -0800 (PST)
Subject: Re: [PATCH 0/4] hexagon: Add Docker image & testing to gitlab-ci
To: Alessandro Di Federico <ale@rev.ng>
References: <20210228222314.304787-1-f4bug@amsat.org>
 <20210301142517.7820b922@orange>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <580346b0-803a-87f2-690c-8c68ff9c5cab@amsat.org>
Date: Mon, 1 Mar 2021 14:29:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210301142517.7820b922@orange>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Brian Cain <bcain@quicinc.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Alessandro Di Federico <ale.qemu@rev.ng>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/1/21 2:25 PM, Alessandro Di Federico wrote:
> On Sun, 28 Feb 2021 23:23:10 +0100
> Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> 
>> This series is a rework of the 'Add Dockerfile for hexagon' patch
>> from Alessandro/Brian that Taylor sent in v8:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg780330.html
>> but adapted to mainstream.
> 
> All of this looks good to me.
> 
> Sadly, we've been doing internally exactly the same thing and were close
> to push it upstream. We'll be more explicit on what we're doing.

Great. I don't have much time for this, but I'd rather not have
the hexagon port start to bitrot because untested, which is why
I tried to get the testing loop started. I'll let you following
with it then, thanks!

