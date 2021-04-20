Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E393650A8
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 05:07:27 +0200 (CEST)
Received: from localhost ([::1]:43380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYgjV-0006Lg-V5
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 23:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYgig-0005tu-JU
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:06:34 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:42813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1lYgid-0002XV-R8
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 23:06:34 -0400
Received: by mail-il1-x12d.google.com with SMTP id c4so4353577ilq.9
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 20:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y35mqOo76xF7yaiOAyonFPjLSbiL8Bl6wHBwjwp5eJ8=;
 b=DzlZJ5o+fTDmLA/b48nppzKkBVyv7hBh2NalmwrnkxkXQd/PEmlIRsavKZ9dOqaNZF
 89HWeBre8GqZPjHNwu7J9VN1C22lfNMpj2Jh55XzcamRFsVGLk+2z0Ml4JlAuZ83f9Hu
 23DYyQ43TTwPQJQDhErN6NwbbSYTVfmj0Wz+bf6s1FdIr+F+j56i890NJkkctnbJU0Fn
 nYBlqLRfW+llceDVwQi+huVNhI4Kw1HnO5KAO1lJdB3W8y6larAzYGMOj/VWDPzcVpxe
 b2Z7VcwQD9UGDiKdOqtczkPgjnSpfJn+M1uievpps8Px73lMcfNRvzsimFi+wD5Eo4cb
 NbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y35mqOo76xF7yaiOAyonFPjLSbiL8Bl6wHBwjwp5eJ8=;
 b=Mcj12asrUvjLXXRWi/L6WhbjAESLsWEPCN96JYBCxriyceZgq0AoxNuUnWClYidc8T
 f9NlC71XJG5PNdRRFDjlP79/7c14gv6ZfN9eVDfczSnBXIwjL+65ynrmo/yPBYRf0ylH
 qlAGbf5EWcj32+UDzZzNGMIbDff1NWPelwwgEKmNc81LY2yPlLNTlu2nuciK3Vyksoq9
 yPJLjvqGUjI1pO+MxD2EHenz3Fc9QopMJsYjP09IFbaxqSyqct22iizBtNlsfLuJaAqQ
 gnqcBwFAdkhUMBkDKixSVDDsBfWnmrcu2wAEoQ2i9KkSDED08z7PzX61xQyRos5xElbs
 FgRQ==
X-Gm-Message-State: AOAM530YD7Cw6Grk6gW9LeSo/fKBkvhl59KEj8aNCOCWI3XUcH6HaPJ8
 SHJDQhA2VRMkl+B+UQe4xtJurXRb7pRMTf7ewYo=
X-Google-Smtp-Source: ABdhPJyKzT4GF/n96LKfUhQZ/DriJ/WYmGY3Cf4f9ojCOeeRPB8HKMT8zPkKT9PGLOcLmfgQqzWYl7Fow4fLZSRUXyQ=
X-Received: by 2002:a92:d90f:: with SMTP id s15mr19927414iln.227.1618887989862; 
 Mon, 19 Apr 2021 20:06:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210415134128.32670-1-emmanuel.blot@sifive.com>
 <FB9EA197-B018-4879-AB0F-922C2047A08B@sifive.com>
 <CAKmqyKNxMWpfQDGxxXLk=reAwv8+ky72YrrX=m5-eF_p_848Hg@mail.gmail.com>
In-Reply-To: <CAKmqyKNxMWpfQDGxxXLk=reAwv8+ky72YrrX=m5-eF_p_848Hg@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 20 Apr 2021 13:06:03 +1000
Message-ID: <CAKmqyKPVYqZdfvn22U+UwS5afJhH00DtTFb5YqESUNYKjK3Jzg@mail.gmail.com>
Subject: Re: [PATCH] target/riscv: fix exception index on instruction access
 fault
To: Emmanuel Blot <emmanuel.blot@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x12d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 20, 2021 at 10:56 AM Alistair Francis <alistair23@gmail.com> wrote:
>
> On Sat, Apr 17, 2021 at 12:48 AM Emmanuel Blot <emmanuel.blot@sifive.com> wrote:
> >
> > When no MMU is used and the guest code attempts to fetch an instruction
> > from an invalid memory location, the exception index defaults to a data
> > load access fault, rather an instruction access fault.
> >
> > Signed-off-by: Emmanuel Blot <emmanuel.blot@sifive.com>
>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

>
> Alistair
>
> >
> > ---
> >   target/riscv/cpu_helper.c | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > index 21c54ef5613..4e107b1bd23 100644
> > --- a/target/riscv/cpu_helper.c
> > +++ b/target/riscv/cpu_helper.c
> > @@ -691,8 +691,10 @@ void riscv_cpu_do_transaction_failed(CPUState *cs,
> > hwaddr physaddr,
> >
> >       if (access_type == MMU_DATA_STORE) {
> >           cs->exception_index = RISCV_EXCP_STORE_AMO_ACCESS_FAULT;
> > -    } else {
> > +    } else if (access_type == MMU_DATA_LOAD) {
> >           cs->exception_index = RISCV_EXCP_LOAD_ACCESS_FAULT;
> > +    } else {
> > +        cs->exception_index = RISCV_EXCP_INST_ACCESS_FAULT;
> >       }
> >
> >       env->badaddr = addr;
> > --
> > 2.31.1
> >

