Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1563DF334
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 18:52:09 +0200 (CEST)
Received: from localhost ([::1]:43542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAxeC-0005zA-Mq
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 12:52:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAxcL-00058p-NK
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:50:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:39474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAxcK-0001y2-0g
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 12:50:13 -0400
Received: by mail-ej1-x62e.google.com with SMTP id go31so37247725ejc.6
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 09:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LdpxYlxYxgGIT9zabZPX7LrZutc5OPJHSAEMKmqjD6Y=;
 b=s+jak7iVCGMRGHJj8dTglFmU+36VaA5XNIbk202fVQlfrX52Quf+rj7OEKdIfAUmsa
 l6wyjAj5J3GGWSb+fkbVBGlYhbygnqv1FTiZ2VmdU0HypVB4tQd75vBrjsfba8VNV6mZ
 NR/Pi0EVJj9MwbsdnsMHZ/bwyE1U6zTDBqUWC07xrf7RdS2teBYJz0a12fF1ZruxNQDY
 I1nFnpAfw+jt2KfiNiu0DkLl8tNrTlIsYs6H2UmUv2zfyOwLuE63DY8BJkHFnXecDMV8
 g1f9HzcqHiwAAbRmayZyiysGe/Yoqoz8hEUStOuaI8xUmiv4iqSfu+eWPsWMYnSeGa/z
 HYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LdpxYlxYxgGIT9zabZPX7LrZutc5OPJHSAEMKmqjD6Y=;
 b=KnmJtBcsN7/c8yce3dHcIZhC+BGPiOYbQvKJlIYG7dm16KmGxZMOm118NEzkNDTfIr
 IwJUzSYjSaW892flzzaxGalL9xh+SvH0AvMVHgRlrRXYSJxUkvp1LkUrLQRyXE8CvGL+
 4jxv13LQzUtqOZxopIjn+1wBK8IQlA7PaVIvWs+EmXEO6ByALnLCos4mNNZ3p+Z12UUw
 2LwFPYyS3Jq44QvfLM3oJ/5JaltJYBTVJL14/fMTYcIdUM1l0719hkftmJP7bez5BEKw
 Pl4mUbG+ryzckVYE2vAyF5myBfc7upgQO6yJSFKiJmwjFDuCA0+OzLWG/TneXkVyMGKn
 NfpA==
X-Gm-Message-State: AOAM5315KTN51P7UZWmhXupPVelEx8RtO4JS+PwTXWUHLBhZjmaP3orw
 GtIHLoFk2hxnen1zf3d+21ppES3Uaef1qCDlHNgwXQ==
X-Google-Smtp-Source: ABdhPJxhmfTf5IqptmBoL9qHWrY3EEl9qwbsABJ503eYbPUZ8wSl/ipxNAOtVBui+zSKdOQCyi059OPwnQufyY03tJM=
X-Received: by 2002:a17:907:364:: with SMTP id
 rs4mr21947561ejb.56.1628009410414; 
 Tue, 03 Aug 2021 09:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210803132450.1093602-1-michael.roth@amd.com>
In-Reply-To: <20210803132450.1093602-1-michael.roth@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 17:49:27 +0100
Message-ID: <CAFEAcA-vUT-st1xKK-CY+Tt2_ErmdXYh7EOBiX1Fr1cYO+DVjw@mail.gmail.com>
Subject: Re: [PULL for-6.1 0/6] qemu-ga patch queue for hard-freeze
To: Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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

On Tue, 3 Aug 2021 at 14:26, Michael Roth <michael.roth@amd.com> wrote:
>
> Hi Peter,
>
> Sorry for the late submission. These patches affect only the w32 build of
> qemu-ga. A number of these patches I've had queued for some time, but a bug
> in the MSI installer that was just fixed was blocking testing. Now that that
> is working again I am hoping to get these in along with a couple of other
> fixes that have come in since then.
>
> The following changes since commit 7f1cab9c628a798ae2607940993771e6300e9e00:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-08-02 17:21:50 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/mdroth/qemu.git tags/qga-pull-2021-08-03-pull-tag
>
> for you to fetch changes up to e300858ed4a6d0cbd52b7fb5082d3c69cc371965:
>
>   qga-win/msi: fix missing libstdc++-6 DLL in MSI installer (2021-08-03 07:01:36 -0500)
>
> ----------------------------------------------------------------
> qemu-ga patch queue for hard-freeze
>
> * w32: Fix missing/incorrect DLLs in MSI installer
> * w32: Fix memory leaks in guest-get-osinfo/guest-get-fsinfo
> * w32: Increase timeout for guest-fsfreeze-freeze
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

