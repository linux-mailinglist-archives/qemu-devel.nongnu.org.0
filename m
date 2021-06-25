Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCE3B48B2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 20:20:06 +0200 (CEST)
Received: from localhost ([::1]:50604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwqQv-0002tR-LQ
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 14:20:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqPt-0002EH-R2
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:19:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lwqPs-0004fX-2h
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 14:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624645139;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u4ljvAO4/KTV6xXwPU2vXZj7cR6BQLEpk/ynHufZCQc=;
 b=i9DEdWoc9MsUhKyRF4VapnwRO/CugN5Q3MDjK6abBpklVAR3/3lLuIa6umeKAy3UZrMl/g
 SaWAJyxvZfjtgx4s1/WTroQJ7cKjoKzYkK0chGF1NMO3MjCEqJwwRafiWC6eA3Wx9anJ1O
 oJrYz/vSOt1Xk7HQjk6V9HqNVw8qpE8=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-TQiNw8LFPeSQbl-CMaJeJg-1; Fri, 25 Jun 2021 14:18:57 -0400
X-MC-Unique: TQiNw8LFPeSQbl-CMaJeJg-1
Received: by mail-ua1-f70.google.com with SMTP id
 i7-20020ab024870000b029028148361400so2677986uan.13
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 11:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u4ljvAO4/KTV6xXwPU2vXZj7cR6BQLEpk/ynHufZCQc=;
 b=ARpL3KQHwiQyU4x0RcyTH09jY6aE/F/5RR648oRhRkwfh/Q1RwNdpZ1b5Eelj1d1xO
 el+i/jwvljrA++j/KjsXp3SbsMwySez3hwijXeEXcCF7Ro2tkbtb0IibAj42RIDZ/hPr
 timUnAc31xhWM+I9lX78vDf/QB7Zwa1O/TkY2t0IuBKfedLk5yQyT/mIMRnAtWZv/YZA
 PBHANj/lCUb5ysH4deMcfFg4zARebg3CzmLmt000poALaySoaOWIwaRkFFqVQLPkHemb
 s0pfsouV/l6ZIuNvPwuCk3w9abjFt+HpXhzhkDoa+WMe6FZROmTeBuxYzZQMsMrzCI4D
 QE9w==
X-Gm-Message-State: AOAM530pkphEorYaFpCJRfFlCwsclyKIu1dnhiCbBO+ubijCkb+1GBHi
 GaZVHFgvj6RCvh7Vehts8u9pj+J4TdjFQfCZv7bnMApRcIiNdGLtWl7tAPVQNsgDp7honDUsE0Q
 BgzTQzsugTcxQjhiZYjzZNgih9VIZjug=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr12885731uan.5.1624645137507; 
 Fri, 25 Jun 2021 11:18:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxilpOhYylwkn3wjA2aDkFIjdcip1FQj4FX6T+o1HGp/NfJ0wS3BZOmSxEEY23WAzBMqxBiwIR5X1jzTIatWJ0=
X-Received: by 2002:ab0:3253:: with SMTP id r19mr12885713uan.5.1624645137386; 
 Fri, 25 Jun 2021 11:18:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210625154540.783306-1-jsnow@redhat.com>
 <20210625154540.783306-3-jsnow@redhat.com>
In-Reply-To: <20210625154540.783306-3-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 25 Jun 2021 15:18:31 -0300
Message-ID: <CAKJDGDYJiKmqEdgijp+mNPggedQ6=pNFw63ijuGYuFt9=1Gh0w@mail.gmail.com>
Subject: Re: [PATCH 02/11] python: Remove global pylint suppressions
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 25, 2021 at 12:46 PM John Snow <jsnow@redhat.com> wrote:
>
> These suppressions only apply to a small handful of places. Instead of
> disabling them globally, disable them just in the cases where we
> need. The design of the machine class grew quite organically with tons
> of constructor and class instance variables -- there's little chance of
> meaningfully refactoring it in the near term, so just suppress the
> warnings for that class.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/machine/machine.py | 3 +++
>  python/qemu/machine/qtest.py   | 2 ++
>  python/setup.cfg               | 4 +---
>  3 files changed, 6 insertions(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


