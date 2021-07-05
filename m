Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02FA3BBEA3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 17:08:32 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0QD1-0002H7-Q8
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 11:08:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QBx-0000cr-QD
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:07:25 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0QBw-0003vy-5u
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 11:07:25 -0400
Received: by mail-wr1-x431.google.com with SMTP id p8so22495509wrr.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 08:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Z9/iKF4yfNtHizDszdfMdImhrh/AzD+0PI/yD/hmcuE=;
 b=LDoQLVuEDuecDil0oMgFcYRri5JE7zoPQG8aPHAyDRzHY4FaYZu1OYCnOLJJCH42sk
 Cd6RskBYDtrntndHAqD8LppU0Mmtclp2ifGX2tPyckQoRMeNrgoQtfqLN1Xrg7DPQ3tq
 kUkizU6sl+/u2kPPfNbi1gh+lC+YAOp0QMKNQgxBODnsrXXvNcgJZhYU6AMQQlCOhla2
 SXOMr979x30R2Jidklkk2QjxMTT5n7anWJIeRm0sV4dhPxpAmQz9vVaAmxfGUkP8y34g
 4vDB+vQKbb2oyUgNmZGUHdjqrvPQ5QCZ0C0SEJ//CQl974eGeLkeY5DVLiQGSW+ow7un
 eK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Z9/iKF4yfNtHizDszdfMdImhrh/AzD+0PI/yD/hmcuE=;
 b=DFMEHfee5MfuL2egP8+0SEfLbYl911kFZbsdPNrNk17GqfF9rFyxiZK4UYE223L4WR
 +krcGK9i9joyAZSlTpn+cuFhnYYR5hAIS+I7UBs6dIOE2LV1A9LL98b394yGohSVx1Mj
 MJTytaBJ5WjF3683ddgBY4CdOR//o4eterYKgSpavdiAPVKTShktYErk5zDZVZGjDrrk
 NYnV1pORgyOmy0H4KuIf/N40ADzV0uDKYbZKCUpq2KAFaCedM/lOAjPS4LqyVSMLwWFW
 NCkBLZ6FRBbO8UqLVskF1jpa4oHQ+ooNdFoe4MRsyjn3y5O9SgO2s0VJbGNJKN3e6Cmz
 v/gQ==
X-Gm-Message-State: AOAM5339/5cnQIyuMRh+3CZD0stGfYWeaIUgsMwTuY5SWecnx/vcSMBZ
 cz0qQ72CLAJ80/BKLWzmu5ezZQ==
X-Google-Smtp-Source: ABdhPJyOOsA+neX8aTqS1115y5+iSQkXgVohiqH9Ui7w1JXS6L9UOvjePHUjLRRqKrWKJQBeQfC/BA==
X-Received: by 2002:adf:cd0e:: with SMTP id w14mr16442777wrm.237.1625497642830; 
 Mon, 05 Jul 2021 08:07:22 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id w3sm22402827wmi.24.2021.07.05.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 08:07:21 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E05611FF7E;
 Mon,  5 Jul 2021 16:07:20 +0100 (BST)
References: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Brad Smith <brad@comstyle.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 6.9
Date: Mon, 05 Jul 2021 16:07:14 +0100
In-reply-to: <YLRDeJV8qBrt9++c@humpty.home.comstyle.com>
Message-ID: <87o8bg3il3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Brad Smith <brad@comstyle.com> writes:

> tests/vm: update openbsd to release 6.9
>
> Signed-off-by: Brad Smith <brad@comstyle.com>

Queued to testing/next, thanks.

--=20
Alex Benn=C3=A9e

