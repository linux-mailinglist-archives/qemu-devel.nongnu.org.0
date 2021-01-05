Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CD32EA74D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 10:28:52 +0100 (CET)
Received: from localhost ([::1]:36942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwie3-0002BQ-I4
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 04:28:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwiaq-0000bi-Kr
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:25:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:52727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kwian-0000ut-CL
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 04:25:32 -0500
Received: by mail-wm1-x329.google.com with SMTP id a6so2360661wmc.2
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 01:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HiVlhUaubV0ph6MKOkNtmjACLsI4rkw+uqxlBftPriU=;
 b=lIPL3IMPIAfirtQ8/zcsXQ32zJY2IUM5Rsn13AsVjKTGDRWQlx8CnHHqMG3Veg4aq2
 gcUEUHuKvA3iA6dDL2W7HN0qC15Zak+x3NdU6paLpC0eurRfhnFqJuI6uGJuJ5GOD/+d
 oempodTIzhZl6WK4HpSHHuhBzQKt4E027cUyStEEOi6kx5VqWslxwCu9tBvcAWw5TbP2
 zu2j+XkUJkoQHfRXr8y8xHQk7XMX1iPzIBLa0gi7nAjA/QYjHZ2kNZzmirmBYL4+zfLm
 zPpFQb10FAd/4OHCF2erad7Jp8Wbgm6SLe/7Xp/QwFivECHR/HpGqcEeiVkoGC7+eMqo
 SYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HiVlhUaubV0ph6MKOkNtmjACLsI4rkw+uqxlBftPriU=;
 b=dB0/jytkHns6aYn775dgbgv/X8OYghC+1L0qX3Eb6XzmCp+qBllr6cTRdelFhcYTXZ
 sU3gRY34JsY9VZscKMYn4erOaL39F3mUPVQbml/sHFTl0g2gew0cad/msGsBhMM55d0u
 NXQ0clGrhBFpnQOE5d+DR6fIvmdGsY+myx8VV4JgCRV9moAfv/Ue72Vma3n7XqkFv/zf
 jvvk8ZFbIRyKXLVgA7FbfONIe3pK/J5EO4EMKsfpq3XgMiDu2eonz0e/GJ7quIzUivfw
 9KoQcweXt6IQ0GAcafxH0zWUyivyOBJlFxQyiiYz5/SiGcE5gNEGWtwrmtIK+toXG0ns
 afZw==
X-Gm-Message-State: AOAM531RfKZyBHavPlS1yxm2bdjmrH5wDjhDvu33jv15BmLQO/dHmHKN
 tC3rX1w59HM2D2XwjfdbKNRD5w==
X-Google-Smtp-Source: ABdhPJzm6FzTCx8rn78se9tVxX2xj3a8GtB09q8PBnxtCCCvKsxTPTXZ/Yg2wTo6wHwjgO1CrKWsnQ==
X-Received: by 2002:a1c:6402:: with SMTP id y2mr2530728wmb.43.1609838726376;
 Tue, 05 Jan 2021 01:25:26 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y130sm3443977wmc.22.2021.01.05.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 01:25:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C2B0D1FF7E;
 Tue,  5 Jan 2021 09:25:24 +0000 (GMT)
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Bin Meng <bmeng.cn@gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
Date: Tue, 05 Jan 2021 09:23:41 +0000
In-reply-to: <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
Message-ID: <87lfd73fcr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
Cc: Bin Meng <bin.meng@windriver.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Bin Meng <bmeng.cn@gmail.com> writes:

> On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>>
>> From: Bin Meng <bin.meng@windriver.com>
>>
<snip>
>>
>> (no changes since v1)
>>
>>  hw/misc/imx6_ccm.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>
> Ping?

Looks good to me - Peter should be able to pull it into his tree soon.

--=20
Alex Benn=C3=A9e

