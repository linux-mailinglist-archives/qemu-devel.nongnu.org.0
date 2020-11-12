Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFD2B0C9C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 19:27:53 +0100 (CET)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdHK4-0000tD-UR
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 13:27:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHIO-0008Em-S5
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:26:08 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:55365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kdHIJ-00025o-WF
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 13:26:08 -0500
Received: by mail-wm1-x332.google.com with SMTP id c9so6102700wml.5
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 10:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=0E2/WczwIoZzRfLgQySSgpEssgkfWaRttbVRGO+iEPA=;
 b=qhg9RAA7bsVOdtbF57431AlEdU2RpSe7/+WEWsI3c0UhS29IdWrYi9cJdSmZVJgNSQ
 Iy4K1l8cIceX3QAfhrAJyqgrxypvWsbK/jHesWqXlv2oHjACKQuPJXD8C+LElvZLD4S2
 UQ47CjS+RUjV/4mzkw3y9Si6tU7e79opBlhkNjVhfpw8EFjZ45gtYcEP5zwQ3fdxek92
 wjYA30HaZA3WT8sqgo0+voHNHmgWZp12vt0hQIS3n3bk6KMP38Q7jBfASG3jh5xJasz4
 AgsEdL2yvNPcJujTaEoTrPkcUW+oCQPnxWf3X8/axdAo+ssWKveqjeBeQfDkAPN2UuhK
 ZOyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=0E2/WczwIoZzRfLgQySSgpEssgkfWaRttbVRGO+iEPA=;
 b=d7L+hOyU4j1K6XX/pt9G3VfEX9rDky/qFKEzJbc6Nbc4qINO33QKbGdnpXvSmsQehF
 WHjULormYKrQob4R3twV+dynAKay7ufUMLjBbVAv+vatqahLD4/sU0BJjCMMonaa6aay
 sJQgOx8olLFI+GPS3jTOZJdhq4L5Wg+y7/qT2ZG39DcfHklwKLMjiXVBGb3v8Amf5a+T
 XJYUk4E+sTnF+jH2YDkvpdt9FS3LcyhpNCqmki8aJX5O07Zh2Se01YkzBpRelPSA112N
 6TZIBPoEitQzCIyFuhTfF1x/DwujX8VN+6AhxAAfyNBiycKOX0HgFaI82O0MYOD+O1a+
 dRnA==
X-Gm-Message-State: AOAM5324ccYK1G4RfW7xI6vRWGyDPIOZLmmADbmGUGvf9wSbki2Fwi+V
 47p8GW+2pWJzW8KC/gAMpEFoyr//vbFbXg==
X-Google-Smtp-Source: ABdhPJwvyf1LK3QgD7r3fdBHvVExqfCDpskdhyLe8iGvN/GnPzd1qqU5wql5qBwWAeJT6qOVXXsEzQ==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr937138wmb.180.1605205562462; 
 Thu, 12 Nov 2020 10:26:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o63sm7438235wmo.2.2020.11.12.10.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 10:26:00 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 179A91FF7E;
 Thu, 12 Nov 2020 18:26:00 +0000 (GMT)
References: <20201112144041.32278-1-peter.maydell@linaro.org>
 <20201112144041.32278-6-peter.maydell@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [for-5.2 5/9] docs: Split out 'pc' machine model docs into
 their own file
In-reply-to: <20201112144041.32278-6-peter.maydell@linaro.org>
Date: Thu, 12 Nov 2020 18:26:00 +0000
Message-ID: <87v9ea5t53.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Peter Maydell <peter.maydell@linaro.org> writes:

> Currently target-i386.rst includes the documentation of the 'pc'
> machine model inline. Split it out into its own file, in a
> similar way to target-i386.rst; this gives us a place to put
> documentation of other i386 machine models, such as 'microvm'.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

