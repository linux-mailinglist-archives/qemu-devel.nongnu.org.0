Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C196841132B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 12:56:46 +0200 (CEST)
Received: from localhost ([::1]:37534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSGyZ-000433-Ns
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 06:56:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGws-0003M2-Vf
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:54:59 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:41666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSGwr-0000nk-Ey
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 06:54:58 -0400
Received: by mail-wr1-x435.google.com with SMTP id w29so28344986wra.8
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ilDsZ4FvhCMdGdQsBSrGoVKuocxdHAtEMAIKEA2/Oeo=;
 b=csy7cZK6uYj7LBLt3kCQfYmblON6NSoMkKMLq4NDP/+y48X4jUiLu+z8e76gH5r6lV
 iQ5YOeWofWCsVUiX8lbsV5NX1ArK/puXvG7B4GhAqFCuFGwzvxho2MGmfJbjNxPOnQPZ
 LAT1wiUgmXQb94gdMC2NQQ7kpd+Cok09zJud7ZvwE7WgOIHDImdBoKpvM1X3XfFS+ViQ
 KGqo5rPdaoW1OLViSOJJn+sEUxY54Lwpmd4JouzRSwcjwTIPFFtA2Qa30C7JsPvX3EMw
 R0J6QiLdAPF/4JDOLlMVyI3Megn8oag+1HH4CMHpS8cnFNEUOkPeXGocUAUSJLVFAyhe
 tV0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ilDsZ4FvhCMdGdQsBSrGoVKuocxdHAtEMAIKEA2/Oeo=;
 b=dhylebJBdEiqhArcFg/QiCwHxV5OOcqY9+UEc2Rl6LibmjW/IyTklnMrU+z6OmiVf0
 be5raLpYlX18goAcW4i4yeCrGK+wJskA7ImK+ecyvrVPZiHvJ0G/xCTMEBzLv10PCcB9
 ENPwPYze+sei20iVILbQ3nD0G2eqtIlER5yhNfpeZrl94jOkYICkg7WzNE109uPbZjxI
 ov7gJ79TgRojgH+n48hjUWORBLPwNRqsTJYyAWdZlgn/OtoPQ4GiUDNwVMH9ENxWlVMy
 vhnX3WvJx1cuTAtqwwXCzLNWqWw7iusKSzJ1zT6Udo9H1+KL7BnDWOI840Gb4GNpTM4h
 v5Gw==
X-Gm-Message-State: AOAM530jksbwpzHkyef53Eajw481XdZSCdL7YDlG+x2ePERBbNbZRmNJ
 44BlS6hQuAIJW2o3DJBfJpp654oR414+us4hACCP2FIlZpKGBQ==
X-Google-Smtp-Source: ABdhPJzzYhT5h1wnvGWLPZjUo11WUIUqc3iTwVnebcL86xyDSiWZD5BBNDoPk/k/qRL8d93zfZIie0BYIW9nlU2MAL4=
X-Received: by 2002:adf:f185:: with SMTP id h5mr28098011wro.302.1632135295235; 
 Mon, 20 Sep 2021 03:54:55 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 11:54:03 +0100
Message-ID: <CAFEAcA9_e4hAisAwGrNu5hK6vioPzpJ_JQD5Jd9VF=YmQ=7moA@mail.gmail.com>
Subject: how do I run a single acceptance test?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I'm trying to bisect a problem that's causing an acceptance
test failure, but docs/devel/testing.rst doesn't have any info about
how to run just one acceptance test rather than the whole lot
via 'make check-acceptance'. Is this possible?

(It's pretty slow to have to run the whole thing, because we still
have those horrifically slow BootLinuxAarch64 tests in there which
eat the bulk of the time and are not interesting for this bisection.)

thanks
-- PMM

