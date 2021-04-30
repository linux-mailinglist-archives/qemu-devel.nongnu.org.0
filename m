Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9C536F870
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:27:13 +0200 (CEST)
Received: from localhost ([::1]:41568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQMa-0002Th-UT
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcQGh-0007VE-Sw
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:21:07 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lcQGf-0001lS-Cy
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:21:07 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so1406167wmy.5
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=ej1gqCwQF2cVfApsF2xiIaUNPs6eeK4n5PZhww4OHys=;
 b=sZwL2ky+eYq/tZUhVDeji0c86BIfkfvcqf5hYweHFPKli1rTE8WhxSQJ+zPETq/a4l
 XnjBa2Lfb5XuwYmy2OB4yl4HSIjGWFum07bE9AyIp8praC/ERcTQNwjnSRgelm6E4O4C
 y9H0NHmtLWmhYeN9kf44LayuPci2LrT+JOX2Mi1EyPuJehZZ3PFW4WgkboeZSoTkwH86
 MLZ/FUBdGpOXh8XzeCd6P0qA7KXB1+xptafy72PlRzFuW1McJsHc1X/BoW0WwFeQwRi2
 lBU3SQRp3LdZksP+zigMpG+PdBSZH0gN/ATOmrwsFSUjVW74xEwY11Qgg+7b+TLdeL3/
 /h/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=ej1gqCwQF2cVfApsF2xiIaUNPs6eeK4n5PZhww4OHys=;
 b=HK55CxsKsSW6/WghUmK+iMwEMjuHHs1bm0Oko4E+uhmKi5XxzF8jtkCFu1Bk/+Pmis
 B1fzsRv4v7saq78d1j97oRxJx8/vY1M1VaeYqK1X4RWKOp+qOB5UIPgfT9jrR0K2zG8G
 wAw/q+PjTuDmwb/YaUwCeAtiuCrBHY1voEzfz5mKT8w8EUt5fgh0CbT3982yGOMVzvWc
 Tt0h3O1MwscbjFuxRwZmQyYMM80jX3joiU8m0yCMaztXt5j525NP5jWD15SZUI4LczS6
 c5ey9ZWcBcgPnmBX9WVqi1kRt+RJoZ9RwMqsanlUHzwYreq/TbRbcCYhlgPLwGzm3UkJ
 Nsvg==
X-Gm-Message-State: AOAM532rvRLh3Xz8q/41amLGI+N1D/W69fi6BTjrIS6pSpZGdw+cIhVc
 egttmakwc2eZz2Oh/3rQz6ogCA==
X-Google-Smtp-Source: ABdhPJzXYp10iMHfHFXyNXtXbTC4+23WL1i9tS6gIHYEuIaFKjQPlc0xN7lgbE4hI2tzCV7Yv1uNWA==
X-Received: by 2002:a05:600c:19d3:: with SMTP id
 u19mr15845909wmq.80.1619778064022; 
 Fri, 30 Apr 2021 03:21:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y8sm2015252wru.27.2021.04.30.03.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:21:03 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AAFB81FF7E;
 Fri, 30 Apr 2021 11:21:02 +0100 (BST)
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-8-philmd@redhat.com>
User-agent: mu4e 1.5.12; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 07/12] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for TCG
Date: Fri, 30 Apr 2021 11:20:53 +0100
In-reply-to: <20210415163304.4120052-8-philmd@redhat.com>
Message-ID: <87czucvzsh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?utf-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Now than we can probe if the TCG accelerator is available
> at runtime with a QMP command, only run these tests if TCG
> is built into the QEMU binary.
>
> Suggested-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

