Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7D36E26B5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:18:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLBI-0006qh-4V; Fri, 14 Apr 2023 11:17:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pnLBE-0006pQ-SP
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:17:40 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pnLBD-0005Tp-8h
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:17:40 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 n9-20020a05600c4f8900b003f05f617f3cso16704762wmq.2
 for <qemu-devel@nongnu.org>; Fri, 14 Apr 2023 08:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681485454; x=1684077454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LiiGjyqX4o159cvbNlKsXJAHA/ueLUd6Q3sCWwwpz5Y=;
 b=DOaKY7KMiuRzv77phiJcAAJ0NvzAbTEawUceJCq6OubBbrOFy3Y2WowDMWM1MdGYR3
 qnxbuVikIfwiaWU3C/6stDlcrBYUtEJPZC6mXfRzfuRNK1brACCZs8MqXBEc8IqMZheI
 OoWJkk6gu7SDNrsmn4lCNzIOyj6jABoMy3GDDBFa1fJz40ZVsCmKSbFNvSbb1MHdqYlp
 782o1F334MH2N07jMwV2b4JQVr9ztDdcdcwufcgZ2rq0bOXHMrWvDwQWE1kepwuQKTvG
 iu5v4ZDskKltIMbH1D19AeTWfSDxUKF4ulyKN1T/UUaFGah5Elk+bCXeFQyc7lmYPPJd
 EIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681485454; x=1684077454;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LiiGjyqX4o159cvbNlKsXJAHA/ueLUd6Q3sCWwwpz5Y=;
 b=iTF6tJ1eo2jFRwLSs1pnXf4kJ1+eOktBaoXoK+rLCmkme7zGvLrqt+of79D2LtlUOB
 EmM/hf9vfwWJ5nugE1+4O/KF6V/5tZxlsuAdr+XDsBTzULPH/XLdXD9mPeFPCsu28oNs
 tKYt8IvSUt5o1diS9U7378Wvf80M+rIcqeGXnOh5vuiv7VQa0eKH3S912XfnwedtfiSX
 xQOH0oxQ6uEpTG44hQQAcYU55PYqwfOa/b+TQ2CArAclBCxkV1poYZ8JLs5/o+Xbg2Vk
 DM4iWfw/n8zb998nm2Kmfea8BpCQ8Bc/7iIuiSuKktkbQQpM4iUa0kOIJiy+XMoqIVKv
 l/tQ==
X-Gm-Message-State: AAQBX9d4ekIgoOO1azvDp+0JZF9OYgLpYv2J2RteOq7WU4HQzdwwS1St
 pIqoUi0V3uWLO47qz+Re92ue3A==
X-Google-Smtp-Source: AKy350bQFzW/yiQUVEbMS8iwEGtjIIv6F3QJDvhfsmxOMugGGxPwOpR0bNIgwlJINtCCORADLPrWlg==
X-Received: by 2002:a05:600c:21cf:b0:3ef:3ce6:7c54 with SMTP id
 x15-20020a05600c21cf00b003ef3ce67c54mr4860044wmj.35.1681485454655; 
 Fri, 14 Apr 2023 08:17:34 -0700 (PDT)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 8-20020a05600c228800b003edef091b17sm4508021wmf.37.2023.04.14.08.17.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Apr 2023 08:17:34 -0700 (PDT)
Date: Fri, 14 Apr 2023 16:17:35 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Eric Auger <eric.auger@redhat.com>, virtio-dev@lists.oasis-open.org,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org
Subject: Re: virtio-iommu hotplug issue
Message-ID: <20230414151735.GA4145625@myrica>
References: <15bf1b00-3aa0-973a-3a86-3fa5c4d41d2c@daynix.com>
 <20230413104041.GA3295191@myrica>
 <c6fb5a06-aa7e-91f9-7001-f456b2769595@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6fb5a06-aa7e-91f9-7001-f456b2769595@daynix.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x329.google.com
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

On Thu, Apr 13, 2023 at 08:01:54PM +0900, Akihiko Odaki wrote:
> Yes, that's right. The guest can dynamically create and delete VFs. The
> device is emulated by QEMU: igb, an Intel NIC recently added to QEMU and
> projected to be released as part of QEMU 8.0.

Ah great, that's really useful, I'll add it to my tests

> > Yes, I think this is an issue in the virtio-iommu driver, which should be
> > sending a DETACH request when the VF is disabled, likely from
> > viommu_release_device(). I'll work on a fix unless you would like to do it
> 
> It will be nice if you prepare a fix. I will test your patch with my
> workload if you share it with me.

I sent a fix:
https://lore.kernel.org/linux-iommu/20230414150744.562456-1-jean-philippe@linaro.org/

Thank you for reporting this, it must have been annoying to debug

Thanks,
Jean


