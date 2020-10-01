Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F8027FD4B
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 12:29:19 +0200 (CEST)
Received: from localhost ([::1]:56592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNvpu-0001k2-Ai
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 06:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kNvoT-0001HY-1l
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:27:49 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:35765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kNvoP-000100-4G
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 06:27:48 -0400
Received: by mail-lf1-x12b.google.com with SMTP id w11so5910628lfn.2
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:reply-to:from:date:message-id:subject:to;
 bh=iGa+qFgSIkBl4GPsPIzwcNrty0YH5eYQvnSsj2kDsLw=;
 b=mr3CyaqNU7w0cKcGGP5BmuSt4tPIor3jlSnXzRAipzcwnH8PGxU3ymREzskm1gkTTp
 f7Nrjrx8a5HhykVaYwdo/gP3kuaRxNKV8Ayc2fz24Kiunt1Wkf98fyEyIjJDyNwotYuW
 HXQZwYmifMU1i/N99Rx1D3GZSnjkLFrieG97O1pwiDYd2lkT8ReKKhUZf5umZYPadJt+
 k+kticl9/HWlSLYRB3DJsEWbutnxCv4Fi4Af/54jGDTlwodxiQnQ4jlRiRg0YDzewlSz
 pvfaB/iYhS9wJqVGDcR/XE9E5auTqcAnWPa2HujD2rRsbxg1FPdqh/4WQYxAxhXtsfY5
 aAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:reply-to:from:date:message-id
 :subject:to;
 bh=iGa+qFgSIkBl4GPsPIzwcNrty0YH5eYQvnSsj2kDsLw=;
 b=YaMTGprUOp/CQOGii92pUn63tuQ0Z8MYfuKYuj+10RSFc+dlPx4v0zsFmDXOYB2Y/m
 uEKH8qZUbMoj1H/VuyoILs8FZKOuuws8usiBIGYc4vi7SUIKUhDuI51Kb9aK6pVlWF9U
 YTm+BwxISNzhxzDv+kAVvjNNI8mSZ5jk9a1ei4MxjgqzyuT+cIA8iqgmcJZuWcMBngca
 JX8X+Oz+16QrrDsFzV0OFGVW5rGQvOt6ZD+gGzeK+HcEpOZhJ0ghlEQOTsFrQmYO6ldE
 XNF4tOQeE4bh3Pzc3v2QcHjiUY9ktN2AhnuLoZDYMCr44Szj4ydf6EkbWNiBtZw4lxRm
 Zy/w==
X-Gm-Message-State: AOAM532FmjYPAPgofxGJoQxnaukmHZ4ta6eekLI3Iy7Pnkj0j7acAg/E
 2lKuI9Inc/QATPV0RZJbkf/7aj1782bIN+365n4=
X-Google-Smtp-Source: ABdhPJxkABUk6UB1nE1XcFE8R5NPtrcmmWQHfhdwm9uBqSEQCwNmPfBztvx7EjZh1SGoLHYRvrC6lM8hlpc92V6DeXE=
X-Received: by 2002:a19:189:: with SMTP id 131mr2183065lfb.331.1601548062881; 
 Thu, 01 Oct 2020 03:27:42 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Date: Thu, 1 Oct 2020 18:27:31 +0800
Message-ID: <CAE2XoE-PwYfKsZTMB2gaA6Fxrs7HRZoqNr2o2c7buUT7ijqeig@mail.gmail.com>
Subject: hxtool-conv.pl doesn't used anymore, may us remove it now
To: Peter Maydell <peter.maydell@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000060fde105b0997781"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=luoyonggang@gmail.com; helo=mail-lf1-x12b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: luoyonggang@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000060fde105b0997781
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

LS0gDQogICAgICAgICDmraToh7QNCuekvA0K572X5YuH5YiaDQpZb3Vycw0KICAgIHNpbmNlcmVs
eSwNCllvbmdnYW5nIEx1bw0K
--00000000000060fde105b0997781
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0=C2=A0 =E6=AD=A4=E8=87=B4<br>=E7=A4=BC<br>=E7=BD=97=E5=8B=87=
=E5=88=9A<br>Yours<br>=C2=A0 =C2=A0 sincerely,<br>Yonggang Luo<br></div></d=
iv>

--00000000000060fde105b0997781--

