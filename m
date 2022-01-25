Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DE49C011
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 01:18:31 +0100 (CET)
Received: from localhost ([::1]:59832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCW18-0004a6-9J
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 19:18:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nCVif-0008Se-3L
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 18:59:25 -0500
Received: from [2607:f8b0:4864:20::22f] (port=37417
 helo=mail-oi1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kennethadammiller@gmail.com>)
 id 1nCVid-0004h0-LU
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 18:59:24 -0500
Received: by mail-oi1-x22f.google.com with SMTP id u129so8270112oib.4
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 15:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=9cwu7OBToBhv5O6xq+ecW28ntG5xA531euDqh4w8WUY=;
 b=XNOfSh4u827dPdRYHdH49Py+2BrVT2ELhccfBzNG8RkgOxNrh+hM3CLy1gQEzc4fDU
 29jdPEos03Mk2aLtwkSqLq4eMH5t2e022tLDNf1LRoALk9qdwDN1DACpz7JA2Fvp4D5/
 cLhes4mqwSCqq1C0VpYhlqiWEFhndFMXFdNsy+/DU2tOhlK7/fAHXd08gltYqK0ypDgu
 WWtZ2ia8oJ9L7sMOUVAgYZnWgkIObBzDQH8ibEexuM/fMBds2/cRPLA2SEJ5Sk9AOZx+
 4ErZELu8AI9bRa4YECSkuCpNRm251KRHbgzW9RPY3IfwTOVvTZJBlblpGiIAgLY4UF4+
 vcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=9cwu7OBToBhv5O6xq+ecW28ntG5xA531euDqh4w8WUY=;
 b=NKrSizyz/F+St45H5kBHET5WEWfN/p+FgJYDpPZzYOctybZJKtoC4hU+lY2Zmmv7KU
 Q+zYcYWPBkB2cLsj/m1fq4KpBuIExC6jseUjh05KxhSgtf4ABHBF69PnJPCJz86TI1yM
 Ca/00rSynulsGbedU71+mDHrKtp4gf6oz6mWklJvyVfG3flNZr3duuK4x18CVQYOJr7H
 Ux6zijxZTBP1JgDd9ryIJJXl2qptdTt3qNn/GU6afQ9GMdjvrOwxMTd8cq6iceA8bZN/
 ZhRcvFD8+JyUPeF7lEhzOwVtzdCvd5rtQ0XCHzrzAwpzCi0TI2EJdPUv3CCnGuxzT1xc
 Kq+Q==
X-Gm-Message-State: AOAM531IAMVYhH6pjPN6iRQsp9Mw12QWPPMKIZa8cjCDrzWPlSmeYr+t
 bSUa+NDlltvz5gJHWf3h9lmE+nPhDwarCtNWU9UGcUoV2Ezccw==
X-Google-Smtp-Source: ABdhPJwEQZ0UhLTtJdF39cTP7z9Q1exBfTcP6iLLhwA2ONTLjY2+X2+urRFLxtyafrsIeICLijuwjuWMQs7wXjhakYY=
X-Received: by 2002:a05:6808:f88:: with SMTP id
 o8mr2301191oiw.29.1643155161773; 
 Tue, 25 Jan 2022 15:59:21 -0800 (PST)
MIME-Version: 1.0
From: Kenneth Adam Miller <kennethadammiller@gmail.com>
Date: Tue, 25 Jan 2022 18:59:11 -0500
Message-ID: <CAK7rcp9pFFvYnvwgX_9ganFsc8V5+c7keofM7PPSY3Fp82J15w@mail.gmail.com>
Subject: Raspberry Pi?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000ba797305d670df72"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=kennethadammiller@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: 14
X-Spam_score: 1.4
X-Spam_bar: +
X-Spam_report: (1.4 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

--000000000000ba797305d670df72
Content-Type: text/plain; charset="UTF-8"

Hello all,

I would like to emulate something on a pi so that I don't have to pay as
high of a translation penalty since the guest and host will share the same
arch. I'm finding that on some forums that people have been having trouble
getting QEMU to run on raspberry pi. The posts are kind of old, in 2019.

Does anyone know if this has been addressed since then?

--000000000000ba797305d670df72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>I would like to emulate something on a p=
i so that I don&#39;t have to pay=C2=A0as high of a translation penalty sin=
ce the guest and host will share the same arch. I&#39;m finding that on som=
e forums that people have been having trouble getting QEMU to run on raspbe=
rry pi. The=C2=A0posts are kind of old, in 2019.=C2=A0<br><br>Does anyone k=
now if this has been addressed since then?</div>

--000000000000ba797305d670df72--

