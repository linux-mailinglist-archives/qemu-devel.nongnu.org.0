Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E93B733B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 15:33:10 +0200 (CEST)
Received: from localhost ([::1]:60232 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyDrQ-0001Pt-Hv
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 09:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lyDpW-0000cl-9X; Tue, 29 Jun 2021 09:31:10 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:43893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lyDpS-0007Cx-N9; Tue, 29 Jun 2021 09:31:09 -0400
Received: by mail-ej1-x62d.google.com with SMTP id v20so17833214eji.10;
 Tue, 29 Jun 2021 06:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=s9qI29q6wwFZ50nNpr1dpuTpE5c2OgebRBprXjzXjDI=;
 b=nFkN5IVjwccCpyRGtKirgbkq3uHTBL91NRWouXUGhxW8L4jQrB/yTaXBX4dRJLXFiQ
 arFvGdEmO8TBmmjBtPNeB+i5hMWPJMbhj7o6COQ8+KhEk5H0Hk0LsNOj48Q8wfDhuHdU
 5Emi7TOdkjOL0bar30Kx8MLpEEDF7ECBjHNuvHMTDRzt17aO2ThC3nbS1mTrupnsOAQE
 2AN91glBBbySIcWShktJq3pzy8cFifiI8A2tLFlw7GX2//aKTaCrGH3C0voqgtAc/8US
 nEYpzuVLmnF9gwmiTIlIKd3UMlozqkLG2H8a1DRk6NWAHipzdEvkDv1rwzOatzEnIEbA
 xe0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=s9qI29q6wwFZ50nNpr1dpuTpE5c2OgebRBprXjzXjDI=;
 b=Rjhace6/JsAnW09CS18iygpEr7vkTpMbKwCAhd/up5bGjY04196/LnY1xhm/Is0lxr
 TUwOE0ceBii2cTndqTK5GJUwnpvkER99/sTdRaIUuAg1OeEtiwXwlEV7fWx+fCgcgSBm
 2HxzN//w9LsCicd+GtQd+iE8az/u6AsNp5QW7n6JFqRjv4L5bGb1DUNs4B9eiTxP3ilT
 7hcILtQHMLOAWtRNzQYl3vzB6inKZ2mU2HCnCtDlPR69w57rbtwPbbv/rpgbuDrcUtHB
 2HjYWlOGPGEbfOa6meqw71z+uVJnXhEQsexEhcPxmk0htNYS3O4X8v/o2bOdnkCDpMcA
 +98w==
X-Gm-Message-State: AOAM532R4OzvjfOv9/Tm7lcPjdNPcfbtypyBV3orapoUvBZ0DXrLZjRJ
 btBSE6T1nfAUxc/evzaoguJnW2TDzpWNkn8/yiM=
X-Google-Smtp-Source: ABdhPJz+4tSJ1IBb7V46onJME6klkiwfKOr42g1wBYxZwun0xdzJ3NWHc1N9yICscK+6hFAJj/+oxYH2pQL2J0xkJyc=
X-Received: by 2002:a17:907:62a7:: with SMTP id
 nd39mr30200344ejc.502.1624973464164; 
 Tue, 29 Jun 2021 06:31:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210628160914.2461906-1-philmd@redhat.com>
 <20210628160914.2461906-4-philmd@redhat.com>
 <CAMVc7JW23VFMG4tboxjpds2SnK_1j9aqpOboGY7xOG2mwwUWGQ@mail.gmail.com>
 <b93d1d5d-cb48-f365-d04b-124ce4d8e6bb@redhat.com>
In-Reply-To: <b93d1d5d-cb48-f365-d04b-124ce4d8e6bb@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Tue, 29 Jun 2021 22:30:53 +0900
Message-ID: <CAMVc7JWPo6WeXNs0k=F1zA7F3uz+qAvA=txoNAWX2bYLN-mQTg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] qemu-nbd: Use qcrypto_tls_creds_check_endpoint()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu Developers <qemu-devel@nongnu.org>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I tested only with qemu-nbd. Other files were compiled successfully
but I have not tested them.

On Tue, Jun 29, 2021 at 4:01 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> On 6/29/21 4:52 AM, Akihiko Odaki wrote:
> > Tested-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>
> Thanks! Does this apply to this single patch or the
> whole series (since this patch depends on patch #1)?
>
> > 2021=E5=B9=B46=E6=9C=8829=E6=97=A5(=E7=81=AB) 1:09 Philippe Mathieu-Dau=
d=C3=A9 <philmd@redhat.com>:
> >>
> >> Avoid accessing QCryptoTLSCreds internals by using
> >> the qcrypto_tls_creds_check_endpoint() helper.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  qemu-nbd.c | 19 +++++++------------
> >>  1 file changed, 7 insertions(+), 12 deletions(-)
>

