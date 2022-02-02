Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8C54A72D4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 15:17:23 +0100 (CET)
Received: from localhost ([::1]:50822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFGRl-0006rm-Ud
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 09:17:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFG41-0005dx-I7
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:52:49 -0500
Received: from [2a00:1450:4864:20::432] (port=38905
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFG3z-0007Zl-8g
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 08:52:49 -0500
Received: by mail-wr1-x432.google.com with SMTP id h7so6722552wrc.5
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 05:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yz596dWyUiyom/dOoePJTlli0ghKkRw31PGwTQoYzPE=;
 b=UtvsduCHUdvrC8LRX2+CffLQ1Gfc3vLMslCLDVmJvLhBV5u0RBtp02/9WqjBLl3z9k
 KmCsusobOQ3UIL/PkbgOKJ9nl6sKxs9kQ74xQ7iI6M/ebZ2o/C8YCs/Lw3mLf3If3FjH
 Cbdft9RMmSGbe1i6as+9iLZLDJLGXHIdOnUFcmTnj2EIQ37RzZVSoeGUnUjZX9kSeLOJ
 cX0Qo6wL26YeOBa5teAzwmjiEyeXiARYEEwBGGVuMzq2oF3sKdPVt9MKogwaMSM58k3Q
 +XXueA9WMJQZyEtdqxSKOqL9RHuaeK+4hI12P/fJpvFoDtCDGq2bew2FOPJSZk53TFhy
 Q/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yz596dWyUiyom/dOoePJTlli0ghKkRw31PGwTQoYzPE=;
 b=taRHYo9/IukaXEKr25ypcDrNqG2QTzb4wFF0BYtdmbgwr3VAiQyT3Uuzfh3XeKPXme
 1PE1+N8n44o3PilncOfb9ByvsU35Olfz+SKaWbpMliNwzbohriFDHOhLONUkq0OeJT0i
 Zbkz/dRdvTo0On0Ali8jj/AFChshsSNLGoaS8RE/c3QdceQCHSgwdEW1FyvDbdmvb+7v
 VtYkgNIcb09awlWWDugFH7YvL+0E6z3vNpdrsCf+E8nfvZWjibkd1wAx9ByzLwr+HFTp
 rGoFHe1BVD/cPuuknBGLH18GnFa0CnD+Awim5d1EWieuSHqR7u96kqhpM07KlThLAAfj
 a3SQ==
X-Gm-Message-State: AOAM533GwbgC2t23XnsBNu3TsDKVEddLrS1zBY+X1syKh0LQRCK8JtwO
 1ls/VoyU1ZWrxwR/RDzMl6Cql3yle8JmoQIGiOUcHg==
X-Google-Smtp-Source: ABdhPJxpXTs9500VZsaNRHyqgEVl0SK7ICSpXWJ68nzbqJ19aOB/H9pT2I8Qb3kG8i4b/StzzY8qyeN4/Ul7rd+FJQ8=
X-Received: by 2002:a05:6000:258:: with SMTP id
 m24mr26248406wrz.2.1643809965569; 
 Wed, 02 Feb 2022 05:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20220113194452.254011-1-dgilbert@redhat.com>
 <20220113194452.254011-4-dgilbert@redhat.com>
 <87ilu6nrqe.fsf@secure.mitica> <YfK+7LCJssDhie9O@work-vm>
 <87mtjc8el9.fsf@secure.mitica> <Yfprvld4Y/GoJbhh@work-vm>
In-Reply-To: <Yfprvld4Y/GoJbhh@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Feb 2022 13:52:34 +0000
Message-ID: <CAFEAcA8SEed=crJr1_gpRCQwAkTn+bgAqfbUEGch9JZo8EAnvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] migration: Perform vmsd structure check during
 tests
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: lsoaresp@redhat.com, marcandre.lureau@gmail.com, qemu-devel@nongnu.org,
 peterx@redhat.com, Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Feb 2022 at 11:32, Dr. David Alan Gilbert <dgilbert@redhat.com> wrote:
> Because in my local world I did the changes to libslirp; I wanted to
> make sure qemu people were happy with the changes before proposing them
> to libslirp.
>
> Which I've just done:
>
> https://gitlab.freedesktop.org/slirp/libslirp/-/merge_requests/112

Does QEMU's own vmstate handling code see the libslirp vmstate
structures ? Looking at the code it seems to me like QEMU's
migration code only interacts with slirp via the
slirp_state_save() and slirp_state_load() functions.
Internally those work with some use of a vmstate structure,
but the code that iterates over field arrays in those is
all inside slirp itself (in src/slirp/vmstate.c if you're
looking at the in-tree copy).

So maybe I'm missing something but I'm not sure there really
is a dependency on the libslirp change here...

-- PMM

