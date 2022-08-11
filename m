Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C188D590578
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 19:13:55 +0200 (CEST)
Received: from localhost ([::1]:37408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMBko-0005b0-Lh
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 13:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBiM-0003lw-Jh
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:11:22 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:35519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBiK-0000Cy-WD
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 13:11:22 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-32269d60830so179449587b3.2
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 10:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=5Nf0rU0OpsHl056S1h+tq4hZ2Zm/hn/hNmbHuIjPS8o=;
 b=py18k4cxcMdc4To2+rwwTiQgE0UeoPEfWCcZG3AluknRDBcziWanyL1lxV3SC1YHrL
 xmxwMLCIuZdX4OCEPbnpUJHQTpop4Q6UgDENxk39fmmUCRTJRiz/zUyD4sYWFiGFaoPY
 4JwVyoKSju8LdayzDX06PlflqBuJMUCOjr2WNv96UKrn+TGW/OpxHRMLkpHe8ub07SLg
 CrlVIuKqktiKtLHhjR2hkv3MxLNo7i2V81xdb5tgyrskpSoVSblxYhVKZPsMsJaQNqkK
 SxeW2hB1PPrgqErsS+W7Py8qWTaxFcSANpem80wUU4hIea8NceSddAJK8dGNfyq8ufxr
 algQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=5Nf0rU0OpsHl056S1h+tq4hZ2Zm/hn/hNmbHuIjPS8o=;
 b=zBDmrDgvOm1/qiFmZYXKJCpENAaZKcQHg0HpyXC3b6pc4umu8Kn/9u4unNkES7OFzB
 EJDn55NRYG3/vemUwyJe/IsOLWgBe9Ulxo18gURAcdhzZ8+GniSSQRZ1qKY42vW+mG0h
 YE6Ev5HaZXyRP6P4t6OLOffHmY9eDXRDEmmFwTEr94XwftbfBPUCAWk/GmGcpCfn5/0j
 7rber7FwWOQ65W71PQuIqKqSqXQoLFoIt0fnBrsLCWruCe9ZHRn0POmkXkn1xE3S8E5S
 9tTGevA/CZdINFH1miwnzduGkbFrUzx7gAdGvXhFqi53Y9s0nVK8iHRiRhuYdmkOwHFE
 PG3Q==
X-Gm-Message-State: ACgBeo3LkFejdZiyyT563nBgG6EFKXEtCNSS6JPvEEE0oFAXbz74i+LI
 QMgukUPO+iX7QLvzeWUMgsxkNMc7Sux2Umg3owlVMw==
X-Google-Smtp-Source: AA6agR7LjCEn82EiTQHunWLiDFvJA8Ljn5aKkDSTT+80lG5T5v8tNy3SePERxfAtkEjsQj+EMdndzmGhcQwcuJvHFnk=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr165640ywb.257.1660237877377; Thu, 11 Aug
 2022 10:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
In-Reply-To: <56c2f192-c897-85bf-9f1a-377eff8d575e@freepascal.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 18:11:06 +0100
Message-ID: <CAFEAcA-0wkYiDgs7DOpnMuwVw=z=H_440Yyrfaa9_V-YRyoU-w@mail.gmail.com>
Subject: Re: [RFC] Testing 7.1.0-rc2, qemu-ppc does not give valid disassembly
To: Pierre Muller <pierre@freepascal.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Aug 2022 at 14:35, Pierre Muller <pierre@freepascal.org> wrote:
>    I don't know if this is the right place to submit this report,
> but I have a problem with my attempt to check the 7.1.0 release candidate
> for linux user powerpc CPU.
>
>    I am testing a simple executable, compiled with Free Pacal compiler,
> but also linked to libc.
>
> This is what I obtain with the new rc:
>
> ~/gnu/qemu/build-qemu-7.1.0-rc1/qemu-ppc -L ~/sys-root/powerpc-linux -d i=
n_asm tprintf
> ----------------
> IN: _start
> 0x3ffda784:
> OBJD-T: 7c230b78388000003821fff0908100004bfe756d

This is because you don't have the libcapstone development package
installed on your host system.

>    I did find that this is related to the fact that
> upon configuration, meson finds no capstone library,
> while disassembly of powerpc CPU has been moved to use of
> capstone in this commit:

The other relevant commit here is

commit 83602083b4ada6ceb86bfb327e83556ebab120fc
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon May 16 16:58:23 2022 +0200

    capstone: Remove the capstone submodule

    Now that we allow compiling with Capstone v3.0.5 again, all our support=
ed
    build hosts should provide at least this version of the disassembler
    library, so we do not need to ship this as a submodule anymore.

> Even when trying to compile the git checkout,
> which contains capstone as a sub-module, in capstone sub-directory,
> I always get capstone support set to NO by meson configuration.

If your git checkout still has a capstone subdirectory this
is an old leftover from a checkout that predated 83602083b4ada.
('git status' will tell you this, and a suitable 'git clean'
command will get rid of it for you.)

> Why doesn't it use the sub-module if pkg-config says that there
> is not system capstone library installed?

Because we now can rely on all our supported host distributions
being modern enough to ship libcapstone, and we don't need to
cart around a submodule any more (which reduces our maintenance
burden). As C=C3=A9dric suggests, you can pass '--enable-capstone'
to configure if you would like configure to fail if it can't
find the system libcapstone, rather than falling back to the
binary-blob disassembler.

thanks
-- PMM

