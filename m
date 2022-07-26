Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0CC581187
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 13:00:06 +0200 (CEST)
Received: from localhost ([::1]:39648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGIIH-0007Sa-AX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 07:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGIFx-0005iB-VD
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:57:41 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:43867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGIFw-0006gm-AV
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 06:57:41 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id f73so24661353yba.10
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 03:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/kcizadk2qNKkqN5OBUsC4u4CW+u4nSCrQ3JwcPQAY=;
 b=hJ7OuyIkK31BYD9LfdOP4znTXKtUcgSoiOI//OH7MmQzE/A7C73CgyLT64khwmlB5f
 4XUJkMB+7xsdzwpJcYmAo7B8BA3KBjd0GLl0qvsvl5+d05I1cF3pQ4P6iQIQT3NYtAoS
 RmLGgEG3h6U0/oQsnCFcFMN7uNtzlN2Tq3o5oE6b8LOtLtZRDV1VOpxky9vU8xKkvNwT
 o4b+CPduJfVPhsuJEEx16WVmc3JIkQbac8Jy5qSS+XKHsguqwIcWHYWLqeuxeLp2c2Om
 WEQqC+E4M/PmlEWwUYaqgrsgOTXk7G1tcXTz8PI8rMyleiJMzSZ7KWjQmar6b8PEOFyJ
 IUkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/kcizadk2qNKkqN5OBUsC4u4CW+u4nSCrQ3JwcPQAY=;
 b=E/o2COsXL7QLLr9av3w8Oy+2DchVrPXXGkee6n35/RA1jqm6a06es0A1zpycqcJogI
 tIeHog3uw7aAENuvSGPFMdNo7uKSBW0v1RrwTyatmrPGGsnlPdrGfLUsTv5f9cbtXlVy
 TnMcOmFaQC2Hm/yMlQAhfC0jYdZOf94AC6OsKqfLzzWMJhQw0m0SSJ4FQebKUDraMGBs
 a3mrhHSHmiPHZut9mD+bgsFL+2lEAaBPLWgR0mddew/o3OYLicIMkNTus5lgSi3u1mlm
 H5DnxytklBBlYa4YdLuFlKuD+WLakRqCkH1LuBaubxL6mkAEVbq68hcgQR0jQ6Lu5c6P
 rJAg==
X-Gm-Message-State: AJIora87GRsCbeKsttVBdLo3WB1qBx1LbBd5UyZzBOLz1qCrZpG9Y2rS
 /PbmdfbNT802iPxLPXqa7RvDYbaJNLCK9SaM2c2eGlYRlKM=
X-Google-Smtp-Source: AGRyM1scXXtQ5MfTQ0F2qsdxP6X9mVPgenFmRcyDQDCGnfJvbPtCi/nCU37fF/526VEy/3IUP6H0HUFSiIWgEhkBEJU=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr690322ybg.85.1658833059056; Tue, 26 Jul
 2022 03:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <8F58FBA7-17C8-44F6-9798-A65FD63E0E78@livius.net>
 <BE36745B-A3A6-443A-A290-31A5578F36E3@livius.net>
 <CAFEAcA_BcnzQ1KnRh=ovKTSahHCabc61n+BHvedqjC0bD2fKOg@mail.gmail.com>
 <4B583095-ED34-4D33-A193-59666FBFAB8A@livius.net>
 <CAFEAcA8BJ+jphWCMNemBC30x+wf3PW2kqSqNz6pCHeD+RyBFeQ@mail.gmail.com>
 <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
In-Reply-To: <C1F087EA-B319-493F-B7BC-BB94D75B443C@livius.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 11:56:59 +0100
Message-ID: <CAFEAcA-Bmaj9YEwqJzvNZtBvKP_sAZNhszqeKeiwyB2=CwMPJA@mail.gmail.com>
Subject: Re: TARGET_SYS_HEAPINFO and Cortex-A15 memory map
To: Liviu Ionescu <ilg@livius.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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

On Mon, 25 Jul 2022 at 18:02, Liviu Ionescu <ilg@livius.net> wrote:
> > On 25 Jul 2022, at 19:02, Peter Maydell <peter.maydell@linaro.org> wrote:
> > The one where SYS_HEAPINFO produces the bogus result putting the
> > heap at 0x04000000, that you mentioned in the original report with
> > the command line
> >
> > .../qemu-system-arm "--machine" "virt" "--cpu" "cortex-a15"
> > "--nographic" "-d" "unimp,guest_errors" "--semihosting-config"
> > "enable=on,target=native,arg=sample-test,arg=one,arg=two" -s -S
>
> ah, the bogus one... that's a bit more complicated, since it happened in the early tests, and I don't remember how I did it, it might be that I tried to load my code in flash and my data in ram, but I'm not sure.
>
> try to check the logic and avoid the cases when flash addresses are returned for heap, if possible.

I've looked at the code, and done some stepping about in the debugger,
and as far as I can tell it should never be possible for the heap
to be returned as being in flash memory: the flash device MemoryRegions
are created with 'mr->ram' false, and the code in common_semi_find_bases()
ignores regions where mr->ram is false.

Clearly something is going wrong with your test binary, but it's
not the straightforward "we weren't ignoring the flash memory blocks"
that I thought it was, and so without a reproducible test case I
can't really do anything more with this :-(

If you're able to figure out what your original failing binary
setup was and repro the problem again, please send me the executable.

thanks
-- PMM

