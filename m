Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DD3EF604
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 01:12:46 +0200 (CEST)
Received: from localhost ([::1]:39218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mG8GD-0007dx-9P
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 19:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG8Ei-0006x1-R0
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:11:12 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:46626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <srutherford@google.com>)
 id 1mG8Eg-00027L-VE
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 19:11:12 -0400
Received: by mail-io1-xd31.google.com with SMTP id b200so196414iof.13
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nSPXvVD5O5V1uAajVcwzQDL8XPPrWHEb/KX0Q3ujGGw=;
 b=DV71LEGEMcriWPqOYp3Q5R0N4RSvbjCLFxLOck0Q7TEvPvU64h7Du0KFJFLqHFTWpJ
 asLis14FQpp3IqFunafPIOYW7Y79oCZd14ntf7XMxW1dZUdTv8q0NwbV+O9FgenjKzl7
 xbzaHOSnzBeCuH7PCFrbbHuTyqgQ03rjFVCuG6di38tfo0nSKzdUKD1s2IZhoUUC7MtB
 tbUL1dN80a4+/0eWCgJcJpbH8Ju7UD6LJBm4nZVXvXCSzOrLsMSiXW7rdIkHU20SyfqS
 ZEyQE8pQSLaPG1bTSF7NfC4UsU6T5S4vYxePdJnKP2Ycb6/lt/hK6CuC17oygWSNt5KT
 K4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nSPXvVD5O5V1uAajVcwzQDL8XPPrWHEb/KX0Q3ujGGw=;
 b=tq686HFZUect3wySFvjlhRF7Fx++oJn4DaZEW5ym2Kq/MJK4edRAWzL0DYeT4ByuGv
 3k4xioSST5O379YKez/qq3Epa3nOxFtGz26gQVz46jyqYmkTa5j7CersSAU/qNRg3jAL
 V/lAz7SUgYAUTlyUZ8i3h87RbQwjasklMXZoaamkC89Ky8i100zqycnI8B44lPIAB+EP
 ehwO0Jo8pfZE2JQE7MIq3n10IHt4pxxB+CpDc2uyqjgW/ori15qxbds+q1O3nb0F45wC
 vkauEwOVsW+Ds1bJ9ly/+KcdK7EHRdxMB+adU6GuWz1Y6/t3KqLRhFUDQLyT5bIm0rPs
 r5AA==
X-Gm-Message-State: AOAM531XzqovEd1wBX6E44f19CmKRGi1PmHZv8FX8euXZL2EsOr+KURF
 fS+mbqE2LfZb4FlniYVnsbR5/AfIjhfbZguy/h23cQ==
X-Google-Smtp-Source: ABdhPJxVvNSmVlJ0KA6TSTA1JviGtz5KbzeBvftwQSoQXXKspUz7umEQ409Z7oNaSQXRbv2fkxMVpdeM+d00qN95S/g=
X-Received: by 2002:a02:7094:: with SMTP id f142mr5055124jac.19.1629241869799; 
 Tue, 17 Aug 2021 16:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1629118207.git.ashish.kalra@amd.com>
 <CABayD+fyrcyPGg5TdXLr95AFkPFY+EeeNvY=NvQw_j3_igOd6Q@mail.gmail.com>
 <0fcfafde-a690-f53a-01fc-542054948bb2@redhat.com>
 <CABayD+d4dHBMbshx_gMUxaHkJZENYYRMrzatDtS-a1awGQKv2A@mail.gmail.com>
 <CABgObfZbyTxSO9ScE0RMK2vgyOam_REo+SgLA+-1XyP=8Vx+uQ@mail.gmail.com>
 <b1b5adcdbf51112d7b3cc2c66123dea5276a4a6d.camel@linux.ibm.com>
In-Reply-To: <b1b5adcdbf51112d7b3cc2c66123dea5276a4a6d.camel@linux.ibm.com>
From: Steve Rutherford <srutherford@google.com>
Date: Tue, 17 Aug 2021 16:10:33 -0700
Message-ID: <CABayD+cCeVw8QAUwD9qCxWN_tEm14k_o4VFM+s4r9uwypvkmSA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/13] Add support for Mirror VM.
To: jejb@linux.ibm.com
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ashish Kalra <Ashish.Kalra@amd.com>, 
 qemu-devel <qemu-devel@nongnu.org>,
 Thomas Lendacky <thomas.lendacky@amd.com>, 
 Brijesh Singh <brijesh.singh@amd.com>, "Habkost, Eduardo" <ehabkost@redhat.com>,
 "S. Tsirkin, Michael" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Tobin Feldman-Fitzthum <tobin@ibm.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, David Gilbert <dgilbert@redhat.com>,
 kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=srutherford@google.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 17, 2021 at 3:57 PM James Bottomley <jejb@linux.ibm.com> wrote:
> Realistically, migration is becoming a royal pain, not just for
> confidential computing, but for virtual functions in general.  I really
> think we should look at S3 suspend, where we shut down the drivers and
> then reattach on S3 resume as the potential pathway to getting
> migration working both for virtual functions and this use case.

This type of migration seems a little bit less "live", which makes me
concerned about its performance characteristics.

Steve

