Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B363D18A5
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 23:06:33 +0200 (CEST)
Received: from localhost ([::1]:37612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6JQG-0006Ik-Sl
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 17:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1m6J6b-0007kb-9f
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:46:13 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stmao@google.com>) id 1m6J6X-0003Tf-9v
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 16:46:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id g12so2082784wme.2
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 13:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=gCLJDXEvFRKqjXnKMDrgVjbjS8tpOBSDMRAMfNfyND0=;
 b=i49rFaIw7PvVFw0iONZWfrqJ/kqeqUqVw52K0Kuc14VjYITg336sCc8OKf9bkILCjb
 cxA/PNIZAhp7+yRp4QLFTJI/6LU3VEoglIiyYORcSuazUnBHNIe8NOukJC35X9BrTk96
 IRqM6pRbIADjip4cQPEpeSBFYnR8aDNaWl1UCXDprsAeESVJL+MO8AfD5bQG1Db5+HNQ
 GI4/HNxX7Fq4orEVu8bP3q7/fxwHlz3OHDBAYyT0YMP31XD03pSJL1e7VLvdf2Ze0vjE
 TGc2Xf4pAD7UKSAIy/lYaMWJ+ZnYarsK+bTyqjAkYcMSf1TJqKO7jR60JU251Hk/9CTL
 GTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=gCLJDXEvFRKqjXnKMDrgVjbjS8tpOBSDMRAMfNfyND0=;
 b=cZPU2UmOMEOg1dxsiCDIqjEFW1GbPx63Mqtc6ytFkVQQNPzxp00tv/+/CXXFfdLjFx
 1kWHbX7E0YYHNlTEoAkHPeSIZdp5VOlvXx4IBsUGpj94SfP+yTuJHoLe1bvx9FFFtZ0Q
 yof0/86Afoiu7ogrGzpc3+WgpUl9PURE9TN4b/VJJrd9zYiZijC3tMM/HwxXhasEgonT
 p9lWZ4jD7C2KFsphx7Bi11KHt2iWQibCpn8YDBeh4LQN4KF9o+OMHdLB8d56tj8KitiL
 yI8fZImZqaubOXXhFAS0Nf1/fjmqtmMUQpbFjl7Dm6Edv3qDjthuzyDCCLSHD/mDbvj9
 fRjQ==
X-Gm-Message-State: AOAM530VjV+MnpiIHLGC6nZkxGDnR+kW3Dni8zPX6a7+Zd/4IOmHSCGO
 ToqmsreOjHtLTR32LqJQr2KYFl/MrfXjNZkqCFK0320ZjbLfdw==
X-Google-Smtp-Source: ABdhPJyMk5tNzu6Fno403dCaf2+Dnf+CTwTFIpmxYC2LFEWYhaLQyPaEZYu1uIdLQHGJ35AL+y3rqVDCa8s2jP4R/BU=
X-Received: by 2002:a7b:cbda:: with SMTP id n26mr38865683wmi.179.1626900366237; 
 Wed, 21 Jul 2021 13:46:06 -0700 (PDT)
MIME-Version: 1.0
From: Shengtan Mao <stmao@google.com>
Date: Wed, 21 Jul 2021 16:45:55 -0400
Message-ID: <CAMiADQ8S9XSgH_zEGTw2bQpoPh4BqKByEaAUA5TTL2rLwYV=gA@mail.gmail.com>
Subject: QEMU question: upstreaming I2C device with unpublished datasheet
To: qemu-devel@nongnu.org
Cc: Chris Rauer <crauer@google.com>, Hao Wu <wuhaotsh@google.com>, 
 Patrick Venture <venture@google.com>
Content-Type: multipart/alternative; boundary="0000000000006ad1ea05c7a842f8"
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=stmao@google.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -156
X-Spam_score: -15.7
X-Spam_bar: ---------------
X-Spam_report: (-15.7 / 5.0 requ) BAYES_20=-0.001, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 21 Jul 2021 17:05:44 -0400
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

--0000000000006ad1ea05c7a842f8
Content-Type: text/plain; charset="UTF-8"

Hi everyone,
we are hoping to upstream a MAX I2C device to QEMU. The device's datasheet
is not public, and we are contacting the Maxim company to get their
permission. If Maxim is okay with upstreaming the device with an
unpublished datasheet, will this still be an issue with QEMU?

best,
Shengtan

--0000000000006ad1ea05c7a842f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi everyone,<div><div>we are hoping to upstream a MAX I2C =
device to QEMU. The device&#39;s datasheet is not public, and we are contac=
ting the Maxim company to get their permission. If Maxim is okay with=C2=A0=
upstreaming the device with an unpublished datasheet, will this still be an=
 issue with QEMU?</div><div><br></div><div>best,</div><div>Shengtan</div></=
div></div>

--0000000000006ad1ea05c7a842f8--

