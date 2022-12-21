Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F76530ED
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 13:39:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7yMG-0002D1-Qn; Wed, 21 Dec 2022 07:38:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7yME-0002CJ-1m
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:38:02 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p7yMC-0007fw-B1
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 07:38:01 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 78so670868pgb.8
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 04:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jcMQVY9BnrUQZQYGXF4eANNzxFffd0DRIvb5G9i0/Ms=;
 b=hpZb2WmQ5PQzX+lmZHB06d8CA2hjPWz0g7VMZ11vkf3bnT3xv3yp61jmGeJBQ7yyKQ
 smvLYuwnochx7b/IpDvw+TAJiPdvTK0IktCzp5tgFSyoMKjGoqlDGrAWEu64sv4ctuj7
 surPWTdnlNKQhaXLZB97xKWrEKfRM8T9zP7Lzw/VhI7zau0zS/YLzKtPCQ200dpP5tUh
 aTchZj9IZ/YY4JBd8dk9gAzeVCuvuPfjEBaut148eF+V0t2v783IshY+KUDVbjRdTlEV
 eBOJVsV+0Ow5Az/PmQWDycOL69sDpH46GzLTBMqOFpawNvn8uoF2lntAgsO2y0N91PAA
 7QAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jcMQVY9BnrUQZQYGXF4eANNzxFffd0DRIvb5G9i0/Ms=;
 b=QZvj6+I83wLd+Cr19ZfCKn9Z2ahZINVDkCdz4NzVqsRSXaasqQLrY7qU1QSCWesSV6
 NOMvk14YofV6ewSM6Rm5Sig3z8mNVszK3uxp+kFy1xGberBbj5EZjLAty1TuJuACg5jy
 gnVpAR7rpPJIrOSqE9t6Y79N7I2lJtobVOyzx7AiTrc6Wm7fBK8jBL+Esew7rbT9c1jA
 8P8EU+bteuK9qmfgxAu7BoNmGHndbvP6KFBSR/X9akH1Ln7EFa9i3YBRGZmgI3n2uZ1c
 Y8Wz55TBplE3hVNMT+t2CsbXrNIhtUuSX31rQKleHSXxEVmn2bCihsaW5M6mMXyDgk3R
 dWCQ==
X-Gm-Message-State: AFqh2kqdB5U/zXlmgTKZWA7wrt/PYtd3Ypy26trerE3gPc6UUBbD8jcY
 QQhRbt/DIU70FazTOHjz2IN/5GmDnE4ngZWzh8zjNw==
X-Google-Smtp-Source: AMrXdXt/QiiHCZBhWE4AoFP+XYV/WjI5SZEzo5IJ6eEeibVR6/VtmlHBmcdiIM0+HkXediMKxwm8iwtbxycExY2Ip6o=
X-Received: by 2002:a63:e20b:0:b0:479:18a:8359 with SMTP id
 q11-20020a63e20b000000b00479018a8359mr89246pgh.105.1671626278835; Wed, 21 Dec
 2022 04:37:58 -0800 (PST)
MIME-Version: 1.0
References: <20221220140225.615908-1-kkostiuk@redhat.com>
In-Reply-To: <20221220140225.615908-1-kkostiuk@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 21 Dec 2022 12:37:47 +0000
Message-ID: <CAFEAcA-OC_xxOyfqBnk-bSPYL=47O3XhefTs6wfXLvozdoA1Jg@mail.gmail.com>
Subject: Re: [PULL v3 0/6] QEMU Guest Agent misc patches
To: Konstantin Kostiuk <kkostiuk@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 20 Dec 2022 at 14:02, Konstantin Kostiuk <kkostiuk@redhat.com> wrote:
>
> The following changes since commit 33698d3abf8ce65c38bb4b12b600b130d2682c79:
>
>   Merge tag 'pull-monitor-2022-12-19' of https://repo.or.cz/qemu/armbru into staging (2022-12-19 16:12:59 +0000)
>
> are available in the Git repository at:
>
>   git@github.com:kostyanf14/qemu.git tags/qga-pull-2022-12-20
>
> for you to fetch changes up to 9ca180bce1f9dad86b8d455a0c5c252d4c54eb92:
>
>   qga-win: choose the right libpcre version to include in MSI package (2022-12-20 15:54:42 +0200)
>
> ----------------------------------------------------------------
> qga-pull-2022-12-20
>
> v2 -> v3:
>   fixed author of Andrey Drobyshev commits
>
> v1 -> v2:
>   removed 'qga: Add ZFS TRIM support for FreeBSD' series
>   that failed to merge
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

