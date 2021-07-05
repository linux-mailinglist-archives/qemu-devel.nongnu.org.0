Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAE83BBD9F
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:42:34 +0200 (CEST)
Received: from localhost ([::1]:39194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Orp-0002rn-Q8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Oq0-0001Ac-CK
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:40 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:46717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Opy-0001Ec-U1
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:40:40 -0400
Received: by mail-wr1-x432.google.com with SMTP id n9so4812933wrs.13
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q20ehzQ6XACIPXRAz5shtfYw4X7cYY9hUbIcxSptwK8=;
 b=ntL0Iu0nRYltFtVoYctAvsOVaavAkN18gv1gqtdj0o7uZDO3Bgz5nattJKwRhpWIfK
 LGuLuvSSPyud4Nsv1GI8+Wy8isMfQRAT8jh7svIiuKSFcoUDLMNgyfxZFcaXBXfp0omY
 kD91vj2wKUqTR8Kfz8wGR5PDHo8a8oqr02ySjU6BMPlsl/FFUwcq7UFs/bs4ySy0IDqO
 tKtlMn0ccnIuYrd3MMQ3WuDa41D78Wszu3N5Q8rL37ymzwMYzizmpEb4mp3q9my9Feot
 kh2ozyLgbI5m1ZwkRdJ8YIUeHwM/+5A5xeGOKSqTuboNzjone9jFQoqsqS8u+VrqJrSu
 EA+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q20ehzQ6XACIPXRAz5shtfYw4X7cYY9hUbIcxSptwK8=;
 b=UnDNJwraBiPPcdVaoX821HlgtFpFeQBDaFJ9Ze0SXvo7BOaMhm2eoxo5hI+T+h71p3
 M1dUQG4xJddyvw5CSxPRGpI5P4NaLDYSJjYebPeceRxrko9+O17ywpNpl89YAANJhJWe
 3TcQkesOiUHFgEoFP9Op1KHX6c+fecxQrVnSrLbIFFb1r4FUai8EqPtNkPQklgRrxZfp
 3FFFUuBOYU5LINoMJoof24jk5+p06rkfgSGWgvj5nk375A9BubbVcv/K8vb1vsW4PgdH
 /sEqhB+aiNid7ArmgB9J9IcS+1AKQBI2oA+KCRPCOiAt75BjtZ44A60VHaQdKxLpRR3V
 KqpQ==
X-Gm-Message-State: AOAM53088VFsAUqC22/gjLzjOmi+vR45IW87sROiYs7intMKg1Mp6hLR
 pWFOMRQgIgdhfy0T0lDghp0Nfw==
X-Google-Smtp-Source: ABdhPJyIiOP5Q+RjuvdNfNXj9MLRXFYMHpEOgWkKKfdVJM9YLskmWb2ItcXkSLJ7Fhrz0m2tf/QwhQ==
X-Received: by 2002:adf:d232:: with SMTP id k18mr4931023wrh.35.1625492437578; 
 Mon, 05 Jul 2021 06:40:37 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w1sm12336802wmi.13.2021.07.05.06.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:40:36 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4CE591FF7E;
 Mon,  5 Jul 2021 14:40:36 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-11-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 10/22] tests/docker: remove mingw packages from Fedora
Date: Mon, 05 Jul 2021 14:40:31 +0100
In-reply-to: <20210623142245.307776-11-berrange@redhat.com>
Message-ID: <87eecc5163.fsf@linaro.org>
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> There are dedicated containers providing mingw packages for Fedora.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

