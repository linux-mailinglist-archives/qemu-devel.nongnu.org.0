Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D622B329DA0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:04:33 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3lQ-0002CX-Sp
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:04:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3jw-00010L-2f
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:03:00 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:44310)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3jr-00066P-Nf
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:02:59 -0500
Received: by mail-ej1-x630.google.com with SMTP id w1so34764757ejf.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 04:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dzga9ZtszM9JYMFYF+h4tzLmJp9+6GVf4JiGpJtsQPk=;
 b=c2MJ1hJz/QeF4K+f3gPRYgYn8hohGd7J5oeTyiX5TTHuQIKfBsEU5r8O0eXy/HYJXU
 679lqyWngML5OI/jXsA1FEWA2f5L9ltBI57kJDvlCH0WhdHGrbS+2SpNRWCbkUf1YldK
 LuaZv3IlVEf5vIKMzHIlMHcA1a8nOL3hpInBP1Vr1+zDtVaoFGvKGTUT5DU3SdtA7wHl
 fdfDzBqhy93fEIycS/S7nAyUb39Koxe+mpH2sXHPA/mUnPWYZq5qQL1Fs/4jHomrXagT
 XOgT3ODihaMX+int0DhB1wASErNjs/RWjaONrtWTRsj0R35s8VOZVZ1EuxYJvCi/C9Rh
 fgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dzga9ZtszM9JYMFYF+h4tzLmJp9+6GVf4JiGpJtsQPk=;
 b=ViUHkajAAm9+fmoei3GlVOTFVHMh296mE9ThCNoZ5hFd2G28rrOo0Agfz96KlQX9d0
 qJzDyX2oehJ2CxIJxTs8mZDUT7rDvnLSwLaXjhcUT5tcsitNU2N0xwjSZ0Z/rnm2zzgc
 SZx5dLH+44Nk1S46FypbqWFf14+01sSyezWl/GNS+no9PGxsslXxjPUo0SYIlmazhuwJ
 ldJ/4I5uqLXcWmdOMCdpnM0rByCpnqIIEJJ1rgO83GYWuAbzp3QtVAYMp8CeJ4pN62rE
 VK/AUGayJ06py0ki2iTh1H1MtFGEMV02t74GlBGW5kdS9EHcmBFgk8v7Zg4L//vtANZy
 WhnA==
X-Gm-Message-State: AOAM531XSfcNMktGvgmkZFymjdmgEVwcSwZdzDPcTTkRylqPcIw6EbUZ
 dPqRhyCBYur10oN85PHXPAylSSn1uNfsHCFNUAfvSQ==
X-Google-Smtp-Source: ABdhPJyEe5BcjMrhzQ7+lETiwd++j5TXzWGG+E0/D5xAISyu9outg8rHNuTkovt99NIUfJW04YPRGMLZvoV7BhOTMJQ=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr2775804ejb.56.1614686574142; 
 Tue, 02 Mar 2021 04:02:54 -0800 (PST)
MIME-Version: 1.0
References: <7360ab6a-0613-8300-ef8d-b0c641fbaed1@suse.de>
In-Reply-To: <7360ab6a-0613-8300-ef8d-b0c641fbaed1@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Mar 2021 12:02:39 +0000
Message-ID: <CAFEAcA9V9vtCeH9=PWdsab7iFA1YxdgB2F6ocLP0COjjP39YVQ@mail.gmail.com>
Subject: Re: target/arm: "define_arm_cp_regs" and similar for KVM
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 26 Feb 2021 at 17:27, Claudio Fontana <cfontana@suse.de> wrote:
>
> Hi Peter,
>
> I am trying to find out how to split properly KVM and TCG in target/arm, among other things.
>
> I skipped or stubbed all define_arm_cp_regs and similar functions,
>
> and made a cpregs module that is TCG-only.
>
> Thought it is fine, as we have a kvm_arm_init_cpreg_list that throws away everything TCG-related anyway later:
>
> target/arm/kvm.c:
>
> /* Initialize the ARMCPU cpreg list according to the kernel's
>  * definition of what CPU registers it knows about (and throw away
>  * the previous TCG-created cpreg list).
>  */
> int kvm_arm_init_cpreg_list(ARMCPU *cpu)

It throws away the cpreg *list*, but not the cpreg hash table.
That is, we trust KVM for "what sysregs exist and need to be migrated"
but we still
use the hashtable to find out what QEMU thinks about them and where it stores
them in the CPU state structure if it knows about them. So you still
need to keep the
define_arm_cp_regs stuff to register sysregs. Not doing so will break
any bits of the
code which rely on being able to do "synchronize kernel's idea of
sysreg state to
QEMU" and then "read the register value out of the CPU state struct". It'll also
break visibility of sysregs in the gdbstub.

thanks
-- PMM

