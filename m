Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6DB37B75B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 10:04:12 +0200 (CEST)
Received: from localhost ([::1]:48618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgjql-0005lG-9e
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 04:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgjod-0003YG-4J
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:01:59 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgjoa-0003pk-Uc
 for qemu-devel@nongnu.org; Wed, 12 May 2021 04:01:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id f24so33624562ejc.6
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 01:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9uP92nBtmpwIzLFaI7dLdeoIeAXBLseUGfFOw8NKaT0=;
 b=rpDfW1ZzbIY4j8LNp8QA0hDL3B7tbhXXyPDWZDLYiugjx1A3gZxAx1lhAO5hi4d8kl
 L0kFE6k3JRKpS4lySVQ91GaGMsGtu67MsRHoFwPZ3bjl6HdcZ3W0vWcHqjCNDowb54+f
 yfex34qo2BUEyPzwCoXzzEvqxurOj6mV5Jwy1NZPGD7vX0Suu5EOYaYpcwMuMq4RYEJ3
 7tPiDrRBI5cbndJiy7qmlfVYXBCs6XmcSSDyWT7Ddl29D3zea3s82TlcjNRcEsjbfVB2
 NDoarKImIDI69oxvEaOvsk/06q2YAs+HrxdbsqOMae2kn8pOLTCEMrac+GKZphjIny9R
 9QRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9uP92nBtmpwIzLFaI7dLdeoIeAXBLseUGfFOw8NKaT0=;
 b=IwNfF6C0iTT5YFJ79k4ldCrmg6QaQDst7DHqLJDzOgxcgI/ngtsXE0AgpUakdjpY7q
 T2j5keYgvE89vtfVxodHjpE789tdOckPZUeSSCQnW62Lx3ThdE5oYb8EKnMefoLxWsCg
 pxOs96L/oyD/9S/3LBllVF5e98f+KbNMxNwp4US910LYJcAVpmdlO+YX4X9VHc+hcjoD
 amMnUU4R4SxH+j/VVksadbUIocS1OKM4m4GvneW8oTTrd+DNLLMYxr5zYxxpHUYN8RgX
 gu12IZULPx+2VmlvjPDFazcxE25SR58RffpHtCpJpN4al4TBtSRQg1uxBB7sNtP+hsM3
 wIxw==
X-Gm-Message-State: AOAM532VwB9cGFL4ivNA2eQPa4UXLDwIyIbwoe2jLj+XKG/JizYvoLok
 P7FzVbls5ONgbo/3EpdCTcpyGLyF9stCuO3bbKpCFw==
X-Google-Smtp-Source: ABdhPJz5i3OVEoXvVvi7IPVW3TIedSLsrvKKODTJMF5aOx6UAdye2FABf1CHosoXgy96kVEYMNTB/Usv0EJvs53BXhU=
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr14233786ejb.56.1620806515354; 
 Wed, 12 May 2021 01:01:55 -0700 (PDT)
MIME-Version: 1.0
References: <YJrKRsF4/38QheKn@apples.localdomain>
 <8a68cd84-1ddf-361d-0f0d-bcf03e94363b@redhat.com>
In-Reply-To: <8a68cd84-1ddf-361d-0f0d-bcf03e94363b@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 09:00:42 +0100
Message-ID: <CAFEAcA-7M0947Fmthnak8VBKoA9LqgN6wVuXbts7XbeLNKbVtw@mail.gmail.com>
Subject: Re: making a qdev bus available from a (non-qtree?) device
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 May 2021 at 04:39, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> IIUC, while we can have unattached drives, we can't (by design) have
> qdev unattached to qbus.

You can (and we do), but it is a bit of a problem because a
device not attached to a qbus will not get automatically reset,
and so you need to arrange to reset it manually somehow.


-- PMM

