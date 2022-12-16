Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FF564EE7D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 17:05:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6DCY-0008H9-Iy; Fri, 16 Dec 2022 11:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DBu-00081v-VD
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:04:18 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p6DBt-00034X-5j
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 11:04:06 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 b13-20020a17090a5a0d00b0021906102d05so2777936pjd.5
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 08:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=s6xqvl1N/w8WA5CqWiYCIQ6UHXZMfHvGMx6PwtIbVz0=;
 b=aw5om+oHfZsTv/bYZh3z0NjD1ZGa7kXYrHxqiKGTefo23TacT8Nldxxf9UnZExT7s7
 fv2KzpM11BIWEZSf4//mLYjqMaq4WXzhLR67xYQ0A/IbG+38N9TK/87ak+hjM+Oo7Gdu
 xFoRBdAAkrQmw+1vRHriEfd2/nmH53HJ0bsbCPGRe0BAJ3soWbHeGV3Pfr06GdhNjOnB
 i3LoUBXQmaNiIz6893UdyuxhXBp/dS22IkkpaCYp/Ld6NH2Bg70LXcxu6KK41E33m4kr
 H45gynI3LUb1V1GF7JW7ZTQvG5AJzAZR1w30jQve+mM7OJIuroVrgp+AlUEHgU/+Q4d2
 8d9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s6xqvl1N/w8WA5CqWiYCIQ6UHXZMfHvGMx6PwtIbVz0=;
 b=Jkg6lG51RKdWfMyKDvUCvkvh5o8u7xkcYx0g9IXjehzpOibysP62XrWv3izdUNH6x3
 7XN6mqwCbE1uc32hsr3jQJwVVKTs1szI5M1grzUXjJzgCGmakMOq48DYr5e9781RX4JZ
 nJoPOXSqbfzlJJfjGy+8nIGq3ddb5fTyWyJiyGKa5A824S9timi+qM5oLRbqjufSJKpO
 yrghuKQ/ZVevgEFLchmrpLzg58Qb2/fyXVn8Onxyo3GGOqgUBB4pWZFAjs2oJZPyYhCi
 1Vx85wz9oeYFf1J8u2Mo9xGedA4dOru2MEX6eYTFFGaSCZDNzyjWEHkv6zgQQnhKivhB
 xgBg==
X-Gm-Message-State: AFqh2ko8cis6zMiaH848Qr8AxpQh/y3OPKpgkgVJ1YTj7wyetbrb58PS
 sUMKnQtn0gFZVqY2AY1I9Rhs3ZFpl1g5EQcd3GOPVAk+V7Q7oYmP
X-Google-Smtp-Source: AMrXdXtr1ZLgLjFPhKSSSLC1lekZ89JhJ/UceJltkX6v1Ct9O5QXUf+3AkPy/NU/to9hDCLgBkzd2wgA4xeaGMnaTNs=
X-Received: by 2002:a17:90b:4f8d:b0:219:9874:c7d3 with SMTP id
 qe13-20020a17090b4f8d00b002199874c7d3mr661352pjb.221.1671206643870; Fri, 16
 Dec 2022 08:04:03 -0800 (PST)
MIME-Version: 1.0
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
In-Reply-To: <20221109170009.3498451-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 16 Dec 2022 16:03:52 +0000
Message-ID: <CAFEAcA9rhC60_pbe7vWLrdcb=42WSGPcaaoSyEf_Ew5S8f3nHQ@mail.gmail.com>
Subject: Re: [PATCH for-8.0 0/2] hw/input/ps2: Convert to 3-phase reset
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1033.google.com
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

On Wed, 9 Nov 2022 at 17:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset converts the ps2 keyboard and mouse devices to 3-phase
> reset. The rationale here is that it would be nice to get rid of the
> device_class_set_parent_reset() function, which is used by
> legacy-reset subclasses which want to chain to their parent's reset
> function. There aren't very many of these devices in total, and if we
> convert them all to 3-phase reset they can use the 3-phase-reset
> equivalent (resettable_class_set_parent_phases()).  Eventually this
> will then let us simplify the transitional code for handling old-style
> device reset.


I plan to pick these up and send them in a pullreq together
with various other reset-related patches of mine, unless
you'd prefer them to go in some other way.

thanks
-- PMM

