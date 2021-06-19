Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DA3ADB05
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:07:34 +0200 (CEST)
Received: from localhost ([::1]:54172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueRR-00063Z-Cs
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:07:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lueQ4-0005Nb-EG
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:06:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lueQ2-0007Qb-61
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:06:07 -0400
Received: by mail-wr1-x432.google.com with SMTP id y7so14397666wrh.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=vS4VqGyuaiTYtZGZAIq8iemRjD3nnEHP7d51UVhhbVg=;
 b=BibkKWs2uxfFHBWwcOImyQKjmm3Cqrev6P1V0uRKacWTSaJ/irkCkaKR8AKjz7tJQy
 dbfgP7MokTusMB16eLzH/iAX094seo+forKBFnT49oiS7KOu4ke6B4PjFxRTMbMW4k+u
 A8Ap+dQIWTiEY79tDcu+gUwO5syaJ++ft6J9a+a6MOZk7bVnwrIb/xcjxPi+tA2BwpOk
 NSaoR6tSkyjfUMoloP3AglzybLPOx4Q73aBhVVANqGm/KHHKrz4GLVIrqX6ORLduMFyK
 conmmjF33zvGE0JhaoTiK5cK5UMVNU6JO9CPrlJD3tTeSdfIkVaTnfONocwhb5KCgwpi
 RW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=vS4VqGyuaiTYtZGZAIq8iemRjD3nnEHP7d51UVhhbVg=;
 b=deR7Kwt/brjiEPX+GiffjadR4V1GDC7Rq5vACDUkc/3wUaF/OFU4q9Vom+7XUGx/V8
 mRfm/bGId7Wg2Ig/IHXBVo+qT62X4AqKHM65DOPew+qGfNuxfqJ5Dpje781mhYGUgD/z
 AT52Ib0ZC5P2BaETTgwqCY2ELVzrGTRr9zeBUExe+7doIrelIAhWreUICSD0+shBfI4S
 e/Kd1nNSBs0yPQeovYjp/fB+xCC9NHXFagH7GWDFP6jjixRL9R1/76KR8kVIDeE7FgYA
 zvgkAq0AOvH7jDbPCk1YkRAN/GoPTczHAYN9i+nuencV0nldszymwfWKGNvU0bO1PQeF
 hR4Q==
X-Gm-Message-State: AOAM530rGdKkC8Im55yHV+/49Wf0bKradESgV9w/cbHnmN/Qdqym1E7v
 6V9la9s1b97zqUSKiyfKlI+Z/w==
X-Google-Smtp-Source: ABdhPJyy8aDYar0kppir4k1+smcBxHqWvgjWJGmzWXqjLbZ3HCnqufN+O+Jt1T8gE9kK7w0TTSiqxw==
X-Received: by 2002:adf:f68a:: with SMTP id v10mr18841079wrp.58.1624122361680; 
 Sat, 19 Jun 2021 10:06:01 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h46sm13789295wrh.44.2021.06.19.10.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:06:00 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 85CE91FF7E;
 Sat, 19 Jun 2021 18:05:59 +0100 (BST)
References: <20210619154253.553446-1-sw@weilnetz.de>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] Update documentation to refer to new location for issues
Date: Sat, 19 Jun 2021 18:05:54 +0100
In-reply-to: <20210619154253.553446-1-sw@weilnetz.de>
Message-ID: <871r8x7pjc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Stefan Weil <sw@weilnetz.de> writes:

> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

