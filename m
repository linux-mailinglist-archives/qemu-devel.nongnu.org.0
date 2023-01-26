Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D767CBFC
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 14:24:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2DO-00048d-6t; Thu, 26 Jan 2023 08:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL2DG-00048C-QS
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:22:46 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pL2DF-0006fa-5b
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:22:46 -0500
Received: by mail-pg1-x530.google.com with SMTP id 36so993633pgp.10
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 05:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=pnmiyECVgDpDk+JGlgRkopzLwGi5GG9lgluTrdebyNw=;
 b=yG2uNs5AuoJt0mmXRA5Pab43JA6iKr8Q5zPnWG9kRK6b6mWh0y7gMXVGQmSCRhHAkb
 xG6kOyKaCslPhN1zlnsmBlBEf2wMujT3JSX3R5l4OhPTdDp4+muGIPYaNG57RzwvWIgw
 1J4nIK45JYcrCet76KOOjc4SdSoRxfDR543WzR2YfZx/30kxKr4I/xhJrNIKWitM68bB
 eUEg+9wvCYlTXKyQTrb3n8wlUd47uFTsH+9NtVpeqPC1qidZ9AStBnKwlK/nkZYVlb8r
 EsqMhpQN230SeU7vpcfIISHtnvxbrgqUmhSwMc7CUIDAgh16ZG7eFVY+4GH4oDsjZ6aF
 izoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pnmiyECVgDpDk+JGlgRkopzLwGi5GG9lgluTrdebyNw=;
 b=n4TdI6BETt3eJMZHU4VWJgVHoJ9Gv+XuW6ByM+OPwqGY2juWHB0NSUJ0B86Hn97xV1
 7/2+2LcZpTKCssLAqX0WnXsOde2bxC6feEVyyBIJkJi4uTdFRvoj795hBTJQ4Y3yaXWE
 1PCaS/WKU6HbX7dJ1yMvUIljyQF8vtRoB4Kh/pyg1Kp2yNnv2yp1sUh1YEh/kIBfP2G6
 rSyixlhFp3DWbXpWOUSZrfP52GQQaAawMfFOu9bQBf1OFMslvmFStXvhsw/0GaBN15Xt
 mxdXsqeeViKlCuJyNgfFIwS+TGgiNnXd6RlLL/mUBXwvS+qMm42pmH4bS+SfeFT/GxHU
 J1QA==
X-Gm-Message-State: AO0yUKUFqVPImRbhUH7X/ucwUkbiiErK8L7vFHPigAMn29L83t5rUbRh
 SvPncff+W/G/FAN8vN4IuCUGR+yDAp+cliP6D1PbtjFPZKYEyw==
X-Google-Smtp-Source: AK7set+F+6D144p5/zh2t7omYMfHIadUMk3+wUxJQ9gSDkT4VzUNGdcUPXer4vnCxkd37bgNv0FVofpJc6YdyAfsG5A=
X-Received: by 2002:a62:144d:0:b0:591:8ac8:7c78 with SMTP id
 74-20020a62144d000000b005918ac87c78mr355080pfu.54.1674739363417; Thu, 26 Jan
 2023 05:22:43 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jan 2023 13:22:32 +0000
Message-ID: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
Subject: no more pullreq processing til February
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x530.google.com
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

Hi; we've run out of gitlab CI pipeline minutes for this month.
This leaves us the choice of:
 (a) don't process any more pullreqs til we get more minutes in Feb
 (b) merge pullreqs blindly without CI testing
 (c) buy more minutes

For the moment I propose to take option (a). My mail filter will
continue to track pullreqs that get sent to the list, but I won't
do anything with them.

If anybody has a better suggestion feel free :-)

thanks
-- PMM

