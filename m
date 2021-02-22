Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED3C321584
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 12:57:22 +0100 (CET)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lE9q5-0005jR-Fl
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 06:57:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9oy-0005Hx-GY
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:56:12 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40258)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9ov-0000F9-JZ
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 06:56:12 -0500
Received: by mail-ed1-x52a.google.com with SMTP id q10so21520529edt.7
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 03:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xMQsCtJf2X//p8mZJWv/bfhsq3Il+/l218fPW5GUOaY=;
 b=LcwDByYtvPbz+V+g/n1CuWwGLxdiDz3D5aNnWrJtv/nrAqJ9Wz2/NmfIsXvoPEUQTx
 chv/e+RHeggIEWl9awmbru35ceUH8blegMRFvu9Otmjfw0lGxSTAC1h7YLIRL/YwmJQu
 xo7h9DWZ0L8bsL2VxkmK0FIcbfhnA3DNUpx4OUaTwJtZQc+3MJV5cGeZHcqrUYgoBo3L
 o8psFfQfyXz1qUx24njSAXzlovJVB256XFb2AD7+v5dr9dVDfSG5JC/30Xdvq2AyhmLx
 Zk1p2OwZZr67Rf+fmthdMACbr1Xh8553YsMRuKDoRcAfONickJOygsOZKm+S3ZoZvTu9
 tKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xMQsCtJf2X//p8mZJWv/bfhsq3Il+/l218fPW5GUOaY=;
 b=DBSOhSyNQiENDe+H8DW9AImo9OTVIfMPglMc/HgkF3+sIWnV49bdR91qNYqm3EF44k
 8t0Zn28UJz4Om1eNDqq1otrSxiWTGhJsTWogQsSy8/O+yA/jHXY7nvNYnt7KPn5cmw07
 ZMsmGBDLdQqCpRPwYZroDlPWoI5NiILfuII5Y/SWv4s4SO3inkWjWtEupnkQr/BNnA63
 iKTe9r+oNkQfyPrlYBteQ99umzZexdb6aKA6CKXgYR5AJlqCr46eyDO3Zjz62uAY1p1O
 ASoXGrWqJcpv32cxs2Ku6SGNo6f03ghbLjDi4JN1PMbV9JrZ3fU8OUk4Bda1vjADNn33
 9Ngg==
X-Gm-Message-State: AOAM533NIYTe9Rti54jTWB4oSJwPYHyXefA5uuPDWBITGeTWFh80de1T
 bB6JEwFml4j4qvekOPXNjdc=
X-Google-Smtp-Source: ABdhPJwq4gJhGNz1QVZvUr7PSQpE0ot7TiVpA60hGZ27K4EboTisLlTn2ZEWiHmWhkmdgz6wuLR+Nw==
X-Received: by 2002:a05:6402:899:: with SMTP id
 e25mr11007034edy.212.1613994967950; 
 Mon, 22 Feb 2021 03:56:07 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g20sm10573362ejz.54.2021.02.22.03.56.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 03:56:07 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <80a645c4-866c-2791-ac9c-91118018a44c@linaro.org>
 <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <84ba4ac5-f239-e3c8-47b8-25e4a81d545c@amsat.org>
Date: Mon, 22 Feb 2021 12:56:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1ae56383-7664-c2df-9402-97844cfbeade@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 9:43 AM, Claudio Fontana wrote:
> On 2/22/21 6:35 AM, Richard Henderson wrote:
>> On 2/21/21 1:24 AM, Claudio Fontana wrote:
>>>   target/arm: move psci.c into tcg/softmmu/
>>
>> Terminology: the opposite of user-only is not "softmmu" but "system".
>>
>> One glorious day in the far future user-only will, as an option, use softmmu.
>> It will fix all sorts of problems with alignment faults and host/guest virtual
>> address space mismatch.
>>
>>
>> r~
>>
> 
> Hi Richard,
> 
> first thanks for all the useful pointers in the series.
> 
> Regarding terminology, I think the mismatch is throughout the code right?
> 
> So many of the existing "softmmu" files and directories should actually be called "system",
> or "sysemu" to match include/sysemu right?

My understanding is there are currently 2 types of emulation:

- user mode (emulation of the kernel syscall API)

  -> Linux, BSD
  process is in unprivileged memory space, no access to I/O

- system mode (full machine emulated)

  - MMU implementation in software: softmmu

In that separation semihosting is borderline.

Also FYI I have a wip branch where I am prototyping a "supervisor
mode" emulation to run Cisco IOS images. These images run in
supervised mode with access to I/O space, but not access to protected
kernel space (where the firmware resides). Unlikely to hit upstream,
but fun experiment ;)

> To me these distinctions are a bit unclear.
> Maybe it would be good to have clear documentation about this in devel/ to use as a reference and end-goal,
> 
> and then we could do a pass of the whole code to fix the discrepancies in the use of the terms?
> 
> Thanks,
> 
> Claudio

