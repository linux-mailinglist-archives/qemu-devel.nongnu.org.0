Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C759C3AEC1A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 17:13:44 +0200 (CEST)
Received: from localhost ([::1]:49448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvLcN-0006od-Rg
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 11:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLaD-0004UC-NY
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:11:29 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37433)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvLaB-0002rm-T9
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 11:11:29 -0400
Received: by mail-ej1-x62d.google.com with SMTP id ji1so23318518ejc.4
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 08:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eRF0fT+WFe520xK0n4lYx276ixE+ik/l4VmupHLGlB4=;
 b=lniAVtSgkmJFShPGF+1ZF4n6UgNv9EQNPXvz8+a9gQBGc+PEVWQfCRRSIYZdu6BO3E
 lE/+uqPyRwYn5vJBU027CBPyCDJvqEHZ5zpMmJkN29Rt9NrviJUAnAN/oFAELN9zl5Fb
 ynyIKSdPPfLtbn+svfY8bHolGRUc7G09G3gXPO4NHGeZXyOEoGD0Vb9T5NemUXfhOkYq
 cTD8Y0SNaX+YS/9V5MIKE3ixJRdtpJoxMYVoKOrkzZRuXatc3iamT/Q2E8ffRiyPxK2D
 9hlgNzAdsQJwGmn6EH7hIhTfbpZuOh8d0NUXBxT29N7/B/RONGPaB7arjARQbRBnJShG
 bdAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eRF0fT+WFe520xK0n4lYx276ixE+ik/l4VmupHLGlB4=;
 b=Mpm0HUX0Ix1WChmRxdsQSPS6bbpXyc8c8FL8oMuvNDnSHBALNSGikVXmcAg3SF45Wy
 hfFTXN4sn6X5zwtoNLBJ1669Bdhn+Upv//OAIsBqCddrt7bUOuHOkL3hrliqCFEOR+3x
 dqMSlil5vO5qb0qVPm06mhbji7iWkgsLH6iEqXK3geMjOWo/0wK7WmLuPvua8joZUQ+I
 vvRo0kgQrZ8ScHOaud8HqgJID6ssou05b0sEjDg5PxE6dlKGxe7fvdJKZIv77ogQ5fWv
 5Y+duAp7DMx910r4GYyE3CkFm6Etq0GOAzkOvtdULHi2O+6RyE3t1ra4H2bjKPFTw/VQ
 EUjw==
X-Gm-Message-State: AOAM532vmVBAqeSEyI4xO6KR3r0pPTG+6Fz+l2hImNeRVCJjrHoGjToK
 SJ1ITH5hqfUDm3UC9CZF7jSMMuv0UpU8J1l6sFsBdQ==
X-Google-Smtp-Source: ABdhPJzw184u/7g+nk5epijkXi9vKANxF9DApao7vavRriNMWMHEgTUP51w9ClCoG5432YLg4ZlYsSHdFj47GHIMKT4=
X-Received: by 2002:a17:906:90c4:: with SMTP id
 v4mr10520796ejw.382.1624288286522; 
 Mon, 21 Jun 2021 08:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210618195237.442548-1-ehabkost@redhat.com>
In-Reply-To: <20210618195237.442548-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 16:10:50 +0100
Message-ID: <CAFEAcA8PAF6RNJfEPMcf+taDDNiiHOYzbvwTP4+q4PXubzseEQ@mail.gmail.com>
Subject: Re: [PULL 0/7] x86 queue, 2021-06-18
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 18 Jun 2021 at 20:52, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> There's still a lot to review/queue on the list, but I'm flush my
> current queue so it doesn't get stale.
>
> The following changes since commit 18e53dff939898c6dd00d206a3c2f5cd3d6669=
db:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-c11-20210615=
' into staging (2021-06-17 10:42:57 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/x86-next-pull-request
>
> for you to fetch changes up to 4e2f5f3a9db06e87a73eb60a7cc9754fc13596ee:
>
>   scripts: helper to generate x86_64 CPU ABI compat info (2021-06-17 14:1=
1:06 -0400)
>
> ----------------------------------------------------------------
> x86 queue, 2021-06-18
>
> Features:
> * Add ratelimit for bus locks acquired in guest (Chenyi Qiang)
>
> Documentation:
> * SEV documentation updates (Tom Lendacky)
> * Add a table showing x86-64 ABI compatibility levels (Daniel P. Berrang=
=C3=A9)
>
> Automated changes:
> * Update Linux headers to 5.13-rc4 (Eduardo Habkost)
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

