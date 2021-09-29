Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5373741CAEA
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 19:12:49 +0200 (CEST)
Received: from localhost ([::1]:41264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVd8R-0003Mx-TV
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 13:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mVd4w-0007XP-6b
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:09:10 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:39446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mVd4t-0002Xq-V1
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 13:09:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d26so5462125wrb.6
 for <qemu-devel@nongnu.org>; Wed, 29 Sep 2021 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hjZ28Pbz9RX1TwkZD46ivmAaf/bF4BYxCgU51PHikvk=;
 b=M0GZ+HJxVF/1W7wPAowfzQllucOTZvY8DVQcy23B1nuN0wFJyHJiQagQEO/LXgXEn6
 +KgXtphH8RxN+/ovZCGYlmnViWtBTVhExvoV+7gFWDKYcM1IhsaAdBfxe1+19dRtEiK9
 mB0ParSjOcmJJ66hiHPHbTpsVzFDmuIg2b0JpGejS6NmCtkAp5MVV5l9/xfSwjUZN1Nb
 GNEeCeYEOCQjRs0/kgqLYIviVMheYXmYGCHR8fGW9WsXhXYshhoP/WzN4RFdMDX5MkYu
 CKqjlXQjnvS+IzN1xCUOQhRf+/tWvU/FMWb89wGMIeCpVkuL+sR/BrKZtxhfkIxrOaCJ
 f7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hjZ28Pbz9RX1TwkZD46ivmAaf/bF4BYxCgU51PHikvk=;
 b=QkHTtP/q/mHynrUwVPTgLJp7AXJsfyamHOkiENthKewfEbDLmOfy3GhsJiIJwV7/QC
 EOT7z4DdTwUfd74DMyNPSdcJwfHTBDkYvPT38Zu5dlfwBZyQL+Uz8xvBoF1W4QQpjFwc
 zwZsbNE2LgW/tdeOVLVS7zFfrItrLGC9g/0kVYlcForkmie1qGB6bDxcRxF0o6pNwU7I
 toWX1DCgK7gyk2aCyAqTBepy01/Yup2XnljiSQhs5K7DdRa6pz8ul/CkMcuWPZyIaM7l
 LsYdVo//YzNn+ozFmiwhYWXIV4XECpedk0K0MjRV36Pl4mVFBO4Bi8+89Id6E6wDvbVE
 tGMQ==
X-Gm-Message-State: AOAM530sI9w1Zh/7bMYmbCS8YRb4lVkNqhnIBeEZvonvXQmE3mr8qXbh
 I8QyCA9yV5APKcQoFvOaj61V1w==
X-Google-Smtp-Source: ABdhPJxoybeTjMBNZk2ujd9mimswnxmRI9kSbUXOFqYXiBfmud0qcIQBBfTrnge9iGXTBnXtYjhNwg==
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr1121131wrw.381.1632935343244; 
 Wed, 29 Sep 2021 10:09:03 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id l25sm394845wmi.29.2021.09.29.10.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 10:09:02 -0700 (PDT)
Date: Wed, 29 Sep 2021 18:08:41 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/6] virtio-iommu: Add ACPI support
Message-ID: <YVSdmaee1upW1iE6@myrica>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <808699d8-d2cf-bd66-c53d-8ae8c2fdbb9b@redhat.com>
 <YSjo7hZ9ptMH9JSx@larix>
 <0b61d1e3-095e-b830-e160-4f56dd5ff171@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b61d1e3-095e-b830-e160-4f56dd5ff171@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Wed, Sep 29, 2021 at 11:18:39AM +0200, Eric Auger wrote:
> > I've been postponing the boot-bypass patch since it requires a
> > specification change to be done right, but it's next on my list.
> The boot-bypass feature seems a critical feature to overcome the current
> v3 limitation. Are there big spec changes required? Maybe we shall work
> on this in parallel of this series because, to me, it will delay the
> integration of virtio-iommu in libvirt for instance.

I agree. The spec change is ready but I wanted to tidy up the driver
implementation first. I'll send something out this week

Thanks,
Jean

