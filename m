Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D793F9834
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:40:05 +0200 (CEST)
Received: from localhost ([::1]:33710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZHI-0004f6-Od
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mJZFx-0003sa-4I
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:38:41 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:44791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mchitale@ventanamicro.com>)
 id 1mJZFv-00047p-Hu
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:38:40 -0400
Received: by mail-lf1-x131.google.com with SMTP id o10so13354156lfr.11
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 03:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=65VwjAFZroJ6oXPkWOuIEDMnAi5IHnivqvV2AVPQbl4=;
 b=V9xWItLg6zDvCOSy//ZX3Syd1Q1cCoAPrJvaJc1sfXuwRCBsT9Xq8D/T+E7orLXjBQ
 qvCR8RjCmohZB0Z2KouVlGKKKv+kVQ/6RUhuT91D5YKVLxRxuOXpwmvMIZ6dcUn0bxdE
 IRd+5tdCVgLIhSMSqmsl7E4NEqVRj/IehMyXA/05M8OoyqndUb+RIeEGf0vqTOb3oePq
 ZDA5MlUnCdtlcSu4axqjdi5/bwT8NdqguFKBgxHRcPKFQMruml1mAA37sXYpovdY9ZPm
 TDuQLjAyofGNZlJ6PS/QG8PZvkXSX8V8iCmc20LpiqsnH0EMLKPeUo9nuR/uaevvCI2p
 IWWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=65VwjAFZroJ6oXPkWOuIEDMnAi5IHnivqvV2AVPQbl4=;
 b=Pz/MtkjsxJFQI89vBJLC8gBGwf6BKA1W4LQRFnOHyAgLeRgO6Ivdq35ozE6XKrGZkS
 gwjJGydx/+Lff+OK3p0XDl1gn1dlqMgLj9NH0KcDyLSkalbfrBxaZ72e3e/22YQhDvPd
 PpZr7j+/PCqx3mWjyZPmR9o5XipPUDY+VzOqFHCegFkW5Bkdqj5Mca7EzepbqikRV0MI
 kFyo8PQuYTTCR9UKb2cVQWy23HqbWrXO4RWf5gDCmtrGorcUB6+XLdBa48M5Fy6XNwAf
 ofxmKqRzwaCjr50/xQuWv69NVDVoyF9yWTLIrL+8P0qyZjIFbAp+OmkwjqBo8hCrZUzC
 F3Ug==
X-Gm-Message-State: AOAM533/tqHCMajoZ+H11OeCgfa4o/rzCKdXegZdXFy2LPOQhaXrBkEK
 y/suSpAW4zxRk+jBpl5BV+4lBc8ybe8OdM3DhLnJiJcjWT174A==
X-Google-Smtp-Source: ABdhPJw5f5E5AbxxIC0kZj7pe+Vmjc2PLi/G+fEQJ6QFnwKPEV95TPdXGLxNpYIFoxXUxbxu1JYCAvcLTpl0Nwyctxs=
X-Received: by 2002:a05:6512:3045:: with SMTP id
 b5mr1195627lfb.85.1630060716854; 
 Fri, 27 Aug 2021 03:38:36 -0700 (PDT)
MIME-Version: 1.0
From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 27 Aug 2021 16:08:00 +0530
Message-ID: <CAN37VV745newYKiUe=XWghtgr1ktbdx+7n7NrDuXoxa+jiTnvg@mail.gmail.com>
Subject: Qemu PCIe aer error injection
To: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fda46405ca8815e4"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=mchitale@ventanamicro.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000fda46405ca8815e4
Content-Type: text/plain; charset="UTF-8"

Hi,

I am working to add the PCIe root complex event collector support to Qemu.
I want to test the AER error injection by using the QMP shell. However I am
unable to use the pcie_aer_inject_error command on the QMP shell. I see
this error: "id or pci device path is invalid or device not found ".

I tried using the pcie device id in the bdf format but apparently that is
not the correct syntax. Help message shows that a qdev device id is
required but I am not sure how to find the qdev device id of a pcie device.

Also, while debugging, I see that qdev_find_recursive function which
compares the input device id with that of the devices on the bus fails. This
is because the dev->id against which the input device string is compared is
always null and it finally causes pci_qdev_find_device to fail.

I am using a Risc V Virt machine with the generic pcie host controller gpex
and two e1000e devices attached to the host bridge as root complex
integrated endpoints.

Any thoughts or comments would be really appreciated.

Thanks,
Mayuresh.

--000000000000fda46405ca8815e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"gmail_default" style=3D"font-family:verdana=
,sans-serif"></span>Hi,<br><br>I am working to add the <span class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">PCIe </span>root complex=
 event collector support to Qemu. I want to test the AER error injection by=
 using the QMP shell. However I am unable to use the pcie_aer_inject_error =
command on the QMP shell. I see this error: &quot;id or pci device path is =
invalid or device not found &quot;. <br><br>I tried using the pcie device i=
d in the bdf format but apparently that is not the correct syntax. Help mes=
sage shows that a qdev device id is required but I am not sure how to find =
the qdev device id of a pcie device.=C2=A0<div><br></div><div><span class=
=3D"gmail_default" style=3D"font-family:verdana,sans-serif">Also, w</span>h=
ile debugging<span class=3D"gmail_default" style=3D"font-family:verdana,san=
s-serif">,</span>=C2=A0I see that qdev_find_recursive function which compar=
es the input device id with <span class=3D"gmail_default" style=3D"font-fam=
ily:verdana,sans-serif">that</span>=C2=A0of the devices on the bus fails. T=
his<span class=3D"gmail_default" style=3D"font-family:verdana,sans-serif"><=
/span> is <span class=3D"gmail_default" style=3D"font-family:verdana,sans-s=
erif">because </span>the dev-&gt;id against which the input device string i=
s compared is always null and it finally causes pci_qdev_find_device to fai=
l.<br><br>I am using a Risc V <span class=3D"gmail_default" style=3D"font-f=
amily:verdana,sans-serif">V</span>irt machine with <span class=3D"gmail_def=
ault" style=3D"font-family:verdana,sans-serif">the generic pcie host contro=
ller gpex and </span>two e1000e devices attached to the host bridge as root=
 complex integrated endpoints.</div><div><br></div><div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">Any thoughts or comments=
 would be really appreciated.</div><br>Thanks,<br>Mayuresh.</div></div>

--000000000000fda46405ca8815e4--

