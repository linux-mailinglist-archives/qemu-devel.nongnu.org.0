Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF460D547
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 22:12:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onQEb-0000XB-OT; Tue, 25 Oct 2022 16:09:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenshuo8@gmail.com>)
 id 1onN0O-0008J7-UL
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:42:20 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chenshuo8@gmail.com>)
 id 1onN0M-00022R-IZ
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:42:20 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 l14-20020a05600c1d0e00b003c6ecc94285so939837wms.1
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=OvdDUdoUkyCCREj0yEPRR6IIbREmI6VMyjEceGF02JU=;
 b=cjkzldNtiy1V5OxjjdhpW7vkChkqfzD4EwIPHIdZcizpPj6SMWV3AWuPs0GV8d2uSQ
 K9iUW+SLdSIhg3hrJXBOuODkT/0n4vorDMC9Xwx9IFocPIwqzLSivpUgsE12XJGtCc0V
 fA1e6HVBvl975eI22pUz58lL2fKjlRptlP01cOAaQev9YAN8F1LANoPRHU1rJWG6H2tE
 /FlthohTIBBT0jMyfvLxh1zWURw/Wsc9xI+OHbIsimsVien/SRzXj0F4FvTxE6Sk3AXu
 zsJAnSTcZJPhnUhcdLU2foBM3FHU6NhAnJkgEQOiVBZ1U0Jp/LSSe9MhMeSRqD7UGs3J
 htWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OvdDUdoUkyCCREj0yEPRR6IIbREmI6VMyjEceGF02JU=;
 b=DL6DwMjyxB3Xlfgn9e3/x1HL603JLWC7Fifs/ASc1X338QHSY3WlLXXvJ5ZtYZ1huk
 O9VbxLEazsAUmcaJAfIF0N7mCGLgNKkF4uRyn1cEf6s9jCfF9ef1AOxGdlCguZCE5A6C
 +fYFe34Vgo2jPO/TfS4LXFJRJbx297zBRWGv2nTJ2oiRgniY4TLnohvVEzvhzUHwoSta
 nmD5L/fF0Ez3qnCp0pHdXg2grKpMZlJsLD05fBIBFFRsrstCJzNHOCyLCN8pDY3PTEBB
 qgxSh7ZjE8BfsoPqjb70+GoMFhaCYuGIAbsrDthxR3BZXT7usRX6y3aEo3zIs7dwJGOE
 p49g==
X-Gm-Message-State: ACrzQf3wf2b31lZsi9+lkbxvtQzNqhqJEa5AsBvUzerL7jDKjCVkWeIj
 k+uxhieXpHG8fOREt/KfOUAY/6X6akj6oA+DXBitIdjCZts=
X-Google-Smtp-Source: AMsMyM6QRdaNNBWOpbuqp7FGgV836M9Icm0+4dPT1ACxn0ru5BLdPLDb216eKo3jvrMrgkdj07vPS25WV3nt2k4iLgk=
X-Received: by 2002:a05:600c:3789:b0:3c6:beed:fecf with SMTP id
 o9-20020a05600c378900b003c6beedfecfmr25563163wmr.174.1666716136245; Tue, 25
 Oct 2022 09:42:16 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?6ZmI56GV?= <chenshuo8@gmail.com>
Date: Tue, 25 Oct 2022 09:42:05 -0700
Message-ID: <CAKNF+u_Ky4F+1k=cCxUahOiEp_Cbu2Rp_Q6WrvwdXETKCm6q6A@mail.gmail.com>
Subject: question about assymetric network throughput when using qemu +
 vhost-net
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003e0cf305ebde9775"
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=chenshuo8@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 25 Oct 2022 16:09:12 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000003e0cf305ebde9775
Content-Type: text/plain; charset="UTF-8"

Hi
We are doing some network experiment and found something that we can't
explain well.

We are using qemu+kvm to create a sandbox and use virtio vhost net to setup
the network between guest and host. Then we start to send some traffics
from host to guest and guest to host.

An interesting finding we got is  guest to host bandwidth(10Gbps) is
much smaller than host to guest bandwidth(40Gbps) and we didn't have any
special settings for vhost-net and qemu. So i wanna ask some insights about
why we see such performance difference and how we can improve the guest to
host network.

Thanks
Shuo

--0000000000003e0cf305ebde9775
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0<div>We are doing some network experiment and foun=
d something that we can&#39;t explain well.</div><div><br></div><div>We are=
 using qemu+kvm to create a sandbox and use virtio vhost net to setup the n=
etwork between guest and host. Then we start to send some traffics from hos=
t to guest and guest to host.</div><div><br></div><div>An interesting findi=
ng we got is=C2=A0 guest to host bandwidth(10Gbps) is much=C2=A0smaller=C2=
=A0than host to guest bandwidth(40Gbps) and we didn&#39;t have any special =
settings for vhost-net and qemu. So i wanna ask some insights about why we =
see such performance difference and how we can improve the guest to host ne=
twork.</div><div><br></div><div>Thanks</div><div>Shuo</div></div>

--0000000000003e0cf305ebde9775--

