Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87184295D1
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 19:36:41 +0200 (CEST)
Received: from localhost ([::1]:38634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZzE9-0001q0-0u
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 13:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mZzCW-00013U-Lu
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:35:00 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:44916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mZzCV-0000aE-4I
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 13:35:00 -0400
Received: by mail-wr1-x434.google.com with SMTP id e3so25000261wrc.11
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vznChvHQTtmv2T+gBn5Na8lCiiy1YjXdr0cqNLhUNnU=;
 b=EVNAomyLvMetmFnh09FjvbdHxjmwVZAjRrph04xz3mIra2AqNRdETYxfhOCu9IStel
 cNE4oRq7fvad8tPNbiAPeKpQQ0FBm2pB678/5leuuDyGZz+G887CP3tMHWFlOklRYB7j
 JmK2a5iFQkAVTJXWdSm4L2kfau+0Xk+9GBiL0AjMSpyAYJLJo9QaJ74KrnTWYxFWTdad
 YSRFy3jde8vHR8ZiVxUgE6cB2QUOePdJpuHsUEokm4qurXUJn48703cCSlDKq2QFh23U
 Cfu5tf6eQfsaLM+r2+vWdM+o4e5MhaRoUhpUopQT3rAQnx1Ik7vqDzvq6lx5tueVJH0M
 Y3Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vznChvHQTtmv2T+gBn5Na8lCiiy1YjXdr0cqNLhUNnU=;
 b=tGJ3CQ96SNT/aUF5HnlUXfhdGbe5s8gqmOttCKR4xUYITiWUDv+2sILSgHZro5s6AY
 zZCtp26WpPQygPPz88IMnZkoelw7CfznpF8ZbAjMSiTxlfLPArGZGu9+OCEkKTUoVeDs
 1zh4Pdc9JM7TPA17q6nsXu+dFuQhwoAnu+8E4EIhSlW5jHgxMVc9ZVN4Z00sjcVhS7On
 DWpH2IgpmGYH+zEgHucfPGQTYhBTplHq5i62Oq4q1+wyyBps4ND8Rc4RafS/oAxsLH1J
 AK0R1xlwxTH8GD3wNCjmPtKvxwJWvBws4bUnImbrxfyPMGIoPS8c5Ee8CbyfPNoQm54Y
 R8uw==
X-Gm-Message-State: AOAM532cZtxvGXXPV4XxB7toji3MYCRdWauNTb2hFzuvssTGqk3qtQCg
 gXLNxkIY2+Sgb+PY6dR3fv+DoQ==
X-Google-Smtp-Source: ABdhPJyI9OgChTlGkBOHbokMk6yuY08KiD+nG2ypAnxzBdY7C6FMMNUCKl8ZbhbBwPFS1ySG/jLzGg==
X-Received: by 2002:adf:a1d3:: with SMTP id v19mr26655206wrv.268.1633973697357; 
 Mon, 11 Oct 2021 10:34:57 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id o23sm140288wms.18.2021.10.11.10.34.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 10:34:56 -0700 (PDT)
Date: Mon, 11 Oct 2021 18:34:35 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Haiwei Li <lihaiwei.kernel@gmail.com>
Subject: Re: [PATCH v4 00/11] virtio-iommu: Add ACPI support
Message-ID: <YWR1q1bL6a4e4a7v@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211005113719-mutt-send-email-mst@kernel.org>
 <YWBhEQxM4wRyZWzs@myrica>
 <CAB5KdOa4aLUq_d5RBws1cp_cfq55fw8_FhLY-HPV-1iVyFYKQQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB5KdOa4aLUq_d5RBws1cp_cfq55fw8_FhLY-HPV-1iVyFYKQQ@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 eric.auger@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, ani@anisinha.ca,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Haiwei,

On Mon, Oct 11, 2021 at 06:10:07PM +0800, Haiwei Li wrote:
[...]
> Gave up waiting for root file system device.  Common problems:
>  - Boot args (cat /proc/cmdline)
>    - Check rootdelay= (did the system wait long enough?)
>  - Missing modules (cat /proc/modules; ls /dev)
> ALERT!  UUID=3caf26b5-4d08-43e0-8634-7573269c4f70 does not exist.
> Dropping to a shell!
> 
> Any suggestions? Thanks.

It's possible that the rootfs is on a disk behind the IOMMU, and the IOMMU
driver doesn't get loaded. That could happen, for example, if the
virtio-iommu module is not present in the initramfs. Since IOMMU drivers
are typically built into the kernel rather than modules, distro tools that
build the initramfs might not pick up IOMMU modules. I'm guessing this
could be the issue here because of the hints and "Dropping to a shell"
line.

The clean solution will be to patch the initramfs tools to learn about
IOMMU drivers (I'm somewhat working on that). In the meantime, if this is
indeed the problem, you could try explicitly adding the virtio-iommu
module to the initramfs, or building the kernel with CONFIG_VIRTIO_IOMMU=y
rather than =m, though that requires VIRTIO and VIRTIO_PCI to be built-in
as well.

Thanks,
Jean

