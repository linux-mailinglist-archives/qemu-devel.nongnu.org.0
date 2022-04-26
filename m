Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB251014F
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 17:03:30 +0200 (CEST)
Received: from localhost ([::1]:52232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njMiv-00039J-Pv
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 11:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njMgN-0001S8-Um; Tue, 26 Apr 2022 11:00:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:38647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1njMgM-00054B-3I; Tue, 26 Apr 2022 11:00:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id k2so5440574wrd.5;
 Tue, 26 Apr 2022 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4RsKOeT93s0AxjFUTOTLqfQ18kCT1mRDJ0K1I56g+Ks=;
 b=T2FjZBukm5NNjk42bpNU6jK0QYwTQXcMwkgWbMP348sgGTRNNkAcZh3kEQGAkY7uqJ
 zip/U1nHj9RLQ+Ygxg0NsQYUpXJgTgC0DUj/G1ZhyskjQ/YA4J+8WMehUZD/rIKjXb/c
 lXRU84JAktp+ffh+Al3s7Cq5Th3/5y+TnO637778SqRcX7dLwiqdaGT5AG37TT5IIcLe
 oFocKXTyKhtfPY8OYJ3Ma654F76cOP+ZEKg28vKOJFpRkLpY48mkQOPlqnhg7j+J3ISp
 upxqbutJQFJ8vNeCAJ0Jvq1Mh54TVVOEhmd15PybM1SsnOjwGrCHFt1XmUHTHtA/8x5m
 H87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4RsKOeT93s0AxjFUTOTLqfQ18kCT1mRDJ0K1I56g+Ks=;
 b=lWtrdDeYXWyB5SGIG7dFsMoJ0xE55h7J+8S+dYCxu+EN9cP4agSlxkQhYsFI/N1Dbi
 csKUIHyTT0zgYImvMXwaxlSeqSs7UO+gLLqUBVUvRwhAQMd4AB4BUXSBlwsAUKvC7QEs
 iod0BR8gs8DRZ2OYl47QGtdTiova2fT1M8G9qpzgM+bvSjOKlJN6vlg1ZB+RIiF+9hHC
 kCl3VZUk/EfHN7oaXOWGQE6uH/ywHvW2Jmg+122Uj+cmlzOIB6nmalnVUhYxyoIehIU2
 Z9Yj8CPAebQGxan8hRmIzVb/QfjUpJcdgh1A4B9aoarYznAMqcVGzHj2OhTY4m8JyzjU
 xpBA==
X-Gm-Message-State: AOAM533qEincMQZzn5IwAZu7cBA2Eh/KGsDCK9J9z970pmiZ9QoewkgC
 BG1H7sGLlTRctAH7AwHStkM=
X-Google-Smtp-Source: ABdhPJxyu8XQWooKeHFhKqPxMrsMd8CMdaKykMFVUB42krU3rxtCTv+tn64YbbGPaNJ5rl1E97UN3g==
X-Received: by 2002:adf:f809:0:b0:20a:c40d:ae9a with SMTP id
 s9-20020adff809000000b0020ac40dae9amr18725659wrp.609.1650985248235; 
 Tue, 26 Apr 2022 08:00:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 e9-20020a056000178900b0020a9f995a3csm12291026wrg.24.2022.04.26.08.00.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 08:00:47 -0700 (PDT)
Message-ID: <13341ca4-32af-6fce-0009-24c6645b063d@redhat.com>
Date: Tue, 26 Apr 2022 17:00:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v2 3/8] block: introduce a lock to protect graph
 operations
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-4-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220426085114.199647-4-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 10:51, Emanuele Giuseppe Esposito wrote:
> If a coroutine changes AioContext, the counter in the original and new
> AioContext are left intact, since the writer does not care where is the
> reader, but only if there is one.

"As a result, some AioContexts might have a negative reader count, to 
balance the positive count of the AioContext that took the lock.  This 
also means that when an AioContext is deleted it may have a nonzero 
reader count.  In that case we transfer the count to a global shared 
counter..."

Paolo

> If instead the original AioContext gets deleted, we need to transfer the
> current amount of readers in a global shared counter, so that the writer
> is always aware of all readers.


