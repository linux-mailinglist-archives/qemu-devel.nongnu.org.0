Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 429251918DA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 19:20:55 +0100 (CET)
Received: from localhost ([::1]:53322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGoAY-0005kN-4f
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 14:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1jGo99-0005FN-6u
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:19:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1jGo97-0004cI-PT
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:19:26 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:56103)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1jGo97-0004bW-LX
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 14:19:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585073964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=29iK0F/Gae8Lnxtt1oKobZRKX29idUp4nofoNcZ/9JM=;
 b=B5ZkkT+mJl2HY1/hfzwTUIFWHDPhydfJOQ887MP0JUDfzw1vQJ8V9P2xp67tMWarZmDhby
 GsRDEP+LBnxmIzHuP3E87I0/3OlEY7YT8f6C3FAfJjvufEhGR+bGqQTRmul0Lz91PRNTqa
 j7gtPQlbzzrVLBaLFeWElTo7eWhCGJs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-IyqLe-ptNRSWbTLJ85oASQ-1; Tue, 24 Mar 2020 14:19:23 -0400
X-MC-Unique: IyqLe-ptNRSWbTLJ85oASQ-1
Received: by mail-wm1-f71.google.com with SMTP id f9so1550739wme.7
 for <qemu-devel@nongnu.org>; Tue, 24 Mar 2020 11:19:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bfKxrcAYL3qJAjPqhp2KXWsKra1TFVjk/RLo1JNsOVY=;
 b=R7iZf3pEFKP8txlDqBQKYLZg6KH/nWe4Obov1+wWwgt7rVADpV/Dejoz3MWFQ+8fb8
 llg3PtqGxUhgVBTNWkfz5FrjkM6UMtmXvBcT9zWM7DL+M/763V9Z/j+7P3QVYtCsc81/
 z5FU/hQL/hytSePDarfNV+lEoYT3pR8XzL6dYY+i+zlW9LzwixcmXiyM37sgtJRnnPdU
 J5K7/Zi+OL4s93fsUrpA119VAt5+KXUkVnZwOZkPPPXcjX81geBslwxuf/KOq27iV02h
 MI3DPX1bA2+rv7JHNV7ALqjmmrfiNyBrNTEQ5QmrhqXccWwG1VfJSWV0WBaLEGtfPuU5
 uLHQ==
X-Gm-Message-State: ANhLgQ11mJ+Vnl7Q5iw4VaKvZ6wG6J5PMc8Re6+vxVJRuEUReQXZjlCU
 heIsOmFlR8XQi6bCtHeaV2KEJKj7AfSyJ7ImWy6TtYy1wlFchFigRV2X5y69EZikkEvNeQULDNp
 xU1T2GTnNNxLL++A=
X-Received: by 2002:adf:cf09:: with SMTP id o9mr37080581wrj.74.1585073961686; 
 Tue, 24 Mar 2020 11:19:21 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtoyGu2Zn/sHDRK1B/QPFf7ailyYZQZxOfMhhUCMwv+32rQI+zwHFaIHeTUKFtQQbBMp9AAGQ==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr37080540wrj.74.1585073961431; 
 Tue, 24 Mar 2020 11:19:21 -0700 (PDT)
Received: from xz-x1 ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id u5sm23315254wrp.81.2020.03.24.11.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 11:19:20 -0700 (PDT)
Date: Tue, 24 Mar 2020 14:19:15 -0400
From: Peter Xu <peterx@redhat.com>
To: Liu Yi L <yi.l.liu@intel.com>
Subject: Re: [PATCH v1 18/22] vfio: add support for flush iommu stage-1 cache
Message-ID: <20200324181915.GC127076@xz-x1>
References: <1584880579-12178-1-git-send-email-yi.l.liu@intel.com>
 <1584880579-12178-19-git-send-email-yi.l.liu@intel.com>
MIME-Version: 1.0
In-Reply-To: <1584880579-12178-19-git-send-email-yi.l.liu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: jean-philippe@linaro.org, kevin.tian@intel.com,
 Jacob Pan <jacob.jun.pan@linux.intel.com>, Yi Sun <yi.y.sun@linux.intel.com>,
 kvm@vger.kernel.org, mst@redhat.com, jun.j.tian@intel.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, alex.williamson@redhat.com,
 pbonzini@redhat.com, hao.wu@intel.com, yi.y.sun@intel.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Mar 22, 2020 at 05:36:15AM -0700, Liu Yi L wrote:
> This patch adds flush_stage1_cache() definition in HostIOMUContextClass.
> And adds corresponding implementation in VFIO. This is to expose a way
> for vIOMMU to flush stage-1 cache in host side since guest owns stage-1
> translation structures in dual stage DMA translation configuration.
>=20
> Cc: Kevin Tian <kevin.tian@intel.com>
> Cc: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Eric Auger <eric.auger@redhat.com>
> Cc: Yi Sun <yi.y.sun@linux.intel.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Liu Yi L <yi.l.liu@intel.com>

Acked-by: Peter Xu <peterx@redhat.com>

--=20
Peter Xu


