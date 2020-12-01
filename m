Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6D02CA1C0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 12:49:57 +0100 (CET)
Received: from localhost ([::1]:56236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4AO-0001FE-F0
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 06:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk498-0000fi-AX
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:48:38 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34220)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk496-0004m8-2H
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 06:48:38 -0500
Received: by mail-ed1-x541.google.com with SMTP id y22so2813032edv.1
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 03:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eNbJBvCjxxSRBqn4PhMd+UKDjwN1evYqMWIzSqsrfYo=;
 b=gkAJYfbacW18D8RmBnyQWhTMl0FGastBsP+jUXcjXVQNx1bfDA3wnkfPgHrG6cO4xI
 ea9PG4GwtYBYqAw/Dtw2cetDX7DidsnmVSqk2ST9n/FsXc2QVvEuSoM+3oAHrdLyQr89
 HXvivab1f0Bx7OZUVrxZy/3aompk4vn8GiJ9Ez8n4lj0oj0PU70c8WX+5aIbZSN35ro9
 qAasaRn355p8ELLT3Qe5uSyVvNBYxL7h0Z94s8b9neuAdWRdnObdjur//8NSOIiXkzEM
 QX3KOF6gXJyvQxMFOUxorDry3GOlCQoEx18j7NHLHnczoUfPtBv/JSQhArdFXBO6LSJi
 NClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eNbJBvCjxxSRBqn4PhMd+UKDjwN1evYqMWIzSqsrfYo=;
 b=KYzZTg0fkm+H1bvghG/pNrn60X7A9LeBEGieLXTetN6Fx7TnBpiT8BvlDd4cJ1aVGY
 /qCwldXWzcQepPUSigg01RIRzVMpgPuJ7ubHAmCsvjqpfeKAn47kXwBuixxN820+Ktzz
 T1osgooPo6RKYwfkqkZdLs5eWsCCPSygVDKipOSiXiErvUnFcBIkqUR/maGygZWY0cXf
 FRfvc/nBpmLuBJh3BfYJ+ervVjrs1cJGjkolj3K7PDr7MR1Hs+rZajvTu46IOh5V2how
 Sr0tf3qiOQAODdrFZhFzTTvmDtLoGgWFP3TtB/2ZzlSreWfyrDphui5ZL4GVjSHrXdJQ
 5F6g==
X-Gm-Message-State: AOAM530O9nInfVbbGALPThwD9bEyyT0Hgzc/gN2VILKBj0V25wNrojec
 iMYuiWyaQV/HE1hImU/vt1zV1PYjbgwGNgMDL68MkA==
X-Google-Smtp-Source: ABdhPJwBkmG7ozxwSvvWNZFi+MOMS8ktr4FfGn2HiL/iGAA05ytNimxgRqwHeGV14exT6S4LiJrHxh/OX3TrNuKrnAQ=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr2588071edb.52.1606823314418; 
 Tue, 01 Dec 2020 03:48:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
In-Reply-To: <4393d426ae8f070c6be45ff0252bae2dca8bbd42.1605316268.git.ashish.kalra@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 11:48:23 +0000
Message-ID: <CAFEAcA8=3ngeErUEaR-=qGQymKv5JSd-ZXz+hg7L46J_nWDUnQ@mail.gmail.com>
Subject: Re: [PATCH 02/11] exec: Add new MemoryDebugOps.
To: Ashish Kalra <Ashish.Kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:07, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Ashish Kalra <ashish.kalra@amd.com>
>
> Introduce new MemoryDebugOps which hook into guest virtual and physical
> memory debug interfaces such as cpu_memory_rw_debug, to allow vendor specific
> assist/hooks for debugging and delegating accessing the guest memory.
> This is required for example in case of AMD SEV platform where the guest
> memory is encrypted and a SEV specific debug assist/hook will be required
> to access the guest memory.
>
> The MemoryDebugOps are used by cpu_memory_rw_debug() and default to
> address_space_read and address_space_write_rom.

This seems like a weird place to insert these hooks. Not
all debug related accesses are going to go via
cpu_memory_rw_debug(). For instance when the gdb stub is in
"PhyMemMode" and all addresses from the debugger are treated as
physical rather than virtual, gdbstub.c will call
cpu_physical_memory_write()/_read().

I would have expected the "oh, this is a debug access, do
something special" to be at a lower level, so that any
address_space_* access to the guest memory with the debug
attribute gets the magic treatment, whether that was done
as a direct "read this physaddr" or via cpu_memory_rw_debug()
doing the virt-to-phys conversion first.

thanks
-- PMM

