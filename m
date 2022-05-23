Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23F15311AB
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 17:44:08 +0200 (CEST)
Received: from localhost ([::1]:43274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntAE3-0001t6-Lt
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 11:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntA5s-00043f-Az
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:35:40 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:53803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntA5q-0005FM-90
 for qemu-devel@nongnu.org; Mon, 23 May 2022 11:35:39 -0400
Received: by mail-pj1-x1032.google.com with SMTP id z11so4584453pjc.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nb0gXLnG3vXymenlSwSKp6S0s3pBepFe4gi9gZLSRsc=;
 b=uMeo4a/6Ngdlog3Hn2bnPn3h96EUVHN6wgF7+0bdQh1S4U77gqgC77Bv/tlrCW+Lmv
 Q2N6xt5/JYkNlcCfTXAb1AmVCFkYMwqtcOZO65BuGXjl3/svnWGBFuVcN/tgOZO+c2uC
 XT2b74qnwgh5St1/zrA+w4wqDgmAwOqoewjwi7ftJEx3ybw7cbcX1WdCOoKKoKIAKOcQ
 GnjnM9FiWxpn/714R6NaL5nB698cyOSSmpu3a3IiBL9sPmwDJkjkFrRDKHWCpEqWsWuJ
 EJhlmuABr0bhtMSu4MS2brKj+joM1IZNKh242g6jxQDdahE1+ga04ANd7rDKuO77hUcU
 VLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nb0gXLnG3vXymenlSwSKp6S0s3pBepFe4gi9gZLSRsc=;
 b=sy3qLlXuowumgm0yp5dP9HELe/58SchVyn96jwtFIuhe/05JZrsHzIl0zOsfW1mQ5A
 fMatfml+SRAESkyT1rNNcKLw8iZgrc6XTk6gzIACnBx3EmaBPI1tjQLUxPtwpqC/XCit
 MQL6A4mHaJb6OIcZaH4qdfRiU12Zl45VrDMHbkmpORs32G5wQ81CE9C/TznDwGZbYlmu
 /7G4uLx96CTOpnIFs0zKDrnyis5MWeUWu46QvLQNo4HD8pNqO0CKiu7agA/LfA/R5wT5
 C8/tHCNFOMYiMy1Tf9+ItKNDytxJ5XCRSOBfO1sZcqo6c+/CNzKQxj8NxZ9swhA4g3x7
 xdaA==
X-Gm-Message-State: AOAM5320J0HZ1g3At8tREE1iIqByCskV25BOuh0Xa4oPFwWL1ExKZlFo
 n6Tvy7sp8dnXuA8tNpAJYA0GAQ==
X-Google-Smtp-Source: ABdhPJyeSXRm3Xbos9R5GzWQp8M+T/ai1kFbazBnmUQ8ZwL6tqakgKO0YyQWMz/BLoHRVLPm/S+LUQ==
X-Received: by 2002:a17:902:6505:b0:162:6c7:7236 with SMTP id
 b5-20020a170902650500b0016206c77236mr11893205plk.96.1653320136849; 
 Mon, 23 May 2022 08:35:36 -0700 (PDT)
Received: from [192.168.1.6] ([71.212.142.129])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a170902cccb00b0015e8d4eb28fsm5330748ple.217.2022.05.23.08.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 08:35:36 -0700 (PDT)
Message-ID: <840c75f7-069b-9c53-37ca-399489989758@linaro.org>
Date: Mon, 23 May 2022 08:35:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 09/49] semihosting: Adjust error checking in
 common_semi_cb
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-10-richard.henderson@linaro.org>
 <CAFEAcA9x+xCFkLQX8wMnTr4JfFLN0nOnLan6y-Qt-tmzRe5mpA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9x+xCFkLQX8wMnTr4JfFLN0nOnLan6y-Qt-tmzRe5mpA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/23/22 05:13, Peter Maydell wrote:
> On Sat, 21 May 2022 at 01:04, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The err parameter is non-zero if and only if an error occured.
>> Use this instead of ret == -1 for determining if we need to
>> update the saved errno.
> 
> The gdb protocol isn't 100% clear on this, but what it says is:
> https://sourceware.org/gdb/onlinedocs/gdb/The-F-Reply-Packet.html#The-F-Reply-Packet
> 
> # retcode is the return code of the system call as hexadecimal value.
> # errno is the errno set by the call, in protocol-specific representation.
> # This parameter can be omitted if the call was successful.
> 
> (and from the implementation in gdb it is basically just returning
> the return value from a syscall plus errno).
> 
> That implies that our current code is right, in that the
> way to check for "did the call fail" is to look at the
> retcode, not the errno (in the same way that if you make a
> native syscall or library call you look first at its return
> value, not at errno). There's nothing in the protocol text
> that makes a guarantee that the errno value is non-0 if and
> only if the call failed.

I admit that I didn't check the gdb code.  I looked at our side and saw that when the 
second result is missing that we'd supply 0, and interpreted "can be omitted" as "will be 
omitted" on success.

> The gdb implementation of the isatty call returns 0 or 1 on
> success, and -1 on failure (though the only failure mode it has
> is "you messed up the protocol packet format"):
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/remote-fileio.c;h=fe191fb6069a53a3844656a81e77069afa781946;hb=HEAD#l1039

Technically, isatty = 0 is failure not success and should also set ENOTTY.


r~

