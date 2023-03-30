Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60ADA6CFCFB
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 09:39:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phmqQ-0001rb-N8; Thu, 30 Mar 2023 03:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phmqO-0001rJ-Sg
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 03:37:12 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1phmqN-0001jt-47
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 03:37:12 -0400
Received: by mail-pj1-x1030.google.com with SMTP id l7so16452702pjg.5
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 00:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112; t=1680161829;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=2gq94IK4ZLJS+KnGYiw/95gbOzDKGWiFVmEQofhI6gs=;
 b=kNA5RU8IiMaUuf261+0rSxPs5f3VMhydioPKTMXATv/+0oPGnoFOkY4yA00RVL6/Wf
 Xk4AzU9DS4KgdaEDiuM0VRSHBqp4g5m1xyIS7WxDAJomSu7oaI7A6xkPPgAQrKjcAfzg
 zICaV9gVoBkoFvfv9PSZCE4MYNd4K97HVs344F23C63HxWp+VAgaXqLU1HsvuYW0TYyy
 MaN7ky2pNiYwHS+hJieAE8BFKm1ToNfS7Js/ZS7kJGUb20CJPscqAqpY5x49bl2RZ20p
 NjdNF+RYmN0miGoh9fJvO1YdcXAp6Gq/tHrQHe355vAiHMjFKj7AIoVGnMuQkDfP0/z1
 G/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680161829;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2gq94IK4ZLJS+KnGYiw/95gbOzDKGWiFVmEQofhI6gs=;
 b=7C4evuQCc1DD8+IFrllsstaGDhNVffHJrYxJg3m9RKHVXx5qervc8lB4TjJCgoquFy
 V/Asz4AkET9HG0bBI5s077LBoEWv2nDyA5pNIxBYF1xkgNoWyGJ94lbh5iFlmFfkXWH/
 Yc4YXWnIxg9YX6DuuVC5WcSmgxDjeOthSmAWixfWXQI7iImU0EcfiuQ8KF6w+L20NxgE
 WqdGxH37fE7bxKCc3Xx8G+NJeT1Q1LX+xoFxNyMAdRaGRvlgEoz6FNhwiMRpQ/lK9YfV
 cfNF12LT7V8nxONz4PxrdH4z7tZ7ugC4B3CUwKRJMQZn3ixLv1I8ZzRMMj+MJVT6T9ot
 jn5w==
X-Gm-Message-State: AAQBX9dM3nuai/cuyCzRKHVzyesBfSjPIgHgzMYN6o+tIpSDSWx2qld0
 F0XtIVj0GJxrGrYEqhIkSAfWTA==
X-Google-Smtp-Source: AKy350YQpIv+fzmDzvWaWCPIQqUxgFhaWhkTiCWFILay+XFxRqopVCpyLu3EqDXZ6vQMFysOIMt+/A==
X-Received: by 2002:a17:90b:4f89:b0:23e:2b3c:d4bf with SMTP id
 qe9-20020a17090b4f8900b0023e2b3cd4bfmr25112072pjb.45.1680161828909; 
 Thu, 30 Mar 2023 00:37:08 -0700 (PDT)
Received: from rhel9-box ([203.163.242.253])
 by smtp.googlemail.com with ESMTPSA id
 85-20020a630358000000b00513973a7014sm1170376pgd.12.2023.03.30.00.37.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 00:37:08 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 30 Mar 2023 13:06:36 +0530 (IST)
To: "Michael S. Tsirkin" <mst@redhat.com>
cc: Eric DeVolder <eric.devolder@oracle.com>, shannon.zhaosl@gmail.com, 
 imammedo@redhat.com, ani@anisinha.ca, peter.maydell@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com, 
 pbonzini@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net, 
 boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
In-Reply-To: <20230329124442-mutt-send-email-mst@kernel.org>
Message-ID: <68579d53-cbb5-154a-6c1e-e733f16540@anisinha.ca>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230329010406-mutt-send-email-mst@kernel.org>
 <96144a1b-efa7-ecc2-3e35-56825fcf48c6@oracle.com>
 <20230329124442-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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



On Wed, 29 Mar 2023, Michael S. Tsirkin wrote:

> On Wed, Mar 29, 2023 at 08:14:37AM -0500, Eric DeVolder wrote:
> >
> >
> > On 3/29/23 00:19, Michael S. Tsirkin wrote:
> > > Hmm I don't think we can reasonably make such a change for 8.0.
> > > Seems too risky.
> > > Also, I feel we want to have an internal (with "x-" prefix") flag to
> > > revert to old behaviour, in case of breakage on some guests.  and maybe
> > > we want to keep old revision for old machine types.
> > Ok, what option name, for keeping old behavior, would you like?
>
> Don't much care. x-madt-rev?
>
> > >
> > >
> > > On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> > > > The following Linux kernel change broke CPU hotplug for MADT revision
> > > > less than 5.
> > > >
> > > >   commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")
> > >
> > > Presumably it's being fixed? Link to discussion? Patch fixing that in
> > > Linux?
> >
> > https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
>
> Great! Maybe stick a Link: tag in the commit log.

If the original bug is in the kernel and kernel upstream has accepted both
your fix and Mario's patch on the acpi revision mess, I see no urgency to
fix this in QEMU.

Maybe we can address this in the 8.1 development window.

