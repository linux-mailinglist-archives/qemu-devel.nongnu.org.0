Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB663AA0F4
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 18:11:02 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltY84-00068T-M8
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 12:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltXzq-0005uV-H4
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:02:30 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:34778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltXzm-0006oZ-40
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 12:02:30 -0400
Received: by mail-ej1-x636.google.com with SMTP id g8so4791161ejx.1
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 09:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OeiiOVmMl+OAmvcvwtHCFq1Ip1vpf4X+57ok1XsZMKY=;
 b=HeM6mlZSGF2JKMq+GTdiKwTGVy+UZJjth9cHT69n4vMPlSxDuI3DsFQT9mNgGwg956
 gFYkWnUZWDKRU7Vof1Aqx79x5W9MVrKqU4hx7Fe5HadFW17Rkr7PQ+rBRTU8VDw+brro
 UnYJmQioz3vP5EX5SRa4rt417O3vO4ogy3X0JvqAua9D0afpeMH3fLFllYO9PG7um5NM
 XrH1Y80NIJNE6wHd5q2r2HVLTOkTk1XX0eeiLalUgCtzQ19/7awnyO71IUWM08bw7nLY
 jVQh5r8gVlcbLZHhVPLWnwspB66ayafVYGmupdyjMBi62pgPKeNTv8hzTkt2DXQE/ajW
 5rgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OeiiOVmMl+OAmvcvwtHCFq1Ip1vpf4X+57ok1XsZMKY=;
 b=aZ16ZTF0LxDXXEzE/TIwuEtwtVwTOQ6X7VZH69Op0wqx6ilvw+E2u55NYhJL+8d0NC
 LaRea5oeaDRmMyPtttyRJwxa/gHYXVGC8gq+o6MZAiRb4oPOj/QJzuP8TqJPr+2IcwsB
 QPJ2XAT3ApWNasohk+vVMmPNO6nFbn2mFccIjvCfmo+E4e9XP4yb8OkD/YdULzlw1CQn
 rWkaLvZHjhJha8Le6NTAFPbrBvZt2ZURRG9GcaKN7n9bG+8+VTu2CYiu2vBjiGZECDz6
 3dESFURSwVLnTLhntPXr8OOM/gNnt04a0Khu8WivFagiTSqfyWMtMi4kXQgq8GL80vwL
 ptqw==
X-Gm-Message-State: AOAM53025yEzpoM5kU81oX0GfWIHNDQiU1b2fjY89iucPxMS3hZO1WaC
 e6vYAnldNlm7wnQy4xyjds8iBF1boQkQ9JmTNPaY9w==
X-Google-Smtp-Source: ABdhPJzOv8JTnI22SSCGILFjFJ9D5vb5Mu4u86stSv5WNRU01jxcFr2vSkaeSLKKeoJSEBGGv7L8FGlHyBlvkJt3l3g=
X-Received: by 2002:a17:906:5299:: with SMTP id
 c25mr228388ejm.85.1623859343380; 
 Wed, 16 Jun 2021 09:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210615174025.3409518-1-kraxel@redhat.com>
In-Reply-To: <20210615174025.3409518-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 16 Jun 2021 17:01:48 +0100
Message-ID: <CAFEAcA89MUpupH8fdSkL7rSx2xFsUyDpFXnD=LeFbq+Nm8QygA@mail.gmail.com>
Subject: Re: [PULL 0/3] Vga 20210615 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Jun 2021 at 18:45, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 1ea06abceec61b6f3ab33dadb0510b6e09fb61=
e2:
>
>   Merge remote-tracking branch 'remotes/berrange-gitlab/tags/misc-fixes-p=
ull-request' into staging (2021-06-14 15:59:13 +0100)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/vga-20210615-pull-request
>
> for you to fetch changes up to 4fa7b4cc500e1fbd8c11e65548b7713db81e75ff:
>
>   virtio-gpu: move scanout_id sanity check (2021-06-15 07:16:56 +0200)
>
> ----------------------------------------------------------------
> vga: fixes for stdvga, vhost-user-gpu and virtio-gpu.
>
> ----------------------------------------------------------------
>
> Dennis W=C3=B6lfing (1):
>   vga: Allow writing VBE_DISPI_ID5 to ID register
>
> Gerd Hoffmann (2):
>   vhost-user-gpu: reorder free calls.
>   virtio-gpu: move scanout_id sanity check


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

