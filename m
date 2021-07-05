Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CAB3BBD8D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 15:36:30 +0200 (CEST)
Received: from localhost ([::1]:52666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0Olx-0001Or-23
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 09:36:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ojj-0006yO-AA
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:34:11 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:34503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1m0Ojh-0005fx-Nv
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 09:34:11 -0400
Received: by mail-wr1-x429.google.com with SMTP id p8so22154754wrr.1
 for <qemu-devel@nongnu.org>; Mon, 05 Jul 2021 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=/mpELbygm7uSePAX8EY0ljWqjFzucnBqnkk2i6IcNkA=;
 b=yLAi+mAhFIA6Qkv8OhS4WF7z/51RMdIdi/zSfLfIOneP/qF/fTIqejl+3k1Omh1gUi
 UjjLYNCAWou8bnAp6yEQZ+BU+e4lIlaG0HxaewozCcPNDM1ShGgYzJy9zOh25+NUaBzv
 gUyWByfTECTcCxPMYSMXN9twx/vgf7f9FJwNJc6d/w+OAXi7ksZoC/PKbNGR9rJOyyw5
 l8gRsjSJUJG/DG+h57fAeZd93HDcSCP49tl+KCR95s0la+vytzlcfdY4ZxI1lvheHmbc
 Ys5O394IJmDlz+ThZDHAXd7DH5oc8DwQWJT5xvD8otE8PFcx/6cbfVFvewzrsfpb3XvM
 KFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=/mpELbygm7uSePAX8EY0ljWqjFzucnBqnkk2i6IcNkA=;
 b=MY9noR+OcZltqKYKYkwkwSyC4eNGJxuOnJO3rWvI4shrkhMW1q1T2k6UWuFNu8JIF4
 2hR/adber1HqRBkrZpcVACExPspAy7v7J1IkPAvMrIQyreXVtwODJM4JE/6rENOuuHp5
 /E6UyfBYaY0Zex1IfGlMoik1izeKeUpF3qyKWWhR7EdSNnlVdZEdgniJrdWc0phV08cT
 GFPZNj4Hwv3hMeQL4uK4HpLRB04MZfnrKryzckUwjvuzIQihayy6OLC+MbmmMV+R9tkd
 SdrusNloTctBv/IaKlPwG8gsu+mPZarvGBOPNq2ftfm12+mJCBHjVn5m+0gYZvk1Q9aQ
 6+pw==
X-Gm-Message-State: AOAM531Z9cM97y3EbGBiDhaH6vslUILIA++j6R0bEEBzZ7QYl/VlZ5+E
 0jiP1Zvt0BcepTsHscq2PFzXDA==
X-Google-Smtp-Source: ABdhPJyHuGwhtrcKr8sJ6Rj26/jeRB3GFv94M0c8dh6NDhMAFpl5HuwAu7V9P7ZXi+LKcpHQRRvTjg==
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr15257742wrx.129.1625492048263; 
 Mon, 05 Jul 2021 06:34:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id m18sm1481768wmi.32.2021.07.05.06.34.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jul 2021 06:34:06 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 770BE1FF7E;
 Mon,  5 Jul 2021 14:34:06 +0100 (BST)
References: <20210623142245.307776-1-berrange@redhat.com>
 <20210623142245.307776-8-berrange@redhat.com>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v4 07/22] tests/docker: fix mistakes in centos package
 lists
Date: Mon, 05 Jul 2021 14:33:58 +0100
In-reply-to: <20210623142245.307776-8-berrange@redhat.com>
Message-ID: <87mtr051gx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

> mesa-libEGL-devel is not used in QEMU at all, but mesa-libgbm-devel is.
>
> spice-glib-devel is not use in QEMU at all, but spice-protocol is.
> We also need the -devel package for spice-server, not the runtime.
>
> There is no need to specifically refer to python36, we can just
> use python3 as in other distros.
>
> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

