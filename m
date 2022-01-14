Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A8848E8A7
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 11:55:33 +0100 (CET)
Received: from localhost ([::1]:33340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KF2-0001BK-D8
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 05:55:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8K21-0001eG-04
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:05 -0500
Received: from [2a00:1450:4864:20::331] (port=44545
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n8K1z-0008CW-3N
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 05:42:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so5376154wmf.3
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 02:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dtt5vkuk64SUnnIs9/zeBgnqYywvysvnTay8RmFCubw=;
 b=T4x8pNJZ2ueEGPDnvhaUQs3oEQ56CHA6J1ciX+gq8JgAJuE8wvGmx1cwzDoQWRuX+A
 hAm6gUdaz7WDZiQbpr5CMMDrE/HciExfW0pX81WnY5FrXAbI+8aUBEnoiAZdCvPRPuTc
 OvBQQjpfPx5aLHhf4rC5+6yoGceBcpwa+Jqzz+5WxIcWb45BTq80JOqgk9s8RCWLJ68p
 Y3ICgemONVLpzUQudXIqpfmrlg4hzJk9CiG9KEeITjjqg/ctilqeKZK1vz9ba1rZOECj
 bnjr/XZwU1GcMs9+VZqU3qI7NGxDv2NER1Q7ZDT1dH0MAEl/gV+N6SiGkZ0bEB1EX7XN
 TmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dtt5vkuk64SUnnIs9/zeBgnqYywvysvnTay8RmFCubw=;
 b=5brgHZl5taE1VJ1R42Qfk2sc/Uie6vTEKX92mmCbkBUq8j5eCnEuBE9Zz37Fchy+hy
 w4GPqfiHPfLdahsmuEXOhdmnDLPyAMu/oGlK6tvAKEEa4PPbwirNe51ExaUt0DUT+LAd
 XsTwPTNZCrxzcDEW2/+A5LIYYvFOHQCOMZEjP3mYuTDGP4tN4G1/GSr1cZ+a2svC8xlB
 J/Y4C5WLgxORW5dv5mFyIeKX0G2MgF6ezbyXyh4dovTtShHkI1IWhsLToEQ6loWcyMOf
 Yz2QB1NEYFyTHlylAUWTdD8HtnLFMqm16WirvGYdFxhSCCnXDkQQjMHmQ3oBu/joYegy
 3a+g==
X-Gm-Message-State: AOAM530T+94mgHugYy+tGfHXQC9qRkiLlTvW+WWXcLYtdPc5PxAZxa85
 rIsi/r2SRusu640TsTjrPhdeJS6N9VsOLYLMzIWnTQ==
X-Google-Smtp-Source: ABdhPJyiGGd830Zxv4WqwPmRo6hWBQ/T4SzIpv9fC9F1xLt2/lXENAOabXL6YS4l1YLMaS0b7Xu1It5is7PdW+j34RI=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr7801964wmh.133.1642156915046; 
 Fri, 14 Jan 2022 02:41:55 -0800 (PST)
MIME-Version: 1.0
References: <CAARzgwx6YtzANV1z24bCmnDiu3bEsX1SSiJ8HjZbmryA2N2Uyg@mail.gmail.com>
In-Reply-To: <CAARzgwx6YtzANV1z24bCmnDiu3bEsX1SSiJ8HjZbmryA2N2Uyg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Jan 2022 10:41:44 +0000
Message-ID: <CAFEAcA9-vmMY2347xq7h-gp2WWO+7SZjPy2j55AjEaKGddxF9w@mail.gmail.com>
Subject: Re: Re max ISA serial ports
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Jan 2022 at 10:31, Ani Sinha <ani@anisinha.ca> wrote:
>
> I have a question re the following commit :
>
> commit def337ffda34d331404bd7f1a42726b71500df22
> Author: Peter Maydell <peter.maydell@linaro.org>
> Date:   Fri Apr 20 15:52:46 2018 +0100
>
>     serial-isa: Use MAX_ISA_SERIAL_PORTS instead of MAX_SERIAL_PORTS
>
>
> Does this mean that this limit of 4 slots qemu / hypervisor specific
> or is it limited in general by hardware across all hypervisor?
> Can you please clarify?

This commit was part of a series which removed the previous
compile time limit on the number of serial ports. (The later
6af2692e86f9fdfb3 and b8846a4d6352b2 remove that limit.)
For some hardware, like the ISA serial port, there is still a
compile time limit because we are emulating real hardware
which had a fixed limit, so there's no point in making QEMU's
code for that device capable of handling any number of ports.
(As the commit message says, the limit in this case is
imposed because there are fixed IO port and IRQ settings for
ISA serial ports.) Commit def337ffda3 is just disentangling
the old generic compile-time limit MAX_SERIAL_PORTS from the
new specific-to-this-device compile-time limit MAX_ISA_SERIAL_PORTS
so that the later commit 6af2692e86f9fdfb3 can delete
MAX_SERIAL_PORTS entirely.

Summary: QEMU (and KVM etc) have no limit on the number
of serial ports. Some specific device emulation does,
usually where the real device it's emulating is similarly
limited.

-- PMM

