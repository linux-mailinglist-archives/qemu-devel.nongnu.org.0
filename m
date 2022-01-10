Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA99489CC1
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 16:51:19 +0100 (CET)
Received: from localhost ([::1]:51750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6wx4-0005L7-73
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 10:51:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6wu6-0003Sg-9Q
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:48:14 -0500
Received: from [2a00:1450:4864:20::435] (port=36634
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n6wtr-000387-Vj
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 10:48:01 -0500
Received: by mail-wr1-x435.google.com with SMTP id r10so19929508wrc.3
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 07:47:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=peGK9jkA1ECjFCE1GKLjh+6ydkjA9f/37HFPcNjIPDU=;
 b=Fh/b5I5anwBkTrgBAtBNtIQHIvXWf0V/SmPFlgo1Ve2rCHEb+dOLc48FjRg6MyDu8W
 3JIjkFNcPvMJwb2d5XweNmVLbAzYZwc+R9yieoV/nO5cUlW7gdt/gjRxm7Vfv+yGhC7C
 UAh3QVRrkzr9VOreaFCPBJ8kfnHPm/lixEr/I8CQqyLR4tP6tUPdbihWPy+afpSTt+zC
 V+4MajeqxYj48c6D7WcxyLT/o8EgbFOASSbmqUAL1danKNNFEAzVqfpB6Ixc/xq75eSx
 69Zu8RVKme11rtIYESDsR1qD0pyXNUWrTeT4ncZtgB5S/IBqFbUZF+NHFw67ovlnh/PD
 6nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=peGK9jkA1ECjFCE1GKLjh+6ydkjA9f/37HFPcNjIPDU=;
 b=viny3creA7xRovBZc+kzkEIyxYLDnEcHvdWBo09NuYHXadzx0ScWlWyjp7XNA9SJd/
 uVjd3cVGzGJp7NjxHHnPIocWfWQ3TZBFZApT/xSzHaQxRVASIdjrOdnZFqtBSd+ZjnfI
 EKFQIRRt8vFQU8vhwTuVYM1HBYDTa89SrhRdWgE+9gYB0nEcbEjTDDZJAREefDLyuvDe
 r/bfautMX0fv8W/kagPgKUlD8gm3d2a3KAJCjBVoW95L8nmOu7yZe9IUgXHcuSr43uSu
 NN3oDeyE03QgIN9b2JCxKWKGUKqUYAeeDMCdf1qQQS5/FB9fCMbvHR9Sk3bkJw/qt9Km
 G+Yg==
X-Gm-Message-State: AOAM530HRK+cBFhWX2Zqt9XdKXKQG1oA+kt55Sc1/MhHYFMVxWFBPSju
 KcRamY5uEjG37LUvCylUnGb/hgGDCCnhYFtDFOmV/g==
X-Google-Smtp-Source: ABdhPJxG4gV0GKraTJ6tgmVj/WLmoPT/UKnsUKRM4S2k9+WOReU1GZyRcyeYg2VWZg8Hu9Q+7DLNpKQQR9PpEA7yc1U=
X-Received: by 2002:a5d:52c4:: with SMTP id r4mr183666wrv.521.1641829678212;
 Mon, 10 Jan 2022 07:47:58 -0800 (PST)
MIME-Version: 1.0
References: <20220107163324.2491209-1-maz@kernel.org>
 <20220107163324.2491209-3-maz@kernel.org>
 <448274ac-2650-7c09-742d-584109fb5c56@redhat.com>
 <87k0f7tx17.wl-maz@kernel.org>
In-Reply-To: <87k0f7tx17.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 15:47:47 +0000
Message-ID: <CAFEAcA-OF29ptHr0X9ojyLEcDw9v7Smc5PC3O+v5Uv3bjiSmRA@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] hw/arm/virt: Add a control for the the highmem
 redistributors
To: Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, eric.auger@redhat.com, kernel-team@android.com,
 kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 15:45, Marc Zyngier <maz@kernel.org> wrote:
> $ /home/maz/vminstall/qemu-hack -m 1G -smp 256 -cpu host -machine virt,accel=kvm,gic-version=3,highmem=on -nographic -drive if=pflash,format=raw,readonly=on,file=/usr/share/AAVMF/AAVMF_CODE.fd
> qemu-hack: warning: Number of SMP cpus requested (256) exceeds the recommended cpus supported by KVM (8)
> qemu-hack: warning: Number of hotpluggable cpus requested (256) exceeds the recommended cpus supported by KVM (8)
> qemu-hack: Capacity of the redist regions(123) is less than number of vcpus(256)

Side question: why is KVM_CAP_NR_VCPUS returning 8 for
"recommended cpus supported by KVM" ? Is something still
assuming GICv2 CPU limits?

-- PMM

