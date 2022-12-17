Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824964FB37
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6auO-0008Rz-BU; Sat, 17 Dec 2022 12:23:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6auM-0008Rc-Cv
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:23:34 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6auK-0001FP-OE
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:23:34 -0500
Received: by mail-ed1-x52d.google.com with SMTP id e13so7660776edj.7
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dmdGErDZtXqzKnKffmqZM6D/cblgH6bwNBhqP3MzXRI=;
 b=EG6D7CxefzK6ldItAiiU3HrmZkXaMVI3+mvOCGqyLoRaJfW7DKtwQm/LNRv/iPZXXV
 gAbJ0O6TwsDEeXCp+w/cIdHWkm0USb6kEoPxdMg5T+APmzAhln3G2lEE/ddKKIW/yj+q
 iFzufE+nrduykrWOtAQ7b0R1JXOXPmgcaAQe2tKothxGs1Y9HgfikBZINDt3YZ8eXhCS
 XPrERK2mfhCpK9AmVZPXEcnIpsVugAAK2DZRy3tNnvNSa0GCe+El53qeezNtCiy1XvlS
 EkHtCGZx9jMEV8BOlfY5kCjK6oxE8pIckHrkQ4G7gl5WDGB4Q7myxlE9nffjaKUaYEIn
 NExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dmdGErDZtXqzKnKffmqZM6D/cblgH6bwNBhqP3MzXRI=;
 b=0kcBSh8LhbT6FM0eYIKQ2MNuPCawGp2FISj2eIpIRfDAh4h8cRc9xxEn935GrJHhbJ
 0aIlalkrdd+ktfyJQ1iV0cK1bCW9sG6tfbvC2BddATOg+dXJLDj0CoEQFTD/9RDGoLD3
 a29fG7bzLzgNycDwqUJeHL64anbzpAbd0nLVeIbJRC7G9R6SGZ3aM6bqT9QcfQUtezB7
 T4bIo5bpEoaVQW1UXYDWg2m7tLHjtBqLTtVGrg5H/LvsUD9uY1N4IxvVvhOxkPqglZRv
 E9Mn8Gpanhhr5NDJ6Sa3wLHm1bysldBrV7cV9Xlm277qE3KgOnfTyqsoBaRITkHdM0pY
 wPqA==
X-Gm-Message-State: AFqh2kono2yaW7mZ4hJf/08XJzGvaKtjl+Thow9R5OcoArjTghT6WeUK
 5P8ukR9YuwMHPgX1gCAAhC9qcA==
X-Google-Smtp-Source: AMrXdXtanKFKIoLiMcMHDwykEisQPx62FKE1TkCPxrQQvwgmKODm91mo62eYTkon2koMa/a/LBB9Hw==
X-Received: by 2002:a05:6402:299b:b0:461:e85e:39c7 with SMTP id
 eq27-20020a056402299b00b00461e85e39c7mr13304547edb.1.1671297811111; 
 Sat, 17 Dec 2022 09:23:31 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a056402144800b0045b910b0542sm2185737edx.15.2022.12.17.09.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Dec 2022 09:23:30 -0800 (PST)
Message-ID: <010eaba5-8d35-7f45-0962-84f3284951c6@linaro.org>
Date: Sat, 17 Dec 2022 18:23:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 4/4] coroutine: Break inclusion loop
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
References: <20221208142306.2642640-1-armbru@redhat.com>
 <20221208142306.2642640-5-armbru@redhat.com>
 <2ac0daae-da25-0a31-9a73-8f186cc510e9@redhat.com>
 <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CABgObfZ4_8MzP4HP1JNjKb=C0qTXY3zHK=zK+=pYBt3hSYjiGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
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

On 13/12/22 01:34, Paolo Bonzini wrote:
>     On 12/8/22 15:23, Markus Armbruster wrote:
>      > qemu/coroutine.h and qemu/lockable.h include each other.  Neither
>      > header actually needs the other one.
> 
>     qemu/lockable.h wants qemu/coroutine.h because of the reference to
>     qemu_co_mutex_lock/unlock in the QEMU_MAKE_LOCKABLE macro.  Said
>     reference only happens when the macro is used, so strictly speaking
>     only code that uses of qemu/lockable.h's functionality needs to
>     include qemu/coroutine.h.  The order doesn't matter.

[*]

>     qemu/coroutine.h similarly wants qemu/lockable.h only for a macro: it
>     uses QemuLockable for the prototype of qemu_co_queue_wait_impl, but
>     QemuLockable is defined in qemu/typedefs.h.  On the other hand, the
>     qemu_co_queue_wait macro needs QEMU_MAKE_LOCKABLE.  Again, the order
>     does not matter but callers of qemu_co_queue_wait appreciate it if
>     both files are included.
> 
>     So, this is why the inclusion loop works.  This patch makes some
>     files include qemu/coroutine.h even if they only need qemu/lockable.h
>     for QEMU_LOCK_GUARD of a "regular" QemuMutex; for example, linux-user/
>     does not use coroutines, so I'd like to avoid that it includes
>     qemu/coroutine.h.
> 
>     One way is to just keep the cycle.  Another is to break the cycle is
>     as follows:
> 
>     1) qemu/coroutine.h keeps including qemu/lockable.h
> 
>     2) qemu/lockable.h is modified as follows to omit the reference to
>     CoMutex:
> 
>     diff --git a/include/qemu/lockable.h b/include/qemu/lockable.h
>     index 86db7cb04c9c..db59656538a4 100644
>     --- a/include/qemu/lockable.h
>     +++ b/include/qemu/lockable.h
>     @@ -71,9 +71,11 @@ qemu_null_lockable(void *x)
>                     void *: qemu_null_lockable(x),                     
>             \
>                     QemuMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>     mutex)),    \
>                     QemuRecMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>     rec_mutex)), \
>     -             CoMutex *: qemu_make_lockable(x, QML_OBJ_(x,
>     co_mutex)),   \
>     +             QEMU_MAKE_CO_MUTEX_LOCKABLE(x)                       
>           \

Interesting, I ended doing something similar today because this line is
the single sysemu-specific part of this file (user emulation shouldn't
have access to qemu/coroutine.h). So back to [*], the order seems to
matter for user-mode.

>                     QemuSpin *: qemu_make_lockable(x, QML_OBJ_(x, spin)))
> 
>     +#define QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>     +
>        /**
>         * QEMU_MAKE_LOCKABLE_NONNULL - Make a polymorphic QemuLockable
>         *
> 
>     3) the following hack is added in qemu/coroutine.h, right after
>     including qemu/lockable.h:
> 
>     #undef QEMU_MAKE_CO_MUTEX_LOCKABLE(x)
>     #define QEMU_MAKE_CO_MUTEX_LOCKABLE(x) \
>                    CoMutex *: qemu_make_lockable(x, QML_OBJ_(x, co_mutex)),
> 
> 
>     Neither is particularly pretty, so I vote for leaving things as is with
>     a comment above the two #include directives.
> 
>     Paolo
> 


