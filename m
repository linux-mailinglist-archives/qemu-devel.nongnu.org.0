Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04C72C281D
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:35:52 +0100 (CET)
Received: from localhost ([::1]:48440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYU3-0001yB-Qh
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khYS1-0000fx-WF
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:33:46 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khYS0-0002LK-GL
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 08:33:45 -0500
Received: by mail-ej1-x636.google.com with SMTP id lv15so22641250ejb.12
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 05:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MNGppwkPaV0l/PF+Nz45efTHNcDpxnQ4Zhu9bL+r6F8=;
 b=qcLEF/RTd+8gVBz/HiQE5FtO5M25Gg9v21AJPO/aIz04jSWQ8qO+/SoJWRFs9MvYnQ
 KE5Hr0OuhA9qPST3lAPUSbgChrwJn7+fss8Yd4PfZjQFdjydNd/wDoGpOFZUDlSfz1Mv
 cyTrfDABNukl6rWuoWDzp1fBnSbV13juRsZTg6RGCVPVGtNe7dsmSbDqPEA/gRV8sidZ
 Ywc1bToFdtCUecsFcM6mrTlQIEpHS9cFXVXN/LhkoXxgOA+9iB0mr9t9k9AVfAQEdttO
 Si+YsJ9FUDMMJECRZwrFM+n2naQZha8wMvY40R/pSgvsY5JbxkqbaVRNfIG/iHhvrA4E
 Pjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MNGppwkPaV0l/PF+Nz45efTHNcDpxnQ4Zhu9bL+r6F8=;
 b=qgTpYYno1Bv2QvsH3StKsBu1WPkz9LFbxi5kId3jMkIgZSi4eErm62Q9k4AP1YnBpP
 sbYlQHPdrCjBj5YWusda21K5gMTcDtdeBm/3GrL/w7FY7Z19kdgdKYfgZSss7PWSxn5v
 65xr+rFnsqWKaqEoaA1j5vKpfk/+vjey3wEMSSUpVgpfbup7yEPiEwaBXGEiuCV3vbhn
 kJmbweWZT38A5iBwmbvAmYOLgkI9FU9/2JkhE+ujhGGTUSkC+l/GqCSVlJNfHWdN/j9f
 Syjddh41R6/Qnh1K3x4uSkjToGa7SM1pEoYgvPfquw6J63ibTEYDFfWvRGl2jfkeWAK0
 OMpw==
X-Gm-Message-State: AOAM533xD7dQt2+xhJf1lel0LwHY9dzVu/84MDHBlnVOOoke9WQQUUPA
 HAReSafvksoMA7eTpjqnPGaYEqigttE5eSWs/U8pWA==
X-Google-Smtp-Source: ABdhPJwBP0V+kLHpJHH1z8dH7u395A4S/aUNZezKoTxRwOQqB+A5I+SavNMMbfBiS9KfNAi6wxd+jQKGLu9nxEOI068=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr4050134ejq.407.1606224822734; 
 Tue, 24 Nov 2020 05:33:42 -0800 (PST)
MIME-Version: 1.0
References: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1606185863-25996-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2020 13:33:31 +0000
Message-ID: <CAFEAcA8it+SCQxCosJd66EUQNgURxLcB98X2nk6JRm6CrQpMaA@mail.gmail.com>
Subject: Re: [PULL 0/5] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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

On Tue, 24 Nov 2020 at 02:44, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 23895cbd82be95428e90168b12e925d0d3ca2f06:
>
>   Merge remote-tracking branch 'remotes/awilliam/tags/vfio-update-20201123.0' into staging (2020-11-23 18:51:13 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to 9925990d01a92564af55f6f69d0f5f59b47609b1:
>
>   net: Use correct default-path macro for downscript (2020-11-24 10:40:17 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

