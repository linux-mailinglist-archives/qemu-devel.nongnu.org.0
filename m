Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D415341016
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 22:57:34 +0100 (CET)
Received: from localhost ([::1]:52028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN0e3-00048I-Ul
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 17:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN0cx-0003af-QQ
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:56:23 -0400
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a]:45985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lN0cw-0001Ia-2u
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 17:56:23 -0400
Received: by mail-ot1-x32a.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so6613572otf.12
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 14:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wWoxWk6iH+D7yn1pettTTwgNja5Zzig50vwkwOCThGg=;
 b=HSbvmRFWz0cRqYtH7QIMl3E40DUyVPCsB6giJJGduuxQ5r+EFOEoVmnV7WHN7nnok7
 6s2MJ4usi2sYpC3HLdjJaSd9FiPKC0MP8IlDtZ8jlX4ry9jRoYLnuWtBpal6UkX6IMJ7
 ZRvXr7G/0On7RFZFI2d7kSYbaizv3UkFuPYhw42btPPET9c6syKenzAjjWYtA5EVMrse
 +7KfcDLzv4J7trVOP17BRAqVltmknZGhgDZI6FvzCA89GzBgJJca71KiZ4t8TFu3vtNd
 iNor8Mo6LjvnC6r/6WrRYUKVmlv2F4v+hEvJ4iyzs5iajS656e5IJf36w1cUbDKG04MW
 gmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wWoxWk6iH+D7yn1pettTTwgNja5Zzig50vwkwOCThGg=;
 b=qITq6hIzimblnHZpwACEQdMvvzM/EIm/ZFBGnPXcNefpqi/wwUui1YlhraDdC88haG
 PtZm9A9qKKZDHHZEVsVQ5f4kaieqXsej6+rkOo/VaiaIcvn6GZoss2HSscxLGZKhDpaC
 IzhwKplcziF0c/vDvNP/R0EX3bAKRMu1KIBUqfoErOoMTBoCpHtMkIHOHA627eVK4Q6x
 OURfcXnzruelhohjT/jPeL6lh3iDMnmgg0tkAVS4bioJ59Q2lQCzeYJeQI6DGUfO0tv5
 a3KR3fGjtEe8E0NC1y5DtcXwXyhBSUBkkcjbFMoT3gkazPi0UDge/fVFteTA6ES/boyo
 G1wA==
X-Gm-Message-State: AOAM532O5u4lZ5o8WiFuUbxJCJLVRmAxnOhZ+h1J6vULgugqyHGa7uXO
 DJ2yLWxtLFii+Loe6bGrOmNIPA==
X-Google-Smtp-Source: ABdhPJyVudulg6Zz/HrwOFC/syWaPQSUjrJSL7G2hLSl+QxfDRjnTg67pjsOWZLyRFAbnROcsvTULg==
X-Received: by 2002:a9d:6a0a:: with SMTP id g10mr9092512otn.236.1616104580356; 
 Thu, 18 Mar 2021 14:56:20 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id r22sm754334otg.4.2021.03.18.14.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 14:56:19 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 4/5] hw/core/loader: Add new function
 rom_ptr_for_as()
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-5-peter.maydell@linaro.org>
 <176ca6cf-f917-eb5d-a5ce-d8a98db8fce4@linaro.org>
 <CAFEAcA-mZMP0LPmGKvMuUq8C_V6cG9AVpaAQ4SoWvihObO_VXA@mail.gmail.com>
 <ec96b321-80d4-948d-b482-dfad61eff67f@linaro.org>
 <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <706a2b95-f0ba-4abf-fdf7-09b7b856db45@linaro.org>
Date: Thu, 18 Mar 2021 15:56:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9i21sTkYoMfMt8sgN+18B3uHSqzG3No7k-+XJkzREi9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/21 3:28 PM, Peter Maydell wrote:
> On Thu, 18 Mar 2021 at 21:14, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 3/18/21 1:02 PM, Peter Maydell wrote:
>>>>> +     * Note that we do not check @as against the 'as' member in the
>>>>> +     * 'struct Rom' returned by rom_ptr(). The Rom::as is the
>>>>> +     * AddressSpace which the rom blob should be written to...
>> ...
>>>> Should you really have this special case?  Nowhere is this going to verify that
>>>> @addr is in @as.
>>>
>>> It's the "happens almost all the time" case. Nothing verifies
>>> that @addr is in @as anyway -- see the "Note that" part of the
>>> comment above.
>>
>> The comment explains why we don't examine Rom::as.
>> But we do check @addr vs @as via @as -> @fv -> flatview_translate.
> 
> All we do is look for "every other address in the AS that
> maps to the same MR as the address we started with".
> Are you asking about the !cbdata.mr exit ?

Well, I suppose.  I guess I didn't read the cb properly.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

