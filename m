Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD2C310D1E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:23:56 +0100 (CET)
Received: from localhost ([::1]:38636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l82xf-0003TE-DT
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:23:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82pW-0001Ht-BS
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:15:34 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l82pO-0007Uv-Ph
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 10:15:30 -0500
Received: by mail-ed1-x52b.google.com with SMTP id g10so9222994eds.2
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 07:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C0N5wRX1RqfdF7COdMaCLRTf8+LHfPZCzG+oRbJK33w=;
 b=w4fHmI2bjzUIQrPV2Fv5vJFwofArX+ZfU5Vh1su2NQKTgWBvBqAi7cM8fP5ssYooQA
 nv3tZ5TXsX2jHzZRx/nEda1Sw+/RfAYzuwgloxeFIxWSBxdfvREFh9Dc738I+ORsZqko
 mrcsWunW6L+Eal98oop8OOTX/BpPCFj/tEHU6H+GtjoEpQSEgFyoGam7qrIuFy/Sjnwf
 EsPqseFTzMbegTOu+ohe2Ad8VUH8WCmmypx55EXyT/u5h2doubBXqgs4PvXLKkM16Pl3
 hSYhpL1FSMpC1AWBjCGZoR9O+mgGWSzDRxIGpGZWcs0DqNz7Mm6oGegBOOUbHalXDGKR
 XDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C0N5wRX1RqfdF7COdMaCLRTf8+LHfPZCzG+oRbJK33w=;
 b=AhRiZ4YiQ2QMJZVgTkLkHfrvHp2Co4dr28jiHj2B29mfrjxxSM2b1msQX08aGFk7qW
 h60Q4sYiLLZJ3PgNNLPDf5N6VVQ1ZKzgAmYWqHqo7AFXrvgoxScJdnQuUKTJJBXhZIoO
 8qjsDZjK05ZG+lI6TuIUTlipTlvpUa5XP26VQcwZv/qiF9cQGyt+9L1cq4A/+wx9TNND
 Ww9JclaWfs31p4A4T3NKyH4YYjK/EwTki1sJjh6+o6ilyhObZuynG51ZL+1iV2mKONN2
 QgWN4chuXueuaWmfpV+NhWX3ePnpGSTHIHGBRBxQa6sIcKSEziTJsRoQuzsBsesz2dQ1
 L48Q==
X-Gm-Message-State: AOAM531K4veNOccaiRmcrxPIdqCLEoich4trseZmHHv2BVzl4v/obTY9
 NOApzJjoFfTQj653fLGG6sU2FbRuXtDJLCFAHQkfTA==
X-Google-Smtp-Source: ABdhPJyvLIFwdFjftSHp1c73Pv0KmdwO4EdfDJ4DDqWv9Hng0ZByRL1eyJ8vJKclX+plVwITMLMWfsBxhCVpH8fNvoE=
X-Received: by 2002:a05:6402:3494:: with SMTP id
 v20mr4070337edc.146.1612538114744; 
 Fri, 05 Feb 2021 07:15:14 -0800 (PST)
MIME-Version: 1.0
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-5-f4bug@amsat.org>
 <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
In-Reply-To: <20210205150810.feuywlyy7xav56di@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Feb 2021 15:15:03 +0000
Message-ID: <CAFEAcA833bbrwZddoyTNbTP5AcNF5bWh_0U+dmej-nxk8Cwr6g@mail.gmail.com>
Subject: Re: [PATCH 4/9] tests/qtest/cdrom-test: Only allow the Virt machine
 under KVM
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Feb 2021 at 15:08, Andrew Jones <drjones@redhat.com> wrote:
>
> On Fri, Feb 05, 2021 at 03:43:40PM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Only the Virt and Versal machines are supported under KVM.
> > Restrict the other ones to TCG.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> >  tests/qtest/cdrom-test.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/qtest/cdrom-test.c b/tests/qtest/cdrom-test.c
> > index 5af944a5fb7..ac02f2bb4f1 100644
> > --- a/tests/qtest/cdrom-test.c
> > +++ b/tests/qtest/cdrom-test.c
> > @@ -222,9 +222,12 @@ int main(int argc, char **argv)
> >          add_cdrom_param_tests(mips64machines);
> >      } else if (g_str_equal(arch, "arm") || g_str_equal(arch, "aarch64"=
)) {
> >          const char *armmachines[] =3D {
> > +#ifdef CONFIG_TCG
> >              "realview-eb", "realview-eb-mpcore", "realview-pb-a8",
> >              "realview-pbx-a9", "versatileab", "versatilepb", "vexpress=
-a15",
> > -            "vexpress-a9", "virt", NULL
> > +            "vexpress-a9",
> > +#endif /* CONFIG_TCG */
> > +            "virt", NULL
> >          };
> >          add_cdrom_param_tests(armmachines);
> >      } else {
> > --
> > 2.26.2
> >
>
> Don't we need to use a runtime check for this? I'd guess we can
> build a QEMU that supports both KVM and TCG and then attempt to
> run this test with KVM, which would still try all these other
> machine types.

More generally, it would be nice to avoid hardcoding into the
tests what accelerators particular machines work with, because
then if we move a machine into or out of the "TCG-only" list
we now have multiple places to update. Ideally we should
be able to just change the main meson.build files and have
everything else cope.

-- PMM

