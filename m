Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15B33AFE9
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 11:25:05 +0100 (CET)
Received: from localhost ([::1]:59540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLkPH-0001JU-VT
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 06:25:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLkMD-0008Jc-FM
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:21:53 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLkMB-0005dA-I2
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 06:21:53 -0400
Received: by mail-ed1-x530.google.com with SMTP id h10so16601930edt.13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 03:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bV5iRAN9hkd+rpgFMIRIEiEYcdwximWY6Z7KXx03KZM=;
 b=OIQfHmGXVmVKVpJkshyjFL9YJhLqhW1gHFR9WUUO0aVy8Liq5sjAlThf/h23P6kXCm
 LS22mtL3nXRPrCKX7O7ijUhBZukjhsKmr+zwLpRfDGmjo++7UVGJUxMI5Q6QwycyFed4
 km0pNv6w2EShV8U/pCVnLgV+gvJvh1z8Lq1WPl1QS4O6XgY44R4NssQOUebw0sZIm6bZ
 kes1LWjOvv5TZYAeTmVTO+s2siMh+UW2rxwa6CffQo1ywkRi0c5dHRybtKYkFp2YZxHK
 kqwFeR6EIQUCsgJH1A/ldh5jttBXUX4bS6w7jI0hKmmSpAuJnQK7Xg7OAIW8+VsfqkGR
 p+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bV5iRAN9hkd+rpgFMIRIEiEYcdwximWY6Z7KXx03KZM=;
 b=phkzq0IPDqOu05VRKQnW8WPpOKRuYB6uf9yKVMaIII+F1cq+aF/wnYKRS8lMl5kzhj
 BN5IUlxRGryEf/lUpc/xugtSyaV/ppXwftvYaiGzs1cSgvtG4Ex7C6JoEwTf0eAun4n/
 CyQtddsHlcEhJFQZasDO3o1xGuNC1/8mp13Pfk8xfXSrfkVHXB8kYXf9gAW2r2e6spzG
 YszA1UBPdREf8ldvM4hSCv7RH56+ZLk1+oUGtyY0bVpxPMQNoOQJjo2akZtafOgD2klH
 oaV3R5GQuE+Pfv0rgSUnFTUlSWMcc9SSzDrchu5g7fj/v2nn1ul/xdj7UXPE7hnnAPEJ
 a9KQ==
X-Gm-Message-State: AOAM533DXshcSeAYlksS9nyme6TtFkRTd8QefuIKYkTsIcLLxCELR2lg
 JxwIxZP9arS4vIi/lxJoF97av4uGs5mElBNbNCUclQ==
X-Google-Smtp-Source: ABdhPJxr/Xbwop2m56ApqCmzGn4lyhIQo2un7GdAeEnGCRefSVDB95A0m4CborDqa7wEP8BRXGKVYJ2xLiFDB4zGMFg=
X-Received: by 2002:aa7:c804:: with SMTP id a4mr28602369edt.251.1615803709227; 
 Mon, 15 Mar 2021 03:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210315075718.5402-1-bmeng.cn@gmail.com>
 <20210315075718.5402-3-bmeng.cn@gmail.com>
 <4093c094-ed8c-d8c4-09b7-4bad19529ec6@redhat.com>
 <2884879b-d645-324b-e90c-95fd59b66daa@redhat.com>
 <f6f4f095-2a69-5fcd-64c4-38115a35c09b@redhat.com>
 <CAEUhbmWv1esg937aD_S9uUkT+pEzGSvJqQa5NObUQA8yMh8M3A@mail.gmail.com>
In-Reply-To: <CAEUhbmWv1esg937aD_S9uUkT+pEzGSvJqQa5NObUQA8yMh8M3A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 10:21:38 +0000
Message-ID: <CAFEAcA_XSo6U1NcivqrtdV3vYqdQyn4PwSbaVRiReFKVV8cg0g@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] net: Add a 'do_not_pad" to NetClientState
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 10:17, Bin Meng <bmeng.cn@gmail.com> wrote:
>
> Hi Philippe,
>
> On Mon, Mar 15, 2021 at 5:22 PM Philippe Mathieu-Daud=C3=A9
> <philmd@redhat.com> wrote:
> >
> > On 3/15/21 10:18 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > > On 3/15/21 10:17 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > >> On 3/15/21 8:57 AM, Bin Meng wrote:
> > >>> This adds a flag in NetClientState, so that a net client can tell
> > >>> its peer that the packets do not need to be padded to the minimum
> > >>> size of an Ethernet frame (60 bytes) before sending to it.
> > >>>
> > >>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > >>> ---
> > >>>
> > >>>  include/net/net.h | 1 +
> > >>>  1 file changed, 1 insertion(+)
> > >>>
> > >>> diff --git a/include/net/net.h b/include/net/net.h
> > >>> index 919facaad2..6fab1f83f5 100644
> > >>> --- a/include/net/net.h
> > >>> +++ b/include/net/net.h
> > >>> @@ -100,6 +100,7 @@ struct NetClientState {
> > >>>      int vring_enable;
> > >>>      int vnet_hdr_len;
> > >>>      bool is_netdev;
> > >>> +    bool do_not_pad;
> >
> > Maybe 'do_not_pad_to_min_eth_frame_len' to avoid
> > wondering what padding is it.
>
> I felt the same when I added this :) But I wonder if that name is too lon=
g ..

If you don't change the name, you could at least add a short
comment in the structure definition describing what the flag does.

thanks
-- PMM

