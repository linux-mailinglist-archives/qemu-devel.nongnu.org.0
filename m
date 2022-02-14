Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 017344B5837
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 18:12:54 +0100 (CET)
Received: from localhost ([::1]:49750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJeuC-0000Ej-Hm
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 12:12:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJerd-0007aZ-Ta
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:10:14 -0500
Received: from [2a00:1450:4864:20::434] (port=38808
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJerc-0006Ep-8f
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 12:10:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id d27so24179885wrb.5
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 09:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=9WsPvfugCztFZpN0/fyrcZhPKkr0h5vTtNyfBrfdCo4=;
 b=JgA+mARw3AjtEl6h6RlAMZqbmHoSyZRMlOO0vU9gDCqCGcs+uxa1VWjbolyqRZ8WTL
 SjkGbHARiLbbzYVJhvOljC45cHgIt7Pgx/4JhEGDOaX8Oxa9dvEj884x5FcFuoGJCVTo
 A7Nar50Aqgc685chbqiKMKyqRbSbaLcktqH++ogv3GI4KnC5wn80xQFDHQ+cwdkVvDEz
 YvJ9Z0izzgWhuyN44EU2LwNe56joCXObe44vLRHlOsHflUyP1sJYB337T8wVEba/+Otj
 tZTRqe9nB8XOvUptTx3pSipRYTL0wqnJLhJmP8hpVXoyHLPaDlXrnToFX8MUtl7S3nr7
 aEPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9WsPvfugCztFZpN0/fyrcZhPKkr0h5vTtNyfBrfdCo4=;
 b=EXIG3hsjkBwwF6TpHOTyU4scRbr/HjZXodjf4HI9waz4yyOZn0twv2jcnuRefOd4YX
 uViXU5yIGMksqJL5ANWmjyQ+jnbHwJZeLAU7JRiMFbJxBaZoRJstOGZrtlHVXRxf8bt9
 Nf/Q2KuxZUbFBoIiMtZ6dAoUtQULhnkyWfqbcUITj4lF5oX/qQ380cvW9RUx8iQu61bq
 z+rY0mQrH/YY7Dvf8r2gtGuYEvySDUihsFa57iFT/Fsp6u5HqQTTyVUcLUTHesaxKvrT
 5UWWtb4oM1SbDtq8P8CjspmlG6qzC8kOQLJAp4Y/3ll2jbKBvVk11tawoN6lHsOoF1kN
 GjEA==
X-Gm-Message-State: AOAM533NyCm0NQagdkw5V/O7lqBIzWsWvHNq235l9JlHNeqk7y3Knut3
 9joFqfMDmsy8CNiASFcr40QND8j3oSwoN+HfbAUxKYL6QZT8VA==
X-Google-Smtp-Source: ABdhPJzRZ60aoDxLnKyMrP0k3qevlxsLFbuE+BrJVyTyo53OYQLNXyx5myFx2Tw2RGScJbZP16J1rQnkWDoUzhNbN+k=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr10082wrq.172.1644858609877;
 Mon, 14 Feb 2022 09:10:09 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 17:09:59 +0000
Message-ID: <CAFEAcA_3C6JoHE288PUFMciO7e2OWK=z-a2168-b2r64H0QCPw@mail.gmail.com>
Subject: proposed release schedule for QEMU 7.0
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.635, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Here's my suggestion for release schedule dates for 7.0:

2021-12-14 Beginning of development phase
2022-03-08 Soft feature freeze. Only bug fixes after this point.
           All feature changes must be already in a sub maintainer
           tree and all pull requests from submaintainers must have
           been sent to the list by this date.
2022-03-15 Hard feature freeze. Tag rc0
2022-03-22 Tag rc1
2022-03-29 Tag rc2
2022-04-05 Tag rc3
2022-04-12 Release; or tag rc4 if needed
2022-04-19 Release if we needed an rc4

Any opinions/suggested tweaks?

Easter this year is April 15-18th, which is slightly awkwardly
between the theoretical release day and the more probable
release-if-we-tag-rc4 day. But we can't really bring it forward
as softfreeze is already only 2 weeks from now... We could
move everything later by a week if we wanted more time before
softfreeze, at the cost of having Easter fall in a probably
more active part of the release cycle.

thanks
-- PMM

