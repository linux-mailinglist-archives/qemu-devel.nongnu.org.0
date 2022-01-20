Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD02495184
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 16:34:05 +0100 (CET)
Received: from localhost ([::1]:40704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAZRs-0003hu-Sa
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 10:34:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nAWCP-0000TK-Bl
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:05:53 -0500
Received: from [2a00:1450:4864:20::531] (port=39725
 helo=mail-ed1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1nAWCM-0007yP-Ky
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 07:05:52 -0500
Received: by mail-ed1-x531.google.com with SMTP id u18so13550821edt.6
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20210112.gappssmtp.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M3ufTUig7+rIcOyI+3zp0fXbc1pb+nvQC+3lEefr5Fw=;
 b=OmgxVb7BQgXzZF8AjO0qiD4r3SUlABT7wW1gezYkO5CwGGJDOzatFRrhW3sWIVX1on
 FTYLARheyu/TidRjAtvhJZu+gHzlBLErjFFkrBZuwT07c21f+Em7AJ3drcRLUC4d4s/Z
 Strnf1wNdmb0EEH9OmikdpaEf/rECFoO5EduKDgLX+nZ/kfGx0K+snQXSAvZ7EOvVs2n
 DVfcEqezQ0lntokr1QElpuhBAUMnPkDE3VpAigCW6L3LZGduwu/hf99Ljt2JqoD4q+sI
 AOpFWA1xy/n1HiSEIwdhBed5VNJIyeNSl3jZz4vbZmna1o5oNzK16lbcIsp1vzDPWfVI
 bhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=M3ufTUig7+rIcOyI+3zp0fXbc1pb+nvQC+3lEefr5Fw=;
 b=lQHpvC00vH5DXVLs8CD13esLHasqwCuYJoXKsL6vekZJw+PC8R0T34bL+l5HgTY8tj
 c0W94Qf83yKfUB7mbZjyKfikjbTJn+5wMfC91l2u/45BYZKu31xGpDSX0SUs5CLmiksM
 ucdsQtnS9y8GwUm/+WkNM27G4rSvyNZnnHzCAlS1E1q+N4unJedmrnmDA9j95tAgpaJZ
 uk/Cje6eYxZXa2DVLj+7/YJW113sTE/24NYrSLwuPm4fZNoWaleLBt8PK6Id05I6F7QB
 janFm/KlENRs9/g6WoYHIGXfeZFKjc7rVuHcQGEfcNr7w+8pd4QopWF5pAhMvqs2rUFS
 rTPw==
X-Gm-Message-State: AOAM5325EGktDX819ZAFHwGy2/nxwDQVZ70/FvDw2VCFpfTfvHgDv/Ti
 xn9o5hXJVW0AQa98QSYOuYbhX91wyB9NIT0F
X-Google-Smtp-Source: ABdhPJxZo/PuOpH49tjvO2mMJ6B58Gh5SMnCsgO8Xij7JVxgE3nRH7p8SHV0AecMMAMFWANXvXIMnQ==
X-Received: by 2002:a17:906:c20c:: with SMTP id
 d12mr28562661ejz.373.1642680348792; 
 Thu, 20 Jan 2022 04:05:48 -0800 (PST)
Received: from smtpclient.apple ([188.25.251.197])
 by smtp.gmail.com with ESMTPSA id t6sm910688ejd.85.2022.01.20.04.05.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jan 2022 04:05:48 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.40.0.1.81\))
Subject: Re: [PATCH] Add --with-branding-prefix and QEMU_BRANDING_PREFIX
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <20220120113545.55820-1-ilg@livius.net>
Date: Thu, 20 Jan 2022 14:05:47 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D063D85-276D-4C2F-878F-4D58E429C157@livius.net>
References: <20220120113545.55820-1-ilg@livius.net>
To: QEMU Developers <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3693.40.0.1.81)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::531
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::531;
 envelope-from=ilg@livius.net; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 20 Jan 2022, at 13:35, Liviu Ionescu <ilg@livius.net> wrote:
>=20
> It is usual for various distributions to identify themselves by
> prepending a string to the greeting message, for example
> 'xPack QEMU emulator version 6.2.0 (v6.2.0-2-xpack-arm)'.
>=20
> To achieve this, a new configuration option (--with-branding-prefix=3D)
> was added, which, if not empty, adds a string preprocessor macro
> (QEMU_BRANDING_PREFIX) to 'config-host.h'.
>=20
> If this macro is defined, in QEMU and various tools, the string
> is displayed before the existing greeting messages.

This proposal uses a conservative approach, and does not assume that the =
macro is always defined.

However, unless the configure process fails for an obscure reason to add =
QEMU_BRANDING_PREFIX to config-host.h, the definition should be always =
present; in this case the code using this definition can be simplified, =
by removing the #if/#endif and always inserting QEMU_BRANDING_PREFIX at =
the beginning of the string.

Any feedback will be appreciated!


Liviu


