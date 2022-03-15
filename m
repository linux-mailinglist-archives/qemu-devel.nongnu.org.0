Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4474D9C26
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 14:27:01 +0100 (CET)
Received: from localhost ([::1]:36380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7CV-000878-Rr
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 09:26:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6uK-0003FF-5o
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:08:12 -0400
Received: from [2607:f8b0:4864:20::b2e] (port=40844
 helo=mail-yb1-xb2e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU6uH-0002GH-3N
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:08:11 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id z8so189681ybh.7
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 06:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pc3lX9dc0xzygBFHqQcQVtp1PXH+SG21+kxfVVFs6XU=;
 b=dGfWri3/PQ3RNbPyYInyla3dWx2NtycNmXrRKR7TVvp6+MZistyb2LDbQ3k3UHWK2S
 9oCXCATtE86ILzB6RYCIaGlvUye67DWtTy8z5Mb9adXu0genQ4V5mqUpgBrqSeYUavMY
 /njEH4LCrgtpac3sHW3jl0QXROy+R5mAUfFNMgVU6/ldbB118lUc2yqtRcJf0AeSCs5+
 I8VaFmkoV4+LQKSGvCu823WZvrmNYThL97KQhJj5KEnyM6K5/34PmM+OC5qSoIJ1k8N+
 xX6+OjDOmrDj0wzHkqkPsgoN+DvfxUIP9+IS6yUikaXOwe5wD+EUKJawJMCfqF4XV56R
 cMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pc3lX9dc0xzygBFHqQcQVtp1PXH+SG21+kxfVVFs6XU=;
 b=Z7LvlIq3d9o+BtN4Dtr1sLY+iV20xzEnqiITJOmdE3jxgvfqZ72xUEh5LnngedF/PQ
 QOZtDr1FNsmen8VNcH1Mlbvk1z4b5AzXQlP4fhUvURGdB3TMc41+/KjNJbShzKOGenAV
 Swy5djFFY2mv+b0vmiPrP0HEnahUnFB9BX7A7T4IpwENEVTs4Cmd5+GTvP2MuZ+BmA2r
 NJMaoTF3BFRS6mZuj9bSBwXv9COo2tDn9yBLLAWEsHOBL/Md+ZQ0Z2RSOS6+wbNRYBj5
 Wh6xcGwNQlwp+q7vRAhnc6rwEnuxOeWqe2Zz1ow2ZiM7B5ftFDlXZ+M5n2aUrNSf9QU7
 ZahA==
X-Gm-Message-State: AOAM5309nRl3aor0SbH59TOs0m6s1oZZNknNGZ5PZBvahdLS4Rm5KXeD
 iH/+ZPM/MheSofFP2CuH+H7b6LB2JOtMwPU0NX+4jA==
X-Google-Smtp-Source: ABdhPJwslFkW36QQIRLk6uToablFmprYK72OcbtDww6WpxPzWh7vD+wZJa6Rkts+RXRfWzTeEaJKy6FD4cXDSQLJVM0=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr23305219ybq.479.1647349687869; Tue, 15
 Mar 2022 06:08:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220315063736.592808-1-clg@kaod.org>
In-Reply-To: <20220315063736.592808-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 13:07:56 +0000
Message-ID: <CAFEAcA_iEYpZK6Tgsp7Mkq3_0zShgEwpEQfWKsk-5bJcq=o6Kw@mail.gmail.com>
Subject: Re: [PULL 00/20] ppc fixes for 7.0
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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

On Tue, 15 Mar 2022 at 06:37, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit 1416688c53be6535be755b44c15fb2eb9defd2=
0f:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/q800-updates-for-7.=
0-20220309' into staging (2022-03-10 13:16:37 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-ppc-20220314
>
> for you to fetch changes up to 9c10d86fee11d96274ea6f7cda12d2471abe3c47:
>
>   ppc/pnv: Remove user-created PHB{3,4,5} devices (2022-03-14 15:57:17 +0=
100)
>
> ----------------------------------------------------------------
> ppc-7.0 queue :
>
> * Removal of user-created PHB devices
> * Avocado fixes for --disable-tcg
> * Instruction and Radix MMU fixes
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

