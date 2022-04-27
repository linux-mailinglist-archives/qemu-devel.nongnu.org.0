Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC97510EDF
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 04:38:32 +0200 (CEST)
Received: from localhost ([::1]:57504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njXZX-0001iu-H8
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 22:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njXXM-0000Jt-Tb
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:36:16 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:33361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <atishp@rivosinc.com>)
 id 1njXXL-00074G-EN
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 22:36:16 -0400
Received: by mail-lf1-x129.google.com with SMTP id bu29so841691lfb.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 19:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pfj6u1NDZBPGoTXuJz67yVJrX5DNKFgIM4WeboFTX5M=;
 b=gbNNIcOvOYfz0TZr4VA1xZzShTPNwWl3QQQjudIiHylqeUU7hkFyIU5l6ah9Kq0LqR
 FcSx0rHvjdAD+aTNrGGqwCHSG1bq24hWBOEw3HFuHM4VrUEgpCkYeTANrIb8vw5cSVJ9
 1fyCHannHkKi9xisLOGvURcl7eUuQbEgaMhnhjpD6lu+W/KVukwxthGkcVGTsqL6OwZa
 91s5dFyBzr26bTI84uVjSo6HJHvcz2VqlBv54LgF805puBwjnL8b4pWZv2AwZUUgEpRe
 piCLP9hT0BaMF+30eVgb55dS3qsBAfxgwMx7J2eZhSf9wsOchGtVp+qp9xhBgSCF6J01
 IrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pfj6u1NDZBPGoTXuJz67yVJrX5DNKFgIM4WeboFTX5M=;
 b=BoV6jCR4zHWNJw7GHkkTEghGEzFQ8HB8Zk0k4IEUlRcB1Bx608HwsGvO+YZjjBLvck
 ROSo5KmXKkO85q//oRx+r9FmJbxtL63Ck6QqA5QGf8Ir/dEX/H8DpN28zl7dOWyAtFnS
 1jGbFFGNYRajhMjySQbqH2ne1eWy897hJOGot6A0JEp1lbTQrcb26/go9tniapdFScMW
 NV9/aNKTQy2TEi6r+pAEfqyXiPlUxfNkTOXDX0ynlNzLX/A/Dml5zfyV9RVB4tSgdRvK
 OdEkhILsOok/Ja6pSZ7rPO3NNetjg2+nSHVx4Xg56N6OMkF8neyPn8xVVMv7GSB/8QmC
 VnAw==
X-Gm-Message-State: AOAM530o9uvXFZrBVeY64vyiHvJiO9x+7pec86bkdoSa4Wv9G2R8Azso
 7Qez9A+Z643sFOjujeOii7x1HhabWfV236/ERn+B0w==
X-Google-Smtp-Source: ABdhPJwDpIlKSZvACdWe+5yNvKEnFloZEWyjncrmVJONSAwRuzPK3BVoBAmcOfIgitkMmhzX7glNURD9Y+Vy+j/714E=
X-Received: by 2002:a05:6512:b1e:b0:44a:9b62:3201 with SMTP id
 w30-20020a0565120b1e00b0044a9b623201mr19242484lfu.42.1651026973977; Tue, 26
 Apr 2022 19:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220426230855.336292-1-atishp@rivosinc.com>
 <20220426230855.336292-3-atishp@rivosinc.com>
 <68ce0082-130b-ed22-8d8b-04878552ba2d@linaro.org>
In-Reply-To: <68ce0082-130b-ed22-8d8b-04878552ba2d@linaro.org>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Tue, 26 Apr 2022 19:36:03 -0700
Message-ID: <CAHBxVyFHmpNXarzrsUV=LX+G+DixCuvxE_u=atSotRKSexi2aQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] migration: Add 64bit variable array data type
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=atishp@rivosinc.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 26, 2022 at 5:50 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/26/22 16:08, Atish Patra wrote:
> > +    .num_offset = vmstate_offset_value(_state, _field_num, uint32_t),\
> ...
> >       } else if (field->flags & VMS_VARRAY_UINT32) {
> >           n_elems = *(uint32_t *)(opaque + field->num_offset);
> > +    } else if (field->flags & VMS_VARRAY_UINT64) {
> > +        n_elems = *(uint64_t *)(opaque + field->num_offset);
>
> Offset type mismatch.  Since num_harts is uint32_t, I don't believe you need this patch at
> all.
>

Ahh yes. You are right. I read the function description wrong and
assumed that VMSTATE_VARRAY_UINT32
creates an variable array of uint32_t elements only. Thanks for the
clarification.

>
> r~

