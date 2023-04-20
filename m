Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1A06EA0A0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 02:30:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppeei-0004fK-Iv; Thu, 20 Apr 2023 20:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zainotelucasmachado@gmail.com>)
 id 1ppdy2-0008MD-IC
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 19:45:34 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zainotelucasmachado@gmail.com>)
 id 1ppdy0-0005QK-T4
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 19:45:34 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4edbd6cc46bso1018563e87.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 16:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682034330; x=1684626330;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=4JTIV1vvo5MZqgzqXaSDFFgPZPkNRhw92zhobKlJoTI=;
 b=mK/kYcccO9TRdl3ROs6Eeh9bh2M6ZTS00VBoq0kd32WBGt03z1Mib7VZUz/cDEQuJs
 EPEzRLvT+EnKRBruY8i1VWWQ+J/nCKW7ReJ+0NFaAVm+U5thslN96sRljC7Wt5xlWWhw
 f0C1ENPotWeCmqIeyH/6ebuQnBTzmh5NqnVgyDuyV0TAfgl5zMQLA0OhFC1L1cnqtaJJ
 aYxTvFANS0ruK2IOLLObju/kaIyuLy0ThFGVJWs90jUlEYIgBzJDlcipNFRN6MwvECuR
 V9MzaRR07XQC7Av2XSibBQxm1d6VTKfZBeZIViI1EUV7yJ9GWSMGNvP8JUvQHzmSpqIP
 skCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682034330; x=1684626330;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4JTIV1vvo5MZqgzqXaSDFFgPZPkNRhw92zhobKlJoTI=;
 b=NdkoLbV307j68/lpKilohjpFXnFWdAxOzUGEkVuK/zVxmXfje498252jb8cyDp9GCO
 e86QASxydYBH4ofy+cXs9DcaXxdQK0Ic6VFmhMJqe/gcJkPaInO10gohzWBVK+CMIeuO
 OyLkJGUnQx6wj5V5b+asjsdWzcCJAQGv6hrNsAlLkwll5fIQg1CtwKtsvlSV8hcjlA18
 MD1RPVezpAmCSkH2S1rhCRcDnnnnhzBSGCKN9IMclftXolvoeCL/+GMuiCCCCY9KuCub
 JxgVmDXo9MAsY9gNZU1k5a1Cxe7mdZQ6VkSgCHidKZyQkHUJPVC58YKP2sn1dWXfGyMX
 kKIQ==
X-Gm-Message-State: AAQBX9dDEmC89K9Jhmiocn5Ef4KgiaEXJSELZB37aA59rVw4BkNNaZLt
 yNDwJflrvbu3Pc6EHtLLGlKgarOoi2R3h2bknWG1AYCSYYY=
X-Google-Smtp-Source: AKy350a0eHoZOoFrMTjOAH3uJ7nFyoeeZAyMaW8XCAAiWXFOvJa7+2b9X9T4mW9+CiUDfVVw/6WTjqWNphD/RVh2NjI=
X-Received: by 2002:ac2:494f:0:b0:4db:d97:224d with SMTP id
 o15-20020ac2494f000000b004db0d97224dmr744596lfi.19.1682034329968; Thu, 20 Apr
 2023 16:45:29 -0700 (PDT)
MIME-Version: 1.0
From: Lucas Machado Zainote <zainotelucasmachado@gmail.com>
Date: Thu, 20 Apr 2023 20:44:38 -0300
Message-ID: <CA+kL3adW366NEoUujxRTOoC=KFp9BuXq_aMcODHLkQQvFWGDpw@mail.gmail.com>
Subject: I've made a qemu appimage
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bce45105f9cd2248"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=zainotelucasmachado@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 20 Apr 2023 20:29:38 -0400
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

--000000000000bce45105f9cd2248
Content-Type: text/plain; charset="UTF-8"

hi there!? I have made a qemu appimage that works in the most linux
distros, if you have interest you can use mine as an example to ship your
software for the most linux distros.
all in a single file working perfectly.
in my github you may find commands to use this appimage.

https://github.com/lucasmz1

And of course I want to ask your permission to redistribute this
application in github page.

Thanks for the great application you've developed.

Thank you!

--000000000000bce45105f9cd2248
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>hi there!? I have made a qemu appimage that works in =
the most linux distros, if you have interest you can use mine as an example=
 to ship your software for the most linux distros.</div><div>all in a singl=
e file working perfectly.</div><div>in my github you may find commands to u=
se this appimage.</div><div><br></div><div><a href=3D"https://github.com/lu=
casmz1">https://github.com/lucasmz1</a></div><div><br></div><div>And of cou=
rse I want to ask your permission to redistribute this application in githu=
b page.</div><div><br></div><div>Thanks for the great application you&#39;v=
e developed.</div><div><br></div><div>Thank you!<br></div></div>

--000000000000bce45105f9cd2248--

