Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7812173CDD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Feb 2020 17:27:11 +0100 (CET)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j7iTm-00014z-Te
	for lists+qemu-devel@lfdr.de; Fri, 28 Feb 2020 11:27:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54616)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSk-0008A3-QC
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSj-0007vQ-Nj
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:26:06 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:35967)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iSj-0007v5-JC
 for qemu-devel@nongnu.org; Fri, 28 Feb 2020 11:26:05 -0500
Received: by mail-ot1-x343.google.com with SMTP id j20so3119260otq.3
 for <qemu-devel@nongnu.org>; Fri, 28 Feb 2020 08:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VGCuSvfY75g5sc3ElLCBkrQCQ48WR1jelO0mTBxqlUI=;
 b=trBAFcd3VDgehG4PbOpE670xY092wQp7jyS4QcN5fkQbUU5SJ7gfdnK88AtyvJxb2J
 GRpyBKrjHKAYq+b+ClJ6n35RNfmwCMfno9eZ/UFeaQuGi5JO50wBDIVGgU/rTBYE/S2F
 CRLHp1GxxNHGh/mgZZHajhz13dqIeRWgYkGozzmBqnfdJjToUzLKF6rrf41oKJ/DbKYF
 ObPApkoknwxBtAV+osI+iT7vzR8qB+zK2sDAx8wId6MsPbEz6tbIYf9Izd3k/wkzTIEI
 2czuPr25iIluEXvq96T9HrLf4SPKEM9uidIDJf9sKgTya4l8cY2kEKfuNytB3c0P/dx6
 Ig/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VGCuSvfY75g5sc3ElLCBkrQCQ48WR1jelO0mTBxqlUI=;
 b=qAsI2DhfrjfeyMvh8XrGs7QaKeNBmx6xdr8ulmia53TSIfxnC2Gwk3zTzwqRhRm9US
 GBEE+N/h7ZcWCXUOmTnwW0zy+lRakF68KUiBIzadwl5+sKDBqoqBENqjT8ehm/Z/xRSK
 ScB3axnZ3BYcsV9iQkEHNNnQmwr62Vp/yT2r2cFu8F8FsLmixoznbOVafFFOfh6UleYI
 EidrUJWk+yS7n4t19BuqwQd+IKspjHq/ZmhDPxvQN5Lp7bBmQiAS022/0/L2uxEafB+M
 yHcA1q9xdyREIKxurD8Guh9FiZoJ0/6gWwhdcVvg2r6bbmMs6hhb3fnCj5qtGcEsbJbU
 Vdqw==
X-Gm-Message-State: APjAAAVPF6ki+2g2vWvrh5Ipjpo8iJ0NE7A0KRpmgAO26zhye1YprdAP
 zsDsQlwhxxpdAynEMgalS2nmfG8qjWymTFG4kGruTQ==
X-Google-Smtp-Source: APXvYqzKzZCatW+snO2ZpmSK0VVfzPZC7n5/oBo5O4MCD5STL96LV0JHWFYr7E7VVrtI4toQbvk7QajGjh8A7vUazR4=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr3774515otq.97.1582907165009; 
 Fri, 28 Feb 2020 08:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-7-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:25:54 +0000
Message-ID: <CAFEAcA_8yawDBorweYE1vQ-eqwnQJrUVWJrFCE44hH0gT3YWUQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] target/arm: Honor the HCR_EL2.TPU bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to cache maintenance insns that operate
> to the point of unification.  There are no longer any references to
> plain aa64_cacheop_access, so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Fix el0 fallthru (pmm).
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

