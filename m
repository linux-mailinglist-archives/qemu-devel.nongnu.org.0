Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927D1513351
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 14:04:23 +0200 (CEST)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk2sg-0001bg-8I
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 08:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk2oF-0005eS-UX
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:59:49 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jinpu.wang@ionos.com>)
 id 1nk2oE-000826-2K
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 07:59:47 -0400
Received: by mail-ed1-x52b.google.com with SMTP id d6so5233907ede.8
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 04:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=4u8f9Hb3tsaqmFwY4mze0g/3ACzPo20apKMOCSmqw+o=;
 b=AEQtHpoBojNiovIEZ96e1WtqIapM8LJHytf/0zs0p3ggy2kI8uOs3yuKGlEnakX7HU
 hifJmSGZwog5mzSPJGjrC43o4wddI1La8w+HiMnsoyeKIFoBW2uxU+6AHoD0xUvIh7ye
 L5H/psjd6bhcn327YYvjMGYzASV9YvKSzP5cu3rBp/YN8ZhZ+kdqgZdPXaSvsdhzTUhn
 a8nGMZb5mCUOZHYCVQZc/6cOPdQk5PBvPYqg0Hd/XJsmYApqgoV83QvUjniP1d5mC2y5
 KIPeFE7VQTrnIHj5nkOZ8IE2B/BMozORT8+mqrzU6hpxdUT/nDDrQ1R4r8O21POcXnd4
 0Amw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4u8f9Hb3tsaqmFwY4mze0g/3ACzPo20apKMOCSmqw+o=;
 b=Bv0OZJeTv+5lroQb5VaCvBnfl06Rn1gpkTnp0isNneTYYo5oiJwi6uEG3IfpP/TsHK
 zpOGLLvIdiFFe4QxcJ5DPnkYLNIgUB9RQFEdss09gyCVJiAL2vg7lNloQg+drWSajOI6
 BsMgLn9fVmJclawfSrPyYJqst7biKjuG61SU+/IQSSepcgQyzPv/2kReKNRbhL3mLXzC
 +MqbtPjWXN6hkOoJE3ysFf0wZ031ljSHlxsE9D2tJsAniDBclClGdCOBaMbAYzjiRgMN
 LPYRmg4l4Ia6lRUZ8VTB9xJwrG/8BCww0fR/+zuudN7rVF2bd7wwMgLepPOgX2UpthJ8
 lZig==
X-Gm-Message-State: AOAM532LYaFbHOpa2wV4GoIKJdeeUbYhTy3i68FXkoNlJaLaX5957rEd
 RboVTHE0tufjUq4yG53GC39dmCIhHPr2gQFTLT/qUw==
X-Google-Smtp-Source: ABdhPJzDfqAb9CNgiyX+QOgxZ6EfDPQzBuRHNm2pOI2xAmB9lemirjyd/624mEd5THXVgMErO49O6YfzW0fBTFwwBmM=
X-Received: by 2002:a05:6402:1cc1:b0:413:2b12:fc49 with SMTP id
 ds1-20020a0564021cc100b004132b12fc49mr35286698edb.118.1651147183917; Thu, 28
 Apr 2022 04:59:43 -0700 (PDT)
MIME-Version: 1.0
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Thu, 28 Apr 2022 13:59:33 +0200
Message-ID: <CAMGffEmEmWK99xDu=i2iq9WeTxdPwnG9-94UEqFnBSzmvv=TWQ@mail.gmail.com>
Subject: RFC: sgx-epc is not listed in machine type help
To: yang.zhong@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Yu Zhang <yu.zhang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: permerror client-ip=2a00:1450:4864:20::52b;
 envelope-from=jinpu.wang@ionos.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Yang, hi Paolo,

We noticed sgx-epc machine type is not listed in the output of
"qemu-system-x86_64 -M ?",
This is what I got with qemu-7.0
Supported machines are:
microvm              microvm (i386)
pc                   Standard PC (i440FX + PIIX, 1996) (alias of pc-i440fx-7.0)
pc-i440fx-7.0        Standard PC (i440FX + PIIX, 1996) (default)
pc-i440fx-6.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-6.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-6.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-5.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-4.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-3.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-3.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.9        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.8        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.7        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.6        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.5        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.4        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.3        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.2        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.12       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.11       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.10       Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.1        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-2.0        Standard PC (i440FX + PIIX, 1996)
pc-i440fx-1.7        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.6        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.5        Standard PC (i440FX + PIIX, 1996) (deprecated)
pc-i440fx-1.4        Standard PC (i440FX + PIIX, 1996) (deprecated)
q35                  Standard PC (Q35 + ICH9, 2009) (alias of pc-q35-7.0)
pc-q35-7.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-6.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-5.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.2           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-4.0.1         Standard PC (Q35 + ICH9, 2009)
pc-q35-4.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-3.1           Standard PC (Q35 + ICH9, 2009)
pc-q35-3.0           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.9           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.8           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.7           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.6           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.5           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.4           Standard PC (Q35 + ICH9, 2009)
pc-q35-2.12          Standard PC (Q35 + ICH9, 2009)
pc-q35-2.11          Standard PC (Q35 + ICH9, 2009)
pc-q35-2.10          Standard PC (Q35 + ICH9, 2009)
isapc                ISA-only PC
none                 empty machine
x-remote             Experimental remote machine


I think this would cause confusion to users, is there a reason behind this?

Thanks!
Jinpu Wang @ IONOS Cloud

