Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 881EE6C9A87
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 06:27:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgeRu-0005KZ-D7; Mon, 27 Mar 2023 00:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgeRe-0005CG-CL; Mon, 27 Mar 2023 00:26:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pgeRU-0004qC-AN; Mon, 27 Mar 2023 00:26:58 -0400
Received: by mail-pj1-x1035.google.com with SMTP id j13so6501427pjd.1;
 Sun, 26 Mar 2023 21:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679891206;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vLmUsZzYLBNAU1s+AtF5Os+cqTh0I7/Qbqt68UQ/oVs=;
 b=njUj5UoP0s33r1/dUQO+BhRjBI/dTNUARc0aifT0dHtWxrMXM4+A6BRiEq42xNYEZQ
 1EC/1NGAN4v+PuKDufgJ5DSJ7XHKoP+04fsq9w17/gAmGzSRVshrgeD7NvMjkLLUiXL/
 5ErHcSrMnq/xLTGq4o2wVgGdBQOuz9nL5UQQGwXMVo+sfOpcUF+yiHk7N8Lq1cuUhHY3
 mksm3rueCp9ZxWtvTAdFMLDCL14raOV6rpZ+VsXBZ4FyXbaiy+Gh+ZwQ8WxZYnIDmJAF
 2MDpKRjPYq2WoI22W/HL4lzKr/AxQLO+tMeHoiu4IOuxmdMJuh35HdPNpPxnFTMXzHeb
 8CnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679891206;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vLmUsZzYLBNAU1s+AtF5Os+cqTh0I7/Qbqt68UQ/oVs=;
 b=fFJ+yxL4ZtdD+VdFKrDZqVw8DRBpXVQxX9J16fKW4m5mp51snJ3Z9JcYEw321TQEnq
 8apkEZb8eZAtJvJNcRpjJvmfaFKsulUvZA/a3qNB3cHGwIHkbRfhGfgDxQsrRp+h9wKX
 bUEalDAzYMEb2whfoX7HnTIgwSSGn6VBohdDyaCu+tRISwB+4Ka4AFXQYSm5az4JGzpR
 Msg/90qqPcb2EfRf1ZPbIGQ6citfEoqFiMusIfN/zUjIHGrIcdf2MP5Yd6VFwEnbXyV/
 TpxT5xmvUHganhUVcJg30FX+ju1eL6aAAZg93u0y+ZL4dhkGiKLyzJj9V4LEFN7kjcne
 cPig==
X-Gm-Message-State: AO0yUKV+IHyjtSmKEITFm7yTbOBRNVqrx4VXlEOg3QgQOh50RiZCESQ1
 aksqalgEDAyRSwF8uA4Y7rE=
X-Google-Smtp-Source: AK7set9DDrqks6FBRnEfMLrZbLTF2TMUOdW1Q5KuPGxP+GWsJjmUIwATY5vWdPULKbdBzOApI2IEKA==
X-Received: by 2002:a05:6a20:be0f:b0:bd:23a2:8840 with SMTP id
 ge15-20020a056a20be0f00b000bd23a28840mr10108246pzb.35.1679891206448; 
 Sun, 26 Mar 2023 21:26:46 -0700 (PDT)
Received: from localhost ([203.221.180.225]) by smtp.gmail.com with ESMTPSA id
 22-20020aa79256000000b00582f222f088sm17814740pfp.47.2023.03.26.21.26.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Mar 2023 21:26:45 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 14:26:42 +1000
Message-Id: <CRGVQCBRZIJ7.19KMYO8U695KW@bobo>
Cc: <qemu-devel@nongnu.org>
Subject: Re: [PATCH 4/6] target/ppc: Alignment faults do not set DSISR in
 ISA v3.0 onward
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Fabiano Rosas" <farosas@suse.de>, <qemu-ppc@nongnu.org>
X-Mailer: aerc 0.13.0
References: <20230323022237.1807512-1-npiggin@gmail.com>
 <20230323022237.1807512-4-npiggin@gmail.com> <87wn36feuy.fsf@suse.de>
In-Reply-To: <87wn36feuy.fsf@suse.de>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri Mar 24, 2023 at 11:39 PM AEST, Fabiano Rosas wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
>
> > This optional behavior was removed from the ISA in v3.0, see
> > Summary of Changes preface:
> >
> >   Data Storage Interrupt Status Register for Alignment Interrupt:
> >   Simplifies the Alignment interrupt by remov- ing the Data Storage
> >   Interrupt Status Register (DSISR) from the set of registers modified
> >   by the Alignment interrupt.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  target/ppc/excp_helper.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
> > index 5f0e363363..c8b8eca3b1 100644
> > --- a/target/ppc/excp_helper.c
> > +++ b/target/ppc/excp_helper.c
> > @@ -1456,13 +1456,22 @@ static void powerpc_excp_books(PowerPCCPU *cpu,=
 int excp)
> >          break;
> >      }
> >      case POWERPC_EXCP_ALIGN:     /* Alignment exception               =
       */
> > -        /* Get rS/rD and rA from faulting opcode */
> > -        /*
> > -         * Note: the opcode fields will not be set properly for a
> > -         * direct store load/store, but nobody cares as nobody
> > -         * actually uses direct store segments.
> > -         */
> > -        env->spr[SPR_DSISR] |=3D (env->error_code & 0x03FF0000) >> 16;
> > +        switch (env->excp_model) {
>
> Slightly better would be to check on (env->insn_flags2 & PPC2_ISA300).
> We were trying to phase out the usage of "exception models" wherever
> possible in favor of specific feature/isa level flags.

Oh good point, thanks for catching that. Will fix and resend the series
(I've done the same thing in a few other places too).

Thanks,
Nick

