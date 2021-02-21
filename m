Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6119320D31
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Feb 2021 20:35:58 +0100 (CET)
Received: from localhost ([::1]:48736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDuWL-0006FC-Cl
	for lists+qemu-devel@lfdr.de; Sun, 21 Feb 2021 14:35:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDuUY-000517-L8
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:34:06 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lDuUX-0002wM-0Q
 for qemu-devel@nongnu.org; Sun, 21 Feb 2021 14:34:06 -0500
Received: by mail-ej1-x62b.google.com with SMTP id w1so25687186ejf.11
 for <qemu-devel@nongnu.org>; Sun, 21 Feb 2021 11:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zBEwbRQZqPnJXRYP2FP1goznLCE+yrtMu47gx1HCXa4=;
 b=J/2OUPcihfNJ4FCDRe8Qigzz5UuX9PqUmQOg1A15JFALO0iihdrRjdaIfHpTjonkk+
 3adVsLFrZCZSMo6g0hhDh4tIXRWIXgMWn/Hz5hE8KYLX6of3ZM1RcbAJl5f3ippktWkG
 hf7ZLAkZkKFt5iWkFzdp0eUi5qnoiDRNPc10VhMqsTf8rLi+QHNNfbygPgXjWaW7lNro
 /QCQ/x7vWrsDOV5LL6DcU55ApQEuPzM+VtYiVYUALOtzLLCCl44M6hgHOzYzN0SCn5H6
 jvmk1SALCMNgjOGkTv5+IaGnxhuZHkhikNC9El8JUW4Bw/NJFCaArcIaAWkvUtL3EFd9
 8vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zBEwbRQZqPnJXRYP2FP1goznLCE+yrtMu47gx1HCXa4=;
 b=OqrNrkXVITyJTe8gMaTDMTAaoJf76s46mmj26vhmNNW+4hMZfkvvQ9v9whaU3eRwuo
 HKBkl+9XdosFZaGNKGxrS5+YN3qRK6gXHtht/CAR3P5NVbAZj+OpUl9cNunTmvuWVZpR
 1Uytlk06ogJL519RGiW7h+nxw/iI4culyVKui4Eov7azZpItWc9pH0slpMStQ5bz3m1b
 yqDoqunB0FGDnX12oqrhzcaTNMoHt9w/Vea2Pp7acE11D394tUH89WLbZrgx1iW5ze4R
 8D0oGe2eP4NX2ApTfVZTTSbEBLhTOzQjPxljkGbfDmJQ2LaIffIMQNUr5JMrWV2GCjtZ
 YimA==
X-Gm-Message-State: AOAM532Xb47L7y8njBbXRU/xjyW9WXlQEgNxS3QLby4ubuk26G1XT6Ca
 Ky5MoSFpWMJCK2XghZqpQejYieEajBx5cv1khq6iVQ==
X-Google-Smtp-Source: ABdhPJx0nusow2zAbE1Do+Uf9EJH8RTbfH97UWPpv3QAaeNvvJY6aLBYiFFVy9aVJ+o0uFXHcx4bzNnz4R9i8VHaWOo=
X-Received: by 2002:a17:906:66cc:: with SMTP id
 k12mr1658746ejp.382.1613936042667; 
 Sun, 21 Feb 2021 11:34:02 -0800 (PST)
MIME-Version: 1.0
References: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
In-Reply-To: <cef2f119-3612-65a0-d828-b480179dc3a9@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 21 Feb 2021 19:33:51 +0000
Message-ID: <CAFEAcA-yLQNLVUPZPRnTTNupkUrgcTRHVR=SW1Yb6KEUeQjkoQ@mail.gmail.com>
Subject: Re: tests: n810 arm failing
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 21 Feb 2021 at 17:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Hi,
>
> The n810 arm test failed on latest master:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/1045015424/artifacts/browse/b=
uild/tests/results/latest/test-results/26-tests_acceptance_machine_arm_n8x0=
.py_N8x0Machine.test_n810/

It passed on the gitlab CI run on the exact same commit hash
as 'staging' before I pushed the merge, though...

-- PMM

