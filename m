Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2498B39A271
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 15:46:00 +0200 (CEST)
Received: from localhost ([::1]:46812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lonfb-0003Cf-5w
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 09:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1londx-0001eC-Vg
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:44:18 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:33313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1londv-0004lT-4d
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 09:44:17 -0400
Received: by mail-ej1-x633.google.com with SMTP id g20so9400796ejt.0
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TC9g0iqOC8p+XUTGJIRxU6GkLkBrQqgYQSILnB1qmXs=;
 b=xZheecLFPfhJ4eQ1vlTEgB/v/KKU6PS7H0c9+svK8TGu7bFIzrFXh2O8at4NzoN+uu
 xuoylt8snmPA0erI71yzuHX+1ajRhscQ+4i1xJ91wq1P4Hh+UpsVTQt7AR2KMWpg/lxu
 oXzDC5SHd4tytLOwuN8XJxpEle65VcRLFFxRuPrVPD3fWVor3rNO1SLLiyw8L9aWf/9o
 b+qc8Hibv+4USbQ98EE+D7JST1bNBmYRNET8N7JhYpmpRghAmUJlEN7A/5AUlm06Hosk
 3bvOpiphDbDi8sy2PW1qVBUA84UbRmG8ZK85MVtVLPqsTbS1cXwTRPdjtSz/PABVWR6X
 SHfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TC9g0iqOC8p+XUTGJIRxU6GkLkBrQqgYQSILnB1qmXs=;
 b=FBbewghAfSPUtjCcZLIqsia8zyJjU43r0LzuOC8r/fE0m30eSIPzDMcOIjSSkRi1Hm
 XyLvBEwxS8auZ+Gr9Qnfvm9qLmC2128uBJTxaEPD7glQ2scScH0OHLvAQHggbGlMOaf9
 /ZEqBOVWoMqf4ddIuTUafdRXB/nInbh0deUr6i6L/y9MQqkZbrAuLX4TZl8/t+55mB5v
 dtC7xXARdr8KQWPXIG36gO48L51Vjh53EopoRekRBfg0zKbcGiXTLOgZ44w2FpLywvP8
 q2Nj/RkTLxw64SqS90pCANlH/6s+4SykDgkyoGB/Ozbf9W/MqDCpuRiolEmaY8epKIAS
 5hew==
X-Gm-Message-State: AOAM532DBaABWkciFpivItumJayn1pMjbvUWLxVDfdwLI7VUJQwYdWC7
 5XL70KDmDT8Lc25u+1RkXOb92jxz8YmYmfvlawC2CA==
X-Google-Smtp-Source: ABdhPJxoAe+tMPgxSmi//jFJAUOd6buy4rmOdVOOAWhG4r0oaoEEfeLMuoeLSLglLsOK5zkm6KilXJuDd+OurYRnoOg=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr23484136ejm.85.1622727853018; 
 Thu, 03 Jun 2021 06:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-1-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 14:43:39 +0100
Message-ID: <CAFEAcA8qwTY7OZzZSCqD3CA_wsL9VJEFWkCSNAerQohM4VvMuQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/19] hvf: Implement Apple Silicon Support
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 19 May 2021 at 21:22, Alexander Graf <agraf@csgraf.de> wrote:
>
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
>
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
>
>   - Live migration / savevm
>   - gdbstub debugging (SP register)
>   - missing GICv3 support

> Alexander Graf (18):
>   hvf: Move assert_hvf_ok() into common directory
>   hvf: Move vcpu thread functions into common directory
>   hvf: Move cpu functions into common directory
>   hvf: Move hvf internal definitions into common header
>   hvf: Make hvf_set_phys_mem() static
>   hvf: Remove use of hv_uvaddr_t and hv_gpaddr_t
>   hvf: Split out common code on vcpu init and destroy
>   hvf: Use cpu_synchronize_state()
>   hvf: Make synchronize functions static
>   hvf: Remove hvf-accel-ops.h
>   hvf: Introduce hvf vcpu struct
>   hvf: Simplify post reset/init/loadvm hooks

I haven't had time to review the tail-end of this series yet,
I'm afraid, but these first 12 patches are clearly all OK, so
I'm going to put them into target-arm.next so that at least
that refactoring part is in master and won't go stale.

The last 7 patches are still on my todo list to review.

thanks
-- PMM

