Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CF63DD62B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:58:38 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXWf-0002ZJ-3s
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:58:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAXVP-0001rA-Ka
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:57:19 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:56063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mAXVO-0006hH-4E
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:57:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id x17so4103225wmc.5
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CnybaXaXRXuXzr+hZu8XpTrvMXCOABG1P6Qfhb+BmoE=;
 b=Sr5QH91mlmN1jqWWDkGfwyulWOmON7Mjk33PgfnSr9j5GMdqO1go88n1v1Yo0+Ki45
 /j+7gx6tRp04HvzMPv6xmOyNEJAsaYEy7RxTt5tThoUPLs6ym/OhkR68Y5zFN12XQXSq
 Rc0DPP+YBWfnkNDf4VNudhMLIyNUQgmWTrRyqEb2rgTcJlP7pHr7hgosL9a2N1jvSQry
 od0Xq1q1dyqNM6uD/DuAiIEIL6ASB63JsOAL4Gr8vCklcOGMVnI12qi0rYIi7cUv6pNb
 4UCvm2xIk72iXrWz5fokLooLE70fhPTGqvNiuIH5fQ/gv0caFN38wokN915mYPnNZdtc
 HyIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CnybaXaXRXuXzr+hZu8XpTrvMXCOABG1P6Qfhb+BmoE=;
 b=eTVcHx+ZxkZf0Vz3qwuqvflOZgl/MMM2YzSxHuiWnxfl5BMzkP6NOluiMBj61PKJxc
 8FdWVaDE17Td7XZMBg17OwZpI8Htm9ojSSTCTu2TXaBXytp8qR/T3NqxzkdPTE1sibOQ
 eypP8laFdIbhtj9qbAjSEDlBx43Z1zh4w5+ovYN1LbkNEZi9WKPbs4Yca8zKB3nqu9Dg
 /P1z0nBI/wDb/Gnxo4kzcOZ04VImr5n3UDYzrOXHLeqIHeeHFG9EOYSraLe2Rp5uPQ1T
 eXaMCGPXBBTUJhxa2rPhwW1RZz1Isi6YIFuYl/FRvGrbe1bbQtoHyQyBAPtslxJOMjQY
 L5gg==
X-Gm-Message-State: AOAM530xYxYzqdo0JEO1svR7/1RompiOQJH+6bthF7Cznx4YlrHhnPqz
 XordrRn9hWqgl+sU2we0s+r5iA==
X-Google-Smtp-Source: ABdhPJxKLcYrdwE9cZP5kCynBeinee0P9XgacBlW1UzNomRaMYho/3erD3drcCEYUlIOGSINpy5Wzw==
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr5713878wmq.60.1627909036275; 
 Mon, 02 Aug 2021 05:57:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id b20sm8341103wmj.48.2021.08.02.05.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 05:57:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 09AE61FF96;
 Mon,  2 Aug 2021 13:57:13 +0100 (BST)
References: <CAFEAcA9cMZoj18gq7Ksv5PRoU1wRmXvW_e9UE73C_MEB7wTroQ@mail.gmail.com>
 <YQeu+Jm2Q0NlQ2Im@redhat.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: "make check-acceptance" takes way too long
Date: Mon, 02 Aug 2021 13:55:44 +0100
In-reply-to: <YQeu+Jm2Q0NlQ2Im@redhat.com>
Message-ID: <878s1kgg2f.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, Jul 30, 2021 at 04:12:27PM +0100, Peter Maydell wrote:
>> "make check-acceptance" takes way way too long. I just did a run
>> on an arm-and-aarch64-targets-only debug build and it took over
>> half an hour, and this despite it skipping or cancelling 26 out
>> of 58 tests!
>>=20
>> I think that ~10 minutes runtime is reasonable. 30 is not;
>> ideally no individual test would take more than a minute or so.
>>=20
>> Output saying where the time went. The first two tests take
>> more than 10 minutes *each*. I think a good start would be to find
>> a way of testing what they're testing that is less heavyweight.
>
> While there is certainly value in testing with a real world "full" guest
> OS, I think it is overkill as the default setup. I reckon we would get
> 80-90% of the value, by making our own test image repo, containing minimal
> kernel builds for each machine/target combo we need, together with a tiny
> initrd containing busybox.

Also another minor wrinkle for this test is because we are booting via
firmware we need a proper disk image with bootloader and the rest of it
which involves more faff than a simple kernel+initrd (which is my goto
format for the local zoo of testing images I have).

--=20
Alex Benn=C3=A9e

