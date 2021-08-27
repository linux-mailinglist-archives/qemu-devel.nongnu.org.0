Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFBB3F9A25
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:31:59 +0200 (CEST)
Received: from localhost ([::1]:46426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbxe-0008CF-HN
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbu3-00044o-9K
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:28:15 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:39551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbu1-0002n0-LR
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:28:14 -0400
Received: by mail-wr1-x430.google.com with SMTP id z4so10414598wrr.6
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hLXmW8lnIR0vGIwVfHCn084kS7VObtURvu8WDB3Cwmc=;
 b=hs0EMql1ACYClqanVSWdcjsuvuI32Z+hQxAHSNdXl/Filj627ZUhlpdu3L+8242PAT
 Z4y5S03B0XnooofDg3HtrTdBSfo7SL9LmSk9pRKNCCkfTr6/A6uvuKwqNjanHF4EYMIq
 QmlE3yh7CLRPLyZfbo+R+IAzqWtlpR+aCko+mFCkYuGrU+VqK66ceDOvn5JQgNunlg2Q
 oiJ5GoxeBIr0/DQJBrB1KZxZ+aDNcbmbHU2NcZgf1gpo3c6nUxs0ytG32bKGwXYBcgXZ
 1yy1xGwW1e1U6W3iD73DbNMTsRah5UnXKIJltrDp+wpGEK6+mdOMLKfhCrKjhyGkk8Yu
 dgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hLXmW8lnIR0vGIwVfHCn084kS7VObtURvu8WDB3Cwmc=;
 b=UFPZ93a60D1PUhTGG9eA4037Xj6Sv0Cq2+QPaoP/leKcYiEP/AHC4u0emP9s2qXQ8C
 BcWswfs3x9trO+aimP8CjD1Go13AckhQF1ggNg8rCAaVzLMvTSFqK/94gUvwJprlhnpx
 6clXhkkXvbjiwkREquN3+WZnCQuK4CdGNoTV1UXprHAUnh2fByRd9wQO1tnFg6Q0zzRc
 x2iiNFShEmhJJKnpDj4gtfruvuWySriwKac0V/A3yk1GvYzQduJekR0fn+CPIrvl272I
 y0Q4kNvijbPfCEUtD+3HgIn0G8iBahQ3b56PhbfDEpyB64eMwz2+v/v2vZpF7m9tRhli
 24Hg==
X-Gm-Message-State: AOAM533ktqpCt2lUQpqGnFxqYCpdjx4WZ2fpv0QDN4PLVlgK7p8CJzl1
 lrarylebhGuyV+ZTK9Ujhgldyr8ZZ6e4NuMP
X-Google-Smtp-Source: ABdhPJymfACtt7Ct9L5yZG1XWEMAMb8fPv52kb2iXZyar0YdqtT8p6Kt15Kb7IP1Tm0WTNSaeGOZ+g==
X-Received: by 2002:adf:f84d:: with SMTP id d13mr10433678wrq.292.1630070892241; 
 Fri, 27 Aug 2021 06:28:12 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id l26sm2060769wmi.13.2021.08.27.06.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:28:11 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:30:22 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
Message-ID: <YSjo7hZ9ptMH9JSx@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Eric,

On Tue, Aug 17, 2021 at 04:58:01PM +0200, Eric Auger wrote:
> Hi Jean,
> 
> On 8/10/21 10:45 AM, Jean-Philippe Brucker wrote:
> > Allow instantiating a virtio-iommu device on ACPI systems by adding a
> > Virtual I/O Translation table (VIOT). Enable x86 support for VIOT.
> 
> Don't you need your other patch
> "virtio-iommu: Default to bypass during boot"?
> 
> Without this latter, for me the guest fails to boot.

Good point, I think I've been lucky during my testing. My bootloader and
kernel are on virtio-blk-pci devices and as I wasn't explicitly enabling
the "iommu_platform" parameter, they would bypass the IOMMU. When enabling
the parameter, boot hangs since the IOMMU isn't enabled when the
bootloader needs to fetch the kernel, and DMA faults. That parameter is
specific to virtio devices. Using another storage for bootloader and
kernel will result in failure to boot.

I've been postponing the boot-bypass patch since it requires a
specification change to be done right, but it's next on my list.

Thanks,
Jean

