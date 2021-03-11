Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07231337CC6
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 19:40:02 +0100 (CET)
Received: from localhost ([::1]:53648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKQE4-00088z-Ri
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 13:40:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQ7x-0004FW-Kt
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:33:41 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKQ7t-0006PX-9c
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 13:33:41 -0500
Received: by mail-ed1-x533.google.com with SMTP id z1so4310203edb.8
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 10:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ov70TAUDYlyHMvYN6fTBML1UlSTX7smftZbhOVMO4zU=;
 b=TRPBLzKcCy4u6qq8ZF57rfTPp1LCazBWXSyXM7K6/W9cR9ytH1widbOtaUwCTJ9iFj
 9lJFCABx/BpLEJI/6uaVqf9/2/ymINumOa/KdLRO2Pkg/ag9M1XGldq3NB55gc/RxZaK
 BqzXIkF12HRfCO8IjKc42lipuNmjT7ihG7FHE0ZAYmyn8C5MAi6wQ5zfOGs246ZOxHVa
 5LxabUrDGNM0ir5uKw2QZBmBePa4Xv/xT5AcoamijRCCXoeaN7N38UaqX3xdsVseXlID
 HDoKSsw9/tQXgfnLTFyjsHJZkIy67Wq56BlQwduHP9iLl9737c4eZpYttF67xNRmJDBF
 ExfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ov70TAUDYlyHMvYN6fTBML1UlSTX7smftZbhOVMO4zU=;
 b=CqzA54N812NZ6sGFL1xlm88N24FaFjaRKm335DuObCwhLE6XaVtwKk5FPz3x/EMEJc
 0RpdxUbOtcMLrC22nF7+mrBGPayp3+b0Hyn09hMC9vDTeb7qo0f/pim/KYGVEewDjBVf
 /O9FeQcIaoJiuXefAfW5vHBIUK2OgH4YRRcJ6526haXoXTrpjC25ZiJ/vPNiwnL57E+X
 WDMqZyhx/IdqqNjQZxc3WPJih0Y2vXryTXQx8s8QJ6lvXxokEsopNfQjqSZfYAAazsHk
 OwlbNvAgb21qaVnlRBi+3Lu42gJQoecWPf8bQqhJxNvUFuvEC2S1FbNasVhbWquu1b75
 wn2A==
X-Gm-Message-State: AOAM532I8Enw/CoLqLiiXfekf7z7RFdpfjtwnXZmHDbR+ZWIwvhcMoq5
 viBaH7oRmaXjAVf2McB6lBbQqxfN0s8XF+qx9drzNg==
X-Google-Smtp-Source: ABdhPJw1SG6Fo1khy7FQ/Dh27256/RNkeYkE20jj0QRAfECI4nD5gu+N4YoVBkBDopR13YDSshUMYCWFEZVX7SoN1ys=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr9766096edt.251.1615487614051; 
 Thu, 11 Mar 2021 10:33:34 -0800 (PST)
MIME-Version: 1.0
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
In-Reply-To: <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 18:33:15 +0000
Message-ID: <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 17:16, Claudio Fontana <cfontana@suse.de> wrote:
> Maybe Peter you could clarify similarly what the intended meaning of "max" is on ARM?

"max" is "best we can do, whatever that is". (On KVM this is "same as
the host".)
"host" is "whatever the host is (KVM only)".

> KVM: (aarch64-only): aarch64_max_initfn():
>
> The following comment in the code seems wrong to me:
>
> /* -cpu max: if KVM is enabled, like -cpu host (best possible with this host); */
>
> This is not exactly true:
>
> "-cpu max" calls kvm_arm_set_cpu_features_from_host(), (which checks "dtb_compatible", and if not set gets the features from the host, if set ...?)
> After that, calls aarch64_add_sve_properties() and then adds also "svw-max-vq". This code is common with TCG.
>
> In the case of cpu host instead,
>
> "-cpu host" calls kvm_arm_set_cpu_features_from_host(), same as max, then calls aarch64_add_sve_properties() but does NOT add "svw-max-vq".
>
> Is this a bug?

Maybe; that's a question for Richard or Drew...

> Are "max" and "host" for KVM supposed to be the same like with x86?

Yes.

thanks
-- PMM

