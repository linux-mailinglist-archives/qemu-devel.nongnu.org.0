Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E76ACC60
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 19:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZFSj-0000wk-Jg; Mon, 06 Mar 2023 13:21:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZFSh-0000wZ-O7
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:21:27 -0500
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZFSg-0006Ro-1A
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 13:21:27 -0500
Received: by mail-pf1-x433.google.com with SMTP id fd25so6458790pfb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 10:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678126884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2w2GR5sMEAaiLlMt5GrRVTC58hdAXMPxPx3xxGGp7w=;
 b=Hjd0c2QZiczzEDuWsBNEmy83D8ykqM1OyQWKe7gHe4yNq6+xYHMjiNA3fMQkmP+l8O
 SSAPgMCdODMIR+GIY4mTW50CSOMO7Lt+KAmVmScT2vNDCTx745OymvHLFpncH5dHw3cq
 XWzcqzR0vqLNgPW4cjQjgNF2D8JnmGK1RrVgkXkwnz4vEbHB/xO2MopoUNApWlCv17me
 k5LTpXikrxJESOsjM6tXdLxY0mMXOpclB/4orLb9l7UXcG7Su869qsr4MrMjCTXK1D/9
 bLcnDM7q1lbOWXNaPioXxt9yJwRKUebdXdWkBLCRsDdqBVLwogOFyBJm/EitJ9/MCgOA
 vlgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126884;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k2w2GR5sMEAaiLlMt5GrRVTC58hdAXMPxPx3xxGGp7w=;
 b=TdzpZlrA0tHbpEdvfPdPsjt2zIpvZhrTSDaQh8pJAWStJaSGS3N10rzTZS+rf3LBYa
 fk516U9jaaN9nXouOqptu0mVtNImt0sv4YYC1hIhtr0uGGyhKKiGiG34VunYEQMgZugl
 UYITjguZhDZlO/jliFgjl51FQt0vI92RQpqx0kV2akgn1kLaj0PU3dM4UsNZ49nIzN/U
 qgNpk83qWJzfRqg6Vzn7z6vDsiYtgyoHk559248i5e7uXUFetpvSudWXch69g39aIQ2u
 VRs7OlWn0s6nA+CBGv9LZUux8YwT9TYC2CZ8Mn1VsbFk+6Ef5hgvL71Y6yC5j3V2uJbP
 UKjQ==
X-Gm-Message-State: AO0yUKUkgGCCv2vYrYoU+zjjfaEl+Bwu8L+T1maS8CCTKHqSctzm1x6t
 TRWPHOzz9Yps1f+BChwijPzEpqux/jUqd/V/NMCOJw==
X-Google-Smtp-Source: AK7set+lrkaw7qAIc+fzg2snA0lsaZ/B9GBZqsQXp2ZiU7lb8KzAG5cX2dpuJ+jfh0MqcsEDXuSWJQIc7xSWKuwzUhs=
X-Received: by 2002:a05:6a00:8cd:b0:593:e110:9582 with SMTP id
 s13-20020a056a0008cd00b00593e1109582mr5204851pfu.2.1678126883765; Mon, 06 Mar
 2023 10:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
In-Reply-To: <20230306065202.2160066-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 18:21:12 +0000
Message-ID: <CAFEAcA9fLPM6utViikVaYNrJVXoqwWSdXzBUQC--5e1wV_VxmQ@mail.gmail.com>
Subject: Re: [PULL 00/27] Audio patches
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Mon, 6 Mar 2023 at 06:52, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ec=
c0:
>
>   configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46=
 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/marcandre.lureau/qemu.git tags/audio-pull-request
>
> for you to fetch changes up to 2f886a34bb7e6f6fcf39d64829f4499476f26dba:
>
>   audio: remove sw->ratio (2023-03-06 10:30:24 +0400)
>
> ----------------------------------------------------------------
> Audio patches for QEMU 8.0
>
> Cleanups and improvements from Volker R=C3=BCmelin.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

