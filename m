Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 507C149D171
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 19:09:59 +0100 (CET)
Received: from localhost ([::1]:35304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCmk2-0002Wa-2h
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 13:09:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmgu-0008V3-LH
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:06:44 -0500
Received: from [2a00:1450:4864:20::435] (port=41930
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nCmgs-0002Es-GQ
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 13:06:44 -0500
Received: by mail-wr1-x435.google.com with SMTP id h21so431023wrb.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 10:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=SUD15Xe4vNahY/NaTaU1Ia3FZqtSNmlnp2SZLaOHK0A=;
 b=xihVaJZs0zfPxHjxle5aTU/8wxPT98//QsFZr50nN9txpXQfBuYjEzAKJM8rYEfzNV
 WbaUwQ6TwoJQB56ABw3y3gptLdmrevFQul2IENyfqtSoaKko7BUXKIkFdIASLYGe3wFK
 4qlETbQ7Q2InMFr/ntvJgu+B+ba/1HDumzy4OPxEh0uiTooPne0Hm3Oz5YsPOibw5HTz
 AimfAljmELGU9toslr4z/vqxLVD/G64S3SAH7APMobFcYGeB6ACiyWUvNMzd4gZT5PWm
 5Hhs9BMRaNIdsiL6I8cYehN3ZFdi/johfLvi2PFKirCiBs7490NpcRkYyzh2ZIerqPI2
 cC/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=SUD15Xe4vNahY/NaTaU1Ia3FZqtSNmlnp2SZLaOHK0A=;
 b=1XDRsQzgr/JmG7Urj+T2HchWjJXFSHXLdRoFTfUiZOeKthgcP0LkLeFSV0kvkSQLxM
 BzocQHjjhB+X4Hok431nl1Y0xa1FPVfOWOf14TvLU3EaAUFe3FZ7Dfi8cwwOyyMtnAos
 vvsMQPNysKPcuijZ1LwMYFts4Z8ii1KeIf50OpTdlPLioI5L+fQZ3h+rlMRJOAx4WpIs
 gdr3GaezX7hdmmYdAfYYyQ4WWZzy5QpC0+BamtmL65gKbXJADDwRXDZSVao4oJzTdg35
 9YEpegjybMzm8tG5Nl56v3BDY/I8mTDDOu9O9sFIaPfDb97A2LdyGbFmK5u4VF0VsAYQ
 7fJw==
X-Gm-Message-State: AOAM530Lzu9x7fJHiMNI3ZbfDZPnMfe6D69OSSaSSaH/YWRqidan7C1i
 AjUPcWuotvQp+p5Bzl1wCdFtuQ==
X-Google-Smtp-Source: ABdhPJyatRU7H8bGEXZUAswGd8tPDe0oTmGX6rXn+8tH/euENSVQS1cpGVIGvxQuTZmOU8igT8vvOA==
X-Received: by 2002:a5d:6488:: with SMTP id o8mr23375656wri.219.1643220398072; 
 Wed, 26 Jan 2022 10:06:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u14sm20011565wrm.58.2022.01.26.10.06.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 10:06:36 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F1B51FFB7;
 Wed, 26 Jan 2022 18:06:36 +0000 (GMT)
References: <20220124171705.10432-1-Jonathan.Cameron@huawei.com>
 <20220124171705.10432-4-Jonathan.Cameron@huawei.com>
User-agent: mu4e 1.7.6; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH v4 03/42] MAINTAINERS: Add entry for Compute Express
 Link Emulation
Date: Wed, 26 Jan 2022 18:06:31 +0000
In-reply-to: <20220124171705.10432-4-Jonathan.Cameron@huawei.com>
Message-ID: <8735lacqxf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@huawei.com> writes:

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> The CXL emulation will be jointly maintained by Ben Widawsky
> and Jonathan Cameron.  Broken out as a separate patch
> to improve visibility.
>
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

