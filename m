Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C768964DCB1
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 15:05:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5or5-0001yy-3k; Thu, 15 Dec 2022 09:04:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5oqy-0001wz-5f
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:04:57 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5oqv-0001DQ-48
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 09:04:50 -0500
Received: by mail-pl1-x633.google.com with SMTP id n4so3307091plp.1
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 06:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yB1IXjwWh5r6tQC8XpKctOn2v3UQFDIuoBluosFZVc4=;
 b=ql9r9ZAlrm91I2R+lyKPmExkNxgtf65X6WaviB3zAUC/LYYkSq+fkEq8MPEmZujUNO
 ADzeIoNpt1DF3CZ7ui0rNcNcAN4BNEje2vn1lsig2WcPnhzPVL0JRNpxDVgvCoSmohR5
 Oy1g5VZaPW7vzctXsDVjsoNX882tm/kOeuNXXDYroVlMgpe4L+RkxaX2XHgfOSQnKCsU
 HqqjFT/s3NcFXv49Tt99KrdWYCoaM5Kr4yaDqWyVAbFfHQgKeJKJVW4FqV2iDVNRQSg3
 NM6UcfFKlAh8wr7xmKMpgfNNT/AZf11IvQsCIFaIOWk9lrwHhxcrvnpOC/fT9CCAdOX/
 t0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yB1IXjwWh5r6tQC8XpKctOn2v3UQFDIuoBluosFZVc4=;
 b=7m/C5d6Vbzhpw9rW3IU3ET1THSR1+s5CyOENnlyfHIFmXUMOcMihhInhuFjTwJTeQo
 qlgNQHpflyAYSCjd2PLtpHd200zWlH2n8AhEni04T5Rx5cubpAllnzyrV9rcbAPIYwzM
 9ouQ7K1uKctKM1Qv9YqsPd5obZEp6hNyJYvk/xEs0OBRerea4hhbArR80uvfs+2ptDRV
 VMRsjoR2PmFAu4+0HcaTheTcz6VTK65sO6JyCesuCJpC1TpN2cLlkF/hKKGbkEhUAfxI
 iytoKp921GCZqe7U9r6S3j8FRCxOkN2FVxkoG61TLc2r6N4Qvy+/Qr+0Qjx1jtFWS/wx
 buuA==
X-Gm-Message-State: AFqh2kozMlNm6YpaXn2iG7No8U0w4PT26U3sJoIJHhmbX6+TI0Fi97rz
 m+RFBcmaRVWiwcnMG9qVvkQU6UTDjJT/UHMBPAgM3w==
X-Google-Smtp-Source: AMrXdXueMyuSY3ulobeq5TcQ+F/WEm0yVPBDGK5iAcD1tBVoHXhOqB7bsNxQElVCo6XbcCQX/5UQXCjGg2AT4QHr1Lc=
X-Received: by 2002:a17:90b:146:b0:219:94b2:2004 with SMTP id
 em6-20020a17090b014600b0021994b22004mr633307pjb.215.1671113087480; Thu, 15
 Dec 2022 06:04:47 -0800 (PST)
MIME-Version: 1.0
References: <20221215140152.284180-1-thuth@redhat.com>
In-Reply-To: <20221215140152.284180-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 14:04:36 +0000
Message-ID: <CAFEAcA9JKHV+TNCFjgHsLkoMQ1eVz6d_hbre6OqZVasawdn=2A@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest/qom-test: Do not print tested properties by
 default
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x633.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 15 Dec 2022 at 14:01, Thomas Huth <thuth@redhat.com> wrote:
>
> We're still running into the problem that some logs are cut in the
> gitlab-CI since they got too big. The biggest part of the log is
> still the output of the qom-test. Let's stop printing the properties
> by default to get to a saner size here. The full output can still
> be enabled by setting V=2 (or higher) in the environment.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

> @@ -103,6 +107,12 @@ static void add_machine_test_case(const char *mname)
>
>  int main(int argc, char **argv)
>  {
> +    char *v_env = getenv("V");
> +
> +    if (v_env && *v_env >= '2') {
> +        verbose = true;
> +    }

This is a bit cheesy -- I think we should parse the string
to a number properly rather than accepting '2', '23',
'2.89237', '2e45' '2fast2furious' etc :-)

thanks
-- PMM

