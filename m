Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9293D0460
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 00:17:06 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5y2z-0001qp-CR
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 18:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y1N-0000HJ-C7
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:15:26 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m5y1K-0008ES-G4
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 18:15:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id t5so11331wrw.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 15:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=lB6paCH2gkrmr8baHBaytJsQd2yB05BBd95nDYF5VaQ=;
 b=wgmkATi+KQajSUMdz6i1I3xAcophNozEvsEvBnfWpt4uIauhRjX737Nff+YF3joBqT
 6bOdsD4iv29m4GnJIRDN5EYG4I/BA7zLisYSp/93+AruIvUCi7BLiKRXQ0x+ndMnc+t+
 F6kVpxVpels8anCbw4ELe0YwFaMTZIgfK/t18WZrHNYRfuzyzazAupF7qvHRPlx7kQSK
 Hm1vPy6yS/4qPptIidw9i2/UzUl4OnSgQGISo9JQcE5siE2BfPnxdkyDdFt9OabOT3xg
 xKEJxWmKR6g22lAudHK356S/xWLyelgs+hhXamH6CqP8Kfz7Yx+mtsya0Ns8m9feNv+V
 Du3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=lB6paCH2gkrmr8baHBaytJsQd2yB05BBd95nDYF5VaQ=;
 b=W/KMEF2WYqiCReIZiCo/HueWOVCCsNHhqZjSqfEVV03Z5eCqiIHl+3zoHvVklO+3XX
 4F+JP3PG77puIK/1haiRV9p6GlpGpZ1K6BGbWkJKPfO24EiR34zbbYWvI6NbK1qk6iy9
 oDuNu8Qr6SUJ7vgmhJgqeQti0CiBO3x3ZUEYuesNoLO8nxVK+6ZoGvzwc9z9TTrrY1qW
 hb4kLX7TJz9QBHQ4xRUdxrWxl+m/gGrgifS1M6jdQIWMGPuvcDrtDh8RppGaK8rxGuhJ
 SgY0+1MbDzl/B4jPo6wqhl4c8mlCs87Rx95HgbnE9KbgNKmiXgdmkDgJHighNS0zhqps
 MS9A==
X-Gm-Message-State: AOAM532yiyO9Gdj0PxnLAWottwt6zkF7B5nh/fjceeOGZaRv+AUagm55
 lDsk4GYpcDsZqwyukpitUtv5Cw==
X-Google-Smtp-Source: ABdhPJzk9oBEF3gENq6uNLwe4Vp/8di+mB50NCTOHoF9kbZRHZu2jTsACs+5Dt5pHChwerht/xlacg==
X-Received: by 2002:a05:6000:1867:: with SMTP id
 d7mr39038151wri.199.1626819319831; 
 Tue, 20 Jul 2021 15:15:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id h20sm3615888wmb.17.2021.07.20.15.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 15:15:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2273B1FF7E;
 Tue, 20 Jul 2021 23:15:18 +0100 (BST)
References: <20210719073051.1559348-1-thuth@redhat.com>
User-agent: mu4e 1.5.14; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] gitlab-ci: Remove the second superfluous macos task
Date: Tue, 20 Jul 2021 23:15:11 +0100
In-reply-to: <20210719073051.1559348-1-thuth@redhat.com>
Message-ID: <87sg08ljih.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> While there might have been bigger differnces between the -base and
> the -xcode images in the beginning, they almost vanished in the
> current builds, e.g. when comparing the output of the "configure"
> step after cleaning up the differences due to temporary path names,
> I only get:

Queued to for-6.1/fixes-for-rc1, thanks.

--=20
Alex Benn=C3=A9e

