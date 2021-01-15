Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24F2F7D38
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 14:54:13 +0100 (CET)
Received: from localhost ([::1]:44988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0PYK-0001Yb-V8
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 08:54:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PBr-0006pZ-Hn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:30:59 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:40777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l0PBp-0006x1-Kn
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 08:30:59 -0500
Received: by mail-ej1-x631.google.com with SMTP id f4so13291183ejx.7
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 05:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=d/NTYUmQSF20CR/GY0pSGo3IChBB2r0bG1ve95A+CWk=;
 b=jz+wA7syNehWfUDMrnmCoHz4Vt4AKmawzBnsfsu1PJLEK+qtMm+okIaGgtqJ6ZT05H
 UTzLLBqSSUewK16gQnVPS86S1WDe5KiyiRQe8EZ7hkLNSKINDccdaGErhPx8ZQuGJZNC
 OfK6+sD1tDnehgV40npchXCTch/WxO7NC1UYhPUny726maniMi6xVWdZUATRXnTEx4J8
 QIPlllOh3H1XoH06PqNIPLUeBepov5+0VwiqE+RpqjT1JzPPtInaPnO/rSWGB/Tc86oA
 siobpaN5dvVscA8JRHjVsnPa+3ZAZ8foS6oAjhtR0QBHmLlVWvrU8OKYFGkUEXeqO7bi
 q2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=d/NTYUmQSF20CR/GY0pSGo3IChBB2r0bG1ve95A+CWk=;
 b=Eiw6g30kjsOiad3Q/imuoIBaDaOMouoa9k0DWanhwzlMCqoiPNmryFm3gl+Hx1PvRo
 TAI5qoV7uDIp47C4NCTxVQYnB/zM3dJJV8J0BQywUaRKiIdk+scnYU0e2KYiyA4sjYB2
 OqpfvnbAgGNTFKzgwu9qVo8+nZesq/6MC1uDRTiXTHNtoax782+sgkzffq/114cuVHHK
 nVXDp5zo4NR6oZqjrjDRbhpDCfmkEU1e4vUd1XVpJRIl4bidz9qaGn+5ucRfNVMjucgD
 Y0E1ExLPAO78TbXv4QYwZrzWbvWGQgR9l0V/ja9MWGWWM1uphWjlwH7y5wwUq8UYz1F3
 x9Tw==
X-Gm-Message-State: AOAM531bRjE7jtnOfQJHwqHgF2ykYr2Wf0dalg5WOqi7Fwp0kyJHKD40
 vCYWen8WKwM20rBez7IKCfEEOgrJu5J4ImqH8z16bDRWrMAH3Q==
X-Google-Smtp-Source: ABdhPJxqZrqY9MLMMoL+R5VNPOLN/geedSocHUVGZtNAsomJbgomRLjMJ2K6mJ0N+2YhMYmR7A2nyWjCCeowQIIXxdU=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr8917114ejr.482.1610717455390; 
 Fri, 15 Jan 2021 05:30:55 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2021 13:30:44 +0000
Message-ID: <CAFEAcA9GKLz67ybf6MO2naukmqB3PNHhe0wEgxE290ojryEJ2w@mail.gmail.com>
Subject: QEMU 6.0 release schedule proposal
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I've filled in some proposed dates for the 6.0 release cycle
on the wiki page:
https://wiki.qemu.org/Planning/6.0#Release_Schedule

Summary:
 * softfreeze: Tues 16 Mar
 * Hardfreeze/rc0: 23 Mar
 * rc1/2/3: 30 Mar/4 Apr/13 Apr
 * release: Tues 20 Apr, or 27th if we needed an rc4

(Easter weekend this year is the 2nd-5th April.)

Any objections/alternatives?

thanks
-- PMM

