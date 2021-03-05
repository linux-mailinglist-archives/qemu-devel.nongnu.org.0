Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8ED632EEF2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 16:36:14 +0100 (CET)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lICUv-0000kP-PD
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 10:36:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIC8u-0001Sq-Ag
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:13:29 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:45203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lIC8b-0000wZ-8O
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 10:13:22 -0500
Received: by mail-ej1-x631.google.com with SMTP id mm21so4071477ejb.12
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 07:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78+z7dCZe/BCWEvPqFAKoAuvdhWs2i5RrvNuWubjs9Y=;
 b=HFoYHiGqI2E4dbX7Tq3Y4T3U9RKqKGeSbL5VNnKvfTTW6zk3CTl9uwF5pnFEnhl1ak
 C5HDH6l1NESY8BXcv60Rs1sZoNzmXnOp4Eol2wSHzkMgttrPMnd6dpbVdxpKZTbVOsLT
 G0Zo3xSvx0K8pAE+bfoA5KHK6Rz21rS2Ix5ceEXQRay0D6V7lSvUb7lwdxYdbBpftH3Y
 BTlOrruDbzyhYiWiKRjrKHZk2X69JCZg+2gNQfiwqbrWCPPKVz5h5VF2vKIXZkW2MgtG
 K/L+Am6xWbpKeJRunemYdQvk/PItdRjbKAV1ENDuSMjwaS2KY9aeKZOknj1MdeoJitXs
 gvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78+z7dCZe/BCWEvPqFAKoAuvdhWs2i5RrvNuWubjs9Y=;
 b=aguGelyVs6i2lfnod6BX/xrsNiTZwRlibt6sN1VlbqL9JLi1jYeJbfLfSGfMsCIbfr
 22qnJ/bJ99Bv0/fkXCqb6XTV4430utkQTojvfmw7VXvbqJS4vYSKrOHC6YgxtwGpPGHG
 Z/xrz3yUfpgjmlLI8BWZbimMjQ9xNJCdr17e/zcXfmfGp4K8rw23Tng9PBIoBdJYEbZ2
 pZPFqigKmNKPo5rHKldM/VT8RxMAxdAhsX+1rVPudVTbjp1kaSGaW97LQAHxhPQzzm6X
 16Zdd7uf/y2vH9pVdE9r3Fo+QBSKAHnT0/kkMd0pocGeI5IWOdluH7F6u1cqnE/ae/3a
 ZWeQ==
X-Gm-Message-State: AOAM533DWdYO3LPXZAUfR5RxMje55dKAO/f9HEIdSpJ4X68ZMFRL7rlU
 mxxUfF2WIg4tBp5n5glS2lymFKX/RcdzYqIooZmndQ==
X-Google-Smtp-Source: ABdhPJwhVoDZ7uFvmtRG1FhTsaNAa4h69XxVtJbRjNAD4dnpsm8Q4NULqKjPFUZJkN1N+eLB6cumW0Xv3pbs9o5UjJw=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr2648904ejg.482.1614957186080; 
 Fri, 05 Mar 2021 07:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20210304123951.163411-1-joel@jms.id.au>
In-Reply-To: <20210304123951.163411-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Mar 2021 15:12:50 +0000
Message-ID: <CAFEAcA9jux7H2cAwgrndvUv5=fivgQwbWDUEbU7rv7xUb=rz4A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] tests/acceptance: Test Aspeed ARM machines
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 4 Mar 2021 at 12:40, Joel Stanley <joel@jms.id.au> wrote:
>
> v2: Fix ast2600 test, thanks C=C3=A9dric for the review.
>
> This adds tests for the Aspeed ARM SoCs. The AST2400 and AST2500 tests
> use OpenBMC images from that project, fetched from github releases. The
> AST2600 test uses a Debian arm32 kernel.

Just a note that I'm assuming that C=C3=A9dric will gather up the
various aspeed related patches that have been on the list recently
and send a pullreq for them. (Having been on holiday my to-review
queue is pretty full so I've just ignored anything aspeed-related;
let me know if there is anything you specifically want me to look
at, queue, whatever.)

PS: softfreeze is 16 March so a pullreq on list sometime next week
would probably be the ideal.

thanks
-- PMM

