Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A502B18FD
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:24:37 +0100 (CET)
Received: from localhost ([::1]:42434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWFw-00083A-He
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:24:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kdWEh-0006nT-0I
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:23:19 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:45468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kdWEf-0005vp-C0
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:23:18 -0500
Received: by mail-yb1-xb41.google.com with SMTP id 2so8198183ybc.12
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YvxjEZHOeL0zfV6/wlcoTQ+gOTrgSC7GWnaLq56nWms=;
 b=hUJ32JJ8JtGc3bvCKk0MGXnxUvX1TLV8kuz+T341OKuAbQZUZuboQepAF+x8F3XD6X
 dbqnksu/i4tlkLhogNBNJH+1MN0bTRamwqXZCxR7ifjXk7L/HaXcrmCdDT4uEKOMAuM5
 BAhiTjgGNKVwDMXsrdUppiovM2jBpamXSU0YRZE2oTDldVS383XkdPj7o4B9vn/XALqm
 ty/OntqTAz1+nGaQFZm/OTBK6BtzZ1zPFDhMDkoAMgHHQMQesNObVbNTJIAUH5UKSQLE
 Vm96DI2IQ0qN4Clmo9jVkd/19wu/FM0yZUGI33auluqPPmdCH5YTm10Rh3yR8sLaDMBY
 fSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YvxjEZHOeL0zfV6/wlcoTQ+gOTrgSC7GWnaLq56nWms=;
 b=mBI77+JKlYgyfvkMk0+kExpH4MIDBzpI2c3v2E9uCJ6JGoPjOY/INos97Fl2sf/+pk
 XWwivI7grh076JVNMUftCmRP8oCAr4SZRleKCw/+yR5AERrZhTGqkA4YHulHAkOyglO0
 e+fiLrOdd+XJmzTh4QKX8EW4lV+B7ObRuZkF77W2du7wF3H8L/AWYFGmHQMcKHmB/61O
 G6PeglDZghCdKMHcDCuCXtAT4RPtWt4PVzMkZM0KW5SkLIhbT1heJR0dqd8LepcYNpxU
 61fD6IWAnuFLCY6E0rVC1cFNXzjeZ3LrSPHKgqQLt8uiJD00KWs3yr3Z32CzeaFSKuDz
 IoXw==
X-Gm-Message-State: AOAM530dNGZkIQH5OImJ8aJBclJ16McvpjWVgqS+cT7HuDdsixlJb8GT
 +2sjk8wnESey8LZYifn3Q0ftGNM1kQGEDUF1FBg=
X-Google-Smtp-Source: ABdhPJzWEPnWsMrd11flhpjDOJIxtUtMTK2zFbCZc3PTWdlJXAZ3wV95ozTx53qZgwY7VBrhAhsln8qXBjaJ0T3cFB8=
X-Received: by 2002:a25:9a02:: with SMTP id x2mr1704924ybn.306.1605262996428; 
 Fri, 13 Nov 2020 02:23:16 -0800 (PST)
MIME-Version: 1.0
References: <1605261378-77971-1-git-send-email-bmeng.cn@gmail.com>
 <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
In-Reply-To: <4e7e41c4-ce96-05c7-f2cf-27f926639d49@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 13 Nov 2020 18:23:05 +0800
Message-ID: <CAEUhbmWDXFExcYGy6SZzz9t+TwHRD3LCuPAvg_S9_5tHRHF6-A@mail.gmail.com>
Subject: Re: [PATCH v2] target/i386: seg_helper: Correct segement selector
 nullification in the RET/IRET helper
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b41;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

On Fri, Nov 13, 2020 at 6:18 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 13/11/20 10:56, Bin Meng wrote:
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Per the SDM, when returning to outer privilege level, for segment
> > registers (ES, FS, GS, and DS) if the check fails, the segment
> > selector becomes null, but QEMU clears the base/limit/flags as well
> > as nullifying the segment selector, which should be a spec violation.
> >
> > Real hardware seems to be compliant with the spec, at least on one
> > Coffee Lake board I tested.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> >
> > ---
> >
> > Changes in v2:
> > - clearing the DESC_P bit in the segment descriptor
> >
> >   target/i386/seg_helper.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/i386/seg_helper.c b/target/i386/seg_helper.c
> > index be88938..d539573 100644
> > --- a/target/i386/seg_helper.c
> > +++ b/target/i386/seg_helper.c
> > @@ -2108,7 +2108,10 @@ static inline void validate_seg(CPUX86State *env, int seg_reg, int cpl)
> >       if (!(e2 & DESC_CS_MASK) || !(e2 & DESC_C_MASK)) {
> >           /* data or non conforming code segment */
> >           if (dpl < cpl) {
> > -            cpu_x86_load_seg_cache(env, seg_reg, 0, 0, 0, 0);
> > +            cpu_x86_load_seg_cache(env, seg_reg, 0,
> > +                                   env->segs[seg_reg].base,
> > +                                   env->segs[seg_reg].limit,
> > +                                   env->segs[seg_reg].flags & ~DESC_P_MASK);
> >           }
> >       }
> >   }
> >
>
> Queued, thanks.

Thanks!

> It would be nicer if the commit message explained how
> the guest can notice the difference.

The commit message says "Per the SDM" :) The actual failure case
involves a special code sequence that is exposed in VxWorks guest
testing. Linux does not expose this however.

Regards,
Bin

