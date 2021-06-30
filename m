Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC41F3B8745
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:53:45 +0200 (CEST)
Received: from localhost ([::1]:54552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lydT6-00062S-QT
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:53:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lydQq-00035v-U1
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:51:25 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f]:40876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.montesel.revng@gmail.com>)
 id 1lydQo-0003el-4v
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:51:24 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 d21-20020a9d72d50000b02904604cda7e66so3367215otk.7
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 09:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zcN/lvtVu0J5rV8xoRt1l9n3zTWBVO3l12yGmYdoz8=;
 b=hAnofKDoVlazyyI+wIbtHy1Mk7JqtD5HwwINff78jv1S+0u1K2PMuN47gcotd41Mei
 YDDotnpYX9TQxDSoblghq/oJ8xjYLpqQ4RwBri5X/+n2ogHZwOSK0bap6YVS8cvCLsjy
 rgAK/iyPszuSsJcnDeCqDcsrLYt1PlXFZykqW3xI9hIvMXy/rC5BT9b3YN+Jdw1yRkAg
 BAScadStm0rUXPFIOr8DBVM0ZpThlK9lAUkYCShr0UY/Z/G6i6lYzSSWqF+0dBCebqnS
 FiOSqYs3hN6S1nPzhyHqFh/j91GgDX8BSXWdGKpsREYYc1TH4i+Mt1RQ9C68zKrcdpWx
 WZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zcN/lvtVu0J5rV8xoRt1l9n3zTWBVO3l12yGmYdoz8=;
 b=BzW5CWQUXrwNiB9HqCG+ZR1ni3LwXrrniXPA4S27C3bcvxJnE6Q5mP72cjoxiHeahf
 oJP6XqewllHMggvwMNwL7YpDwhDs+j2DNANzAFcFhVZXyYckmC9XY3+qfUUWRqzhBwX7
 YZbM++CR+gK/AgL0lDVsZN00TOuOpBfzv6/GJFYE0Vxr00eO8N9E51eSEv1FvuQOgxBU
 UkrtIxQve6N1KDBZYLNl4h+5gs28R5JuoNgjTeN3qW+7t/WazSXMFLE854hBXZp4VO0U
 RRddrrh8RfI+PnNcT3e8hLmImVM+jwA3Q5bRTHZAC6MhNFm4msd5EVaWNT6YUKfNnNEL
 V6Pg==
X-Gm-Message-State: AOAM532F3UF+okUGZJ7CN0c1xkwb5oLiyIWPdK4iDNpIQ/LbKCaqX1XQ
 FYLdY8Eb7B8I+2Hlnf4eH4ipXe8XZsJNe3h6QZ8=
X-Google-Smtp-Source: ABdhPJxUBp4asR7MtW/HKzgeUeaQjgzWJB1l9VSWH/qDgus+3kGSUiex4p9IQD+Iu8F0O9Tdwzjs4tu3RHnBNH6taCk=
X-Received: by 2002:a05:6830:1e83:: with SMTP id
 n3mr9848589otr.49.1625071880742; 
 Wed, 30 Jun 2021 09:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-11-ale.qemu@rev.ng>
 <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
From: Paolo Montesel <paolo.montesel.revng@gmail.com>
Date: Wed, 30 Jun 2021 18:51:09 +0200
Message-ID: <CANnx7NM54K1SuU1kzPcmumybXp4Ws0803Zwmki+q+J4OO2zZ1A@mail.gmail.com>
Subject: Re: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
To: Taylor Simpson <tsimpson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=paolo.montesel.revng@gmail.com; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alessandro Di Federico <ale.qemu@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > +void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
> > +                 HexValue *dst, HexValue *val)
> > +{
> > +    yyassert(c, locp, hi->type == IMMEDIATE &&
> > +             hi->imm.type == VALUE &&
> > +             lo->type == IMMEDIATE &&
> > +             lo->imm.type == VALUE,
> > +             "Range deposit needs immediate values!\n");
> > +
> > +    *val = rvalue_truncate(c, locp, val);
> > +    unsigned len = hi->imm.value + 1 - lo->imm.value;
> > +    HexValue tmp = gen_tmp(c, locp, 32);
> > +    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", val, ");\n");
> > +    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst, ", ", &tmp, ", ");
> > +    OUT(c, locp, lo, ", ", &len, ");\n");
>
>
> This doesn't match the C semantics of fSETBITS
>
> #define fSETBIT(N, DST, VAL) \
>     do { \
>         DST = (DST & ~(1ULL << (N))) | (((uint64_t)(VAL)) << (N)); \
>     } while (0)
>
> #define fGETBIT(N, SRC) (((SRC) >> N) & 1)
> #define fSETBITS(HI, LO, DST, VAL) \
>     do { \
>         int j; \
>         for (j = LO; j <= HI; j++) { \
>             fSETBIT(j, DST, VAL); \
>         } \
>     } while (0)
>
> You need to put len copies of LSB(val), so emit something like this
>     TCGv zero = tcg_const_tl(0);
>     TCGv ones = tcg_const_tl(~0);
>     tcg_gen_andi_tl(tmp, val, 1);
>     tcg_gen_movcond_tl(TCG_COND_NE, tmp, tmp, zero, ones, zero);
>     tcg_gen_deposit_tl(dst, dst, tmp, lo, len);
>     tcg_temp_free(zero);
>     tcg_temp_free(ones);

The change was suggested by (I think) Richard some patchset ago and I
think it is semantically equivalent.
I checked `compare.idef` and every value of `VAL` comes from a
comparison, which has value either `0` or `1`.
Applying `neg` turns it into either `0` or `0xFFFFFFFF`, making the
`deposit` work as intended.

Am I missing something?

