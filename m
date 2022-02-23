Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B67B4C1D0D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 21:21:30 +0100 (CET)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMy8d-0007HF-4S
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 15:21:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nMy4j-0002dG-Pa; Wed, 23 Feb 2022 15:17:25 -0500
Received: from [2607:f8b0:4864:20::c29] (port=41473
 helo=mail-oo1-xc29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dmiller423@gmail.com>)
 id 1nMy4e-0005GN-SF; Wed, 23 Feb 2022 15:17:25 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so190871oob.8; 
 Wed, 23 Feb 2022 12:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlhxO10mSA0qOoDndsglLbaBI6KUjztLXm2ilYI8WvA=;
 b=Hz2YeqC4KSLlghTW6b+lZPca2VuAQ6P1E9xEQwOZ4hfVXqbnoEtgiR+sjz4oMIw+Bk
 aqHhqo5j2Wq56Lc8Jf3VLl156OvFESB5/CCjqNlQWZf8miA2Uke2Bug4OBj4AK2SavoH
 sRiZTZKexCGoZuQLW9VDP7T3derTQ28+3jkvnHpuqjAXqcLcsbaHFPPHAMhOTiNvgEgP
 OXpQqOyKkWet4aJ6UFcJEaowhn3Cv2L6piz8O3+8J0IWHunasbK8EGSLm56RRFpjE70h
 WSJ0+5ORca6YkKEWIxHfPH1Hch+WaYXkt4C1AUNu9Upa0JHVaAoZwn1nAtw9GWn4AHj9
 5sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlhxO10mSA0qOoDndsglLbaBI6KUjztLXm2ilYI8WvA=;
 b=lx2EI6rUqmXErKTtfz33Du231KfzVEXYBoZ+tPDrqCWW7fxadECzGgB272+HpqIn5H
 kVYhjN2LSa9d/PPl+OQyuzSzQtYXPNJj1FUqYzjvsyNCbhh9dfpMfpVLbHkJ0PkZVtX+
 2oTj+IBFfar2ZawbCy3zFJPZw5FR1Xr3jGQEdqGsWISNp59gCiLZxMHErfa73e+Y/df/
 WUcxbH3idyakNUB039Z6KfZK5dyvySNy/Lfo5uvzqyc1qaOQzZbf7DL0VpPCN6/iywVx
 b72p6wO3YUQRE3+cyVlUS8U3EDhXDaic7aQZTEau8ky6g/UxCoZGCVtSYEOagsgpg9rk
 8jjA==
X-Gm-Message-State: AOAM5305xqbDltphylTVMmOTe2cPVXYZTtn43tePe6OA7PvQEHE7IRER
 qv9+6EK9XwG/oTUGPV3J3Ok4qEZW23rqDSVxGCU=
X-Google-Smtp-Source: ABdhPJx9YJtn8eqySxj+P81CB+DZlD/47ogMWAVdiuCFsTmigpeNqLLY+VJvNR7tfVuLrQ+sMKEf1+ebp1uaLvxIUgE=
X-Received: by 2002:a05:6870:d8b1:b0:ce:c0c9:5f7 with SMTP id
 dv49-20020a056870d8b100b000cec0c905f7mr4718718oab.73.1645647439094; Wed, 23
 Feb 2022 12:17:19 -0800 (PST)
MIME-Version: 1.0
References: <20220217231728.13932-1-dmiller423@gmail.com>
 <20220217231728.13932-4-dmiller423@gmail.com>
 <93ff22ad-ca20-e009-d8eb-12ca0ba63668@linaro.org>
In-Reply-To: <93ff22ad-ca20-e009-d8eb-12ca0ba63668@linaro.org>
From: David Miller <dmiller423@gmail.com>
Date: Wed, 23 Feb 2022 15:17:06 -0500
Message-ID: <CAEgyohWGrZBqETNV+ua-M2CVbEAbGXKEvXeRTpkdpXQEFkM36Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] tests/tcg/s390x: Tests for
 Miscellaneous-Instruction-Extensions Facility 3
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dmiller423@gmail.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: thuth@redhat.com, David Hildenbrand <david@redhat.com>,
 farman@linux.ibm.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> No test for popcnt, seeing as there's a bug in m3?

Originally popcnt was not in the task list, it was added later.

> You can't split these two asm, lest the ltgr and sel not be adjacent, and the flags not
> having the correct value when we arrive at the sel.

This was tested, both gcc and clang assemble multiple 'asm' statements
into a single block as long as there are no C statements between.
I'm happy to change it.

On Wed, Feb 23, 2022 at 2:45 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/17/22 13:17, David Miller wrote:
> > +#define F_PRO    asm ( \
> > +    "lg %%r2, %[a]\n"  \
> > +    "lg %%r3, %[b]\n"  \
> > +    "lg %%r0, %[c]\n"  \
> > +    "ltgr %%r0, %%r0"  \
> > +    : : [a] "m" (a),   \
> > +        [b] "m" (b),   \
> > +        [c] "m" (c)    \
> > +    : "r0", "r2", "r3", "r4")
> > +
> > +
> > +
> > +#define Fi3(S, ASM) uint64_t S(uint64_t a, uint64_t b, uint64_t c) \
> > +{ uint64_t res = 0; F_PRO ; ASM ; return res; }
> > +
> > +
> > +Fi3 (_selre,     asm("selre    %%r0, %%r3, %%r2\n" F_EPI))
> > +Fi3 (_selgrz,    asm("selgrz   %%r0, %%r3, %%r2\n" F_EPI))
> > +Fi3 (_selfhrnz,  asm("selfhrnz %%r0, %%r3, %%r2\n" F_EPI))
>
> You can't split these two asm, lest the ltgr and sel not be adjacent, and the flags not
> having the correct value when we arrive at the sel.
>
> No test for popcnt, seeing as there's a bug in m3?
>
>
> r~

