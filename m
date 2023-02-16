Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD6698BC9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 06:21:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSWhd-0005PS-5r; Thu, 16 Feb 2023 00:21:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSWhU-0005Oe-Us
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:20:56 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <debug@rivosinc.com>)
 id 1pSWhS-0004G7-7x
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 00:20:56 -0500
Received: by mail-ej1-x636.google.com with SMTP id a3so2488300ejb.3
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 21:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZOfd1irgj/WVnHrNkmoSwaV6aW0WY2eDWU89ngbsOy0=;
 b=cuktNgrWXhwV+O5UElvsEcjamMOgkiGp64QsWOqKrZqMYpewaWo+BrMDoErATtoydB
 7ucL3k8R0q3E2+bcoNAcPjc2JvWRfKQvjIT3JYDkclZ3J5AZR1ihGqxmCUu1MkUC3UCP
 oZ/hx65qv4anUEoSrC3JnUeCDH9ohPtfQWCSaVyblbU5AhytR/DHeDb5s7gsZ0g+nsc9
 b0ZigYQESNEChn5Owj5Y2JHJl1URox7k7iewnS61oFQuKHnPf4sfcx3fHzgVx6WmKHa5
 qlb7uhe4wjoYuswSDJgVS7bNyuWG3BFlPQMtvikgDPmrWuT3Li/Z9lpg7hJYefIVM6s9
 pcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZOfd1irgj/WVnHrNkmoSwaV6aW0WY2eDWU89ngbsOy0=;
 b=BAKRIjdnUGhDlqVHr5OjQQcuV83Ff7QxiF8PKjwC2J8/GXrQsBYjdU9zr2wPPj1dYV
 rZ9dk7I6mKJXyNBDxpzXAjjW+YjWWAVNvQYp/QxkTLkzFLE4gTSgsD/Hfoyhih/m2I6U
 EaTFzANfBHc9QEVKuKaOC9UXFzJtlzsVC9jV+IpXvS1ADeZt9Fm751E96t5RWEM8GBwT
 9dGAqNNn3LbTWKo67kEi+JR4BtA3izVkF/XBiZkNNJtIkGalA7EeHTF9TPzZAuRwq9KT
 UzRKYjBRPHfA1Z+Kar16/9esXhVCajdy7b0mnSCS6V7kDj54XCyMoNQpXr/oekQP1jOF
 wRfQ==
X-Gm-Message-State: AO0yUKVm5FLHpDuUDhTvmdm9LxX1ziwdlvyuifWL3bwQuVb1sxaD+Hot
 iF78Gjnxr3oVbTemwsntCSdw1YwX+Jt904En/DMc2Q==
X-Google-Smtp-Source: AK7set9857CG/6ZyMsy0UF24+yFG7G+Vx3rV/R+IvMSz2LnIVJky6KKmVTsTIoqP8z1sc0MynTIK37Qd0HxUQ2nkZjM=
X-Received: by 2002:a17:906:af10:b0:877:747c:373e with SMTP id
 lx16-20020a170906af1000b00877747c373emr2206187ejb.6.1676524852331; Wed, 15
 Feb 2023 21:20:52 -0800 (PST)
MIME-Version: 1.0
References: <20230209062404.3582018-1-debug@rivosinc.com>
 <20230209062404.3582018-4-debug@rivosinc.com>
 <f68da758-a418-c528-6f7c-e6e0d0246255@linux.alibaba.com>
 <CAKC1njTbP0=H8w=izkMkEwVjq9=6m_Rw_ymgremjtbFYDGTrow@mail.gmail.com>
 <d9f692af-eb86-421d-f0cf-495f2a2e01b4@linaro.org>
 <CAKC1njR44uKkeqT52mn2wg4PzpF6cvwCEk7cGn=gCVjwjVA-6Q@mail.gmail.com>
 <3a786c14-11b1-6a12-1bb0-fc467bdd2daa@linaro.org>
In-Reply-To: <3a786c14-11b1-6a12-1bb0-fc467bdd2daa@linaro.org>
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Feb 2023 21:20:29 -0800
Message-ID: <CAKC1njT3aafBANBjB4zQ0ysDz=5MU61AV4DQtEyPV=pWBdX+0A@mail.gmail.com>
Subject: Re: [PATCH v1 RFC Zisslpcfi 3/9] target/riscv: implements CSRs and
 new bits in existing CSRs in zisslpcfi
To: Richard Henderson <richard.henderson@linaro.org>
Cc: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 liweiwei@iscas.ac.cn, 
 dbarboza@ventanamicro.com, Kip Walker <kip@rivosinc.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=debug@rivosinc.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Feb 15, 2023 at 6:44 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/15/23 15:38, Deepak Gupta wrote:
> > Question:
> > I'll basically need two bits (one for forward cfi and one for backward cfi).
>
> Are they separately enabled?  It may also be possible to use a single bit and then perform
> a runtime check.  I guess I should read the spec...

There is a master enable but there're controls to individually enable & disable.
Thus the CPU could be in a state where one is enabled and other is not.

>
> > But I need to throw away the TB if cfi enabling bits mismatch at the
> > time TB was generated and the current state of enabling bits.
> > Reason being, this needs to get translated again and zimops need to be
> > generated.
> >
> > What's the best way to throw away a single TB?
>
> You don't throw TBs away at all.
>
> The current cpu state is produced by cpu_get_tb_cpu_state.  This is included into the hash
> table lookup and will only match a TB which has been generated with the same state.  Which
> means that you can have multiple live TBs, those with CFI enabled and those without, and
> the correct one will be selected at runtime.
>

Thanks a lot. I see `tb_lookup`  & `tb_htable_lookup`.
I'll revise and add some bits in TB_FLAGS for both of them.
And probably ask some questions on the list if anything is not clear to me.

>
> r~

