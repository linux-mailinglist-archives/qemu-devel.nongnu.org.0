Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACFA2EBF33
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:53:05 +0100 (CET)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx9FI-0005aC-IV
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:53:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx9Dg-000571-IL
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:51:24 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:54525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kx9De-00005o-Oc
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:51:24 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c133so2489220wme.4
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=iboVhOXtailWVcMx73OZ2Y92upq0bGuFpk6vWCXvnQo=;
 b=btRcgiBZh7kFoCZE7hl+pi/Zz6Qkns6lSwL1QrUZPbFRawvrpnZCWOYiT9ZBhZ9/Ns
 iIXHIJt1FYjgpZ/POocyIptME2pkfScd4BvUOMj7T+GDwB6ztmMoW3c2+Lf24NtzUuR1
 iSBcgCjPKvNqf9aEWpW2eesY7gmOlJcjvYFYMUU5K4+y83VK/CWwurkYHNYpHPfqEmy4
 Xx+I0rZNTGSRWVkHRbBx4+Z6OgGHkw9SXxEpGEaWLRQS8DlxzKghYDZ/sjiauaGxt0Dy
 iA7d4mDXRDuQxl3UfxzKU8VTHVjrev8m5Z+C8LzYgFnHseo58n8QskCfa6uRdL6+fIGy
 sOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=iboVhOXtailWVcMx73OZ2Y92upq0bGuFpk6vWCXvnQo=;
 b=BJ1mOenH+mUFSLw2cZe5BCRZuv4Ti+Jk22RbNo4w4GgSLRrp74URmcT6iViGR2RL1r
 uBvS+AU5HWalRds1aKTHua7MHvyDtglyOUws6c2bM5Rds9bxrn5HMQApV/kN9Or++yL2
 bsSbnYs0/962SSuxk+7iE9X27JRr5j3dS4WJAC8BVDfXxaEveirGjYFolHroSQvO1Wyg
 ewih7L4WP26tluxpOVTffY8lGtkX8BexHOknIaV2T/8RUc5ZQGyTrg7lI6HBlQaSve8k
 psx189cs6EzGKVkLYDUXLWZ/dYRjtWB2IGTAjyMW4sSzSZUH9hYEfE39KSkbmfidMvg7
 wdbQ==
X-Gm-Message-State: AOAM533YTmlAHuAOlZG3jUKkjTFqzlQU3HjO7m+h8mQylvYliMffKXOa
 LbEqw0rOFG9I4ZQzOp9TKbkszA==
X-Google-Smtp-Source: ABdhPJwbMSr6Lf3J6o2F126EmC7z8t0bdfqpPlVYOJbRoi04EImA5x7Ro0tmNbRZ4qYHphjKc+sZXg==
X-Received: by 2002:a1c:ddd5:: with SMTP id u204mr3712866wmg.174.1609941080687; 
 Wed, 06 Jan 2021 05:51:20 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id v11sm3251743wrt.25.2021.01.06.05.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 05:51:19 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CB17F1FF7E;
 Wed,  6 Jan 2021 13:51:18 +0000 (GMT)
References: <20210106114159.981538-1-berrange@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH] cirrus: don't run full qtest on macOS
Date: Wed, 06 Jan 2021 13:51:11 +0000
In-reply-to: <20210106114159.981538-1-berrange@redhat.com>
Message-ID: <874kju2my1.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> The Cirrus CI macOS build hosts have exhibited a serious performance
> degradation in recent months. For example the "qom-test" qtest takes
> over an hour for only the qemu-system-aarch64 binary. This is as much
> 20-40 times slower than other environments. The other qtests all show
> similar performance degradation, as do many of the unit tests.
>
> This does not appear related to QEMU code changes, since older git
> commits which were known to fully complete in less than 1 hour on
> Cirrus CI now also show similar bad performance. Either Cirrus CI
> performance has degraded, or an change in its environment has exposed
> a latent bug widely affecting all of QEMU. Debugging the qom-test
> showed no easily identified large bottleneck - every step of the
> test execution was simply slower.
>
> macOS builds/tests run outside Cirrus CI show normal performance.
>
> With an inability to identify any obvious problem, the only viable
> way to get a reliably completing Cirrus CI macOS job is to cut out
> almost all of the qtests. We choose to run the x86_64 target only,
> since that has very few machine types and thus is least badly
> impacted in the qom-test execution.
>
> With this change, the macOS jobs complete in approx 35 minutes.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

