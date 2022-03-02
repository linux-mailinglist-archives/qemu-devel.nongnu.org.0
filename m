Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D14CAAFC
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 18:01:07 +0100 (CET)
Received: from localhost ([::1]:39794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPSLZ-0000zD-SF
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 12:01:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSJ6-00084Q-9K
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:58:32 -0500
Received: from [2607:f8b0:4864:20::1131] (port=45025
 helo=mail-yw1-x1131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPSJ4-0000IH-HB
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 11:58:31 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2d07ae0b1c4so24942667b3.11
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/VA1NSHS8K43Dd38qsMDdxeFZUkAh1/89nZYd2Eodvk=;
 b=vsjTjCwXGCtkWGm9V7Ch/W2LhuUCCybVK2kXEmU4vZenY1BiXcgs7WtUNW5L+YXOr5
 kZpR8qF7aRmh6+vnqAdsguvphUusW02U4N7TxXsydaVro/BvKNNYZa0t02m7nyaiqS5T
 UhyDG+2QWlFPSIMkWmsY0S7gE5erhGlVvYQd1mMyJiyXjeVadYQgAX+3Mv9f2LQza0VD
 zTrOxYAEIyAB/clUdXsw1Of2xKpLDqpD4F40tVcsDWEBPERl3n0dB9UR8PYxhEx/qhgR
 VpduE5O8g8MY7v9BowzbeV8TH5yZa6EWS3VnKXDUu0y/zbfh6+28Dhez0bC8laWrwjoU
 G99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/VA1NSHS8K43Dd38qsMDdxeFZUkAh1/89nZYd2Eodvk=;
 b=ILhfQuST/7M3r0E+cd1xUn06NzBlb46J2tmm9EARNjL9RMubVHgiiQ0R4zD1D1lvAO
 cXM9JniyZwttam6AJNE5ofhrthvXQZ9ZvqOLrplpjgId2vWH4MnISvNJF1M8ha/RmSBJ
 zIAj1x/WsyVd3Cuezyt3WIp9xStFRYAq7627b4DAqmRdRyW8q+PWHkG0cDwmIkJG1l4+
 iPVEaAFYUek/dHbCvSmtNV85zIPXvHtjORoVdU7gkWpwSXbYuOM4EPDwFkKDRJSQwulg
 TpVHWqYXx6ec595xOhyBV+GrShBmu+TRCRVLACETSAFmJt6HwzKdObMyv/buACZGQSkL
 eDyA==
X-Gm-Message-State: AOAM531QdbGyQKrIR6lsENBhnKJNykHpKrGPHg5n7sPudglvOiogY5+f
 tBEo1hnWgrSAcHX7/mRLuMHm/UiNUMitN8dhAuQ77A==
X-Google-Smtp-Source: ABdhPJz2BJFy1/dWnuggOARTRCGT2ZMyJ99UcryS5LY6ZkGDvko+10xQGOPBqxJHUpoYgxcEIwfXXPNE2c7QGKLyUUA=
X-Received: by 2002:a81:8c9:0:b0:2d7:6801:3fcc with SMTP id
 192-20020a8108c9000000b002d768013fccmr31393077ywi.347.1646240308390; Wed, 02
 Mar 2022 08:58:28 -0800 (PST)
MIME-Version: 1.0
References: <20220302110803.849505-1-clg@kaod.org>
In-Reply-To: <20220302110803.849505-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2022 16:58:17 +0000
Message-ID: <CAFEAcA8FP4Z+yw2EKV3iuxf=jq-KMdZEm=HFwsBk4LUuabqyVg@mail.gmail.com>
Subject: Re: [PULL 00/87] ppc queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1131
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 11:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 09591fcf6eb3157ab9c50a9fbbef5f8a567fb4=
9f:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20220228=
' into staging (2022-03-01 15:55:31 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220302
>
> for you to fetch changes up to 169518430562b454a1531610d2711c6b920929f6:
>
>   hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice() (2022-03-02 06=
:51:40 +0100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue
>
> * ppc/pnv fixes
> * PMU EBB support
> * target/ppc: PowerISA Vector/VSX instruction batch
> * ppc/pnv: Extension of the powernv10 machine with XIVE2 ans PHB5 models
> * spapr allocation cleanups
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

