Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC032DBA53
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 06:09:18 +0100 (CET)
Received: from localhost ([::1]:57688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpP3t-0005Ae-Gj
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 00:09:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agpr123@gmail.com>) id 1kpP02-0003Xr-Q1
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 00:05:19 -0500
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:40193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <agpr123@gmail.com>) id 1kpOzz-00031V-DM
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 00:05:18 -0500
Received: by mail-oi1-x232.google.com with SMTP id p126so26102093oif.7
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 21:05:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BQgv7IVRi+xaX4GGUdaG00dozn4WqeNqgYXPr7A+fB4=;
 b=WJHVgDOG9gwW0EctgQ1xUsJOMtYD01KG+/j4ZSb0Lz7bIG74AphZ/eGYONwMvuSilk
 9plK4gQxnq9fJ7j01hDj1mo/P5JcgUYAWP6QhYE20D2Jab2WeYeSUqw8tOoqSyQ5jW03
 jp9yx8f6tG+12BZcU8wMQ2QJDwreBHbs0bpKUu5NcqGHfAPkJdpTQqoE+8u/WDxoeYA9
 0YDg/EcB1CswHV+IQjPkeFTawO2+dxqQmSiMN097n2oAcI8LyGxjSdbJlR7lv6f29v4Z
 p29VqxfUQoazznnPTTmraoW9YzIj1KCOvxTNpAaWNxlgWdCvPDjfdiQ5qdlNMI6EVklf
 3Jsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BQgv7IVRi+xaX4GGUdaG00dozn4WqeNqgYXPr7A+fB4=;
 b=oAYHbB2ebCL6z6If3dzdTYtkPKesU3RqEKydD6ATiCPNcYe39azIcW9MXUVAoCbrN2
 Gsf6PeSTKzmCOu6lMsJFZoSWV1uK2ID/Sp9E/jyYQ2Rs8giQCJZuhlQ249NCB1UQRQIg
 wJSZiEQRdoecLLjsWE8yd6IrRPbKy1gbZYC+Qp6u7Inlw3+8YIy1KJ+6DFPQxggxmq3B
 hAyWoTEnXFu/3lfBmFrFpJWZMuUZA0TWoIfzI4i1PySFjE4DSMZKUOQWFm40eBK2G6Li
 lJVtz722Yve9b6mvo/FUKmnQza8yi9jxWw/B9bQP77j5i/X/LWlrwIxrujbyp6WWT6Ku
 eN9A==
X-Gm-Message-State: AOAM530AeYbKDsQe1F4ukzzGb8tU5n53QMDiPg6WMv2pT4BWwvxh66I1
 Xr0gy7kHyFOyODiVakFX6xN3gczaMTOlPiKo3L4yO+PZynNlZw==
X-Google-Smtp-Source: ABdhPJwHOcacnwqZKnx1ZWz6T/E/PJz+IN1IfpwwTFzd1P71UFHI1I7ODmLl3hBrQ9HviVtJwhbDQ28j6FjOmX8h+28=
X-Received: by 2002:aca:5453:: with SMTP id i80mr1178129oib.2.1608095112927;
 Tue, 15 Dec 2020 21:05:12 -0800 (PST)
MIME-Version: 1.0
From: Prashant V Agarwal <agpr123@gmail.com>
Date: Wed, 16 Dec 2020 10:35:00 +0530
Message-ID: <CALOWxgPkoiR9jHSP-S+hYkWZb89xi8kLVY4vsHqTMzpg6Sv=jQ@mail.gmail.com>
Subject: CXL support in QEMU
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f89bed05b68dd1ae"
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=agpr123@gmail.com; helo=mail-oi1-x232.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f89bed05b68dd1ae
Content-Type: text/plain; charset="UTF-8"

Hi,
Is there a way to know the support plans for CXL protocol in QEMU?
I see that there is side branch development going on:

https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2

But when does it get merged and gets released in QEMU formally?
Is there a way to know a rough timeline?

Regards,
Prashant

--000000000000f89bed05b68dd1ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>Is there a way to know the support plans for CXL p=
rotocol in QEMU?</div><div>I see that there is side branch development goin=
g on:</div><div><br></div><div><a href=3D"https://gitlab.com/bwidawsk/qemu/=
-/tree/cxl-2.0v2">https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2</a><br>=
</div><div><br></div><div>But when does it get merged and gets released in =
QEMU formally?</div><div>Is there a way to know a rough timeline?</div><div=
><br></div><div>Regards,</div><div>Prashant</div><div><br></div><div><br></=
div></div>

--000000000000f89bed05b68dd1ae--

