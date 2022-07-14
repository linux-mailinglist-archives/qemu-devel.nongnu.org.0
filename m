Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FF5751B9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:23:22 +0200 (CEST)
Received: from localhost ([::1]:60186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0gS-000424-Jn
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oC0Wt-0002cU-HP
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:13:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oC0Wo-0001YJ-8N
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:13:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657811596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lB/RM/P4bS88mrf788AA18x/tmFEXCSQcX4UbiNRoGQ=;
 b=YrTZ+EQCp+NfuWvRlyjAwz1cHXkA7PXWV5KC1OwLXbqwS02D9oBQ6MxFWJbYMg3Mih5FTi
 fWKmNyuMxGKpvPFuxjVd8wcFph1Lhq+rhH9t3nZmtuUY53LmFV1/IVW7Jg7C4l9K+aAVbG
 RTP/4t8KPIukTghpIWnGZA2wDRfDyPg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-344-bJXE4loJN-6DlnV0RmF2iw-1; Thu, 14 Jul 2022 11:13:15 -0400
X-MC-Unique: bJXE4loJN-6DlnV0RmF2iw-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr24-20020a1709073f9800b0072b57c28438so873279ejc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:13:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lB/RM/P4bS88mrf788AA18x/tmFEXCSQcX4UbiNRoGQ=;
 b=DTpDN5cQFZLBNwIM9l4MXCi5yDD5UaU5jRJJ3k7EYpXFMqTFTVSGxMF+/G7K3CrnAn
 85VixQ7vqoDfrdq1hR1oGuPbi31bmO7Pr1VrO8mXHq6cgm1z7z1gPcHffAzwsT8tUrKN
 Fze1ybbeoDo1Jh40FYV40VXhhGA51CLhrr3h+eVVAo8Zcc1dKfZQ6+bfefjzE8UAN48v
 bRo47nMP+wSgwYwwpY1FzLATUjTE4/wyxJsvOgLrzZ6rg0cxVj9Z7jZBbrVNBinJYT9k
 igQ1f1jtyqY9c5IeoSSVSZV8Z69sVRPQ0z6acuNqHrZQ83NUH8Rcyw/zDiIIRmFcl8YF
 Xbpw==
X-Gm-Message-State: AJIora+TI6xDaeN5jHfleWAizKmtLppbDewNZMRdEqEzg3qK/MgFVeRD
 6bMs4IB59l9wzOFH/13AFhZqfmeqQFhyhfNS8/fILdCQ5JWbaVD5EAe78c1sijF9pwiXISP5jzX
 dO0X2xjTUmYTmEC8=
X-Received: by 2002:a17:907:3e0e:b0:72b:568f:7fa7 with SMTP id
 hp14-20020a1709073e0e00b0072b568f7fa7mr9323569ejc.119.1657811593901; 
 Thu, 14 Jul 2022 08:13:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uZmnNVle6hdqAdDmtJ1taSGPJJMadM+voi7pSSnPEwhOeWjUFGtZyWwTWtU3TqumXCCk43zg==
X-Received: by 2002:a17:907:3e0e:b0:72b:568f:7fa7 with SMTP id
 hp14-20020a1709073e0e00b0072b568f7fa7mr9323541ejc.119.1657811593664; 
 Thu, 14 Jul 2022 08:13:13 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3?
 ([2a02:8071:5050:c500:3cbc:a8ad:61a8:57e3])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a170906721400b0071cbc7487e0sm797030ejk.71.2022.07.14.08.13.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jul 2022 08:13:13 -0700 (PDT)
Message-ID: <5f17518a-a2ae-8e6e-6864-84b13058d5d8@redhat.com>
Date: Thu, 14 Jul 2022 17:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC PATCH 2/8] transactions: add tran_add_back
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-3-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220712211911.1302836-3-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 12.07.22 23:19, Emanuele Giuseppe Esposito wrote:
> First change the transactions from a QLIST to QSIMPLEQ, then
> use it to implement tran_add_tail, which allows adding elements
> to the end of list transactions.

The subject still calls it `tran_add_back()` (perhaps from a preliminary 
version?), I think that needs adjustment.

> This is useful if we have some "preparation" transiction callbacks

*transaction

> that we want to run before the others but still only when invoking
> finalize/commit/abort.

I don’t understand this yet (but perhaps it’ll become clearer with the 
following patches); doesn’t the new function do the opposite? I.e., 
basically add some clean-up that’s only used after everything else?

> For example (A and B are lists transaction callbacks):
>
> for (i=0; i < 3; i++) {
> 	tran_add(A[i]);
> 	tran_add_tail(B[i]);
> }
>
> tran_commit();
>
> Will process transactions in this order: A2 - A1 - A0 - B0 - B1 - B2
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/qemu/transactions.h |  9 +++++++++
>   util/transactions.c         | 29 +++++++++++++++++++++--------
>   2 files changed, 30 insertions(+), 8 deletions(-)
>
> diff --git a/include/qemu/transactions.h b/include/qemu/transactions.h
> index 2f2060acd9..42783720b9 100644
> --- a/include/qemu/transactions.h
> +++ b/include/qemu/transactions.h
> @@ -50,7 +50,16 @@ typedef struct TransactionActionDrv {
>   typedef struct Transaction Transaction;
>   
>   Transaction *tran_new(void);
> +/*
> + * Add transaction at the beginning of the transaction list.
> + * @tran will be the first transaction to be processed in finalize/commit/abort.

Of course, if you call tran_add() afterwards, this transaction will no 
longer be the first one.  I mean, that’s kind of obvious, but perhaps we 
can still express that here.

Like, perhaps, “finalize/commit/abort process this list in order, so 
after this call, @tran will be the first transaction to be processed”?

> + */
>   void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque);
> +/*
> + * Add transaction at the end of the transaction list.
> + * @tran will be the last transaction to be processed in finalize/commit/abort.

(And then “finalize/commit/abort process this list in order, so after 
this call, @tran will be the last transaction to be processed”)

> + */
> +void tran_add_tail(Transaction *tran, TransactionActionDrv *drv, void *opaque);
>   void tran_abort(Transaction *tran);
>   void tran_commit(Transaction *tran);
>   
> diff --git a/util/transactions.c b/util/transactions.c
> index 2dbdedce95..89e541c4a4 100644
> --- a/util/transactions.c
> +++ b/util/transactions.c

[...]

> @@ -54,20 +54,33 @@ void tran_add(Transaction *tran, TransactionActionDrv *drv, void *opaque)
>           .opaque = opaque
>       };
>   
> -    QSLIST_INSERT_HEAD(&tran->actions, act, entry);
> +    QSIMPLEQ_INSERT_HEAD(&tran->actions, act, entry);
> +}
> +
> +void tran_add_tail(Transaction *tran, TransactionActionDrv *drv, void *opaque)
> +{
> +    TransactionAction *act;
> +
> +    act = g_new(TransactionAction, 1);
> +    *act = (TransactionAction) {
> +        .drv = drv,
> +        .opaque = opaque
> +    };
> +
> +    QSIMPLEQ_INSERT_TAIL(&tran->actions, act, entry);
>   }

Perhaps this could benefit from a function encompassing the common 
functionality, i.e. a tran_do_add(..., bool tail) with

if (tail) {
     QSIMPLEQ_INSERT_TAIL(...);
} else {
     QSIMPLEQ_INSERT_HEAD(...);
}

(Just a light suggestion.)

Hanna


