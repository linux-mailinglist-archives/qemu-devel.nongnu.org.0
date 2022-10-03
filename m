Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566B5F3257
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 17:08:47 +0200 (CEST)
Received: from localhost ([::1]:41138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofN3m-0003Ji-7q
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 11:08:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofMwc-000879-Ck
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:01:24 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofMwa-0005V2-Du
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 11:01:22 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so5991091wms.4
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 08:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=QDRvEj3KXpQGDLxvnHjNRgjFBdV4ogspQgruOucaDMA=;
 b=bjRZZ0l1WUZHIWyvamSEqj4Jw9sj2mX7VtGA1d5BYiFBPSgjRuCa1OR8eD4b7/e892
 PZSLWZ7DXwurk4NKK+cZKKWwCO48o58ms41P0K72/52TH7tX9fRJB8RFri6hWtQVNz8L
 C2hqq4qQwlRI2D5Mj0J3qja68fRk/YuFctXzr1gM1MbwYkDIx87gUgVwkozM/T4mutlt
 yW6lW8xTXJk3uL9wLxlnj12/Ax3BCl0YleZrLHiymBIoAFO5UdMsFOqzdOSnrQK7coei
 99V4K9zI55uKNsOc84wpjLU8dVPX/a6DWTKEWJPqtYLXWgW5b7SuFKLBA+kgUzd/3Nrx
 uruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=QDRvEj3KXpQGDLxvnHjNRgjFBdV4ogspQgruOucaDMA=;
 b=YQo9bV68D2fxHS1Y8Hf5P63S5Eb7Q4+w2T2hLeagmbAwAzymTBMl+7f3tiV+486K88
 p2hQxOnVvqXLSaT8QOXnR4czT9vHJuaSARmcPww6UDxzoXg6r/MvqkG2Qs9SyYqGv2MT
 UwYpTcOtxdFnDUWsBlwo+z1GYEdbNMgRfAiU0dVOUNvt0s9sHTLp3G5ni1B4BXJN9Xnn
 oFfuhuTGE/7WG1Vz9tlJbk/v7KPRN3+MUAdRYmbe5awHjHJsaHcwk0wuyB3w0n8g2aGr
 F3chBrrC5yrGzJGkKyt9eXURWBEN98cN6bkNnr7TTSMUvT24V9vjDXWUQtOS4o6ZEyo+
 AAdw==
X-Gm-Message-State: ACrzQf1M6Hs2TvFSRSZS6WwFfl254qDILOVW1Lwg/Cb/Pi1mFCkwyL5+
 pfXdWaIOHJKmsB1HCTrLjSj0M0r+o8Wz8Q==
X-Google-Smtp-Source: AMsMyM6VzjzmsZ8km1vOCKCdhZWo2JMOd2UnjNT0sNW6egOkQzOZxulDWlWq/mgkfr5DPyD0x/tIAA==
X-Received: by 2002:a05:600c:3d15:b0:3b4:8bd9:3905 with SMTP id
 bh21-20020a05600c3d1500b003b48bd93905mr7095452wmb.173.1664809278080; 
 Mon, 03 Oct 2022 08:01:18 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a05600c189800b003b4727d199asm11182466wmp.15.2022.10.03.08.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 08:01:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 023871FFB7;
 Mon,  3 Oct 2022 16:01:16 +0100 (BST)
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-14-richard.henderson@linaro.org>
 <87fsg5nkap.fsf@linaro.org>
 <cab82ec5-88c4-1624-8fff-a9f45a282470@linaro.org>
User-agent: mu4e 1.9.0; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 13/18] accel/tcg: Do not align tb->page_addr[0]
Date: Mon, 03 Oct 2022 15:59:49 +0100
In-reply-to: <cab82ec5-88c4-1624-8fff-a9f45a282470@linaro.org>
Message-ID: <87tu4llzno.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 10/3/22 05:47, Alex Benn=C3=A9e wrote:
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>=20
>>> Let tb->page_addr[0] contain the offset within the page of the
>>> start of the translation block.  We need to recover this value
>>> anyway at various points, and it is easier to discard the page
>>> offset when it's not needed, which happens naturally via the
>>> existing find_page shift.
>>>
>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>>   accel/tcg/cpu-exec.c      | 16 ++++++++--------
>>>   accel/tcg/cputlb.c        |  3 ++-
>>>   accel/tcg/translate-all.c |  9 +++++----
>>>   3 files changed, 15 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>>> index 5f43b9769a..dd58a144a8 100644
>>> --- a/accel/tcg/cpu-exec.c
>>> +++ b/accel/tcg/cpu-exec.c
>>> @@ -174,7 +174,7 @@ struct tb_desc {
>>>       target_ulong pc;
>>>       target_ulong cs_base;
>>>       CPUArchState *env;
>>> -    tb_page_addr_t phys_page1;
>>> +    tb_page_addr_t page_addr0;
>> We don't actually document that this is an offset here (or indeed in
>> TranslationBlock) and the definition of tb_page_addr_t:
>>    /* Page tracking code uses ram addresses in system mode, and
>> virtual
>>       addresses in userspace mode.  Define tb_page_addr_t to be an appro=
priate
>>       type.  */
>>    #if defined(CONFIG_USER_ONLY)
>>    typedef abi_ulong tb_page_addr_t;
>>    #define TB_PAGE_ADDR_FMT TARGET_ABI_FMT_lx
>>    #else
>>    typedef ram_addr_t tb_page_addr_t;
>>    #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>>    #endif
>> implies these are full size pointers into the guests address space.
>
> And that's what I've got.  What we we were storing in phys_page1
> before was a full size pointer that was page aligned.  I'm now
> dropping the page alignment and having a full size pointer to the
> exact first byte of the translated code.

OK then I'm confused by the commit message which says:

  Let tb->page_addr[0] contain the offset within the page of the
  start of the translation block

> Is that clearer?  How would you improve the wording?
>
>
> r~
>
>> Either we need a new type (tb_page_offset_t) or to properly comment the
>> structures with what they mean.
>> Otherwise:
>> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>=20


--=20
Alex Benn=C3=A9e

