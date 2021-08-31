Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4E3FCDC3
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 21:51:34 +0200 (CEST)
Received: from localhost ([::1]:39318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL9nB-00053V-JS
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 15:51:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL9mL-0004OI-4z
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:50:41 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mL9mJ-00087F-LR
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 15:50:40 -0400
Received: by mail-ej1-x629.google.com with SMTP id mf2so1321938ejb.9
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 12:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Jxu9OVNsIN4JkgcG6d08Mxtx2uOD1hFDk/jDfsXWFb4=;
 b=mZL4PWlTTsLN8sulBLzi6e5xCjkiSl31Uyx7/k9Loh5FgqMcuoah9PxZSMevToIINq
 xCiI3Sp4EenzPY+qqxuSF17Za/kylTFM+92OS6TPmCqwLRW5f9qV751acCAsNc2ecMLd
 0FVJUECUMsWIGwgiaChlvj5/VWHTjer5Gs0TX9ytH6HZR4pjF2msTMiWeocxOFBZP/8k
 0zuYEFMUYtl5z703S2aq5eT/2TdVonHoFKsSd8ysAFy9jRJzL+sgZoNT0cF5k7O+71Xc
 gH6l03PKRevuOp60U7RVpX4pQDWQc6kpNjLXRZ9isHA/YRhZdIjDT3wWxi2JgRYFxgGZ
 N2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Jxu9OVNsIN4JkgcG6d08Mxtx2uOD1hFDk/jDfsXWFb4=;
 b=Da0meUg75JMVCiBgERw5cf0iRVK6PcOCx4kG6KDKodN2UxhBu+jpFd+4unBoEBH5RC
 9k4iUYffMdl+pAy++ks57InJ9+C82Xd7Tc5QUVRHmLTTuWDUIzKUk1m3AwGUjlO5qrvx
 b4h0xiViqocBd5zrt0Kw/1LuWSuD1O1Fd42bcKLf6+oQitybB08zuk1cAWETUCAj4/Wz
 3c8GfxXW5EETmTthv/97I48vuMtOEvNLjKj0P1+7IBrhnt8hyhz6PZniSgqOHWHF4BLL
 ikDLb8U4PuWS5IltITZMxcHoWNwxFb0AURuypqpnzMEdc2REseY3N8yCaEhjDOT5K5Je
 PAkA==
X-Gm-Message-State: AOAM533Kg+wqa4FvoPZeSZ/C0OuAHaqGualZUNzFggmFrUXCYdfWNlWJ
 rbJc8mDM/ETAl4CjfHrnNIh5osbEpx9CqAMPOoVmwg==
X-Google-Smtp-Source: ABdhPJwp8NgrS+iIgZp0gxvw1nBOyYi58BLb7bEAsJ8AHkWYFQcX1RatSCE3Krs9qeXVLkgNAImZObPEnmDFUcXzf4Y=
X-Received: by 2002:a17:907:75d9:: with SMTP id
 jl25mr32521206ejc.4.1630439437886; 
 Tue, 31 Aug 2021 12:50:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
In-Reply-To: <20210831133132.1697228-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Aug 2021 20:49:49 +0100
Message-ID: <CAFEAcA_yEy8F+MDZxJ=udDP57zCsBi7=HbNCBSZJjXhFav5egA@mail.gmail.com>
Subject: Re: [PULL 00/18] UI/clipboard fixes
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 31 Aug 2021 at 14:31, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The following changes since commit ad22d0583300df420819e6c89b1c022b998fac=
8a:
>
>   Merge remote-tracking branch 'remotes/dg-gitlab/tags/ppc-for-6.2-202108=
27' into staging (2021-08-27 11:34:12 +0100)
>
> are available in the Git repository at:
>
>   git@gitlab.com:marcandre.lureau/qemu.git tags/clip-pull-request
>
> for you to fetch changes up to 90208bc9657b7e0f8a6bc6af82b69c65c97b2d64:
>
>   ui/vdagent: add a migration blocker (2021-08-31 17:25:14 +0400)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM

