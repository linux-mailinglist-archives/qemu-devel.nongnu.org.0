Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEC8329E12
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 13:12:52 +0100 (CET)
Received: from localhost ([::1]:46778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH3tT-0006vi-Vv
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 07:12:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3sA-0005o4-Jp
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:11:30 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:38178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lH3s8-0007XD-RO
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 07:11:30 -0500
Received: by mail-ej1-x631.google.com with SMTP id mj10so14701714ejb.5
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 04:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qO0hhibHe0XgOUSR0Mvj/SYwbrY3uPIW00eaJ3XOccc=;
 b=nO6yytZmDAYwZej+vZjVIEM0yYT6MVdK02vNbQoskrkuJOJ0R+p7/jo94Ln93U/CA6
 Muq3Y1FcvXhCCAJ/v+VLw2LeCcwAEowJzolRQL3G9wepKu53E5Pwj6FXuJJH3oPThmwP
 5/sByzt4u6fN5qobnSSgIs8VGEns7DSGL3kgGyIPH+8zev45LLc4g2NawjwkvpGMBBgN
 X2CKxfPCaCy3dgNj58AAGtQqp53V2eHNvYaL9M+8KL+YPPSrmj1w2OLHMryHeTDxYKJ5
 4v3CBxMpgQNL/k5C1qs2mLcPFj7WQCyzPM3YF5W7zS7BGGdTYA2MFZgHUOEpAyRleBAT
 kvfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qO0hhibHe0XgOUSR0Mvj/SYwbrY3uPIW00eaJ3XOccc=;
 b=XYPScABnRvsb1xVq/pMsZI2pnUwGZ5wvobrPInlHN6RN1FZTZdbQ/ObjQ8SiQoqxsq
 IgIOamij/09fSw8WoO9ubchrbp/N1aPlXI1bzi72+VeGNz7epSSbtUyE3ImhU7x9SaSs
 1nr5vtvoLrjyUszbCza2G4Lg5gXhY5Qc5DUPJHs9Du4wVMhNcB9zrVdXeadlrIbCWtm/
 Y7byKI4kMKliyN5AZm7IdwIJwPuR0X+j3VpVMmKSb1yLFvnkgDSP5aAy2ORSokrjxqIr
 zarYzT5lnRzLL5dMsxbwi8Lwlw2MV+pVaQ2cMVd2sBNScIhPiOFNAdcGbCKh7eVKIuDy
 7yPA==
X-Gm-Message-State: AOAM533b7anEfv4eu+GkCxFkrSsNFe/zUmm8p4itdoDiVOaKXIWo/45A
 NI4+hoA3++QBfhCAHpJ2XGZNU/R/aV5cFksFQE/qLQ==
X-Google-Smtp-Source: ABdhPJzfY2+T8zDttvXz27nFNw+Bz0l2ExgcC/dtFINe9Dldu4ueYlu/ClnSwQQnc0EV83eiYHqeWk82+pPVunRz27U=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr254498ejg.482.1614687083975; 
 Tue, 02 Mar 2021 04:11:23 -0800 (PST)
MIME-Version: 1.0
References: <20210301164936.19446-1-cfontana@suse.de>
 <20210301164936.19446-20-cfontana@suse.de>
 <3c8622f8-cf47-2819-c351-8051c2725155@linaro.org>
 <564ba572-b323-eca4-4cf6-c2c466f7f795@suse.de>
In-Reply-To: <564ba572-b323-eca4-4cf6-c2c466f7f795@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Mar 2021 12:11:09 +0000
Message-ID: <CAFEAcA9_AbhDPLa3c3FMhcxwJ580EgT28=tvCHT=_wXhz4P5+Q@mail.gmail.com>
Subject: Re: [RFC v2 19/24] target/arm: move aarch64_sync_32_to_64 (and vv) to
 cpu code
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2 Mar 2021 at 11:59, Claudio Fontana <cfontana@suse.de> wrote:
> Then, in kvm64.c:
> kvm_arch_get_registers()
> {
>     ...
>     if (!is_a64(env)) {
>         aarch64_sync_64_to_32(env);
>     }
>     ...
>     write_kvmstate_to_list(cpu);
>     ...
>     write_list_to_cpustate(cpu);
>     ...
> }

The way to think about this is that there are three places where
system register state can be stored:
 * in the kernel (assuming we're using KVM)
 * in the 'list', which is the cpreg_indexes[]/cpreg_values[] arrays
 * in fields in QEMU's CPUARMState structure

The "list" data structure is a transitional one only: we use it:
 (1) for migration: outgoing migration is of the cpreg_indexes/values
      arrays, and incoming migration goes into these arrays
 (2) as the intermediate point when moving state between the kernel
      and the CPUARMState structure fields: we have functions for
      going between KVM state and the lists, and for going between
      the lists and CPU state fields

Nothing else except the migration and the conversion functions should
need to know about or touch the 'list' representation. All QEMU code
which needs to examine or update guest CPU state will arrange that
the in-kernel state is synced into the CPU state struct fields (going via the
list in the process) and then update CPU state fields. Before the guest
is run again we sync in the opposite direction (again via the list structures).

thanks
-- PMM

