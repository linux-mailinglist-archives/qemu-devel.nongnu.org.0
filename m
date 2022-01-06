Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAA6486901
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:44:42 +0100 (CET)
Received: from localhost ([::1]:43394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Wob-0000uW-A4
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Wlm-0007aV-3Y
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:41:46 -0500
Received: from [2a00:1450:4864:20::32e] (port=55974
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n5Wlk-00062J-MK
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:41:45 -0500
Received: by mail-wm1-x32e.google.com with SMTP id c66so2320557wma.5
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ah5wxiQ0AgQh1F/khNBb0l2wx0jcLCWgwsTaSKGpxSc=;
 b=vHehU4pSaJCrCT+5RZjAgiNTyvANHm/zKNZCyPjzraJI4hD9sLG/77EAJEAuHm2JHN
 lUBQTZJHX/NTrR13NtfVw1R1ZsXSyWfUvEhtZhTlpREV7LHkjYaN/vuLFCZYDaexvbkN
 nO/1iHpO1MUdgiJ2vylzLqVRm0SFR72oOWHpq6zYN9CpNzt77tIzxTIhNop5sTEbpmot
 UyiN3cznN64n5cjKRYRtmntu+Z9wL0it3bi4QWT4G4S2f/X7jSuoMAXg5HoU88JRf3f0
 S1hYhbx8i0VgVNhlIkMb1EwwzL4XT6CHl/AJC94GstQEOPUXsIxYK/XHfIbauwW8MN5C
 GuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ah5wxiQ0AgQh1F/khNBb0l2wx0jcLCWgwsTaSKGpxSc=;
 b=EV02vA3y0kWm58+5XgzLWOKbxqoxtX7jFlo8HJ/y9sxhWAsBtaR4LRC7UdSh2g//aJ
 qvJ24N/lHGT7YbjvjX7DJXJfGaaWb8eXnA0/qAWTavuGhpUl1IGjwQofH8PlOVkqqtgt
 fwAW+q8QretSte1Z8/SFUqXdqQI/I9E0VYkKVG+L+jpZKi2SJIIpD3ZRQ6wW2J1j1XAc
 7xRM0uz4SvyTWZslTGXgoxPkNDYnBYuPjMabih6Ki4P1mbcYq7Ws/lyO2E0ZxYu4pefq
 VCMBBf5kwMH1/OkuR9uncxUmKTc0H0sXzYpccQoQjO7c8StVANbZw1cDQFY0ZRuPAXOi
 HdPw==
X-Gm-Message-State: AOAM530YCi2n0/+pSaNFUj1bw843Ui1QioKQDdS4vy5N+MVu72CTA88C
 TPPtciFfw59LdbCVTPxowa8F1M5dWwquKDVNgW1o7w==
X-Google-Smtp-Source: ABdhPJxYmjDnkOLDHegFcXMVKeO5tVouNMhjD5WSqaOKhDX9CKaUbCjHf1RcFmZyzYy8JkQmVL01Jtwfm2oxqN4q62k=
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr7898850wmh.133.1641490903211; 
 Thu, 06 Jan 2022 09:41:43 -0800 (PST)
MIME-Version: 1.0
References: <20211210083034.726610-1-troy_lee@aspeedtech.com>
 <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
In-Reply-To: <914155fd-646e-b551-9c54-3b132a5abfa5@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jan 2022 17:41:32 +0000
Message-ID: <CAFEAcA-n+CDyqsLE=fyc2+LRqMFYiFOBkb8MShuUGRYsu=p2FA@mail.gmail.com>
Subject: Re: [PATCH v1] Add dummy Aspeed AST2600 Display Port MCU (DPMCU)
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Troy Lee <troy_lee@aspeedtech.com>,
 qemu-devel@nongnu.org, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 10 Dec 2021 at 14:05, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 12/10/21 09:30, Troy Lee wrote:
> > AST2600 Display Port MCU introduces 0x18000000~0x1803FFFF as it's memor=
y
> > and io address. If guest machine try to access DPMCU memory, it will
> > cause a fatal error.
>
> The Aspeed SoCs have an "aspeed_soc.io" region for unimplemented devices
> but it's too small. Anyhow, it is better to have per logic unit. We shoul=
d
> change that one day.
>
> For my information, which FW image are you using ?
>
> > Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>



Applied to target-arm.next, thanks.

-- PMM

