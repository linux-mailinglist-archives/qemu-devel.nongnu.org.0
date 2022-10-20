Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D2606736
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZaR-0002lg-CX
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:44:09 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZaJ-0004Cd-T2
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZa6-0002Yq-Or
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:43:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olZa5-0005pE-6V
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:43:46 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so233197wmb.0
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5mcrTPtG+Hnug4mYT11Dbe6wqhC5jV24Oopg/d1mpTY=;
 b=C98pw7XDTI2fQzwp2qfHXFMdQj9csoiCJLdOnqxUktfzC2aq2cyqKHkSSaQcvbo/ky
 tPLUI69kSWfOXGr/89h3rb6O3A0VttpOWOjgtnHWFimiAhkUvrWUPv+PlkBE6Nw/U7+o
 J9SfOE3DNLyQHAQAHiZ0aFlmuvgBJV8XtAL9mrMjNrbE/YDpU601VIZ0HE8Ivm3eMdvT
 cx3PDzxbehiZkz0+jSpigw8+3jjcBKwWDHHMU+rqatgdkpAHbgMCHoC8VZVomgDTLsen
 RnSMCvUA0vHye+q4r+axKikG/bkCwvV03h8tCJQ+7DRl/wiw/uHfBsh5E2ij3sjFusox
 zK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5mcrTPtG+Hnug4mYT11Dbe6wqhC5jV24Oopg/d1mpTY=;
 b=wOAX9e2cZG3GJ6caqQYKrk850x31uZhIny7jl/EMZ7Ik2gSSFrdMgwSDnXhbQrR9zI
 xyURQIfj3447LeU2MRJ/ZlG4frvfRCEtVfzQLqfkbni6kAIKF8wkP8K5+UYZErZKsnUi
 8iLruWAj57sjYL/UINHHBfBq0WqT1NStNdJUhFhnLQQm5skiCK+IvLHBUvwPzZxiOc2H
 yKtaHGRH5UXzrzB/lqmDGeIy3nqnDrjUeu87hwOvmd5j22Fr9Zu6UFb+VXogiCl4qR1Y
 /baTvMF8K+qnmR7CSKhnq2x5b5ggUUQzU9JyHbW6inHmMNpJPYLJOyu5CT9FjKuFk+Gn
 tncA==
X-Gm-Message-State: ACrzQf3oNSn02JpaJ3G9xzeRBLOiVO5orXNEwNKXCdxDKKvCLejUPRBc
 SOQf7oLY807TQyfYGdiW1VVoiQ==
X-Google-Smtp-Source: AMsMyM4Bt8eOreBJGBGl2yab68y89mE7BiQ9gSJRYIhF29s95z7gMfP+/PrhiSkMP4BGNzZnUDNt8g==
X-Received: by 2002:a05:600c:220a:b0:3c5:df6:2f3b with SMTP id
 z10-20020a05600c220a00b003c50df62f3bmr30189914wml.63.1666287822570; 
 Thu, 20 Oct 2022 10:43:42 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b003b47e8a5d22sm445391wmo.23.2022.10.20.10.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 10:43:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A40621FFB7;
 Thu, 20 Oct 2022 18:43:41 +0100 (BST)
References: <20221020123506.26363-1-ani@anisinha.ca>
 <20221020123506.26363-6-ani@anisinha.ca>
User-agent: mu4e 1.9.1; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Cc: Cleber Rosa <crosa@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin
 <mst@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 05/10] acpi/tests/avocado/bits: add SPDX license
 identifiers for bios bits smilatency tests
Date: Thu, 20 Oct 2022 18:43:36 +0100
In-reply-to: <20221020123506.26363-6-ani@anisinha.ca>
Message-ID: <87wn8u75ma.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Ani Sinha <ani@anisinha.ca> writes:

> Added the SPDX license identifier for smilatency tests.
> Also added a comment indicating that smilatency test is run from within t=
he
> biosbits environment/VM and hence is not subjected to QEMU build/test
> environment dependency fulfilments or QEMU maintanance activities.
>
> Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Maydell Peter <peter.maydell@linaro.org>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Michael Tsirkin <mst@redhat.com>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

