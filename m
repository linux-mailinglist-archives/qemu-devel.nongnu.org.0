Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B1C2A088B
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:55:05 +0100 (CET)
Received: from localhost ([::1]:35624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVo0-0004f4-Lp
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVfc-00029l-5h
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:46:24 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVfa-0003T8-Et
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:46:23 -0400
Received: by mail-pf1-x441.google.com with SMTP id o129so5503578pfb.1
 for <qemu-devel@nongnu.org>; Fri, 30 Oct 2020 07:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Js/kqOn2MPmlNJW1UthaEMiCLGmPlIWGAEB/p/esi/Q=;
 b=rWldmADR452LeA1UO5pshGM8jF38w23ArzavweMV6CO1OTwWrUkMwyTqZCputDKPXM
 NPkP90dTzugfhVTw2avcCxgdes93SjDOenkEQPYU9WhcOfKBePiAYstXTNIUlWkEUK+8
 m9BgpKRz89kCej192pcd2Dr4BOXVgNZb7WTtqZs8mebDL+8A+x0vwCDWxrb8EDke1Y03
 nCEqtB31SZXg/d4H9zCupw95tHCzaXScv3b/6hgnyGFTr+llNN6qhsyU86R3kiONcrSU
 5+uoyBMPCXnzHxdTMBSHJlTDqAZkCl46tmXhPJSLP0nz9rGjn6w6+yLJ7AIZRcKHT+0O
 88Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Js/kqOn2MPmlNJW1UthaEMiCLGmPlIWGAEB/p/esi/Q=;
 b=qpvh6xNOTUzzej5E+B+YKmt7baQ6+Sgz+EHuUgRfc0hsbqSUdC5HM4VqKcCFyXA5O3
 b8ZudK4Jn0w+x9mXKcmiJ0GI9Oa0fcTcxiXw9XgORxMXsDAhoL90WCxt9cMka4waSqc5
 H2QU6g1ihcgOz3dj0smi7AMO6B6+nQAnjtkxoxELxGCrWqJ957JTkvn+JcxeZhphbp37
 BxXPyd/nVoFeYgFjbfsMxLDZJMicqcInvRuqGk7MODhm0r+YzQOiyZPRZkd8uBFiY2jI
 D9zz8iDgJ58JpYP2BpuA5AZqrN1oVqtXwrfoseYHfNh/fTgXc+d0/TiqDB7VI3Emwl58
 4Naw==
X-Gm-Message-State: AOAM533hhJXG+2erkW7qKWHFyDvbsh6BH94ra/ets1AMq7fsCmt/YHTD
 WQl7+fi5UjMUsjjp6aB2tP59DqrE93Ez6hTkcs8YLA==
X-Google-Smtp-Source: ABdhPJwzMTZGoK9vv/g+Hu9xIAg0fytAi5lu2y8oSQ0GlEDJc2ffBID1T6aU5dUuXxVYqRWA7F5WOKHZmNBJaJeg0gQ=
X-Received: by 2002:a17:90a:4596:: with SMTP id
 v22mr3282840pjg.73.1604069180920; 
 Fri, 30 Oct 2020 07:46:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201022132445.25039-1-peter.maydell@linaro.org>
 <b073898a-4be2-3b06-96d6-7551a9d1a6f3@amsat.org>
In-Reply-To: <b073898a-4be2-3b06-96d6-7551a9d1a6f3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:46:10 +0000
Message-ID: <CAFEAcA-1rZQT=j48+hn_h4K4D8St_jYmiMU_UKOFvam5pQJ_wA@mail.gmail.com>
Subject: Re: [PATCH] disas/capstone: Fix monitor disassembly of >32 bytes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Oct 2020 at 14:52, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> On 10/22/20 3:24 PM, Peter Maydell wrote:
> > If we're using the capstone disassembler, disassembly of a run of
> > instructions more than 32 bytes long disassembles the wrong data for
> > instructions beyond the 32 byte mark:


> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thanks; applying to target-arm.next since nobody else has
picked it up yet.

-- PMM

