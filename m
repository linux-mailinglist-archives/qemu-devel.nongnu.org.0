Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C654D9D23
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:13:56 +0100 (CET)
Received: from localhost ([::1]:35082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU7vv-0005Vc-JF
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:13:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sheerun@sher.pl>) id 1nU7eT-00071S-2d
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:55:53 -0400
Received: from [2607:f8b0:4864:20::e2d] (port=42548
 helo=mail-vs1-xe2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sheerun@sher.pl>) id 1nU7eR-0001v0-51
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 09:55:52 -0400
Received: by mail-vs1-xe2d.google.com with SMTP id j128so20851751vsc.9
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 06:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sher-pl.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=XVOZ0ia5FQaQ6qch1wM0EGgMJzT5haMgz84pjat75qk=;
 b=FoJZ0d3SIwK5xvMnRS9yoggiKLMW50vBZwqrl2naDGchEyi9uCy6EchoINVNAQljVq
 BkfCF2wOSa59kxubKK8u8ozfZDgmC6Tye+0Hb0/sbnSKU1FvEuqaV5e/XuxjY7PoeX0h
 DqblJKkle3FH76oF7i6b3+2G+hQg/UuC4MwSNRbUDtTQVWVf1BHZTyKCpeV+0Jr+ov7x
 EbBPWb61l7iDKNQZ+7SpjGlXn10VLQsZpD3W9iT9Mm7bkoRGVwsdLbdSOkaT55ZaOD9n
 HKnY9wXzGABmiMerxsWBVM/1nlny/KvGtC0ruWJcCQAiTU5ralWF+UxkzyS2YYSftusY
 Ryfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XVOZ0ia5FQaQ6qch1wM0EGgMJzT5haMgz84pjat75qk=;
 b=FnErZSfb+Qhl9D07o9+L0+sS4pq/fDXLkKShx+kupSQQwX6LGcPU3lbHznztMG8a+I
 RXLBmK6ZK/8pyKZJ3I0//WFblinrrxa/wVHnL4ZCjK32P13x/1qpWgsyxwtoIBcLgV7s
 /duQAa7bVp6qr6UiMWiPOX4/eUO2JR8n/gU1adD9AZs7oM2ftZomN19K4s91TxADGIns
 0xwdB9nACGzGpUhpi7NkNPkSUwbtmt2W6MHdTlmkIMNb1MTeqz52aNgRIATfxKPg4Y1c
 6GP6iTCDmVC4GmawRs4IkUcv1IkFlCd9UUNxwZF+spcxsaFXn1nyV9GL8q9R7x0YZQM3
 ziFQ==
X-Gm-Message-State: AOAM5314WOCTLzihcQ8Trw9w4ID4kjS8fqApuC8CKFvMBQe8/b8Y06n1
 Zmuo0kAtSYUE4icjrViYDZUCG0/sge8PHZLPEnV4ZcJfGiY692Ra
X-Google-Smtp-Source: ABdhPJwLok6TPKjdSGH+cdw9ejXB6ykHsdgwXSrUkpnQRClfBu2De2b5UiG9ej22H6q45W7Y8DKOF6kn2e7mHTS3yeY=
X-Received: by 2002:a67:b846:0:b0:320:898d:b70d with SMTP id
 o6-20020a67b846000000b00320898db70dmr11183836vsh.31.1647352549756; Tue, 15
 Mar 2022 06:55:49 -0700 (PDT)
MIME-Version: 1.0
From: Adam Stankiewicz <sheerun@sher.pl>
Date: Tue, 15 Mar 2022 14:55:21 +0100
Message-ID: <CANCidP-6L861iGHPd413DRou0BJarig+7PkOLy_B_5Fcf33n6g@mail.gmail.com>
Subject: Wiki Access
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008c68f405da422750"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::e2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2d;
 envelope-from=sheerun@sher.pl; helo=mail-vs1-xe2d.google.com
X-Spam_score_int: 22
X-Spam_score: 2.2
X-Spam_bar: ++
X-Spam_report: (2.2 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 15 Mar 2022 10:12:15 -0400
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

--0000000000008c68f405da422750
Content-Type: text/plain; charset="UTF-8"

Could someone add me to wiki? Username: sheerun

I'd like to describe on https://wiki.qemu.org/Hosts/Mac how to setup QEMU
on Mac with volumes.

Best Regards,
Adam Stankiewicz

--0000000000008c68f405da422750
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Could someone add me to wiki? Username: sheerun</div>=
<div><br></div><div>I&#39;d like to describe on <a href=3D"https://wiki.qem=
u.org/Hosts/Mac">https://wiki.qemu.org/Hosts/Mac</a> how to setup QEMU on M=
ac with volumes.<br></div><div><br></div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Best Regards,</div><div>Adam Stankiewicz</div></div></div></div></div></=
div>

--0000000000008c68f405da422750--

