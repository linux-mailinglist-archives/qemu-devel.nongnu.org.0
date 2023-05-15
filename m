Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D69702937
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:42:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUi9-00086y-1H; Mon, 15 May 2023 05:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUi2-00085n-P4
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:41:38 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyUi0-0005IR-TE
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:41:38 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc394919cso18408997a12.2
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 02:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684143695; x=1686735695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qzgrsi3n8ZjkmL69MBPeEzl+rt2cOVsrlKPUxO+xDuk=;
 b=Ls5bzCZ3fhuKZnD4VOMX3KPf5c9Uo2bvxkV5bMTg8sBiOiFYGpVP75WsdS8LcF0Ccd
 bo6yneACpJCTwP4ciptNFM598LTrnvkcBva7BFInijJvmbnPogvE5pCP5bLQ6knrPvwf
 AS//S9YwuNTagUou9XcdUhiCrtbtd8uZj3LOcCTezv3A4qh1K/ZtV0pnLKK5+HDUnTD+
 cXgTjUJTqletZDpHOFo0cjQEiY7dGRExf0g9ITHxcpxtJP0unpte+YrvA1hP3B3NFEPy
 wnpjhUceBfXgGUnwjjRDpyqZdOt4c/vEs8qMC4/jhSTli6lroBcb0NomqD6g9RXG+Qvj
 +buA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684143695; x=1686735695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qzgrsi3n8ZjkmL69MBPeEzl+rt2cOVsrlKPUxO+xDuk=;
 b=RpTn0iHp34tA17+CstTCM85LUJ0iPhvzgiuMgHWH6yZDyhovhtp9bbL1SvoQXTm9os
 P9SBpoDeTrZVsM46ovb5XOG4uHZ9qUnVeHNk/kuvdt/E1g7epVV3501vEoI+hr0rndwu
 6Iyb6IvVmwV0UkG7dnd/7p1tLwCViNm+KLXQT0lQgP9E1iBxnnjLWS/hc8XN718rEvbn
 i9BAowjlgWqE/4uPawxC3EWmB6FHgb2hAYUz1HYqOfJOrwTLLHASsi53emy065IadaRu
 BHTffxAv2DAXpX5fjA1vIbKaMfXZMpn6+YsD/hYkDVYq5fFZ/TTMx3fNQzIUvbPXYlRR
 ThkA==
X-Gm-Message-State: AC+VfDzzIL8m66s2gGXJvGcw9U9MB8F74QzWno++orqrQIwE3Z74j2ED
 ouqlen9+wxrwGmLrUNmS8lTCUM4nn1mS/9kyRHvaSw==
X-Google-Smtp-Source: ACHHUZ57T3spYqyEtotKxAnCsf2RPzF7GXtkFhYYkVsoyc1TzrKV3lUE6ifanFqumx+yh1D/rh55ysfLoI8x0aNNVKE=
X-Received: by 2002:a50:fb99:0:b0:50b:c50c:8bd0 with SMTP id
 e25-20020a50fb99000000b0050bc50c8bd0mr24975807edq.28.1684143694752; Mon, 15
 May 2023 02:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230512093108.1180726-1-zenghao@kylinos.cn>
 <ZGHyvBb8BQdKhWEy@redhat.com>
In-Reply-To: <ZGHyvBb8BQdKhWEy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 May 2023 10:41:23 +0100
Message-ID: <CAFEAcA82ye08-WFG=5wJPOvXfgu8mFhNFF7anbFUwUADh6tsiw@mail.gmail.com>
Subject: Re: [PATCH V2] hw/arm: enable qxl for aarch64
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Hao Zeng <zenghao@kylinos.cn>, pbonzini@redhat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 15 May 2023 at 09:52, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, May 12, 2023 at 05:31:08PM +0800, Hao Zeng wrote:
> > Qemu does not support qxl graphics cards in arm, it is recommended to e=
nable
>
> Who recommends this and why ?
>
> The recommendations from Gerd are what I tend to point poeple to
> for display devices:
>
>   https://www.kraxel.org/blog/2019/09/display-devices-in-qemu/
>
> and it had this to say about arm:
>
>   "On arm systems display devices with a pci memory bar do
>    not work, which reduces the choices alot. We are left with:
>
>     virtio gpu, if your guest has drivers
>     ramfb"
>
> Not sure if anything has changed in this respect ?

That statement was not exactly correct in 2019. The
accurate statement would be:

If:
 * you're using KVM on Arm (TCG is fine)
 * and your host CPU does not have FEAT_S2FWB (a feature
   which is mandatory from Armv8.4 onwards)
 * and the guest device driver maps the PCI memory BAR
   as non-cacheable memory, or as write-through cacheable
   (which a real-hw graphics card driver will do)

then the behaviour will not be correct.

The only change since 2019 is that systems with FEAT_S2FWB
are more likely to be actually available now :-)

This happens because QEMU and the guest disagree about
the cacheability attribute for the emulated frame buffer:
to QEMU this is always normal writeback cacheable memory,
because it's just memory we got from malloc() or mmap().
The guest of course thinks it's a real hw framebuffer and
wants to map it with the attributes a hw framebuffer would have.
FEAT_S2FWB allows the hypervisor to overrule the guest's
stage 1 cacheability settings and enforce that RAM from
the host is always cacheable, which is why it avoids the issue.

For TCG none of this is a problem because the guest's
emulated memory accesses to host memory via emulation and
what the guest sets the cacheable attributes to has no effect.

The simple approach for KVM if you need to run it on
pre-v8.4 host CPUs is to use a device where the guest
device driver treats the memory as normal cacheable,
which includes the virtio-gpu one, but not any real
VGA hardware devices. A virtualization-aware graphics
device likely has other useful features in the VM
usecase anyway.

thanks
-- PMM

