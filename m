Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D0055081C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 05:35:30 +0200 (CEST)
Received: from localhost ([::1]:43790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2lij-0007UW-9s
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 23:35:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o2lhf-0006j3-4Y
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 23:34:23 -0400
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b]:40837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1o2lhd-0008HZ-M9
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 23:34:22 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-101cdfddfacso2059202fac.7
 for <qemu-devel@nongnu.org>; Sat, 18 Jun 2022 20:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=1M496IL0aSVaZMg6snbk68KC1XSD7pdapcaoQyy6zfI=;
 b=nV7KXt3NhJt0tTYBQa0Dp0VctThZ8DycDBVFtjKvlGlFDUbEy5RXqqj8qgmpImNrE9
 v+d46MtjC56CbwhV2Q1an1DnA1YTnJjR8CfQpmCPy34VaDQPQVwlMhJXR6WQX9Nhb7uS
 cIsssWVUhKDrWFXdNNtvmOddD7ODkTPncTCxvbqm5EWRk6MN7Z3pCim3lVDOU1ka9NDf
 ZdgXn4Fd5weUO3KdzorUL03BCVGwgQqOhzHEa6M27qCIRt1V6O7L2y/NCerUgxtZ4DNA
 2kEP3Ot41w2ODHYdJVVVKaX28PLCqG/gcyxvf6Q36nKMoeaR0/ct5GKGuveZ2QwBre7Z
 ROZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1M496IL0aSVaZMg6snbk68KC1XSD7pdapcaoQyy6zfI=;
 b=3alH0YwfGH5B+JCkIVwAWjxcca6tHztXJP/z6aqY2IOPsmh9qVP4SYKlENzbPDbOLQ
 7xYh3DBHlaRBrTEa4mhj6dWsmMujfMk3o3MMGyo1x8OyfIvtnYaWyP0bsH7BFgkC96d1
 nC/IbeSXQyoLEAF4TNfi9na2S8Uizr5YBniUWDJKyNEavM56aOxG+DJVUBdaLlnVq858
 2Q1ybLLmOuF60mEjOsY4U7YM6G8ni3x1w40s56EsI9sbjsOubUtCV5ZpEl40g+SvTz8j
 HftRTWf0VaaKFrpUapPRyDngnF/kJ4sL66VgZUdT6xXBWxb/QiH6Nj8mgbHfYdca5OXa
 1P3g==
X-Gm-Message-State: AJIora+33Eak6J90dGeCJ+4SN6JOg8nGjZ2wYAbWKZOZ7s3DFTMzTeIe
 TRT4mgOoUzxIWs/c7z60mfuNwRuS4wz5f5nu08stAW8d
X-Google-Smtp-Source: AGRyM1tIfRy6o5EQtXTo2gnIgrrQOsMIyrJx050YuZ0QPRbpmVdjJuHJVakwMGFwXiLyREGtvbyfpZMoL8yZoBWRtds=
X-Received: by 2002:a05:6870:d68e:b0:e2:861:8b15 with SMTP id
 z14-20020a056870d68e00b000e208618b15mr15092433oap.156.1655609659335; Sat, 18
 Jun 2022 20:34:19 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Sat, 18 Jun 2022 23:34:07 -0400
Message-ID: <CAK7rcp8M=B0PmvZ4FnXNAnSh5TuvxNA4aKXJ8+JF06XogMmsEg@mail.gmail.com>
Subject: TCG development tools?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000a1a8a905e1c4a976"
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000a1a8a905e1c4a976
Content-Type: text/plain; charset="UTF-8"

Hello all,

Suppose I am wanting to implement and test for the TCG. Is there any set of
interactive binaries or other things that I could use to work with it?
Could I open a shell to it?  Perhaps feed it specific byte sequences for
tests to ensure correct operation? Are there a canonical set of unit tests
that exercise the TCG that each architecture implements?

--000000000000a1a8a905e1c4a976
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>Suppose I am wanting to implement and te=
st for the TCG. Is there any set of interactive binaries or other things th=
at I could use to work with it? Could I open a shell to it?=C2=A0 Perhaps f=
eed it specific byte sequences for tests to ensure correct operation? Are t=
here a canonical set of unit tests that exercise the TCG that each architec=
ture implements?<br></div>

--000000000000a1a8a905e1c4a976--

