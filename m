Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C012B2DC11F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 14:23:31 +0100 (CET)
Received: from localhost ([::1]:34410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpWmA-0006CZ-A2
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 08:23:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kpStY-0000HU-Jg
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:14:52 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kito.cheng@sifive.com>)
 id 1kpStU-00005b-O9
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 04:14:52 -0500
Received: by mail-lf1-x12e.google.com with SMTP id o19so20899772lfo.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 01:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C8Bo/NRBH2yj1+iDGWMOna9YGAL9PrYYyzakmAnRfOs=;
 b=S8cA/Zx9PqqBsJTOTdix4v38OaD6Tmztg+OCO9z3whsUjOqWc5c9g0lZDadBeh9kde
 x7FvxHgrMrt6jk1NkFU8q7H1SMJUYAcaHSC+AajmsGb1DMik29J9IOV2jQ/Y6hCvxdzn
 Y4mcffoMoD0aJxJA9M4HZHt3TAe09ftPHgQ05aRuaJv+xJ8QYJhbd9xp4WEtu4zJVdkr
 od+1idTcKQFGM80btm5Txxc6PqSoDZbxHP/bpNeoY+QDTDPdtAtFAke/ta+InIzHBqm/
 qsZxQNaYNx6AJNpTL7FLiYIsPnu/hZNKWGKJw+EoVww6dno+Z292REdS/r4nEvODR7c8
 6UEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C8Bo/NRBH2yj1+iDGWMOna9YGAL9PrYYyzakmAnRfOs=;
 b=Q0r+ORsXOTNarKnKdZpIzyck7/0o9lx5aFnvRWfrP3Jmbi97xSrbjE5/fgrnXLRQvZ
 vSw2R0zYhGg0uH1UIupwBko8GJp2T0aeEQ245vt/KGYKljPqjwrGC0l4DWr/jwFftWMb
 CJbRSLQ2tKUOyjZa8fTAlefuCd2nW4DOUFlLfsvVFaL4M3wU5BwfZBLl22rEoLfBdp6G
 Op/6ktJ6TtlkVaS80ADmVZK7w81cFJFVWB3XSJkNnG8ZbcX/lIhG/X/cZmO19OANAWto
 J8R2V6ceMszNOPM+y8v/w8wKdDrAxZ94QmtEUNSWf+4tXe0a6pZdmiQKZU6Bz8Hwdeqh
 7DhA==
X-Gm-Message-State: AOAM532CvIxEvMJ+3fJe1g5yfJpAS8IQXUfei3d4coT6RMz40oAczFLM
 ezPVpOnFGd4xLJ1SEbN6zrwj+DNRDT2MPJe/PHEaKA==
X-Google-Smtp-Source: ABdhPJz4M43ShrYqlECNs0TItl6tD3mEVhY+6nvHNdRc4QaG2YsfbJf804Ms1m6nTeZ4MkyRa/BN8sPtO6R7/z3TXBc=
X-Received: by 2002:a19:4a13:: with SMTP id x19mr12105339lfa.648.1608110086351; 
 Wed, 16 Dec 2020 01:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-16-frank.chang@sifive.com>
In-Reply-To: <20201216020150.3157-16-frank.chang@sifive.com>
From: Kito Cheng <kito.cheng@sifive.com>
Date: Wed, 16 Dec 2020 17:14:35 +0800
Message-ID: <CALLt3Thrw7pRGPgLa2upS6ZUa87H2UAKYMw-yyC2wkHEfF3Epw@mail.gmail.com>
Subject: Re: [RFC v2 15/15] target/riscv: rvb: support and turn on B-extension
 from command line
To: Frank Chang <frank.chang@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=kito.cheng@sifive.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 16 Dec 2020 08:20:23 -0500
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
Cc: qemu-riscv@nongnu.org, Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, qemu-devel@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair, Frank:

Should we add the bext_spec option like Vector-ext? I would suggest
adding one to align the behavior between V and B.
But I have no strong opinion for this.

>    DEFINE_PROP_STRING("vext_spec", RISCVCPU, cfg.vext_spec),

