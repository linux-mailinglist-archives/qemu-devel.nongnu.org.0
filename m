Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3AE6F2A81
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Apr 2023 21:46:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptCzl-0003fr-VG; Sun, 30 Apr 2023 15:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ptCzf-0003fV-6n; Sun, 30 Apr 2023 15:45:59 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1ptCzd-0006xY-DQ; Sun, 30 Apr 2023 15:45:58 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-54fc94476e2so24416667b3.1; 
 Sun, 30 Apr 2023 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682883955; x=1685475955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m/QC2nesU865Z1d0BRSZoKO6n8mHFVbhR6AtyWnwewg=;
 b=H5xmkSFzA4Phyd6TUbiK0b/1jFCyXvGVOlHQtnftOP0AdODp/sN6HPKmJ1insv/QcK
 mG9QJPL2reacAibATH6rMBZOnpb9q+DYbG7TlrjPcEPP3NEAqr8rce1gLFmFT6Evrpt+
 ylDpEIDyV9/qHFgBrFJu6QWtKNMOLttdh0CzKL8ydF7Gi9Bfa7Acv6LDrwK6LBxIXwiF
 PLQxJpRY5uOHDGemi/RimmXoXyukXHv1gyZUuN9RFqMnSDueJGtG0lmOG+JqpolaGUkb
 E7Fv8NP7q3JYJQIjBcl3o4crB2Wv9HZmWIHvjsOy6F9GaulATPOJv1gJpU8z/B1Y3zIM
 d9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682883955; x=1685475955;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m/QC2nesU865Z1d0BRSZoKO6n8mHFVbhR6AtyWnwewg=;
 b=QOqofAi5niTOFGyEtcwRpPsc7PZW+dgXUJnCQwEIuau6moFFGhF7l05LBozcvCXCzg
 HNMvM90mNKtvk5fWqKv5iqfP0YkpNbLnLIrXeVk4p2tHsvbu/kMhimYtdU8a4THXPy4o
 cNOvue1FxH1/9GORnhdLCFkCo1MLs6itIPe3ig2z4hbf1xVNeCoWfIH6QU6SPtUW5m4a
 IaHxDtPto2qPS/48tcdz42QquL73Pq4cNBRhjQKzkLQqHQw9oGB+r+HWbHUX1f+lPcoE
 f5Mck7vnOAWBqKOGqVxwvjA0KEQT5C26MV+ZDPoMJUr5D+WE1lb1SFu/yQkrMACXADPU
 NzrA==
X-Gm-Message-State: AC+VfDwDCxWXVSWIHkudVLNxaL3ywUf4uJjuP0+TRrGTo1g+tEuny0n1
 eZd8sOV8XfnSm4rarZatwXs0NhiRb2NBomslp8A=
X-Google-Smtp-Source: ACHHUZ55TWBGa+ls+7SU+Idze2pDgI/1h09IXPHXXPLFEgKKzmrcdRBgqWQ35WTqKy+KTCZO5XZabYMFHyr/4t2BBAc=
X-Received: by 2002:a0d:d046:0:b0:54f:ba89:225d with SMTP id
 s67-20020a0dd046000000b0054fba89225dmr10467941ywd.19.1682883955464; Sun, 30
 Apr 2023 12:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230403191600.43487-1-fcagnin@quarkslab.com>
 <20230403191600.43487-3-fcagnin@quarkslab.com>
 <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
In-Reply-To: <4bcb801d-7a16-765d-730a-ba2bc882fbeb@linaro.org>
From: Francesco Cagnin <francesco.cagnin@gmail.com>
Date: Sun, 30 Apr 2023 21:45:44 +0200
Message-ID: <CAF8_6K=dO7xUM76ZzuBz=kQvnqh3gV=5NNrNz9BCMfQn+DncCw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hvf: implement guest debugging on Apple Silicon
 hosts
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, mads@ynddal.dk, dirty@apple.com, 
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de, 
 pbonzini@redhat.com, alex.bennee@linaro.org, 
 Francesco Cagnin <fcagnin@quarkslab.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

> Other than that, the structure of the patch looks OK, but
> I think you need to identify the cause of the problems
> with SMP setups that you mention in the cover letter,
> since they suggest that there's a bug lurking in here
> somewhere.

In the current patch, in `hvf_arch_update_guest_debug()` I'm enabling
exiting the guest on debug exceptions only for the vCPUs that have inserted
software/hardware breakpoint or are singlestepping. In SMP setups this logi=
c
looks flawed, since for example if vCPU #1 sets a software breakpoint and
vCPU #2 hits it, the generated debug exception for vCPU #2 will not exit th=
e
guest and lead to panic for unexpected BRK. A possible fix is enabling
exiting the guest on debug exceptions for all vCPUs (and not just the ones
that have inserted breakpoints)=E2=80=94is this the way to go?

There's also a second analogous issue for which it feels like I'm missing
something. If through GDB a software breakpoint is inserted from vCPU #1 an=
d
later vCPU #2 hits it, then when trying to resume execution after the hit
GDB fails with 'Cannot remove breakpoints', due to
`hvf_find_sw_breakpoint()` returning error because it (correctly) doesn't
find any software breakpoint for vCPU #2 (queue
`cpu->hvf->hvf_sw_breakpoints`). A possible fix seems to be modifying
`hvf_find_sw_breakpoint()` so that it searches for the breakpoint on all
vCPUs' queues; but I've skimmed through the analogous routines for TCG and
KVM and there's nothing resembling this fix, so I wonder why TCG and KVM
don't fail on my example GDB scenario?

With both proposed fixes the patch seems to work well also in SMP setups in
my limited tests.

For the next round, I'll also split the patch as suggested.

Thanks,
Francesco

