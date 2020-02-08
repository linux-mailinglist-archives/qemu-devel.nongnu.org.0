Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21388154C6E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 20:47:07 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izn7B-0004oz-Lh
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 14:47:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jerry.geis@gmail.com>) id 1izn6O-0004DJ-Uj
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 14:46:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jerry.geis@gmail.com>) id 1izn6N-0000FA-Sg
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 14:46:16 -0500
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:35791)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jerry.geis@gmail.com>)
 id 1izn6N-0000CI-OP
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 14:46:15 -0500
Received: by mail-qt1-x82f.google.com with SMTP id n17so40402qtv.2
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 11:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+fyj4BqAgCAswt8tu5laBSBlUAe3P/lOiw2nJ14ZKHQ=;
 b=taMl987l1X1k8RXD0MdUFuVr2ow8H3o/iDZJGRq8Zxl4w5xpI67maRDiMtevCljc2S
 j/dkQmB8eoddmgdh3LTZ8217PdIC1Sflrxj1HTHKS+mpxifeeci64WsdJMBrc4lf8Wfy
 xqpT8IkkZ/B1O6TuSZ3jtMAnYT7G3fzwoGjPE8zRuHiOH2e3empqRe6xjVTlAS1ltAft
 VprTeZCSaL/67HJxSzUDZ4xwkQaZfEBaCqJKFulGco9y6XFPWdvl10F6D8qEnb35m3i2
 2Bm9jDW9BhOYKgeYLBuNFMoCTt6ugNr+o+6NR2BAFCFIZqHRaKAgiWMzqNInO/wFeV7G
 Hpqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+fyj4BqAgCAswt8tu5laBSBlUAe3P/lOiw2nJ14ZKHQ=;
 b=gxkV6e5LUBRlGQMFTxxBj0lcVjr9Ifsle2fL6aE3DaSFqMQmMBAqOpSxll4h6gWIxM
 WlNvILSi9IqgB6jwHRiXj/G1NBWVHVh66r6aT6yNrXdhe9UW1OPY3T025uwCUGthsjJ+
 YspHkdIkb0IaGaDfs5FCKI3IuChksITn0dU8ooNhIfQ5PdhVOlV/dWHwvx2TPMIOxe2q
 FChqYaTybeJyfMIzFXSErPwzQo7Mq1H7JPaVkzpLmfVwvyCzZQbVfg2EGK1mqBbknzuZ
 AwVyphXF06QKEL0H5FuR/T3oT1v+ZqgUbMPIxlnOWAqfTzaBDllSgNuazCVeCkOtb5Js
 hqMg==
X-Gm-Message-State: APjAAAVfvha8gfwNU29D+DJO3qcwBZw+HJkB7rg+TmXTpOW9Q8b1ZRLR
 5FVYGOOewecsWlAvzG6aKFEqD8CTwKWAr42VGY/Tyg==
X-Google-Smtp-Source: APXvYqzqko5GYMGdodmsgKiZnmAElq8u7C8/4KQmRCqUeEo/qZd/VkW6UuBVYtvFygMPUGVDTV+CRIqlPdNm/3Rc1Rw=
X-Received: by 2002:ac8:5283:: with SMTP id s3mr4135899qtn.47.1581018374728;
 Thu, 06 Feb 2020 11:46:14 -0800 (PST)
MIME-Version: 1.0
From: Jerry Geis <jerry.geis@gmail.com>
Date: Sat, 8 Feb 2020 07:42:14 -0500
Message-ID: <CABr8-B7+S=WavWA7Ad_7sSB5B-QFJ6uBFuVXPw1hNRQwdZw_7A@mail.gmail.com>
Subject: Qemu 4.2.0 on Windows host
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000009bf166059ded8666"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::82f
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

--0000000000009bf166059ded8666
Content-Type: text/plain; charset="UTF-8"

I am trying to figure out how to boot a linux external USB disk from
windows host ?

I do this all the time on linux - simply -hda /dev/sdb

But how do I reference the USB on Windows ?
Thanks,

Jerry

--0000000000009bf166059ded8666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I am trying to figure out how to boot a linux external USB=
 disk from windows host ?<div><br></div><div>I do this all the time on linu=
x - simply -hda /dev/sdb</div><div><br></div><div>But how do I reference th=
e USB on Windows ?</div><div><div>Thanks,</div><div><br></div><div>Jerry</d=
iv></div></div>

--0000000000009bf166059ded8666--

