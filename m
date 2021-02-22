Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C286F3220A3
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 21:10:32 +0100 (CET)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEHXI-0008VJ-SA
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 15:10:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEHVJ-0007ZB-FU
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:08:25 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:45391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lEHVH-0006CK-QS
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 15:08:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id p2so23496829edm.12
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 12:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oKTzqH9GC6q8U45fb9tvKHQDhzw42ew0DIqaKrG8r0A=;
 b=l4vSP2srPY5DkEuInPdFboTIw7/nLH1vuiEtxllnijxZtUhGuEMBo2RkePw8YKe3Kx
 H0s+o5uGGcEjbcE3RMsYJpONjDDqX1Vrjguo/15tvFSzYtgG1+bzHqgo2Owv8Io9FLv4
 kL0ZBlUj/c4ZBuZd6nGYwXA2Psh6sameOKvyMGGqFyNii+LjD3UTN93JvGxDVvnsMP1E
 Se9xEtSuiKxgIjgHw4aKtz/fb4xfD97yQK/DWn6K2gKcFvaZRPKN0Gx/2EzLil/xfOwT
 s7p0jMHYQkub+8cvBHQa1wni6taN3Ih6i93mCfG/espLZcXVNy0FmxYcH2X4l1xvbXFh
 p8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oKTzqH9GC6q8U45fb9tvKHQDhzw42ew0DIqaKrG8r0A=;
 b=o1quMLl8J/HTzi3JOYp3cl+tq5RCcWxjQrqaNPHm0gZiNzg5qZfE424gnFjzubfjuk
 ZmexubuxkdaB+flh8NsFx3j9l1tU6f9CSrxLgAHlNFM2F4+Z0PVyJwL+WjfjHvtHc2Aa
 c7Wf/Bm5uGhMwWBj3akPWvDi52NtB8zG6ngBm1xFVfEHFnjwZuwxxmb7qMimTYE3BNEN
 8Xt/QfJg39SoxBkaoF4vMD6L6nsD7dqz+uqho7Vj7aTnRRG1WAh/CryVhGLRZVh/dPRj
 fsGXdDIiDXEcxfc2e4LL0vek61I/OEh2qqGKG11nHd1z17X/lnadnee7qZqRNMZsWa2x
 dpww==
X-Gm-Message-State: AOAM530jBpuugPZqIVz+OdFxLcBDh9xcS8eW1vzQPSp2ZZYiV60tW+AT
 VsfJC0Y+hT6gzGEaI+wBecq0VB5Gn9Ze1p/6l3w0lA==
X-Google-Smtp-Source: ABdhPJyiBmS/vpg4G9EgCGzyLWMwKAjckzojjxRjYta5ZQpYCAHuOvGIpA6c6lJ874oZjx5dJTCVl6Ba+lUy+6S8vWw=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr24121269edd.52.1614024501242; 
 Mon, 22 Feb 2021 12:08:21 -0800 (PST)
MIME-Version: 1.0
References: <YDPk08PCwhD7Nm2+@strawberry.localdomain>
 <8735xn6fy7.fsf@linaro.org>
In-Reply-To: <8735xn6fy7.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2021 20:08:10 +0000
Message-ID: <CAFEAcA81B_7+aEu3CkOwRGdaEtP8r_HwihuD+oEwYsb4+ZmSUA@mail.gmail.com>
Subject: Re: Plugin Address Translations Inconsistent/Incorrect?
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>,
 "Emilio G. Cota" <cota@braap.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Feb 2021 at 19:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> It certainly is by design. The comment for the helper states:
>
>   /*
>    * The following additional queries can be run on the hwaddr structure
>    * to return information about it. For non-IO accesses the device
>    * offset will be into the appropriate block of RAM.
>    */

That sounds like we're exposing ram_addrs to the plugin. Are we?
I'm not sure that's a good idea, as they're not a guest-relevant
construct.

thanks
-- PMM

