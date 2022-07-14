Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D45485751AD
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:21:12 +0200 (CEST)
Received: from localhost ([::1]:55674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0eN-0000rN-FE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0a7-0004GT-SY
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:16:51 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oC0a3-0002GD-FV
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:16:47 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31c8bb90d09so20264597b3.8
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 08:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NW4Hcit7i3msDjy2O6bJFx+UfSMpaS4HqbHyr4OFkIE=;
 b=Y9anPix6oAK5o4uwFIIt036SqDLTWGYVptgytjhIDv3qjOt1fHs4HeRyP9SfjMbDFn
 9CFMeZUO3eMV9cUWUEajJVTW3+1DQ6B4F5Uq72709bp3P/MnqcCOA7uo7aP+Z8pKDhZ/
 7r8Ju2ORdE3uKIxv4QumvXQ4x04peNAZB8DDyrWu+/+QQTtnAiC4OPUIaFVAUe0HrRvW
 ZdPH7TcfETYd/3JBoWGlbbaHdsaTHJ8DSYVEEtxUPC4+8ZjbZUUweYx/QzWNhYwQUNzE
 jIeVD7Bj79kuqlyVrpCn6+UPn8lLff6QGtgHbaLjrDDiQ/Q38PrIZu8kz9nB3/Lkfccq
 s/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NW4Hcit7i3msDjy2O6bJFx+UfSMpaS4HqbHyr4OFkIE=;
 b=xihe8cNzHLdb8DV+pwPEHV0Yceu76jc0UOLfPXxNEOVdHY7RVArkbZS+ptVm8XKBrq
 gytSVmrlyWzzCqcQBkokpxcYIT3xMxJrCkWjU5LvwoECo/Ip2Nb7ZO2V9ggzc668ILc6
 xSwVeHZ+KNNS7xMufl5Wxkk+IpysPd9yYiK6aBHEMDzxWQse9YM3ingY3YOzt00PeUjC
 20MxPArLWcvMJHfR1BSjWfCyWedHO7kCJPKiow8r1n2ejoFY2U9/+eZ1GpY7BAdi+e9q
 MeP5tWZZQF3l2wQtZ4wN2Ytmt1Vc78/46vzmhi+PryRSnT6F72qVQ43bUbpCtV/k5kq5
 eleg==
X-Gm-Message-State: AJIora8zuSREchTc10+oR8ELAUxp6ONXFJ2BenBzmarrR8N1c6UblXob
 tty22WrN5cFjog0e7LyUfiBzdRywhtWEvY5ck7jGcg==
X-Google-Smtp-Source: AGRyM1sNKxvbQhqAasWMLkS6Kaqwa/TPXIyfODO8DDTU8Xp/8ky6lk6ZOA2D14F12BifRy2KL6eV2K+2D6pjgR1ZnJw=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr10127243ywg.329.1657811801463; Thu, 14
 Jul 2022 08:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220714145355.7225-1-quic_trohmel@quicinc.com>
 <20220714145355.7225-2-quic_trohmel@quicinc.com>
In-Reply-To: <20220714145355.7225-2-quic_trohmel@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 16:16:02 +0100
Message-ID: <CAFEAcA82k5AYvvSFEJmEm9t+EcbX_eOEUrrtZ0pJcLswTg42Nw@mail.gmail.com>
Subject: Re: [PATCH 01/11] target/arm: Add ARM_FEATURE_V8_R
To: Tobias Roehmel <quic_trohmel@quicinc.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 14 Jul 2022 at 15:54, Tobias Roehmel <quic_trohmel@quicinc.com> wro=
te:
>
> From: Tobias R=C3=B6hmel <quic_trohmel@quicinc.com>
>
> This flag is necessary to add features for the Cortex-R52.

Is it? Generally we try to avoid adding new ARM_FEATURE_*
flags unless there is no way to get the equivalent information
from some combination of the existing flags and the CPU ID registers.

-- PMM

