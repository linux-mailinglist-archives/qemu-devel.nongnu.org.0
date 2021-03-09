Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D70D73322AA
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:12:31 +0100 (CET)
Received: from localhost ([::1]:54738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZLq-0001Jq-Vm
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZKf-0000tc-9Q
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:11:17 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:39125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJZKd-0003u4-Bz
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:11:17 -0500
Received: by mail-ed1-x531.google.com with SMTP id h10so19046372edl.6
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUy7oz6XKOu9TyrjTVaegMyjj38rOWf3Iq1ElvmbJeE=;
 b=fBwcBeIFiOUMDziOMlpLSk4uuAd8pvUoItDSiSyb2me0Fazs4A+SaPR4DZV27vzCpx
 D2DUpSMZ2vw+RZ1120n8GeKIJ7RE1LDyK9o/+9iMswG/Ia84qcRFo3qeCPCBIv5GRooF
 J1EFsbWOhVnr8TPINJpmogKGNk1lrU94HkXa+wGzLdWJjzydj/oH+sJXaE6homNLGmb5
 lHjpmKB65+I+0HsItQNsQQ6lewBD8FVSeiyRbcmcuW8LHtPj6eDSrAlKXfjUV0K/BKfO
 kxFr+mQywqtxRyXipb+Vw7aF2SsgIpym4ju/oQQi5LTveOKirhZ0qZBZ8wp2MREFUMEq
 Lg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUy7oz6XKOu9TyrjTVaegMyjj38rOWf3Iq1ElvmbJeE=;
 b=VvxFzzqb1hGyYvsI9DfnHInYhYYDUqwoY5cMnD5vlo3RArNRNQk+51c+lBWQqKePlR
 w4f5g4Kuzv0wsZHKsm/unpC6Jsf+E5US5P6FCMtZbPrSjxjqfxEBU3i+GaPm/onhKV+k
 2G8zfRTSvdKHNaE1zB/k9TpFtTJYE/uPA6y+b2ulz5mcZc9igQucxAjbjomN2f0Pq1Nr
 6nAm5zhoO0a1F6CNXgtoNlopJ6H7S8DvC0l50DrfleMUBcWO4Vr/7TRchxmfyfsl9TMJ
 gn1ipa1fZKV/s3YA12nMJyO14MisyMnCJafe9UfRXvIBOgrsA1FfhLWjVc06f7EUHsxp
 PeYg==
X-Gm-Message-State: AOAM532CRy3lzIFkNMVmQOrb7HCVmKr2QYx2aA4CYh7lxwQQ19/2EAPw
 WD6fknVuBKaauEhNc7qtoh/g1WeMwrOTLW6A2CvQeg==
X-Google-Smtp-Source: ABdhPJyRYWq58o3FcHQPOC4SgoxNg556Yvm+wn+SBOJgpuOSt5A4N5TPyP57oHre5FbmE/P/Ddy1mCNXNZPH5E0IFp8=
X-Received: by 2002:aa7:d686:: with SMTP id d6mr3243963edr.146.1615284672738; 
 Tue, 09 Mar 2021 02:11:12 -0800 (PST)
MIME-Version: 1.0
References: <20210309002741.85057-1-j@getutm.app>
 <20210309002741.85057-5-j@getutm.app>
In-Reply-To: <20210309002741.85057-5-j@getutm.app>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Mar 2021 10:10:56 +0000
Message-ID: <CAFEAcA9ATZh6PVRbvUhT6ZAg6-85xhgOwTz=ufUHgZYzFAWOUA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] slirp: feature detection for smbd
To: Joelle van Dyne <j@getutm.app>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Mar 2021 at 00:30, Joelle van Dyne <j@getutm.app> wrote:
>
> Replace Windows specific macro with a more generic feature detection
> macro. Allows slirp smb feature to be disabled manually as well.
>
> Signed-off-by: Joelle van Dyne <j@getutm.app>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

