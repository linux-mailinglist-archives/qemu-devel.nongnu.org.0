Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B54FD3373CF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 14:27:48 +0100 (CET)
Received: from localhost ([::1]:49660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKLLv-0005Eb-PW
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 08:27:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKLJe-0004Qn-U6
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:25:27 -0500
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:40100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lKLJS-0003ci-Pu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 08:25:26 -0500
Received: by mail-oi1-x22c.google.com with SMTP id w65so23079078oie.7
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 05:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0fg94crNULxrN2oaCZSUj+wYIs/4f572ktCplESe2nw=;
 b=zPVUrnofWIEta7/pkYGom1o5v+cGSqlmOE4DGyojA3FDA1j+OiKfrpcivDPsSYPoPY
 r9oHOt7r7hRwze2KRIA0W+pPfXcU8ZDpYGhPhIxG+djzfIuRn2kXxrpY9XMmogh2s6qB
 79STz/XJ24PN1s8EZ0GY0CjIJPRy0h9U+tM5zmXRKoiUuVFJq3Ms0oeyroFdtxUevOzI
 NAzX+EHfZU8uhLzuXonAArGcpv53juTfqkIbMgIuMdqwKfVtW1+5S3Teskyd+jrOULvA
 ZOdIX3pFuhBgdoDX09lmagcdDbCgiFBosNTy+FhpCEINZn5QvkupQKSNgCefXRGi23G2
 Wcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0fg94crNULxrN2oaCZSUj+wYIs/4f572ktCplESe2nw=;
 b=MSOH0q3eEWhluHvkr1RvF46R8bsun6PsAOM5clJeP7eHbtgVBx1+/9ZexfGKkgaC9G
 QxA3AIGOayTEOrejExRX4YT13bSjcjnuZ2spCkZ7hQ4BFrM+o28GxhVz+9zpppYYu6UV
 LkdvD3aIGqh+NYChXQ/2rc1xQpH24hGwT3/gsDtTQeuyppsvoKuPm1ROpVCqNdipk1vq
 KBdoRaMWSCFf+FsuYlJXK7HXoPdMsnwHaiuRzfYd9FQZo96wMHgN9rgNwRxqSh5kn1k0
 wI1oDagZgRPal85498vpZAmbSa6soWD3vsQcsHsH7Pd20IaCRoEYGAuJibUk82if9rfO
 5lOA==
X-Gm-Message-State: AOAM531J2UWQQsBk+v3oHLHyDZGN1huhVXYPexcjQxFSUz2FvxmpXSvA
 nPJ/TtKPjQhKimOTCrxSnNuPNQ==
X-Google-Smtp-Source: ABdhPJwjtZwz+IXJhzCuXqcio89zGRe/QdUTyOEvLL3awCs/46fmmQh+Zbh2wJwj4P1gGW9NxlqEjg==
X-Received: by 2002:aca:d5d1:: with SMTP id m200mr6085543oig.102.1615469112919; 
 Thu, 11 Mar 2021 05:25:12 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id f197sm545763oob.38.2021.03.11.05.25.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 05:25:12 -0800 (PST)
Subject: Re: [PULL 18/40] linux-user: Fix types in uaccess.c
To: Laurent Vivier <laurent@vivier.eu>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
 <20210216161658.29881-19-peter.maydell@linaro.org>
 <ec051472-7511-62da-d485-17f7573aa460@vivier.eu>
 <CAFEAcA87oLDyFJovHvppa+zwO=XJoFOt3Q5V9Y5+7BU+zDQsVw@mail.gmail.com>
 <b87c934e-ab46-d862-7fcc-736d6e3442b2@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6a0be1e-ea56-1ab4-44bd-af0cfa1980af@linaro.org>
Date: Thu, 11 Mar 2021 07:25:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <b87c934e-ab46-d862-7fcc-736d6e3442b2@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/21 10:34 AM, Laurent Vivier wrote:
> Le 10/03/2021 à 16:48, Peter Maydell a écrit :
>> On Fri, 19 Feb 2021 at 09:21, Laurent Vivier <laurent@vivier.eu> wrote:
>>>
>>> Hi Richard,
>>>
>>> I think this commit is the cause of CID 1446711.
>>>
>>> There is no concistancy between the various declarations of unlock_user():
>>>
>>> bsd-user/qemu.h
>>>
>>> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>>>                                 long len)
>>>
>>> include/exec/softmmu-semi.h
>>>
>>> static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
>>>                                  target_ulong len)
>>> ...
>>> #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
>>>
>>> linux-user/qemu.h
>>>
>>> #ifndef DEBUG_REMAP
>>> static inline void unlock_user(void *host_ptr, abi_ulong guest_addr, size_t len)
>>> { }
>>> #else
>>> void unlock_user(void *host_ptr, abi_ulong guest_addr, long len);
>>> #endif
>>>
>>> To take a signed long here allows to unconditionnaly call the unlock_user() function after the
>>> syscall and not to copy the buffer if the value is negative.
>>
>> Hi; what was the conclusion here about how best to fix the Coverity issue?
> 
> For what I know, there is no conclusion.
> 
>> To save people looking it up, Coverity complains because in the
>> TARGET_NR_readlinkat case for linux-user we do:
>>              void *p2;
>>              p  = lock_user_string(arg2);
>>              p2 = lock_user(VERIFY_WRITE, arg3, arg4, 0);
>>              if (!p || !p2) {
>>                  ret = -TARGET_EFAULT;
>>              } else if (is_proc_myself((const char *)p, "exe")) {
>>                  char real[PATH_MAX], *temp;
>>                  temp = realpath(exec_path, real);
>>                  ret = temp == NULL ? get_errno(-1) : strlen(real) ;
>>                  snprintf((char *)p2, arg4, "%s", real);
>>              } else {
>>                  ret = get_errno(readlinkat(arg1, path(p), p2, arg4));
>>              }
>>              unlock_user(p2, arg3, ret);
>>              unlock_user(p, arg2, 0);
>>
>> and in the "ret = -TARGET_EFAULT" and also the get_errno(readlinkat(...))
>> codepaths we can set ret to a negative number, which Coverity thinks
>> is suspicious given that unlock_user()'s new prototype says it
>> is an unsigned value. It's correct to be suspicious, because we really
>> did change from doing a >=0 to a !=0 check on the length.
>>
>> Unless we really want to audit all the unlock_user() callsites,
>> going back to the previous semantics seems sensible.
> 
> I agree with that.

This passing of an errno to unlock_user is... horrible.  I guess we have to 
revert to the signed type.


r~


