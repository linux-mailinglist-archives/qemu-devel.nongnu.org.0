Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866582D634F
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 18:19:55 +0100 (CET)
Received: from localhost ([::1]:53590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knPbe-0002VP-2D
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 12:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knPJe-0004JN-3V
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:01:21 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:40975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knPJK-0007go-VR
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 12:01:17 -0500
Received: by mail-ej1-x62a.google.com with SMTP id ce23so8310946ejb.8
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 09:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ve5Zhy6cHgBEjP0keEmb7hY2E+HvgpVJ820Sp+ZjZDg=;
 b=iKWb2ysPcxYkiIX9X99ubSf2e1YMOIPPGrEW5xh90usyxnoHQ84PoRV6V24CG5K1Mh
 7/HqICj264Qrea1Kf8Cc6xSWwoLqrcMJwhM1PTNrXbnr1jPKGi1TCHJmxxlMWJIounzK
 HgGlm6PGdNNP0HbFMfetJRO1V5VnDBYpcuzq7/VKqjytkpRFVuuUQS87DnAj/8sbho4f
 5SK2nNPqLQjAMD20s/edyPmm9JM4KDR0E8kvFOigrZlrCYDz3mosXz3NuhV6JPTP9sbj
 tkkcgio7yxMC5gLhSjQYxXge6HdLAu4uaMioK3kIg6xh945vrbaxpL3GfQ6nj5EnCvWO
 MHWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ve5Zhy6cHgBEjP0keEmb7hY2E+HvgpVJ820Sp+ZjZDg=;
 b=nXxHCLgs83kwNARk4Nd4N0eSXgPrm5E/NcY9PxxlvZZ5+UsGa9mOnns2vhvuCioWEt
 ZJfp5zDjlbANER72GvGMmAIObluZ558LsAmS5cjimdjiR74TrU+CzY4KOcSBxE0wVCvi
 jLJnZsPzRV3ACcXGB/BDP8BMD2Eso0BOr67+vnSm5Y025vKVwfUmDP7OkqrlMqPLn7kq
 KxunufEYAklCdlwlPvHlpLVeLDC0eajlfowPxIYvAJpq4C1r887+AunjiJKVZpBqIT7d
 B+DkfCidta6Fs6sQp/6SwVMNaJ/yXHPJ5REt5j8CmQhDEtO1aEHT8CVjTGT6Jj0iRlGb
 2l0A==
X-Gm-Message-State: AOAM530MZe1ms+/OetvJblk6anP4nNTZrePEqcOmnmVhiImM0Z23e5zR
 DhG9GliIiNj/VkkIA+8KfKpSwG3z120DQkOgzD7uhg==
X-Google-Smtp-Source: ABdhPJxEJqZYWAXhpZ+p2VviT2N8fmT1aa3VSH7D+ttX9gkJ32kj43QvW8t+buNx73vCvaa0M4cjx8zRGa9OfgPaRGo=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr7336278ejr.482.1607619655951; 
 Thu, 10 Dec 2020 09:00:55 -0800 (PST)
MIME-Version: 1.0
References: <20201210121913.531490-1-pbonzini@redhat.com>
In-Reply-To: <20201210121913.531490-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 17:00:44 +0000
Message-ID: <CAFEAcA9Vx1U25i_JwW2fLgWP88dAm62vDXTkLNWYdD2jWapMrA@mail.gmail.com>
Subject: Re: [PULL v2 000/113] First batch of misc (i386, kernel-doc, memory, 
 vl.c) changes for QEMU 6.0
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 13:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 5e7b204dbfae9a562fc73684986f936b97f63877:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-12-09 20:08:54 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to aeea99accef39f34dd1090c4aee86b7052076ce9:
>
>   scripts: kernel-doc: remove unnecessary change wrt Linux (2020-12-09 18:16:05 -0500)
>
> ----------------------------------------------------------------
> * Fix for NULL segments (Bin Meng)
> * Support for 32768 CPUs on x86 without IOMMU (David)
> * PDEP/PEXT fix and testcase (myself)
> * Remove bios_name and ram_size globals (myself)
> * qemu_init rationalization (myself)
> * Update kernel-doc (myself + upstream patches)
> * Propagate MemTxResult across DMA and PCI functions (Philippe)
> * Remove master/slave when applicable (Philippe)
> * WHPX support for in-kernel irqchip (Sunil)

Warning building test-i386-bmi2.c:

make[2]: Entering directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'
/home/petmay01/linaro/qemu-for-merges/tests/docker/docker.py --engine
auto cc --cc gcc -i qemu/fedora-i386-cross -s /hom
e/petmay01/linaro/qemu-for-merges --   -Wall -O0 -g
-fno-strict-aliasing -m32 /home/petmay01/linaro/qemu-for-merges/test
s/tcg/i386/test-i386-bmi2.c -o test-i386-bmi2  -static
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:
In function 'main':
/home/petmay01/linaro/qemu-for-merges/tests/tcg/i386/test-i386-bmi2.c:8:14:
warning: unused variable 'result64' [-Wunuse
d-variable]
    8 |     uint64_t result64;
      |              ^~~~~~~~
make[2]: Leaving directory
'/home/petmay01/linaro/qemu-for-merges/build/all-linux-static/tests/tcg/i386-linux-user'

thanks

-- PMM

