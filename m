Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDDB411ED5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 19:34:08 +0200 (CEST)
Received: from localhost ([::1]:37516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSNB8-0003eN-Vh
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 13:34:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSN8Z-0001Y1-TJ
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:28 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSN8X-0001Ge-1v
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 13:31:26 -0400
Received: by mail-wr1-x432.google.com with SMTP id t8so24915156wri.1
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 10:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wcvCGd5e3L5F7wix1Vdj5SvfUOJ3fAlRwtLvKlPfam0=;
 b=W0bMjt30oT20klHytDubfi5apiVzszADphuISFmtcPrTRSI55jQqs8MhscZlKWb0VM
 545Zymsz81oJqZaKZn0Prr/3vAaAhDPf/IPXyb3cJTZwOZMaKqJS8o9urYOq6okm+iJD
 vICfUnUIQNsK1kyhSaUur63NgCUjbO6/5btcab06S05ZmKpGq5U1VdEg9l7DB0QNvuwA
 2Si58IT8ooajW6zvE7f+d7duVeSQ+jTyKNAokvj25aLd7I3xX2gs/qxgmgsY191KkM2a
 PHoz96t8dMktr4LDqS/MGzFBysROQJM2GlZGJofwinVabRxIJUBv34q4jocWyMsle9ln
 R9Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wcvCGd5e3L5F7wix1Vdj5SvfUOJ3fAlRwtLvKlPfam0=;
 b=KSpgv8rXBOZRG/F5+L7+2val/yokC7Y/e0oAtTnax5PU+8YTMn5GM+0fXpGdbCTVnE
 82zb77/RHFyXZkOBg/FzbVCgK0eWdSGoSz9QBXZSYCusjnSq4m1O6NcYKF8zJDZJHKVd
 M4EYzYVAP5QxhlL7PWDhIoXfbxaGEjV9RfaQHw9ZRyP0jhog98WlURGnMfJ8iZFZL9Oh
 fpUSIDcfBqW5bkTbGZTHoGFq7S5XUS7mZGZ2udRYg8npMA1bgv3lQx8P6fXJ2rDrBMTY
 kY8IDDqtDx9uRhFpB0jPghwjVieSQq9l0er//enkAPgAqvENBytB75vBXgpIKbzfijBp
 pVBg==
X-Gm-Message-State: AOAM533d9SiUBAtFarmDHGCYY1KsYlCI7G3hK303LFDdBHmEHuLwOYmm
 oloblEaC5VjGaoDIOq6+ED/LFGUM430UGhprFUedvA==
X-Google-Smtp-Source: ABdhPJyOOzF4o5eLBZajI+tzCYxuaRIZEMeL+cV/qG/vrax/ODTb8dudis8WNV8KHEcceB15symHpbVMXhSlxi5I8xs=
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr176098wmm.133.1632159083160; 
 Mon, 20 Sep 2021 10:31:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210917082412.75470-1-jasowang@redhat.com>
In-Reply-To: <20210917082412.75470-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 18:30:31 +0100
Message-ID: <CAFEAcA9rM3HSYkiUn=92i-3EKVFTQhOveNFTHnG4jk_EMbeTHA@mail.gmail.com>
Subject: Re: [PULL 0/2] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 17 Sept 2021 at 09:24, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit d1fe59377bbbf91dfded1f08ffe3c636e9db8dc0:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/trivial-branch-for-6.2-pull-request' into staging (2021-09-16 16:02:31 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to bedd7e93d01961fcb16a97ae45d93acf357e11f6:
>
>   virtio-net: fix use after unmap/free for sg (2021-09-17 16:07:52 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

