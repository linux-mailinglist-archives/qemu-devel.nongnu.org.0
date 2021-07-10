Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428663C350B
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:07:23 +0200 (CEST)
Received: from localhost ([::1]:53878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2EZe-0002VN-Bs
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2EYT-0001Zw-Of
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:06:09 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:44592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2EYP-000226-NU
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:06:09 -0400
Received: by mail-ed1-x52a.google.com with SMTP id l24so18783698edr.11
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YyGS8w5rVX/MgsQu5sXDouu1WhX5OGnNH3bn4/RCnt4=;
 b=KpVEZ31zk+PujdQ6UIP64NxbQVQGALA1x8uLu3Fl5fXtRJn7B5AycnceZJlID6UBdH
 fHd8TX8ubI5sw2KTDNhqtSkvzglcMmZ1yIICVxU+goDgkhfx03wSWTG24QpBCyC6rbpO
 ib9o174mPaBpKPk9iB4avCN08veaP27YFXSPVqrike5JUK4/XQt7zHt70N71uKbncaf3
 FMFj5VMAUbci3lJPOQ9oKjzRhnKYyR+jOJFagdskY1Us+42EWlTU0/xLLi/NxJQdNC9K
 KnuA9IP3bRkNZcJD6tmtXFCJcIekyFN7LiP8T3nrb1Mj23iv3W7ZMEZOnsQ1Brgkc32a
 IVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YyGS8w5rVX/MgsQu5sXDouu1WhX5OGnNH3bn4/RCnt4=;
 b=W/9OV6goBz7NIVib6lGp4Umy9bZU9y2v31vcdSODaT8GxUJh+BnDqlFAZVVROypKM6
 XPbGi33/JHGa0t0ZrYsDQRXmPcmQZvhNqVeShSOScLXMj2DFWDUsz3+qZXEv+rwOvf/e
 2u32Ew44LBPBpsOWXQYsJ233yz6uoE3t62BXJwsDdiabZKkSgN3ZF9w/QPMkcm+Wf80s
 ySjwkSfHwr33LLrmVsthUvDj0xyUVMLMlFqBnG1QiHiUYqnR1HBGTWRLHDDT1S8Rub81
 OaBuIi/8nES0vKRbsP+4lNrrDNMcMDxz/Xe7Qy/Wn7/gDEyXY2EkL3ZajN1T0CMY6Kee
 V75w==
X-Gm-Message-State: AOAM533sq6yPE29ej6sz8+xLcnt01oOB9G2ptGdqP/tBidDwribpWtHJ
 r06yRbbIB1eeFqWS81xIJQpw/xBVStbbRJZE3uo0Xg==
X-Google-Smtp-Source: ABdhPJyDNAv3NOvt32x38nHztVfTOt3d5AgZ18B+hbTbyN/xq/yIAxU9Sdz8kQF2oYgJrNBlkyu0YJ8g5pi+BxlVlJE=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr30130088eds.204.1625929563709; 
 Sat, 10 Jul 2021 08:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210708195552.2730970-1-ehabkost@redhat.com>
In-Reply-To: <20210708195552.2730970-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 16:05:24 +0100
Message-ID: <CAFEAcA_5QfQ61RKqt65dgqVZ=tW2yK5=kERtR6E9Kdby-_Fewg@mail.gmail.com>
Subject: Re: [PULL v2 00/15] Machine queue, 2021-07-07
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 8 Jul 2021 at 20:55, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Changes v2:
> * Fix doc build warning
>
> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to 53d1b5fcfb40c47da4c060dc913df0e9f62894bd:
>
>   vfio: Disable only uncoordinated discards for VFIO_TYPE1 iommus (2021-07-08 15:54:45 -0400)
>
> ----------------------------------------------------------------
> Machine queue, 2021-07-07
>
> Deprecation:
> * Deprecate pmem=on with non-DAX capable backend file
>   (Igor Mammedov)
>
> Feature:
> * virtio-mem: vfio support (David Hildenbrand)
>
> Cleanup:
> * vmbus: Don't make QOM property registration conditional
>   (Eduardo Habkost)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

