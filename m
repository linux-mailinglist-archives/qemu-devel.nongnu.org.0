Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF33418B27
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Sep 2021 23:01:33 +0200 (CEST)
Received: from localhost ([::1]:38666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUbHA-0006T4-8f
	for lists+qemu-devel@lfdr.de; Sun, 26 Sep 2021 17:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guyyur@gmail.com>) id 1mUZUh-0006PU-TB
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:07:23 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <guyyur@gmail.com>) id 1mUZUg-0007SS-3X
 for qemu-devel@nongnu.org; Sun, 26 Sep 2021 15:07:23 -0400
Received: by mail-wr1-x430.google.com with SMTP id t8so45569580wri.1
 for <qemu-devel@nongnu.org>; Sun, 26 Sep 2021 12:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BKFULUArWqr1aOPgXwVjeOBQ1CGHX61/44aKqOXc8WA=;
 b=a7BEEK8yZgWGbhPkeZHndmihKRqDk7AlTGxK62ZDs8qZI2aeYAoVQ9uY4zwMPySxec
 RfB1zbFAjOnjAMFwKcRKj1eoKkXcUAosaa/nlCse5NYoxMD7JjGYI4IYbzb9bYreTO3I
 bNF4W6WlmKz7HakvqG9b7Xx2oN406xlKBnZW8vTH5QpN+qdmYJ0+vmDySntc7zSJUDdT
 pYKRR61RAUkfe6tTXFUza9mWK6KakV7YFy7WY0ez6PKPhH1vcGKcf8kfQFd4vKYKttSp
 cW7/jAiyJDPLTWJ9h0vuFsisXKw8mFY2k7ifRut6pHyZcuUvhE2Tj0xD+zaOJFJmCNAP
 kK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BKFULUArWqr1aOPgXwVjeOBQ1CGHX61/44aKqOXc8WA=;
 b=KhD53Xh3dmV9R/D5P/gNS3u1AWgXyYal3ar/TEVgJpdpOTQkWJdhfdzYZsAVnP7Pva
 t/r7E4t/GVlas4A7HVaIWmgLCiW3bwfOvTIPOeKcWfxV5f2qxqXUOivLnWxgganiMplJ
 lEJixHXnUgjGOVe/rMwt0BrKbatvO+/Bide/KdcmP+jOUOaugupZtcnaRle7672MJ+mY
 K9yU7AdL6hAcREy2sJMFTFxBLhrFHfvde2BYTknTsIjkfyCKoynbfNXFD9gK1K6DsscX
 RuUYeMa2dOc+IEPKMGiVIxqx6Iyz0On6+cNfkx4LCnNApHx+Eea2aDApEOSRwJ8aM2X5
 KYjA==
X-Gm-Message-State: AOAM533G8tUxJaAMllhe3spuPw0lLtuUHa494aGHRzzsUOAv0/1KDZTM
 AS/be3ucZO2UUkk/moZYIJs=
X-Google-Smtp-Source: ABdhPJyx9HbbIoTXh3GkOX31SFZCiBluTf+chpyk0Arn62kL/NyTrJwyVqzUrG9sIE9C+tKqlc28Rw==
X-Received: by 2002:a5d:6991:: with SMTP id g17mr8207437wru.218.1632683240022; 
 Sun, 26 Sep 2021 12:07:20 -0700 (PDT)
Received: from [192.168.159.120] (IGLD-84-229-239-40.inter.net.il.
 [84.229.239.40])
 by smtp.gmail.com with ESMTPSA id c30sm14591695wrb.74.2021.09.26.12.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:07:19 -0700 (PDT)
Message-ID: <b5d1b686-a6ce-63b0-8655-4918f70efdf6@gmail.com>
Date: Sun, 26 Sep 2021 22:07:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v2 7/9] bsd-user/mmap.c: Don't mmap fd == -1 independently
 from MAP_ANON flag
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210922045636.25206-1-imp@bsdimp.com>
 <20210922045636.25206-8-imp@bsdimp.com>
 <e66d76d0-a463-5a01-e508-bb592c9cce97@linaro.org>
 <CANCZdfrXJD6X+AiWLYYzQB-mB3uW34r+xe970uMmZz79xA-GqQ@mail.gmail.com>
From: Guy Yur <guyyur@gmail.com>
In-Reply-To: <CANCZdfrXJD6X+AiWLYYzQB-mB3uW34r+xe970uMmZz79xA-GqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=guyyur@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.478, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 26 Sep 2021 16:59:30 -0400
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
Cc: Kyle Evans <kevans@freebsd.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/9/21 20:08, Warner Losh wrote:
>
>
> On Fri, Sep 24, 2021 at 6:00 AM Richard Henderson 
> <richard.henderson@linaro.org> wrote:
>
>     On 9/21/21 9:56 PM, Warner Losh wrote:
>     >           /* no page was there, so we allocate one */
>     >           void *p = mmap(host_start, qemu_host_page_size, prot,
>     > -                       flags | MAP_ANON, -1, 0);
>     > +                       flags | ((fd != -1) ? MAP_ANON : 0), -1, 0);
>
>     I don't understand this change, given that the actual fd passed is
>     always -1.
>
>
> That's a very good question. I'll have to trace down why that was made 
> because
> I'm having trouble with it as well now that I'm trying to defend it.
>
mmap_frag can be called with a valid fd, if flags doesn't contain one of 
MAP_ANON, MAP_STACK, MAP_GUARD.
The passed fd to mmap is -1 but if flags contains MAP_GUARD then 
MAP_ANON cannot be added.

* If fd is valid (not -1) we want to map the pages with MAP_ANON.
* If flags contains MAP_GUARD we don't want to add MAP_ANON because it 
will be rejected.
https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mmap.c#L302
* If flags contains MAP_ANON it doesn't matter if we add it or not.
* If flags contains MAP_STACK, mmap adds MAP_ANON when called so doesn't 
matter if we add it or not either.
https://github.com/freebsd/freebsd-src/blob/master/sys/vm/vm_mmap.c#L284

The intention was to not pass MAP_ANON for the flags that use fd == -1 
without specifying the flags directly,
with the assumption that future flags that don't require fd will also 
not require MAP_ANON.
Changing to !(flags & MAP_GUARD) will also work.

Guy Yur

> Warner
>
>
>     r~
>

