Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2544F57A74F
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 21:38:43 +0200 (CEST)
Received: from localhost ([::1]:51656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDt3I-0005g7-Vq
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 15:38:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oDt24-0003Ov-Vq
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:37:24 -0400
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1oDt23-0008Tz-AV
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 15:37:24 -0400
Received: by mail-oo1-xc30.google.com with SMTP id
 t11-20020a4ad0ab000000b004356ab59d3bso3081037oor.7
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 12:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=wuX2+uuUjaFZqTpWF0KM6xKOmSk3WOupa/DI6VbjBQo=;
 b=QYuwWF1g/MN7moh5bRYJaEtPpSXvuWbUjOqUG/RhhjGiVFpHwiV5CFkMZRv7xhW51k
 MappC3BFaAQJMBefrKCCeu71VQgtICh5bBA3L4mREIYPrUPjdG7hKoK3R27oOCrU1Sy8
 rgY2RB0uMR2CpW9fvvwo7/pq7EjPUnz4QWhpUd1Kk4BmXTQNpcZd0rpTwJ/GHrZfsQel
 8/0cyk2ot4luK9hpXyn1dLz+MTIqEtYjXrilIefbK59tQKj0nVdbSN9LmXpgg7kXFY8w
 ImUb3lHfkfSVF7RSPOi47ofAWXX5iTx3wj+5jmWId42OSc82waZjTeHsh3UksF2bO5yN
 xKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=wuX2+uuUjaFZqTpWF0KM6xKOmSk3WOupa/DI6VbjBQo=;
 b=pZxyip43kbgjInaLfwEbiZAwM1J/0jF+nq7DvQ0Do0XhBCKwtr7uVkLvTj9Wc2Ejm8
 2u2s9jq+rocfuyRyOhPaTMCvoj0beJQMh+cahVjgZxfcVcorm7Se7ngHy9cOTyqkFyVo
 tutTQGpMpzb1AKDxU5O7SYG8ioGOL0G8Ek3HlP5SL9sehQTmHpIprbjf/gsusPVOzIeN
 R4GAQzCAwq+EpAb6A7m4ux4Z06miFC/ycehK6msighL09STTInQ6DRd13/wAVdzzHAh9
 YntvrRetN1l5NaQWdJ3/i8C0II0LVKCV4k8MHhVEHQotCd85sp4yxk74ZJ4JKk+0U00U
 MjLw==
X-Gm-Message-State: AJIora/YalQbXlOXCKTXdSGByaZeGDH7G+XrPaBJv7oa+cPSKjMydXQ6
 AIOzGawAARwtT+/k8EG+Yw92GZ9vSJnvVJGfbs2p5Be3
X-Google-Smtp-Source: AGRyM1tkcRGDcwJGlxV9A48haxzL4TBOkj5UoGzJDVamn9yic1KJIASTFkbSbYJBJS/GnPwIJJj7hYNPXD9uv5NGAyk=
X-Received: by 2002:a4a:c702:0:b0:428:8037:e5a3 with SMTP id
 n2-20020a4ac702000000b004288037e5a3mr12037399ooq.71.1658259441315; Tue, 19
 Jul 2022 12:37:21 -0700 (PDT)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 19 Jul 2022 15:37:10 -0400
Message-ID: <CAK7rcp-qoQrEo2D_H=39AeJVtZJfmNUuFRfTdQr6LqUpjp+FEQ@mail.gmail.com>
Subject: Access target TranslatorOps
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000f1f4f205e42d9ccb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c30;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oo1-xc30.google.com
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

--000000000000f1f4f205e42d9ccb
Content-Type: text/plain; charset="UTF-8"

Hello,

I would like to be able to, from the linux-user/main.c, access the target's
registered TranslatorOps instance. How would I do that when 1) the TCG is
correctly initialized and ready to run 2) before QEMU starts to run or when
it is safely paused?

--000000000000f1f4f205e42d9ccb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><br>I would like to be able to, from the linux-u=
ser/main.c, access the target&#39;s registered TranslatorOps instance. How =
would I do that when 1) the TCG is correctly initialized and ready to run 2=
) before QEMU starts to run or when it is safely paused?<br><br><br></div>

--000000000000f1f4f205e42d9ccb--

