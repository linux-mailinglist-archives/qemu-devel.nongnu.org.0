Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1706794A6
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 11:01:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKG6d-0004Nd-18; Tue, 24 Jan 2023 05:00:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG6Q-0004Mm-B2
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:00:32 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKG6M-00070A-UG
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 05:00:29 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r2so13302820wrv.7
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 02:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pGtRppymZ7AwyQQoeY/s9C+Ffa0l96MxnwycTDdkkBg=;
 b=gzTkBWRD87vXK6T7z88q6A7ddLQhDkPvK09cPQ7uzpxXL6wlkSvjRvAmDhHsojZvjh
 NpXQRYHgxffUGyxhgPdxjX0vix3JJcZqeYxDHPS+56BK8G96D8pNczZ29eYyp7tsO7YP
 VPLGxJnGxagBtc+NG3zEfDw9ytHITFlo3NUa6qgfbfBWsxlAK/RuVpeWJGarkhuiooYW
 XwvQWPlPGWsxl4cDKDVA2PaRR+dpIw+0MAmEN0jpzes1lhB8TeR/pOs47dqRycfAeENF
 oWge+SyqAFwkuUGviEwTWy7syBNQh+C9VC3mg10YGWpgRlgI8hV3g1iW/uYQWlykA90x
 KqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGtRppymZ7AwyQQoeY/s9C+Ffa0l96MxnwycTDdkkBg=;
 b=y/OSqZLBS6f0teFFoIWUxnSJsfzPv+JWh0NEx76ietCTqGixTTPLUDA3Udq9bdSum7
 syM/f16ztw++MdEy+FaWG4gPbD7VX1dOqwPtUDndVOoBKyInThk9zFLuB6RC34ZE89Jb
 rAD50MrV2U+fscsUXOctTRDTsvK/tsP7yXvHPMqlD6PxfyGuu81NAbkXGthsYyAYqklr
 adjLBa+ZEQifBYaZLWJMsnpumGwRb02rETtfm2SIv9GLFsfduO1qpzBcjCky/SRulheU
 Bj4d3pUwClGavpsXy7P5L+mFXASFg+kpQFrIkfG+1s58Ok3FQVaePkSWTRLWN5K93INS
 9eeQ==
X-Gm-Message-State: AFqh2kqglEWmX5AP0FmYYxun2g9x56kzPkOeNA3LuA3kyOKitDk9x8NH
 BbDD3+4i3tbeRti5YASupLsTGLm7KgO3XferMxzU4l8iIoRf3w==
X-Google-Smtp-Source: AMrXdXuyYMOCzLXcIphcFfNs6XFSfeWGZLDPy32bhvZW+vR9WLx06XdjIdgYcaJFGrRT/0xYOWVnnhTghMRqK217gWI=
X-Received: by 2002:adf:f650:0:b0:2bd:dd46:99b7 with SMTP id
 x16-20020adff650000000b002bddd4699b7mr1247571wrp.108.1674554425328; Tue, 24
 Jan 2023 02:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20230123090324.732681-1-alexghiti@rivosinc.com>
 <20230123090324.732681-4-alexghiti@rivosinc.com>
 <20230123102912.kq5c47nzeg7ufkma@orel>
In-Reply-To: <20230123102912.kq5c47nzeg7ufkma@orel>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 24 Jan 2023 11:00:14 +0100
Message-ID: <CAHVXubi_4znHQ0yJYFR3UJ1adRE0yhECwb=Wohza26bucAKjEA@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] riscv: Allow user to set the satp mode
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Bin Meng <bin.meng@windriver.com>, Frank Chang <frank.chang@sifive.com>,
 qemu-riscv@nongnu.org, 
 qemu-devel@nongnu.org, Ludovic Henry <ludovic@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Mon, Jan 23, 2023 at 11:29 AM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Mon, Jan 23, 2023 at 10:03:22AM +0100, Alexandre Ghiti wrote:
> ...
> > +/* Sets the satp mode to the max supported */
> > +static void set_satp_mode_default(RISCVCPU *cpu, bool is_32_bit)
> > +{
>
> nit: When passing in the cpu object pointer there's no need to also pass
> is_32_bit, we can just use it from the pointer, cpu->env.misa_mxl == MXL_RV32

Ok

Thanks,

Alex

>
> Thanks,
> drew

