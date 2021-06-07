Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EB039E2E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:33:00 +0200 (CEST)
Received: from localhost ([::1]:47770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqIBP-0001Wx-0i
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:32:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqIAU-0000Vl-AQ
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:32:02 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:54247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lqIAS-00066S-QC
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 12:32:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id h3so40039wmq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=gygksKjKocTGUfCOjlXJFfSmVPj1HsKdwDVuc/hHyF8=;
 b=t/6lPu/9jo+IpI3DlS9OzPWpVcjhqDlatKbrtB8CnWF6wGhfGAst9Htvhh5OPy/xAI
 +27NiO7IQiyvKA0O6ht9tM9aP+zbaQuwU8fCDbScMhbiLBLbgl3X2RO4t+QGdxRe6k48
 0gqTfbwsRCPIVpbwsuM4aPRNqS7FGDo/H64GEwroevmLk3iK1Dw1TcmhKymxSvQSXVDd
 y1BMZn/elVKjwOtBUXItPd4vCnXUJHxTghcmCi+j+B8dByguouY+uVuNSl3bZOk2Qlsf
 0Ohd5Q/dwTjznvWAstxrFvglexWNRoFmOkBYFpBiv+ut7LIvhcZD7ctgOhnErTsYOkOk
 MAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=gygksKjKocTGUfCOjlXJFfSmVPj1HsKdwDVuc/hHyF8=;
 b=FMclMFbJyJM8NdbgmWT7USqBQRFq8vL0YRkHzum4h4ufhfwiS0lqH9TtbZjq+0DMwq
 hBt6kJ5Gtr3+WAwG9NVTXX0xj80lL+Zi4gAntePeIiZXEVQI3/bj1/GNl+30awVR/v2k
 2SrrBNPKnGb8GyxnLSFB3LIgoDj4EQ4JUhQcm4SDpITbfaFmhkNgtOFo92YOInJQSvc8
 4HTZXVHb2+hFtbzxYBsD5jjROSmpynNv8tyOSt0mC9AmXkQvmYULuSrgrrmUp9sFNS96
 IoNZzt+zUxu5EqFGCP5cGhOz5hMwJbCJV0LdCJ/NHH0kDUpZAHYefxXwlsbDPCipmuUj
 W4+w==
X-Gm-Message-State: AOAM533kImUx1cViAbarpwt+PWpqYKyiSBrpmsnyecUeI7Y4pb5vsQMI
 ZRW8inFhH3kxBPtaPiCnQu/Uvg==
X-Google-Smtp-Source: ABdhPJwqjtOMwD6x41UiL58A5jm0MXTV1/98Q5exyq+cxmRZ8htQ0aUGSbtudJ/pXsHp/GdRRZDxlg==
X-Received: by 2002:a05:600c:c7:: with SMTP id
 u7mr17854472wmm.178.1623083519349; 
 Mon, 07 Jun 2021 09:31:59 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 32sm18382561wrs.5.2021.06.07.09.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:31:58 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AE70A1FF7E;
 Mon,  7 Jun 2021 17:31:57 +0100 (BST)
References: <20210527041405.391567-1-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/11] softfloat: Improve denormal handling
Date: Mon, 07 Jun 2021 17:31:04 +0100
In-reply-to: <20210527041405.391567-1-richard.henderson@linaro.org>
Message-ID: <87sg1tmy9u.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: mmorrell@tachyum.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> This attempts to fix the x86 denormal-exception flag, which is the
> inverse of the existing float_flag_input_denormal flag.  I have not
> created a new test case for this yet, fwiw.
>
> While auditing all uses of float_flag_*_denormal, I found some errors
> in target/rx and target/mips.

Softfloat code looks good to me, I'm leaving the target specific stuff
to the arch maintainers as I have a hard enough time with just one
architectures FP vagaries ;-)

--=20
Alex Benn=C3=A9e

