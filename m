Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FAEF2C2B57
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:31:26 +0100 (CET)
Received: from localhost ([::1]:39608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaHs-0003dU-GY
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khaGM-0002gY-Sa
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:29:50 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:40760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khaGL-00022O-4f
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:29:50 -0500
Received: by mail-ej1-x641.google.com with SMTP id oq3so29072482ejb.7
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 07:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YIK4rT06OEVfS5PAOFn7t9VN48hP6GRhcSimvXcCgSQ=;
 b=CttcBkkcNyEqepfnn77FAVRKHMb7jYBvZrAZhZ6szTgFuj8XrMMpVLtuYzl1J3jS1K
 MqS56Ge6WgO4SoOI1l/yOc+7N6l84nsa/vMrJo6INkKUO2unSVHKW5jwHcJCV7xmN9wH
 rnxR2pQ21uh/kvzCtNCq0eOo1uBIuwE/qRAETiue8/KXez4QO7s1rhhWk3pU362HZvlE
 5HGa/1rFLN9fscHiEzlzsri03FgpseSnYxun2RXx3p0Ja22kCqyCO/HEv+i3lh7NJCi8
 vn5A10fbIrn2+NqN02RK698saIMoDDWtu/lauHu24Cz03EWs31/mowHhjEyLXtocwlre
 3JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YIK4rT06OEVfS5PAOFn7t9VN48hP6GRhcSimvXcCgSQ=;
 b=GWKP1jTSdIQg8umvp2Wzn5x4orthVoEEL5a4/UjOsdimgngnb5z/Iy9oquVfHTYnOY
 pipHfsHSYs83GNFhbxu0kib34S0Ef/RZZkDexCHF57H8XCWWh1ffJASjQ8XrxrmcgNo6
 CZnFaB6n64lyHC3+ZxyKNu3PtFcyqju4RM9DDHffAC+/ARiXTiwZGqVQ7RdGVYqo6yup
 JkaCoFrmq9oxremhWpWmyawxHvbUa5ThPqUcIMR3EWA6EGoMf0u9bH8v1He2s9c91+H3
 hXdQ5gdBEN8KuLGljC+weohMyJkJxDP0Xh1zQk+cQ0c8uWZFIEhlp2vNh1YT59xxKNw9
 jd/Q==
X-Gm-Message-State: AOAM530D5Gp41ZSIU+toUXREAGp9nn1kW4mmizt9EnGdXGz+YJe6Mel0
 0tN4N/W+XLDgvMo3g2wtSBAwCdu2xTMssT2nsGAwtw==
X-Google-Smtp-Source: ABdhPJzYQbyOdV6QzHuci89/tFe1qmzC5izCPxllk7FamFiBMRWddCBalqN/+pVoS7iFB4JD0Z2wuOIeEzrzF2X8Pkk=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr4504401ejq.407.1606231787291; 
 Tue, 24 Nov 2020 07:29:47 -0800 (PST)
MIME-Version: 1.0
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
 <5FBCF8F0.9060103@huawei.com>
In-Reply-To: <5FBCF8F0.9060103@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 15:29:36 +0000
Message-ID: <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
To: Alex Chen <alex.chen@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 zhengchuan@huawei.com, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Nov 2020 at 12:15, Alex Chen <alex.chen@huawei.com> wrote:
>
> Hi everyone=EF=BC=8C
>
> Who can help me merge this patch into the master branch? This patch may b=
e need for qemu-5.2

This code has been like this since 2018, so this is not
a regression in 5.2. At this point in the release cycle
(rc3 imminent) I think it's best to just leave it until 6.0.

thanks
-- PMM

