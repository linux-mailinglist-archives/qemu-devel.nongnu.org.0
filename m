Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5245F60FF49
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 19:27:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo6cP-0008AW-Em; Thu, 27 Oct 2022 13:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo6cM-00089j-Ox
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:24:34 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo6cI-0008At-2I
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 13:24:34 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 m14-20020a17090a3f8e00b00212dab39bcdso7237546pjc.0
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kwfk3gz7PC13LMB2IWM5ktSZ8KPzYZNjFGpc+j9dang=;
 b=TOp+3teF/valMu22OFyHulMSXZwx2syQYPl2darOTgbqNBmlNFVbcV5zxq5sKJ7EFN
 9+uVVpiuwYE001Y8AIbUsnmINIXLbn2QnBV4hqCwdUH6TbUB+HTnl4laQ8FahVmN8BZy
 +Hv2RLCMuso1UAGaW4maUV/6iaMIzCUMnqjd6Ro5AfK5XYyR3G4wqwtslwY/cJAGVL4Q
 EJ2utOYUCeIhppScKbnmvHhKVa6D1CLhE+eED5OtJ655ogxpgqcgNWmxsyz3t8wB6GB0
 VKo1KPNieVgBJQJne2cLV37XSJ78w8JQ2MvtL/bB/zu4hc/7E2ybsxZf80BN3vqXpJJ/
 TGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kwfk3gz7PC13LMB2IWM5ktSZ8KPzYZNjFGpc+j9dang=;
 b=pPFv01+w5cVVNbSWk0eHLe6rZ80eQCgt8820G8EckYaqUIkfAhlG7vWIltXfbc1u7v
 EZPTL+6VovwoWmV3ZzNJ6ozJ5cG7Cn49cKf+YVxg5U6hoYZUIhVoyCWStkOH1jGrda5d
 V5K4IBP/sBmI7VzJCYqngVlG0/o9ssohCgu41ZMepfsGr19/P68Bn8ANHMgEbcr8V/gk
 Tw0aKeBkystjgxMZPOnSW89CaygdUyiJtIB/HGhy14rlosVKc4kdyf3n4AKEPK6u7DPS
 XHey506DnpGDyeBwJ/4u9Ba4rC+jJTPrRzqju000VjzXmzafioPScUdxQDOw72F8Vm3q
 KG6A==
X-Gm-Message-State: ACrzQf2zDD/+WiBuIrkK7VRP/CqADbPqY5pQVtZFo+GU0v94NQOsJEkE
 0VcLi4OLp+uaLn4EgOi4my3EVbuGA/gJECmJjSIQAg==
X-Google-Smtp-Source: AMsMyM7I9AsmV8XvX1JCWXghdrMnt2pIegOJgVYgnQ3w63ANiLIwLXIcwGlXVLUWLmJ6BLOagqeqXCPJDfmjSY2fyzU=
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr48734918pll.19.1666891468480; Thu, 27
 Oct 2022 10:24:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221025235006.7215-1-philmd@linaro.org>
 <87bkpxl4a1.fsf@pond.sub.org>
 <CAFEAcA_WefVz8fefKTVq8vkiOkdXhrXkcwj4G6bSZPaFoRTSMg@mail.gmail.com>
 <87r0ytjie3.fsf@pond.sub.org>
In-Reply-To: <87r0ytjie3.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Oct 2022 18:24:16 +0100
Message-ID: <CAFEAcA_-udYfzGNzfARvK1G2ZVKCP+_spEUKa3THroRQ+9SMMQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] target: Rename headers using .def extension to .h.inc
To: Markus Armbruster <armbru@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 27 Oct 2022 at 18:17, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 27 Oct 2022 at 15:40, Markus Armbruster <armbru@redhat.com> wrote:
> >> I wonder why we use any of .def, .h.inc, .inc.h, .c.inc, .inc.c.  Why
> >> not .h and call it a day?  No need to configure each and every editor to
> >> tread these as C code.
> >
> > It says "this isn't actually a header in the usual sense". That's
> > useful for automated scripted checks (eg we don't want
> > scripts/clean-header-guards.pl to add the standard #include header
> > guards to this sort of file) and for humans (if you see one of these
> > files included as part of the normal #include block at the top of
> > a .c file that's probably a mistake; if you see it being used then
> > you know there's likely multiple-inclusion shenanigans going on.)
>
> scripts/clean-header-guards.pl needs exclude patterns anyway.

Yes, in theory instead of having a systematic convention for
filenames we could instead give the files names that don't
let you easily distinguish them from plain old header files and
require every use like this to update clean-header-guards.pl,
but that seems to me to be clearly worse than maintaining the
filename convention that we already have.

> Comments would likely work better for humans than obscure naming
> conventions.
>
> Make them stylized, and they work for scripts, too.

We already have a stylized convention, it's the filename...
Comments inside the .inc file are also helpful, of course.

-- PMM

