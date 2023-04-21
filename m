Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAD6EA68F
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:08:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmjj-0007E9-PH; Fri, 21 Apr 2023 05:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmji-0007CN-05
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:07:22 -0400
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppmjf-0006gh-Fs
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:07:21 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 35BC0602B7;
 Fri, 21 Apr 2023 12:07:12 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id A7bSqR1Oj4Y0-rj4JnVv7; Fri, 21 Apr 2023 12:07:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682068031; bh=sUlnfDW6hAGfresXyvl+K1yPfhrYb+j2BPehOPrj4as=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=ngsd8j/JPtwcv1BisUqVhufswjHEfYPWc3XvqZsBCPEBiRJ6cF6TGvp2Ulnk9SxaG
 1ixRlMIVJjbQ0UWEHwLVuHICrSVVV7StnuPDrcJ7OFNFITcCPl0Chu5vUAX/AAuwtm
 ikIosW8jn1JHeG4zvbglSseqjV+eLR7tzH23G7Zk=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <c2e905e0-2e2a-9666-3ea5-c2453d58a54b@yandex-team.ru>
Date: Fri, 21 Apr 2023 12:07:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 9/9] docs/style: call out the use of GUARD macros
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 peter.maydell@linaro.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, Juan Quintela
 <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
 <20230420155723.1711048-10-alex.bennee@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230420155723.1711048-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20.04.23 18:57, Alex Bennée wrote:
> There use makes our code safer so we should mention them.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


> ---
>   docs/devel/style.rst | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 0bd01f3fca..b50a981a86 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -657,6 +657,42 @@ that declaration and the new code.
>   
>   See :ref:`qom` for more details.
>   
> +QEMU GUARD macros
> +=================
> +
> +QEMU provides a number of ``_GUARD`` macros intended to make the
> +handling of multiple exit paths easier. For example using
> +``QEMU_LOCK_GUARD`` to take a lock will ensure the lock is released on
> +exit from the function.
> +
> +.. code-block:: c
> +
> +    static int my_critical_function(SomeState *s, void *data)
> +    {
> +        QEMU_LOCK_GUARD(&s->lock);
> +        do_thing1(data);
> +        if (check_state2(data)) {
> +            return -1;
> +        }
> +        do_thing3(data);
> +        return 0;
> +    }

For more clearness, maybe add an equivalent code with qemu_mutex_lock() / qemu_mutex_unlock(), I mean:

The equivalent code without _GUARD macro makes us to carefully put qemu_mutex_unlock() on all exit points:

.. code-block:: c

     static int my_critical_function(SomeState *s, void *data)
     {
         qemu_mutex_lock(&s->lock);
         do_thing1(data);
         if (check_state2(data)) {
             qemu_mutex_unlock(&s->lock);
             return -1;
         }
         do_thing3(data);
         qemu_mutex_unlock(&s->lock);
         return 0;
     }

> +
> +will ensure s->lock is released however the function is exited. There
> +are often ``WITH_`` forms of macros which more easily wrap around a
> +block inside a function.
> +
> +.. code-block:: c
> +
> +    WITH_RCU_READ_LOCK_GUARD() {
> +        QTAILQ_FOREACH_RCU(kid, &bus->children, sibling) {
> +            err = do_the_thing(kid->child);
> +            if (err < 0) {
> +                return err;
> +            }
> +        }
> +    }
> +

and maybe similar here.

>   Error handling and reporting
>   ============================
>   

-- 
Best regards,
Vladimir


