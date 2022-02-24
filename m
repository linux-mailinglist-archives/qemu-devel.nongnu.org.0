Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1C74C2C3A
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 13:56:33 +0100 (CET)
Received: from localhost ([::1]:49188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNDfc-0008UJ-Nj
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 07:56:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDXg-0001Y2-0e
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:48:20 -0500
Received: from [2607:f8b0:4864:20::b2a] (port=36758
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nNDXZ-0000oQ-AM
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 07:48:19 -0500
Received: by mail-yb1-xb2a.google.com with SMTP id c6so3580952ybk.3
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 04:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QhGaq9nn9n1l5XrHXInGW4eWR65uXJplxUiSy6cl8wE=;
 b=oQ7plYDGbrlZ1MLB/fqPdi1Kf2jTd2Npu+iFfHQ8MKcs+BJYXb23sQwl2UxVR7XMXV
 XmezP/9N3z3Zdbv/hx+Q1cz2npRWogxGJtuYS27wyKPmKMR+fUiUuPbBb8zY1pK8O4L8
 S8EQ+tkLPYgch3HEnhcIT2MtJ5EJs6JmR8aqQ987X8hStRpKqyv3fHv0Uuua0Az1ucHa
 jzKlVCbPuX07ZoyYgicFliUI3ggENbMiRLbWoGcUr8NYcrvXrlrC48irywbY7Dm5MIij
 iufzs+DglK5bz1rqp0uasEQ6jKxXl6+cfMsEgdVGxfe6rFXvm5q0g7O70WoOCRGyqes1
 lAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QhGaq9nn9n1l5XrHXInGW4eWR65uXJplxUiSy6cl8wE=;
 b=TUFevCwEkluiuzfv+ryC4l5Nj5XB0wfre1Q18Iucl8iNZzT5KA8UMsBgDU6+GQJZGd
 a97N2vkizmavuXWNyjzlZe+nCxCbrNepiTIBfW1bzTWx9vrcBLrVx1fa4gLobcJLFIDt
 1tt7eVi2VXDM4Ipsp+1G++DqNKgY2oRcO7/QAADqaz+POldCZpluWmBpZfzIJO1XsUph
 RXnOta6CGoVcC5FDiKRh2nSNi0K/cT9sPgDvkqZtAhcPyegAYBIXe0kka0A49FBP6ZXg
 kDt8oEOCrEVMl26wjtUnLneVqVUFbwEuQG8hLn0hDkXST3i+tV3n0icfe0lTGrxAIAha
 scng==
X-Gm-Message-State: AOAM531otYCmC+sV6zKSgn1wokXJO4pz5Sny3/svt1maSx0Qf594oHWG
 tP2hynecFtOTrMZ2Gwnbpe+/FeMjbbeTsjTMGo/E+8hcfqQ=
X-Google-Smtp-Source: ABdhPJxj1uObRwsx8MUXCRT5bCSjgO73bZwrUeYAN2hCsM3EzpE+p3ZAScdrTDFm361GmxAZ2VbIdqefyJHT4x8PNS4=
X-Received: by 2002:a25:8084:0:b0:5fe:cadd:2532 with SMTP id
 n4-20020a258084000000b005fecadd2532mr2171187ybk.193.1645706892182; Thu, 24
 Feb 2022 04:48:12 -0800 (PST)
MIME-Version: 1.0
References: <20220217115723.1782616-1-berrange@redhat.com>
 <CAFEAcA9vQUAYPHU6KOwVJRxY=SOa2iipPR-5s0JU79MPEmvQBA@mail.gmail.com>
 <YhPlWnkN5Nf009yC@redhat.com>
In-Reply-To: <YhPlWnkN5Nf009yC@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Feb 2022 12:48:01 +0000
Message-ID: <CAFEAcA8d2hyGNHEP9O_ewmf8QgxdH2Nn1P4i6wFbKyeE3zs_uQ@mail.gmail.com>
Subject: Re: [PULL 00/10] Misc next patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org,
 "Richard W.M. Jones" <rjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Feb 2022 at 19:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> AFAIK, the block jobs run in CI don't cover the SSH driver at all.
>
> I had a CI pipeline before submitting, which covered Free BSD 13
> which passed. To be sure I just rebased to git master and tried
> another pipeline which passed too:
>
>   https://gitlab.com/berrange/qemu/-/jobs/2119118096
>
> so I'm thinking the failure you got is a transient. Could you retry
> this PULL

Does seem to have been a transient. (We have way too many of those
at the moment for a variety of reasons.)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

