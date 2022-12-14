Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEA164CE9A
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 18:04:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5VB1-0002Ke-Sq; Wed, 14 Dec 2022 12:04:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5VAg-0002Ip-FT
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:03:54 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5VAd-0003GD-O6
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 12:03:53 -0500
Received: by mail-pl1-x630.google.com with SMTP id s7so3981964plk.5
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 09:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S8QMZbM32uFq+L9HpEbcNwMfn8ydyEzD3bIM9H2+xrw=;
 b=G5fj+/hfHyJ2WsInSBPfDuV2UkZxM9wZNdL8ulUdPHEeEI1W/6hKQtJHzcYvlT1Z5n
 Ej4ski02Pb2v/374ZiMbZkyIakeTUMXHCMzNOlWYx5aG2cJ5jdabKHd+9dV6jI8d7Tj6
 ey91N4bmbPm2RxT1olDQyQzEngeUxbP2d9fvG24D0lrIya8NDTUZlfAzVj6eURTcQkjS
 43UhCg+wlI/xf7TVMYsYeRH+puwS4Ahk1Y+tshogCjsf5sz4HYv+hSKlClR3FIdMhf3F
 yJH1marOHgZRQJmJYdhifMTm05bkdSmp5mHWA0KgeHzHZYUWOdsh5unafOSVjPSwqU/B
 g0yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S8QMZbM32uFq+L9HpEbcNwMfn8ydyEzD3bIM9H2+xrw=;
 b=y8E4PBQsdeik8LlHj99yFaYWzQo3nqFdQAj7nB91jpdHIS20CPm5yns4OLWRg8iNcB
 zHIKeG3rl7ySPDXG1BZUxKXvFpnAxWFbdUU9E32dBcl9iWVDVQpjopRVfCtzfAjE2FMO
 vO7v2qwuujhm2GhgXe7fkZX0+twRHzeyaI7TLOtAIaU/jTwS+SBHNjLzP6hp3H06j8wO
 JrbeGNARcvy/NJWENOI8ECWR9LxpOvrymvDZ7lpQrD8iI0abaFnJVZCGEdEWaZv/pgh8
 grHy1+y1TbUlL36hWuTJbl3uP0FXdVu2Jbl2ObgkbpfTcgdStSayX17RtJdfgGM2Qe8/
 WqSw==
X-Gm-Message-State: AFqh2koWM89XGIefxNarpjG0EleOgP9SO/WJQ/2+aMdhK8JunxewNcJv
 dqGVmE6IEN7qxIiRl/BfgK8ZchKr0L+Be7MV0jiYow==
X-Google-Smtp-Source: AMrXdXtqZpzDq+VCGWXSuTxA1iG3aPoLTkJmLct1aMrt8rB5elVI4ei9B62B8cHBbsx4qVAiqvUNd4KXzX/16/s5Y1c=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr369602pjb.19.1671037429524; Wed, 14
 Dec 2022 09:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20221214074721.731441-1-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2022 17:03:38 +0000
Message-ID: <CAFEAcA8A8YrYNYdTgcUqb1oreshFhDnyhFeSVP7g0ih42o-ZgQ@mail.gmail.com>
Subject: Re: [PULL 00/30] QAPI patches patches for 2022-12-14
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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

On Wed, 14 Dec 2022 at 07:48, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f=
93:
>
>   Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-qapi-2022-12-14
>
> for you to fetch changes up to 4fd14ed8e5432f2998ec63922e3146c017ce8fc8:
>
>   qapi: Drop temporary logic to support conversion step by step (2022-12-=
13 18:31:38 +0100)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2022-12-14

Hi; I'm afraid this fails to build on multiple platforms:

https://gitlab.com/qemu-project/qemu/-/pipelines/722490645

Symptoms generally seem to be missing fields in QAPI-defined
structs, eg most of the CI fails on this one:

../block/rbd.c: In function =E2=80=98qemu_rbd_do_create=E2=80=99:
../block/rbd.c:545:15: error: =E2=80=98BlockdevCreateOptionsRbd=E2=80=99 ha=
s no member
named =E2=80=98has_encrypt=E2=80=99; did you mean =E2=80=98encrypt=E2=80=99=
?
545 | if (opts->has_encrypt) {
| ^~~~~~~~~~~
| encrypt

I also saw these errors on a local macos build:

../../net/vmnet-host.c:42:18: error: no member named 'has_net_uuid' in
'struct NetdevVmnetHostOptions'; did you mean 'net_uuid'?
../../net/vmnet-host.c:50:19: error: no member named
'has_start_address' in 'struct NetdevVmnetHostOptions'; did you mean
'start_address'?
../../net/vmnet-host.c:51:19: error: no member named 'has_end_address'
in 'struct NetdevVmnetHostOptions'; did you mean 'end_address'?
../../net/vmnet-host.c:52:19: error: no member named 'has_subnet_mask'
in 'struct NetdevVmnetHostOptions'; did you mean 'subnet_mask'?
../../net/vmnet-host.c:53:20: error: no member named
'has_start_address' in 'struct NetdevVmnetHostOptions'; did you mean
'start_address'?
../../net/vmnet-host.c:54:20: error: no member named 'has_end_address'
in 'struct NetdevVmnetHostOptions'; did you mean 'end_address'?
(and others in that struct in the same file)

The macos CI build also fails with
../ui/cocoa.m:1485:39: error: too many arguments to function call,
expected 5, have 7
calling qmp_eject() and similarly with qmp_blockdev_change_medium():
https://gitlab.com/qemu-project/qemu/-/jobs/3474118201

thanks
-- PMM

