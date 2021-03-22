Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA2344847
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 15:55:58 +0100 (CET)
Received: from localhost ([::1]:35878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOLyH-0001Y3-0C
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 10:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLK7-0000OT-F5
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:14:27 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:36516)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOLK5-0003KN-LG
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 10:14:27 -0400
Received: by mail-ej1-x631.google.com with SMTP id a7so21531501ejs.3
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UquaP4pUBZ76S1BSPWRn75vFJOP9OAM8DZxtutAJ6Wg=;
 b=zSehq0Q1vUiK8i4NwvQPNjJdfYDzB8cRV7r9lRUzruCHZKUo9HhZrbkGzu3PDVPHV5
 +U7VRtl/7AV0eKzIhx7MvUcBDulEDUy28dlYawCKpJsj+ktyy6qexmf4s0iICh+nY3s2
 ycUu9igvaqFhvTWJFCF2JZN9OPR/FzB+RfES75xYbqj2spdMCHMCp5BPS8btYs8QdwOs
 obXLoHJ+Gvib1OmOHeVbpeS8vJ0xZDHiEI2ODYAKHxAPXyIUapzwntwW7kkVw21chZht
 Wge62A3d8s4nTyNuHo0Ym6U3CE8xdN4lTJenbNqkWftxAMWv+24/LXKHXe+jicC7lfNz
 nllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UquaP4pUBZ76S1BSPWRn75vFJOP9OAM8DZxtutAJ6Wg=;
 b=n4N3XFXsvIQzBxzUO8mUrHUunHtfUmtC8rtCPN2TxlSBPNqiBs8ljZi9xsrnnh7Y95
 jsB20i0+UPilDeywdk418oGqqm7z5PW2UGfQ/ibLuE5rbqah0VO151ap3ZGVTiP43nH+
 4/SwAkg4OteXYnTTrlvPMWdd7LJebZnRnxuX/k+ckMkSGMR065N1zTbe9qgxEwnentnq
 Q9dpHNdm0TYdLiX8+cRA1s9+NExPELW5CYNd/XW3wibPxnDRp815Ep2Lu2O5JWg/Bd8d
 cSuQyVy/1xEUVeqVjXhOLZ0JcWXLnTvP3we0wxt0rJZiSjlk6rDC6acV9wuZcHAEpZyQ
 3Byw==
X-Gm-Message-State: AOAM530tAtmIZ74CxVzvfnquZCPAljDp65H8Jh9yAXRXmBIrRLucQfj0
 +TtWuep+rDG2eghkhS/6pSMlsV3mfba92RMr80snFw==
X-Google-Smtp-Source: ABdhPJxq9yzKXVIIPqxKUM4U+HTp248CKH/912eUGTLKBc30vX7obfQ2Sg6sf0+A1rVcOX9UGnxZui2Q5X/V9oTFqWs=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr19392450ejc.407.1616422462334; 
 Mon, 22 Mar 2021 07:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <1616407692-693-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1616407692-693-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Mar 2021 14:13:54 +0000
Message-ID: <CAFEAcA_oNRb2cyX-8CGzOvpoHgz1eYfq+wUV-xFKoKSmJgJM9Q@mail.gmail.com>
Subject: Re: [PULL 00/13] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 22 Mar 2021 at 10:08, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit bdee969c0e65d4d509932b1d70e3a3b2ffbff6d5:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-03-19 18:01:17 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to c7274b5ef43614dd133daec1e2018f71d8744088:
>
>   net/eth: Add an assert() and invert if() statement to simplify code (2021-03-22 17:34:31 +0800)
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

