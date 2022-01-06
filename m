Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9118C48671A
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 16:53:42 +0100 (CET)
Received: from localhost ([::1]:49632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5V5B-0003rO-Ns
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 10:53:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5V48-0003BB-JK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:52:36 -0500
Received: from [2a00:1450:4864:20::332] (port=45019
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5V47-0007K8-1n
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 10:52:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso1418699wmf.3
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 07:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=yc+1jc9eP79u9C7UZKZulPm69BFdO/NOzLfj47RdBhc=;
 b=wX0Q1yhFoGCM+fLF3tOyU21Gm3r9MvcQqSL6VKgWbWDzc72lr3vCScWizS3kXnEGN5
 yToXzPiwNYgi77QxpUPB2SMREtd5hTCkF2GsFHSWpbs0/SNeTarravSwHQme032nOmRo
 kjE/h5k9x7S2ouFWmduTeqkJglZ8FbRmhoAVDSXKrdRjR3/x9ZAnzzJuv9EAOaPSPJhe
 Mf+Rt1l5quO07cn4pucR0iOPjpWDPweeEQTYOiDaN7OAKsLfW83eUb96YkPbss5pPrcA
 a67jAWHt8u3vyC0o8bsRCeZAag4DYICg8Ih3Dvljb5zl0XEb15edXtstaZCNclDGI1f4
 iYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=yc+1jc9eP79u9C7UZKZulPm69BFdO/NOzLfj47RdBhc=;
 b=KxMP9k+RQ5QtZtq+Lx/Gz2JU6ljpaP3COdVVMqRaDVLvyPliSEyc86EZwFepPYrX+h
 wgLfKMPWvjwcRk8qcbeclaf9XiJL7M91sFJC2/2m4eAgrcemuO/sDQuhtxUPqYtRYawJ
 kOTW3Wr872jvovBmmoU+8TK9C5KOj/bJGZpNbQjSh9IZqE/g8cypDLmmn2yNdvOVO+r0
 ciP1t+UxFam8WYPttzuhRdgO/LPyWueFoPTHxXBD6JgTVtp/vBTyOvrFVJgzteupZfeq
 P7ReDCXN96jjeLbnQEzrxr28TlkgOUhgsxmNV1C0gxf0vsUduU8wt7bXWQNANZB2/QM9
 qY6w==
X-Gm-Message-State: AOAM5322rsFuxE9zuvRQc/U59j+GD8gAIFo/gQP3++nk9F+3KCvpJC6O
 Yj5dRwFc64Pv2JtDOQ2W7gj7/KTVK66AvK+FUT1gCg==
X-Google-Smtp-Source: ABdhPJx2y+0i6NkKc3Edtg+geloSAl8iFIiLZx4GkBv6hB0580SH2n7sFkJab1sTfuVbaAIC8Ot3lQ/KiHMzYQa7jPw=
X-Received: by 2002:a05:600c:154e:: with SMTP id
 f14mr7926709wmg.126.1641484353551; 
 Thu, 06 Jan 2022 07:52:33 -0800 (PST)
MIME-Version: 1.0
References: <87czl6jb79.fsf@linaro.org>
 <fbc66bb0-2c15-d789-bbaa-f9c3ba6f81e4@amsat.org>
 <87r19lj3l3.fsf@linaro.org>
 <CAFEAcA9XX26RHmNM59Zc13dwvhv83bAnomLp7Yj45Wmf16W66w@mail.gmail.com>
 <87iluxhrdc.fsf@linaro.org>
 <CAFEAcA_yg=FVCadEa7BBaudvyoZ+VgAppG5cT=T4MoKmYhGaQA@mail.gmail.com>
 <87a6g8j2af.fsf@linaro.org>
In-Reply-To: <87a6g8j2af.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 15:52:22 +0000
Message-ID: <CAFEAcA_gEM8aA3KzSxKZWG3Y8-z__5UrjiRVjW26EcLZr0ypWg@mail.gmail.com>
Subject: Re: Trying to understand QOM object creation and property linking
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 at 15:45, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Yeah, that trick only works for the real CPU object, not for
> > passing to SoC or SoC-like objects.
>
> Hmm I wonder if I should be instantiating the underlying CPU object?
> AIUI the cores are cortex-m0+ so I assume that comes with the gic/irq
> wiring up that armv7m does?

M-profile's a funny special case -- you do always need to create
the armv7m object, which wires up the NVIC and CPU objects together.

-- PMM

