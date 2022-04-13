Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4294FFFEA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Apr 2022 22:23:10 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nejW9-0003v8-JG
	for lists+qemu-devel@lfdr.de; Wed, 13 Apr 2022 16:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejUP-0003EE-1M
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:21:21 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nejUN-0005wx-GP
 for qemu-devel@nongnu.org; Wed, 13 Apr 2022 16:21:20 -0400
Received: by mail-wr1-x436.google.com with SMTP id t1so4232841wra.4
 for <qemu-devel@nongnu.org>; Wed, 13 Apr 2022 13:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kiFeHD+01fRleQ9LJhb7JWI9i+XDdzKbvOvWGgRUF9M=;
 b=jfOC2HWVl/jyEpqMZM1FwyBVRfog+oVzmC2jq2/Wz2r30fBvZ4+jMaNT+7U5cqL2o5
 a32/JgueCjJqgfNB+uF/DcFzSp9/LlYUYAyFRgk3qy5l+IIikANPN742AASbZP3bjnQ3
 mAA+fpfwhLB7NbWi2cMcfHZNAY/MZAi9qUNvlM4JOU6LYXLKM6Y5d97Rl6iDuQO5ppmH
 cjTtYMMEJ0R4GNRAj8tLFVLtgXPGlZaKUgGyy51/WlOuHT5q2pzMfrMV7yIM0xvPx57Z
 NUnc/6PKFDMkWcW1Vy9zyRfW/mxIrYgkpgkdigi1h4WZcnpFMYdD3O3THyi9AOHV479y
 G0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kiFeHD+01fRleQ9LJhb7JWI9i+XDdzKbvOvWGgRUF9M=;
 b=o7yneCawJfJDeZfK2RKqiIXj0eqApuk07u8ID48ENVlcL89uG4ZwJmR2/Fc8T/c/O/
 QhB9jftZk4QmNzoY9myFcrddnbFoXZmXaMdTwJFLRxA8gaT92+P4BbnitCrEBKif28y/
 ZSTdb6PHjJPV+VRdCHLo1mb4xFennnpL7p17InqA3+6oELhDYCqrqnqYZSLjD1unpu+m
 vUGup1hUOYKuK0ixGqtm5dBq4lZsbuVlxOBi8TIdh/kJ3hmJbCk9nkuZt1GYGdBT1zuL
 VRwsAvF68ympoj6QTINYO5lbz5quPVT2xabx4LlB9BuDI0rKurJWd7VHZ8WSWdcnscSz
 o1DA==
X-Gm-Message-State: AOAM530hJUWMvDCQnHjyrHK4ntmI5Gzlog6XTAL1NCis4xNePIftAIaI
 oaCXeVpQK1I8VDYQSMtcRu0=
X-Google-Smtp-Source: ABdhPJzd85FYkpHYLsnUG6HODG7urcXUsxfRG4Lp6X6zUm3VHtNHJhaoENYdK6l8NBIXD2NsjhdkbA==
X-Received: by 2002:a05:6000:1e0e:b0:207:bb61:78d0 with SMTP id
 bj14-20020a0560001e0e00b00207bb6178d0mr409741wrb.512.1649881278078; 
 Wed, 13 Apr 2022 13:21:18 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 f13-20020a5d64cd000000b0020787751295sm38753wri.35.2022.04.13.13.21.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 13:21:17 -0700 (PDT)
Message-ID: <52751dc3-8a7e-d920-2af2-5cd0b2df7f98@redhat.com>
Date: Wed, 13 Apr 2022 22:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH for-7.1 6/8] nbd: move s->state under requests_lock
Content-Language: en-US
To: Eric Blake <eblake@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
 <20220412194204.350889-7-pbonzini@redhat.com>
 <20220413162313.ckrqv6a6vr2jtcjr@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220413162313.ckrqv6a6vr2jtcjr@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/22 18:23, Eric Blake wrote:
>>
>> The function nbd_client_connecting_wait() was used mostly to check if
>> a request had to be reissued (outside requests_lock), but also
>> under requests_lock in nbd_client_connecting_wait().  The two uses have to
> "Function A was used mostly..., but also under requests_lock in
> function A."  Reading the rest of the patch, I think...[1]
> 
>> be separated; for the former we rename it to nbd_client_will_reconnect()
>> and make it take s->requests_lock; for the latter the access can simply
>> be inlined.  The new name is clearer, and ensures that a missing
>> conversion is caught by the compiler.
> 
> I take it your experiments with C++ coroutines helped find this;)

No, they never went that far. :)  Rather, these atomics have always 
bugged me, and after Emanuele pointed me to the enter_all without lock, 
I noticed that they can be fixed with the same hammer.

>> +    QEMU_LOCK_GUARD(&s->requests_lock);
>> +    return s->state == NBD_CLIENT_CONNECTING_WAIT;
>>  }
> 
> [2]...while here, you only needed two lines, using QEMU_LOCK_GUARD.
> Both styles work, but it seems like we should be consistent, and I
> would favor the shorter style when all that is being guarded is a
> single line.
> 

QEMU_LOCK_GUARD() is a declaration in some sense (well, it is also a 
declaration when you expand the macro) and QEMU in general doesn't do 
declaration-after-statement.

Also, QEMU_LOCK_GUARD() emphasizes that the whole function is guarded, 
while WITH_QEMU_LOCK_GUARD() has the opposite effect on the reader.

> although the suggestion in [3] to split out the function motion to a
> separate patch may result in the v2 series looking different enough
> that you may want to leave off my R-b to ensure I still review things
> carefully.

Will do.

Paolo

