Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5850C415085
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:36:34 +0200 (CEST)
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT82j-0005wq-6t
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT7yd-00039k-AA
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:32:20 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:40892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mT7yb-0000FI-JF
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:32:18 -0400
Received: by mail-oi1-f173.google.com with SMTP id t189so6102885oie.7
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 12:32:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=S0npY/y+2Jf40Ni1/32S0HMSFMwwLOrJj8knzJGkt7Q=;
 b=qu+e9T1U802h6l6f6upSBVMTHMCHF6c0ELkhk5/TDOxomZBromWhldZT84cEh9yL0a
 FHPkTvxKgX05glTcSAvJ4grOCYLIXrRO1zSXTgeBN1zeWL34SmGA9/NiIh1KTNpulwQu
 YKmjjqmUUhd+P/kg1+oCtx2OnUqJOc5WFcZcs+vclgHsyfv1jRcdUKyLtjo32nwMbuQ2
 ARHfXdMEFDoI/aWl9XrkZAu1EE8Bja2KGnl2JiXzdt+3/3a65PF95XR6MHAJFuNPCWaa
 zrtsyS81MRnxRDa1GpSlBcDR/+o5swZFpwpkvr//BTEvlsYfXjIbNu2Ix0QpSQJ+kZAe
 ZEIQ==
X-Gm-Message-State: AOAM531NkmcO1RQ0nD2XtkFVsll3EyGkPvmfKll2l7vmXaFThRffli+V
 kVN9Z7q2RTsWkVHndXJgWAbK2jfXcCV5chgJn9s=
X-Google-Smtp-Source: ABdhPJwyewYa9A1j9WBgRPzjLQtR6/dUJxomD+Cnd/W0Q/j2oV++6woLvjwGBELcq6WXUUEjL5pZnaz1wbZiP/RWwS0=
X-Received: by 2002:a05:6808:179b:: with SMTP id
 bg27mr9615433oib.46.1632339136424; 
 Wed, 22 Sep 2021 12:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-5-git@xen0n.name>
 <c3bb4d03-62bb-5b5e-caa4-7c8a90059eac@amsat.org>
 <47989395-3dbe-ef72-4037-a23fcb5cd15a@xen0n.name>
In-Reply-To: <47989395-3dbe-ef72-4037-a23fcb5cd15a@xen0n.name>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 22 Sep 2021 21:32:05 +0200
Message-ID: <CAAdtpL5m_CwVT=OKd0Ei4w8Y1Pbr-C6ku8LDzP2cVHpNsLWjDg@mail.gmail.com>
Subject: Re: [PATCH v3 04/30] tcg/loongarch64: Add generated instruction
 opcodes and encoding helpers
To: WANG Xuerui <i.qemu@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.173;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Sep 22, 2021 at 8:51 PM WANG Xuerui <i.qemu@xen0n.name> wrote:
>
> Hi Philippe,
>
> On 9/23/21 02:37, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 9/22/21 20:09, WANG Xuerui wrote:
> >> <snip>
> >
> > The generated code ...
> >
> >> <snip>
> >
> > ... ends here, right? ...
> >
> >> <snip>
> >
> > ... or are these helpers also generated?
>
> I actively hate writing these by hand, so of course the whole file is
> auto-generated with some quick Go scripting in that repo. Even including
> auto-formatting with clang-format so I could directly pipe the output
> into this file...

Awesome then :) Maybe add /* End of generated code */ comment at the
end to make it obvious?

