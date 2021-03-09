Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A44D332A5F
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:26:37 +0100 (CET)
Received: from localhost ([::1]:58428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeFh-0004Pv-CM
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJdUY-00088Y-O3
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:37:46 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:45576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ilg@livius.net>) id 1lJdUW-0002Xe-Sb
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:37:46 -0500
Received: by mail-ed1-x535.google.com with SMTP id dm26so20498303edb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=livius-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RRl8ZwwGl0rjUuWYzuTyINdrAJBZTYZJDNbf5fF8KoY=;
 b=CoznnZ27q0i1MKxTi9Kzn0pbxM0+i8sz/AeGxchjjmU0q9HmtBbRYfchSdHaUOZxhi
 R75C88eikBDRw5x3kLNW0R5FVRMml1BmMRDmmeP3nwm7g49m5IwpUbkKfft2MvIpKaF4
 bIU4nLBma6xnfdIlNiSan2PitrLylwGHpnhsLurVhw5trXKjqCrgtquIdtfMJfBmr+oJ
 H1n8RvC2AbWziVDGJEIygH4AV4siVeCrw+VyWPkU3locEfjpc7H9qsc/CfHtulwf0I6u
 C/gTgPPVlNmdn4zC0uRmFa1n60jeG+cfVbPcW0dyvzIPSNZpkfcqK616OZcdmcJNkLl8
 p9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=RRl8ZwwGl0rjUuWYzuTyINdrAJBZTYZJDNbf5fF8KoY=;
 b=PakStvaFneXEDR7X2sSZVbeWxAC8Pgue3gfUDnZzYDe4bDTyDkxm9hKrrAU/VDosHJ
 Y7jAJWSPcU5swH7X1OvJqZvp6rkU9vW1jHHcnqCtIC9cBNeHCTdtNlNgSDXusA38gByu
 tyt/eGpCrZgOxT/GYWAXsAnDFRzvktLq3on4wrRBJ7Sbrk6SpUlfiYFosO/nAAbFRk2j
 Rf1bQDz60KStRbNDgpmCyZzhQag8vrQmTDTROEQuhBp9r3HQ5osEUzLXx5fhjqxOC9ux
 /Mrgr2J7eWfgFfqIR39A/TiJgyD7q6lyYy2muxz8e91Ey7Hagqj25BB9h4YLHobPiMlj
 4e9g==
X-Gm-Message-State: AOAM532pVNFRTDhzSSVV6iMaG9tlm6FUGJSc+I3gWmOElpHB1I0AZ7FI
 u6wnD8BqcztU10gwmcOFYwlylQ==
X-Google-Smtp-Source: ABdhPJzWDAhoaYG6EouIhSW8TZfLSJGCaLxZq8HAhGZomA8+sCNf6bfpmtlw5MOHor/CFzO4YuBzkw==
X-Received: by 2002:a05:6402:304b:: with SMTP id
 bu11mr4287747edb.157.1615300662793; 
 Tue, 09 Mar 2021 06:37:42 -0800 (PST)
Received: from wks.local (5-12-20-125.residential.rdsnet.ro. [5.12.20.125])
 by smtp.gmail.com with ESMTPSA id e4sm8566632ejz.4.2021.03.09.06.37.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Mar 2021 06:37:42 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: Malfunctionning qemu-system-arm ?
From: Liviu Ionescu <ilg@livius.net>
In-Reply-To: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
Date: Tue, 9 Mar 2021 16:37:41 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <FBA649E1-4EFB-4409-894E-C1A5AB086BF1@livius.net>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
 <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Received-SPF: none client-ip=2a00:1450:4864:20::535;
 envelope-from=ilg@livius.net; helo=mail-ed1-x535.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On 15 Feb 2021, at 17:09, vincent Dupaquis =
<v.dupaquis@trusted-objects.com> wrote:
>=20
> ... stuck on the starting HAL_init() call.

HAL requires, amongst other things, the clock registers, since it sets =
the PLLs for the desired frequencies.

xPack QEMU Arm [1] implements these registers, and is able to properly =
run the HAL init code.


Regards,

Liviu

[1] - https://xpack.github.io/qemu-arm/


