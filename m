Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19932CA718
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:33:09 +0100 (CET)
Received: from localhost ([::1]:49766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7eO-0007E8-J0
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7c5-0005bG-AH
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:30:45 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk7c3-000736-DM
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:30:45 -0500
Received: by mail-ej1-x62b.google.com with SMTP id f23so4917328ejt.8
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=omoNZuMXZYHwSB73tLL9ieIUFXaxqMuFLDoFP/xEzdA=;
 b=X/oQwuCednnGQaFtOZw3glPPl//jyBqdiFdsF6/Q8ln2AEp7ORlbH3LjzTok4zi+wH
 9PoH6SEmej7yXwXhGshN7Lqg/RsGSPdYTY9jcjntBjfWUBkcYBVtYKa7tkLNzvIayLly
 p85jNjGWKAIQqxR8MaugHFZMyDxekdQcHU/1BgDbbkavdC9rvHLNJN0XFHGGUE19ov+F
 a8xZOQ+WPrmx/qvBQ6ce6III+aA92KODrI4lOHewpmHKWsz8Ep6CaiR/JdZCMsnCLzlY
 RQ2wes2tey4eY7s7Xtwb1mPs6q/UdIrTHK+gwVBemDX0y3tB5MGgafR9uony0dm08THC
 zPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=omoNZuMXZYHwSB73tLL9ieIUFXaxqMuFLDoFP/xEzdA=;
 b=RNFsc9zniBCher5FhBFXWNYXcwah/LekC3ZKtMMOMih5iU/mrwvNOGrZMUnM7+UkqY
 vOjn0UyKPFIwZWNw343Y6a5JmdnJ+CPVhu7o5Ye1nne0I5xGSPvE16ZrUsnqoPOK80wU
 P+NHEyfy2H547mBs/ApblfKsUeb6SMxp8OpNZYOcNtd9vgRvwRwOCbn8eHeFTwb5ozke
 zUy6K9ttrlY3s55/M34t6nJAWH0EHzllDrPTGarB+61GdN2ayHDW5a+Sy/E1d9GlsekA
 b8h+sV3IG1Ass++W7ykrd5EjR7t20CNJKmzwW2qm6z+Tp7fydxoC4YMSDvBJDuSENW7L
 R9UA==
X-Gm-Message-State: AOAM530EldAuT0tkZdwN7Va2GyUdgR9HEdkOF55gdP/VxxKy85JYKm35
 15s9SDMSs5fca/LfwsZRLLDdxPjXex9TlBdNJSbdmA==
X-Google-Smtp-Source: ABdhPJxBVUGe+pRlK4Kvtf63wT4WWnhk+dWFcVdeCoHItuwCpAkggGFNJvXNO+WlYVC1OsNw7dWriGdix236VYeRSM4=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr3346799ejd.382.1606836641682; 
 Tue, 01 Dec 2020 07:30:41 -0800 (PST)
MIME-Version: 1.0
References: <20201118142745.112579-1-ppandit@redhat.com>
 <204751s9-11np-413q-q3pr-3o6os86078@erqung.pbz>
 <492170b8-8056-bd65-5150-62c6e89cb3f0@redhat.com>
 <933np1s-8p4p-o74p-rp94-517r98nop2o6@erqung.pbz>
 <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
In-Reply-To: <0fd8daa2-7ce3-0231-8b95-d498ce900c8e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 15:30:30 +0000
Message-ID: <CAFEAcA80QONZVnvf_BVnvFtx7tRX9Zr+7KCCuLJy7wXwppF7gQ@mail.gmail.com>
Subject: Re: [PATCH] ide:atapi: check io_buffer_index in
 ide_atapi_cmd_reply_end
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 P J P <ppandit@redhat.com>, Wenxiang Qian <leonwxqian@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Dec 2020 at 15:28, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> About reproducer, Michael asked about CVE-2020-24352 (ati_vga OOB in
> ati_2d_blt) this morning. What happens to reproducers when a CVE is
> assigned, but the bug is marked as "out of the QEMU security boundary"?

Also, why are we assigning CVEs for bugs we don't consider security bugs?

thanks
-- PMM

