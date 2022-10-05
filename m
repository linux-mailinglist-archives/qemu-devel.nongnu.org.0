Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB205F5719
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 17:07:08 +0200 (CEST)
Received: from localhost ([::1]:43650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1og5zH-00007e-Jn
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 11:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1og5CU-0001g1-0p
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:16:42 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:44812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1og5CS-0007AP-0s
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 10:16:41 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id n74so6361485yba.11
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jEQn2fDpe7fnIpiIIAlXy4BVVWJYyyLTOAMSftHCm8Q=;
 b=mSe7BiEK7OEyRvYDjXbzlII5r8x51stQKMc0OAcrORTHumrNkmekIWd2GwqOTC+G5O
 62yrqCQRDMqO6dUA/p33yobg5MVYgr8uwKDVSIIT8GaN9tLYZBjGQd+Bi6bYxWma/705
 F9zY20VtoVBTxX4LZ+IoDwMZMO3AyMaWTsiCg3KT3hQ3gBZO0ivNe0lIGwtjwdXqa7ol
 6zBmleRSU1Hhz+1ihjANaNDW5Nd9TpzKcw1o4W53RoRF83O/oWBSqnK/WY0tTlm5J73S
 BF7txjXQLljq6+FOeFIiNc0nEHQo+KzrdNlLGb4JcGDxLHgIN5c1J6SbAyRRcy1rwONN
 11UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jEQn2fDpe7fnIpiIIAlXy4BVVWJYyyLTOAMSftHCm8Q=;
 b=f6tgsi8XFt7Bou0Hndd6zQlaNzlqcmR9HZYTk6vNVvvkhCG5qlwGuvMdn4H6jXmt+J
 U8vWZ65PzlpveArM1yzXI+uTiYyQ17rIm1ZCOPo6fXA8F9S+R4xxhV0/2HKcqMu5QJMg
 dXS8/l8Jx57zLlhOsptt0RVw8Uf3nA4V2r1AOeMHx/iWlwh6edjuSl8AkqBUU2o9fZs9
 e9vdcmqhZ3pDR9ECuwlcIvFxeYTPeYEumZPQ6ul6jJz5I5wPBotSm1jhIckq4di878I2
 p005mOvgUKk32FjrN69WSRWCOU0EKPwGrZJRLSVFYJn45kI9dYaIvXp8Nd9/yIzU2N6O
 B/OA==
X-Gm-Message-State: ACrzQf1RCv3s6xqA6ExeyEYg8/Jr1As14+KSvc2je/xAMqqx0ldtH7pZ
 zUjABVtHtjLgjcUC0YjO650O+OCbYZiOhaziW3w=
X-Google-Smtp-Source: AMsMyM6NMmciurLSENjoMaaTtJ/mbxkoX8CluV8Wr7eSS7bU2HyL1/wxcsaHw/QDwb0U7oPV4hITxnp05Pc6WrKACwM=
X-Received: by 2002:a25:4fc1:0:b0:6bc:c570:f99e with SMTP id
 d184-20020a254fc1000000b006bcc570f99emr103635ybb.58.1664979396889; Wed, 05
 Oct 2022 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Wed, 5 Oct 2022 10:16:24 -0400
Message-ID: <CAJSP0QUCnYVyDfUY7aC+ayJS0RwJ70QRMti6Z-vLfu9==VWRxA@mail.gmail.com>
Subject: Re: [PULL 00/54] testing, gdbstub, plugin and gitdm updates
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 4 Oct 2022 at 09:38, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> The following changes since commit efbf38d73e5dcc4d5f8b98c6e7a12be1f3b917=
45:
>
>   Merge tag 'for-upstream' of git://repo.or.cz/qemu/kevin into staging (2=
022-10-03 15:06:07 -0400)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-testing-gdbstub-plugins-g=
itdm-041022-1

Hi Alex,
Please rebase and resend. There is a merge conflict.

Thanks,
Stefan

