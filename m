Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87332495206
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 17:10:36 +0100 (CET)
Received: from localhost ([::1]:52632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAa1D-0006bS-5o
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 11:10:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVqi-0004LV-Nx
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:43:28 -0500
Received: from [2a00:1450:4864:20::332] (port=41850
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAVqf-0000No-Qs
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 06:43:28 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so13164660wme.0
 for <qemu-devel@nongnu.org>; Thu, 20 Jan 2022 03:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X1ZaMLm2agU/Cziyky+mdkbdTkgJbaudZ1GxAq58pq0=;
 b=dbxHo1INuZi73l7WJx/CXePBeEuBWyd1aLl1pPiWmV35L/YErkQt1RszngahODV18N
 7m+iCXcpsmnzcXEj+62h4g9YSxnJ5XRTLBA49nLt7vPZcxUdBjvNzxNpPkye+ORK5IgF
 6oWMW0MnqRwTn3jnpJgZtT8Y79fWP997QhI3fyBupjV+eEzVOFwIQGgM1qVqO25TvDQg
 8b17oSOqgegt1I0aOn7h8wf1jZzEBYede2OXgFPe+8zt7xcIlwtF05ZO+XuyK6zcpvNy
 ySXWJcF9z9F9ddahovz1CoiXHFSggD4b81QmNgS10VYcW5miPxklbAG3xGyj0wnD78Ac
 3MSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X1ZaMLm2agU/Cziyky+mdkbdTkgJbaudZ1GxAq58pq0=;
 b=YdzBDTXCfbR5Ls4Ek1RrqvRnPxCj0NzFNEXsCwHVNClkg3skLnIvI/2FkrgiPsJaM7
 OvAOy+kgvMvMs3mt5basr/fre9YzjVTwa5rwS2zTlRq6erq1Dc8rrXi851gMT7poLA0l
 0his7mZop8QzzaxUjTEjHqiWgt6PXl6XOGTPLlHK5n1Tswx8/sTmdrS4srkwmujiG+3D
 BILy/EpFlj1qn2aMPq55TuTE2GybCMQYFIAtAOCft2mLdcxHqnlDysH7pVIOIykjT0eg
 aNiDcXr2pJC2abOayHE8seDcNHj5UvgiIlsRBc0uyK4edq9BaWmZQFMkWwBQ+npVWh9T
 QS/w==
X-Gm-Message-State: AOAM532lxRF3AXq9X6qJWAgtCETEXVXuV7fuEy8fozggs8gAffd/EDPI
 PnFL6n8ILctgKacwxZUrl9W8pBsOWzsbH2gOa5/lhg==
X-Google-Smtp-Source: ABdhPJygz/kjuG2MqGLYEN7X1SMpRdH0Tg/7akRdAStxP+0opGephLzoHZJufElgugBdmXcB/4G+NfakLDmtp6bXv7g=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr34760211wrv.521.1642679000209; 
 Thu, 20 Jan 2022 03:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20220118112232.2396744-1-kraxel@redhat.com>
In-Reply-To: <20220118112232.2396744-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Jan 2022 11:43:09 +0000
Message-ID: <CAFEAcA-Rd244B3-aKikb53GmznVJHH8vr-wQvFcTL3HeFT8sPw@mail.gmail.com>
Subject: Re: [PULL 0/2] Seabios 20220118 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 Jan 2022 at 11:38, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 6621441db50d5bae7e34dbd04bf3c57a27a71b32:
>
>   Merge remote-tracking branch 'remotes/mcayland/tags/qemu-openbios-20220115' into staging (2022-01-16 20:12:23 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/seabios-20220118-pull-request
>
> for you to fetch changes up to 11bb4e968432fce4b140e2d272301d1fb025a77f:
>
>   seabios: update binaries to snapshot (2022-01-18 12:19:36 +0100)
>
> ----------------------------------------------------------------
> seabios: update to snapshot
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

