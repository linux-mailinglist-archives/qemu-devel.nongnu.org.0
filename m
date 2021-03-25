Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A40349842
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:38:06 +0100 (CET)
Received: from localhost ([::1]:47670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTvp-0005q9-3h
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPTtL-0005G3-MJ
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:35:33 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lPTtG-0005IR-TC
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:35:31 -0400
Received: by mail-ej1-x62a.google.com with SMTP id ce10so4279927ejb.6
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 10:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4mRWQi4gzlFMr7tCQsh6G/25NJbc+6sHTA4ThLctF0U=;
 b=oBUg57rZ+Jt39iSDPIy9BSBIi/Z86iohDat8wpJVqrgvLYY2CZ4ydbQE1uLafdJcs1
 kQlbkrULfEM86L2pxFBVH8v9Tfy99PA8GadGIIVgImUraza8ldZ4tDx2OZ7fBQigEHWT
 hZ8OB65q/VqJHDOTyOWdNA2zqHYOsrws5Rqd7n7GMxLxAzlRZ6KdJsq4NHHuI+6zalXB
 GiA3IyiF1NKNOhV1BWEI4IrFEwGJNZ8PNC+NFjJClldCoakijXuUDXHOdBH10IE9k5O4
 8gVkJlEkdDoxAD5Cw3a2/miegTEn/qaICoS4+QwJz0/AqsbAn+bzm7Bw6hhT8HJHP5xi
 6MGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4mRWQi4gzlFMr7tCQsh6G/25NJbc+6sHTA4ThLctF0U=;
 b=mCGzHrCmmRqgKVDbSevBmz7pP31VmLoLKw3bFAblOZWhVvDzYfH4lscLA7oyRBqP2d
 r9chphaH7ygqnafvfy4QL01qalnz9v8MtkDNn40NySOGEK4CyzaKZ9jCFM22tdjIR7a7
 KDG52GeOtnDFNlU7E77dpouNvymzy0MPj+aMZECL19SO2wfdRCYj3OiKx/oJ+JM2UTUO
 FIAu7KUpAW/vRDMOqa7UCu73VWtowwkdy8IkkHAtZWZXJM6kDDDOXlBXE9IS5PJNSGhs
 bWQdwxbwwDXsoTqwZ/lEPdc9jsuEEE0nj4CE3KeS38WKQgNzvZ39cuJj04B31tfY0ZAN
 Xlsw==
X-Gm-Message-State: AOAM533bPWFkICjX66VOyEPeXO1DJ/KKWT+WfTLrP2d24a2PVfwsLxQG
 bIttWeUu+EI4V1J2G58aCDPeN+g4yGpY5OJiR5SDuA==
X-Google-Smtp-Source: ABdhPJzH/mAq3msDiOu+PD1vfy6B2d+RTXQrvfljXql08v8/uhhQtYa2VPZhT9jY6zzq/ghrsbG2vZjcnh3eb15foLY=
X-Received: by 2002:a17:906:8a65:: with SMTP id
 hy5mr10995743ejc.250.1616693721005; 
 Thu, 25 Mar 2021 10:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
In-Reply-To: <CABLmASGq42X5pEuTkWZTp_djr5qmo98BD_9wi4zFnG1DYNnJ9A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Mar 2021 17:34:49 +0000
Message-ID: <CAFEAcA-79VsatyDSP8_u+=m=PpQLyjsuNBQh_-xt2RZ-6vqkgw@mail.gmail.com>
Subject: Re: Bug with Windows tap network when running qemu-system-ppc with
 Mac OS 9 guest
To: Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(adding the relevant people to the cc list)

On Thu, 25 Mar 2021 at 17:26, Howard Spoelstra <hsp.cat7@gmail.com> wrote:
>
> Hi,
>
> When running qemu-system-ppc with Mac OS guest, the guest crashes when
> using a tap network connection. Openvpn 2.4.9-I601-win10 is installed
> with TAP-Windows 9.24.2. A tap connection called TapQemu is bridged
> with the default ethernet connection. It gets activated when I start
> qemu.
>
> To reproduce, compile qemu-system-ppc from current source and run:
>
> qemu-system-ppc.exe ^
> -L pc-bios ^
> -M mac99 ^
> -m 128 ^
> -sdl -serial stdio ^
> -boot c ^
> -drive file=3DC:\Mac-disks\9.2.img,format=3Draw,media=3Ddisk ^
> -device sungem,netdev=3Dnetwork01 -netdev tap,ifname=3DTapQemu,id=3Dnetwo=
rk01
>
> I bisected to the commit below. Thanks for looking into this.
>
> Best,
> Howard
>
> 969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7 is the first bad commit
> commit 969e50b61a285b0cc8dea6d4d2ade3f758d5ecc7
> Author: Bin Meng <bmeng.cn@gmail.com>
> Date:   Wed Mar 17 14:26:29 2021 +0800
>
>     net: Pad short frames to minimum size before sending from SLiRP/TAP
>
>     The minimum Ethernet frame length is 60 bytes. For short frames with
>     smaller length like ARP packets (only 42 bytes), on a real world NIC
>     it can choose either padding its length to the minimum required 60
>     bytes, or sending it out directly to the wire. Such behavior can be
>     hardcoded or controled by a register bit. Similarly on the receive
>     path, NICs can choose either dropping such short frames directly or
>     handing them over to software to handle.
>
>     On the other hand, for the network backends like SLiRP/TAP, they
>     don't expose a way to control the short frame behavior. As of today
>     they just send/receive data from/to the other end connected to them,
>     which means any sized packet is acceptable. So they can send and
>     receive short frames without any problem. It is observed that ARP
>     packets sent from SLiRP/TAP are 42 bytes, and SLiRP/TAP just send
>     these ARP packets to the other end which might be a NIC model that
>     does not allow short frames to pass through.
>
>     To provide better compatibility, for packets sent from QEMU network
>     backends like SLiRP/TAP, we change to pad short frames before sending
>     it out to the other end, if the other end does not forbid it via the
>     nc->do_not_pad flag. This ensures a backend as an Ethernet sender
>     does not violate the spec. But with this change, the behavior of
>     dropping short frames from SLiRP/TAP interfaces in the NIC model
>     cannot be emulated because it always receives a packet that is spec
>     complaint. The capability of sending short frames from NIC models is
>     still supported and short frames can still pass through SLiRP/TAP.
>
>     This commit should be able to fix the issue as reported with some
>     NIC models before, that ARP requests get dropped, preventing the
>     guest from becoming visible on the network. It was workarounded in
>     these NIC models on the receive path, that when a short frame is
>     received, it is padded up to 60 bytes.
>
>     The following 2 commits seem to be the one to workaround this issue
>     in e1000 and vmxenet3 before, and should probably be reverted.
>
>       commit 78aeb23eded2 ("e1000: Pad short frames to minimum size (60 b=
ytes)")
>       commit 40a87c6c9b11 ("vmxnet3: Pad short frames to minimum size
> (60 bytes)")
>
>     Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>     Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>     Signed-off-by: Jason Wang <jasowang@redhat.com>
>
>  net/slirp.c     | 10 ++++++++++
>  net/tap-win32.c | 10 ++++++++++
>  net/tap.c       | 10 ++++++++++
>  3 files changed, 30 insertions(+)
>

