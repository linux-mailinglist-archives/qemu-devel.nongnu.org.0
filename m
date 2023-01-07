Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A77660F05
	for <lists+qemu-devel@lfdr.de>; Sat,  7 Jan 2023 14:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pE92X-0003Qy-0Y; Sat, 07 Jan 2023 08:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pE92J-0003Qj-1T
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:14:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pE92D-00025r-Cn
 for qemu-devel@nongnu.org; Sat, 07 Jan 2023 08:14:57 -0500
Received: by mail-pj1-x1036.google.com with SMTP id bj3so986097pjb.0
 for <qemu-devel@nongnu.org>; Sat, 07 Jan 2023 05:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=U1X8bKwTkS3a+k7kQCEoqx8ZZ+aLcJU48EU0FOjlcrg=;
 b=D8MZsnZaoLh6SZZXQsvvW8XqApMKALnp5tMT9Ee5oxUwrqix6xLLcxhi1z2rFVnTH2
 uEC8IKcMTXbOlqplKytn9g60Ax2pESf1ET41XUFy+tZCahACwGNjgxWNgiNIXAJIbvYm
 b+JVV+4hSighUWS+aT8fjgfvtdbkqlllYJuHullbZ34dG7QeOOa7qp242iyPxrG9orHW
 0CmnTlY5aTErIbcqqNCC2F34o5dQmh/1TcmiLYjI2c+KuVce21vNQ7RNjSRzIBNFXZq6
 R9SIB85AEeOzInm8zdg/UKoWLLMC4FoKFevW5w1q/8jV54sKpd0KQAbfkKqJXyiQTpSl
 EWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U1X8bKwTkS3a+k7kQCEoqx8ZZ+aLcJU48EU0FOjlcrg=;
 b=V1b+yEIQrGrDuJWHv9OdwLxvDY3gv1nHM8S8Loe8/K2rHE2kAVXHrzWnqI04NXMjxP
 Xt3xak0RXrV+kv8qzdUSwFJrAqZaEDkhSAa9pvu4emIMNBKdTDqDmvLKr5GtYKCEOg/p
 h/bqXaxUcsFyUL+FcHWlcjrH0ZMKTOUnQQtnXE9H4mzazvgydptcOdtsMe4mMVPUaRMv
 rfEOS9mCKox7ws8TiRQpxEB22WrJK0u4BuvprFC7O0RPI8E35CjYoGgUQUVzj/Z5QSOJ
 tIAF+p7+ah3ACs8Z2zokexp4OQuX7kN/4CbnBZyjhXdMlJyDfAHL/ufqUy+tfDGdZWq9
 lfYg==
X-Gm-Message-State: AFqh2krIS2Ct2icL3MOSUBBHs51CtSJDy+duFtvdwzFqP0wk7T1tsdJz
 rjUkzji9TykLov2eU0CG0U24DXI0iS+CrtZHJoR3mw==
X-Google-Smtp-Source: AMrXdXupL4Z7zjXWTmxAYcdNHGJCgD6K/RfBz2OhOlc2hen2RAiREY7ovhI4ZrQJWykgmrKC+0Fp8xhVu28Jj6jqTAA=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr1059178plb.19.1673097291030; Sat, 07
 Jan 2023 05:14:51 -0800 (PST)
MIME-Version: 1.0
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <CAFEAcA8K=1CNZfDG8i3bSXXSWT7D2oWg4jyupwYmw8oR7MJVsQ@mail.gmail.com>
 <9f9a6c22-315b-de1e-958e-89963c5e7e90@linaro.org>
 <CAFEAcA8cxJFpB9V826DjSsFOy7VYh5TWXb4vRYDUeOMjQgk-eQ@mail.gmail.com>
 <b3dd666e-582b-e9d4-6dee-364b9dd6d00c@linaro.org>
In-Reply-To: <b3dd666e-582b-e9d4-6dee-364b9dd6d00c@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 7 Jan 2023 13:14:39 +0000
Message-ID: <CAFEAcA-WChgHcT==Nt+CkKb-Y45QFmPFiBT2MKkdBFr8Rkwv3w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/40] Toward class init of cpu features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, berrange@redhat.com, 
 eduardo@habkost.net, armbru@redhat.com, ajones@ventanamicro.com, 
 alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Fri, 6 Jan 2023 at 22:28, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/6/23 13:59, Peter Maydell wrote:
> > We also set some properties in code -- eg aspeed_ast2600.c clears
> > the 'neon' property on its CPUs, lots of the boards clear
> > has_el3 and has_el2, etc.
>
> Yes indeed, but in all of those cases we want all of the cpus to act identically.  Those
> are all easily handled (patches 35, 36, 38).

That's just a happenstance of how the boards create them.
There's no inherent reason that every CPU of a particular
type in the system has to have identical properties.

> > I hadn't got as far as patch 29, but
> > looking at it now that looks like a pretty strong indication
> > that this is the wrong way to go. It creates 3 extra
> > cortex-m33 CPU classes, and if we find another thing that
> > ought to be a CPU property then we'll be up to 8;
>
> If we find another thing that needs to be different between cpus, you mean?

Yes. But conceptually we already have lots of those, we just
happen not to be using them right this instant.

> > I think our object model pretty strongly wants "create object;
> > set properties on it that only affect this object you created;
> > realize it", and having one particular subset of objects that
> > doesn't work the same way is going to be very confusing.
>
> Eh, I didn't think it's particularly confusing as a concept.
> The code is rough, buy what one might expect from an RFC.
>
> We really ought to have *some* solution to not repeating property + feature + isar
> interpretation on a per-cpu basis.  I'd be delighted to hear alternatives.

Hash "cpu type plus property settings plus ID registers",
and look them up to see if we've already created the
cpregs hashtable for an existing CPU?

-- PMM

