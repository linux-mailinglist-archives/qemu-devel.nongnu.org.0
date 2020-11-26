Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 068362C5DDE
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 23:36:41 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPsW-000628-0I
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 17:36:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPpZ-0002EZ-U6
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:33:38 -0500
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:46661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiPpW-0003Wl-9e
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 17:33:37 -0500
Received: by mail-ed1-x541.google.com with SMTP id k1so3748522eds.13
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 14:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=20mziViPTMD+Ki2bG0qhpamrJiUgGTsMx6sx1SoQTSE=;
 b=LQdQxyFdVIoh+eH3I4hOg0qRMiQ7GFgY9tNBKVGkyu32qlO2fAGvnZvMlh6nkyBbUx
 1xONiW7r5apyu8gBM1tfthO3vGGB+TySJwzqZkxbzay1GSrC9FOYG+HnL1FVA8hFKxVl
 V76uj7Pu7wWHdu+2imBIGMJ+/HBAuIwJ76tEUWKqgPvTU95muw+uOb+SRgRHJmLPYxwE
 ONDaAnoNtrA15IjPzOMTjPz3e/UQM24G5u/b9YcbTp6G8LPTdjblMSZlzwnek3OIFHoI
 SFoEWfieXu2Qwv3u27MQz6T4WWtTX6CQF3HGi7k6uoJyRCGllbvG8AVKhUG8ZtMG6XII
 wjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=20mziViPTMD+Ki2bG0qhpamrJiUgGTsMx6sx1SoQTSE=;
 b=XoRMi5mFGqa9Tlk8OI/mFaYso6+dLBTAWwihNyalo6UBjEDXT63T0LE3dlca8RGzOI
 XKVREGfkPwSXDx9KAHagboc1NvrSX+CQ9FZsM+KeH47nCciQJKpM1ZLXcRKjy7lgNGnt
 RBBGb8UUjjy/SEoQ6Q9/Sjqhom1XN6AkGrPFLogCS6xMhG06sZZOhVJ+yIdwRuQ2dmV0
 UuqXdQ96iE994IwmxMGZj+A4F5+wNugWzgOvMrymo/tXeDZ/oFDPozBCszRWwI6ekpmQ
 /oJ/ZXQcUfMyoQWuCZh7inCTEGXeukaxyVqcB92ifyfQ+cuNfXOihk+dQifQ5rSlCCIH
 6SIg==
X-Gm-Message-State: AOAM532eLF4Ta6d2rJ69QisnG+vNZ+7AuGorA6hOdS+E6DiRtGQYJwrd
 IVR2l5xo0tgvpynvNNakPK2MfSmBNKw9dwDIg55IrQ==
X-Google-Smtp-Source: ABdhPJzf28974UJN11RKD9bTlDWcTFmOjtby/hvLIDKdgC90Bmr05qdv6SsbQC5+/f7plUDBu8XHqW8yPSvja5EpoCg=
X-Received: by 2002:a05:6402:30b5:: with SMTP id
 df21mr4652477edb.146.1606430012900; 
 Thu, 26 Nov 2020 14:33:32 -0800 (PST)
MIME-Version: 1.0
References: <20201126213600.40654-1-agraf@csgraf.de>
 <20201126213600.40654-9-agraf@csgraf.de>
 <CAFEAcA95L=25QM4BTPbDV6HXLXD5zh+50WTVtrK=fKPwynV=vg@mail.gmail.com>
 <54b287f7-5240-5e98-d5d8-581cccb14b82@csgraf.de>
In-Reply-To: <54b287f7-5240-5e98-d5d8-581cccb14b82@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 22:33:21 +0000
Message-ID: <CAFEAcA-qiyJmuU+sAGM3F5XiXo+oUktBF+Da8NV1CfaqXrzqow@mail.gmail.com>
Subject: Re: [PATCH 8/8] hw/arm/virt: Disable highmem when on
 hypervisor.framework
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x541.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 22:17, Alexander Graf <agraf@csgraf.de> wrote:
> Are you suggesting that on boot, we start a tiny mini-VM to enumerate
> the PARange and set highmem based on it? That sounds like absolute
> overkill to me ...

You'll likely want that for a bunch of other information too.
The KVM version of this is kvm_arm_create_scratch_host_vcpu().

In particular you must populate the ID register information
correctly because target/arm code is steadily migrating
towards "don't have ARM_FEATURE_* bits, just look at ID
register fields". You'll want some equivalent of
kvm_arm_get_host_cpu_features(), I expect.

thanks
-- PMM

