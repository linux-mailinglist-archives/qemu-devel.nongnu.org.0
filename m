Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893D30F1A9
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 12:13:53 +0100 (CET)
Received: from localhost ([::1]:50674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7ca8-0005VZ-B6
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 06:13:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cVZ-00022B-8I
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:09:09 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l7cVW-0006Ef-8N
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 06:09:08 -0500
Received: by mail-wm1-x335.google.com with SMTP id w4so2741384wmi.4
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 03:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=hO55L68Z1N28ujp8mkU2jpbk2RUvaHuHr1t0V8nF1DM=;
 b=PAynvCIajIieLH8fpospSsgfHdJC1saCuk+CQ31Wzl5QPbSlPscaX9ijJzUw39um64
 NzAopzfgdbkC3ItvfLB4s/R6IiiX1Vq4YiLEIZl2x9wb5s+0rZtOonYoGObcTSNKyKuR
 W8o49YZEMd85+nXjiBd0max97JWJlL9DLc7K1IIIqETnmBoa85FKnEf+J4WgbrYYptLJ
 GDI3ogjQPP91m+oxR6gh84e6jHQP2Qxtyzi9uBEXqWw2Vq0L1leGmq5HYH+iejnO4SET
 u9AUofjZKDl+DqWRuOZ9K1k6Q4JjRVkIkRGofDL8iTMgcFo/n4Wr5vDBkgTbJCNy0A7Y
 +lnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=hO55L68Z1N28ujp8mkU2jpbk2RUvaHuHr1t0V8nF1DM=;
 b=FqchaKGxMxNOtGKVq8lo0c5hF59YX3xqsAz9sBx5UAtSzuTxhxYGuaLsLnLYdi6QYJ
 Jts7u5BJgbFHNuaBx0MifP7ACNjv//08IjCHNqWThz4jj9mLXua86xvcFNC9RqK3LjT3
 g6kXnxwwRJJx6VyAKxR+SnTQVftZCTVcHk6fvwlOK/UUAiErXPc0kjrBYF6ZLdSNb6v1
 G9lc7VR6968Mdj68Eu8kPZiRaqeRT5Taqk+31w5GmVMkpKF4iEXTies3qQwsdaQ0XHfG
 CHeSKwjKxa4juiIurCYqM8uA02/QztLYL6MAgDMR6zanRTzaQidV1iuB2fBuDgsYUPHR
 xpWg==
X-Gm-Message-State: AOAM531+IF/WlUFw+UMSF152j0MFPoXzUsewPMC6W6HvdDszPSUvv6d2
 cwsKt91R4lI9WwxnuD/9vIbHmA==
X-Google-Smtp-Source: ABdhPJzBbYj4XPAB58DucR7lhJnfMots8YvyHGwh45uPFTD6HFmGLC8ufimRaFKAeYpPPsvDIzeRXA==
X-Received: by 2002:a1c:730a:: with SMTP id d10mr6866527wmb.53.1612436943640; 
 Thu, 04 Feb 2021 03:09:03 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id e16sm7559120wrp.24.2021.02.04.03.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 03:09:02 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CE68B1FF7E;
 Thu,  4 Feb 2021 11:09:01 +0000 (GMT)
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-6-crosa@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH 05/22] tests/acceptance/virtiofs_submounts.py: do not
 ask for ssh key password
Date: Thu, 04 Feb 2021 10:49:57 +0000
In-reply-to: <20210203172357.1422425-6-crosa@redhat.com>
Message-ID: <87bld0qecy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> Tests are supposed to be non-interactive, and ssh-keygen is asking for
> a password when creating a key.  Let's set an empty key, which prevents
> ssh-keygen for asking for a password.

We are not generating an empty key, just one that isn't protected by a
passphrase. So:

  Tests are supposed to be non-interactive, and ssh-keygen is asking for
  a passphrase when creating a key.  Let's set an empty passphrase to
  avoid the prompt.

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

