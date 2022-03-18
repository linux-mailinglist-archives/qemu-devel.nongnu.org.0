Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71C4DD677
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 09:50:16 +0100 (CET)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nV8JK-0000xq-Mw
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 04:50:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nV8I5-000082-0p
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nV8I1-0005lN-Lc
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 04:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647593332;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=td0KUv8Shbhs6RLAOiYT/xs06t5S0jcVx0J9DIJuOU0=;
 b=i8rdiyI7I9/G+ywIYpPMrQ7ZI3ay4lBtjmiK1wK26NxeBp+WDoLqPlozZgzj8NjdkbC4z9
 bJoHfr8ol+3b+sAf7WQs+0sOCU4lV+Bv7Pc/a/8Uh64tbO9Dlk16kXJkJ3VGRCjfrxniJA
 8WSy0aowcX/9X6EFZ8bSxJv/uzFyWYY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-tce_BZ7RM_GDS2eIp3kcmw-1; Fri, 18 Mar 2022 04:48:51 -0400
X-MC-Unique: tce_BZ7RM_GDS2eIp3kcmw-1
Received: by mail-ed1-f69.google.com with SMTP id
 i22-20020a508716000000b0041908045af3so1104169edb.3
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 01:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:from:subject:content-transfer-encoding;
 bh=td0KUv8Shbhs6RLAOiYT/xs06t5S0jcVx0J9DIJuOU0=;
 b=t59r+9aVjFr0kVnjNILFe2Mcny5i+mealEq85MiVn3wUWUjDcUmgv/OkWC90PliP5u
 Q1mWtKHwH4JjaehtZtS0u3aJmF2EVPdBFw1GKKfxa6NY1qEsiXW/rPjdofnipNEjw5Ie
 u3YYHPP/rWPw2nviyURTp6Ba5Pm6uBzs7K00vgoAKcz50bRRTHX6IzORrnU6Qn2AWJeO
 ewBLnVLP8bU8rWqp6lLCxgvedjabagKi9/u6sc4DPDxMa+p8GZQdkkkm9mcCrFpJVrzD
 mLLbT4/6fM4ypRaccVEoJX7XOHWMv5NEG8UoaGh93MYidT878LgQRG83SaCsC92Q7ysc
 S9cg==
X-Gm-Message-State: AOAM5301aCha70oL90DuJOUAfkxrAcLxcwBkI6PG8ERgPZPggGelqZk6
 k4PeoNEP2+CcH3gYsgrs0LREXyxodd1Og1L8F+x6WzARSMpCZ3ezwCs5lrSM2p3dIEIE4UB26zg
 6P/Vzs/nshDj7ajEYdp30D45xIr5M+GBGbW7hg1GJpQDhdi4ni/E3UJOl3XUaq1ICHpA=
X-Received: by 2002:a17:907:7da5:b0:6db:344:f5b3 with SMTP id
 oz37-20020a1709077da500b006db0344f5b3mr8059977ejc.385.1647593329396; 
 Fri, 18 Mar 2022 01:48:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2ogb4Kgzn71dweEHlU0sdn033HH3aZd8XfbENf5UU/YNcsd4L+eJ1R6pru7UNrfm2kZR9ww==
X-Received: by 2002:a17:907:7da5:b0:6db:344:f5b3 with SMTP id
 oz37-20020a1709077da500b006db0344f5b3mr8059960ejc.385.1647593329035; 
 Fri, 18 Mar 2022 01:48:49 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.googlemail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm3378957ejm.115.2022.03.18.01.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 01:48:48 -0700 (PDT)
Message-ID: <8e98ff69-2f35-72c1-9b68-2a6a19ed716b@redhat.com>
Date: Fri, 18 Mar 2022 09:48:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
To: qemu-devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: comparison of coroutine backends
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

based on the previous discussions here is a comparison of the various
possibilities for implementing coroutine backends in QEMU and the
respective advantages and disadvantages.

I'm adding a third possibility for stackless coroutines, which is to
use the LLVM/clang builtins.  I believe that would still require a
source-to-source translator, but it would offload to the compiler the
complicated bits such as liveness analysis.

1) Stackful coroutines:
Advantages:
- no changes to current code

Disadvantages:
- portability issues regarding shadow stacks (SafeStack, CET)
- portability/nonconformance issues regarding TLS

Another possible advantage is that it allows using the same function for
both coroutine and non-coroutine context.  I'm listing this separately
because I'm not sure that's desirable, as it prevents compile-time
checking of calls to coroutine_fn.  Compile-time checking would be
possible using clang -fthread-safety if we forgo the ability to use the
same function in both scenarios.


2) "Duff's device" stackless coroutines
Advantages:
- no portability issues regarding both shadow stacks and TLS
- compiles to good old C code
- compile-time checking of "coroutine-only" but not awaitable functions
- debuggability: stack frames should be easy to inspect

Disadvantages:
- complex source-to-source translator
- more complex build process


3) C++20 stackless coroutines
Advantages:
- no portability issues regarding both shadow stacks and TLS
- no code to write outside QEMU
- simpler build process

Disadvantages:
- requires a new compiler
- it's C++
- no compile-time checking of "coroutine-only" but not awaitable functions


4) LLVM stackless coroutines
Advantages:
- no portability issues regarding both shadow stacks and TLS
- no code to write outside QEMU

Disadvantages:
- relatively simple source-to-source translator
- more complex build process
- requires a new compiler and doesn't support GCC


Note that (2) would still have a build dependency on libclang.
However the code generation could still be done with GCC and with
any compiler version.

I'll also put it in a table, though I understand that some choices
here might be debatable:

                          stackful      Duff's device            C++20              LLVM
==============================================================================================
Code to write/maintain    ++ [1]             ---                   +++              - [2]
Changes to existing code  ++ [3]             -                     --               -
Community acceptance      ++                 ++                    --               ?
Code or PoC exists        ++                 +                     -                --
==============================================================================================
Portability               --                 ++                    +                -
Debuggability             -                  ++                    ?                ?
Performance               -                  ++ [4]                ++               ++

[1] I'm penalizing stackful coroutines here because the worse portability
has an impact on future maintainability too.

[2] This is an educated guess.

[3] If we decide to remove the possibility of using the same function for
both coroutine and non-coroutine context, the changes to existing code
would be the same as for Duff's device and LLVM coroutines.

[4] Slightly worse than C++20 coroutines for the PoC, but that is mostly due
to implementation choices that are easy to change.


Stackful coroutines are obviously pretty good, or we wouldn't have used them.
They might be a local optimum though, as shown by the negative points in terms
of portability, debuggability and performance.

Both Duff's device and LLVM would be more or less transparent to the part of
the community that doesn't care about the coroutines.  The translator would
probably be write-and-forget (though I'm not sure about the API stability of
libclang, which would be a major factor), but it would still be a substantial
amount of work to commit to.

Thanks,

Paolo


