Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFA93DD41C
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 12:42:45 +0200 (CEST)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAVPA-00036S-6W
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 06:42:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAVO8-0001jI-77
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:41:40 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAVO6-0001qw-OD
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 06:41:39 -0400
Received: by mail-ed1-x534.google.com with SMTP id n2so23777164eda.10
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 03:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nLIYWYlJsR5CvuDmcgO8Otujh07/PlMO/sdgzTHbSZo=;
 b=ksJ1sprShe+/iEaZA6uwWBGxJaLl+k22F5IX0TnPv8gpKagoFDZFBd+eCLNVbfEODr
 hiL+qAXYC15qT4PYstD0mHybKh954b+0x072HCwzEufYoyvDEPPyf2vzkgXiT3X6O3za
 6Mo9TxPSxaJlrMKpMlxQZKAxJfuCEdrwZ5kOeNSvDgNhSU9Q81KcFxRfQDj+sedkN17u
 hgzJiPfr6WUv9nZwTW50r79AnO7lOZb3+DIR2Qsgo8wWWHIp44r9en/hgRnrfjG28+JY
 p0yoh9NZrh+/MQJOHu83zEThnoYBd4lMs2TqTL7d+eZBB72G72M3H71qb/pJyfK2fAXB
 QRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nLIYWYlJsR5CvuDmcgO8Otujh07/PlMO/sdgzTHbSZo=;
 b=Lr8BpZ/rg770tF+dyc5eUTz1tDrlGKP2YuCrauG8upCCM6+YKnvA2pBRPwFmO5wW76
 16AmLx3eURg+UyNLXB6MAQh7EKRmx4uNlfmCxsPOAT6GTHm4aq345hZy01Cz6eHZUBMW
 MJBGltFX5Tzo9Qp601+60o4YQl6rYiDFkt8LDVX2A1xz+4l1LfW7Eh8nRETvcbxoKuIW
 w49Yx6XgSgg/vGb4TJp9+qI/jV2chAW+VK5K9VE6vZ54m1MaoVa9r97wanMpqwhKMYAk
 SMD75/vXed/d7qVc3SkrtmJ7733UjW0dzM2fLHq47raVLwGW7vCNBeSYwmPNtjgr2SWh
 oxXg==
X-Gm-Message-State: AOAM531JZ+fLs+r/+q4WV7OluXv1o02xx2pS9dbVfDgZuBeVYoyrFC5u
 9AA5AMBZQ2q8wGImliCWQPvLX/GEvvbQGME2TRjIpQ==
X-Google-Smtp-Source: ABdhPJzI5+CiTFq6MSllMyq2dOxMsv8CJlZjr4lFUCNMoiflGjoKz+oITLhpHXjbk46t+tqMLSLbyx720K1lxC2wwC4=
X-Received: by 2002:a05:6402:31e6:: with SMTP id
 dy6mr18524728edb.36.1627900896255; 
 Mon, 02 Aug 2021 03:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210802043344.44301-1-jasowang@redhat.com>
In-Reply-To: <20210802043344.44301-1-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 11:40:53 +0100
Message-ID: <CAFEAcA-VZi2htDxg3xxwoWN1YfXgTjdrP+c_Yzv6ZsM28-ostA@mail.gmail.com>
Subject: Re: [PULL 0/5] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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

On Mon, 2 Aug 2021 at 05:33, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit 0c633cf0c221922a0a9f9d0b8866cbb111f5e192:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210730' into staging (2021-07-31 21:29:57 +0100)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to cfe6d6841ff46b43ec38792422f690813f4ce3bf:
>
>   hw/net: e1000e: Don't zero out the VLAN tag in the legacy RX descriptor (2021-08-02 12:19:18 +0800)
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

