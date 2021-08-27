Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 655753F9A19
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 15:29:30 +0200 (CEST)
Received: from localhost ([::1]:41654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJbul-00051m-FA
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 09:28:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbsw-0002rY-61
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:27:06 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:33727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mJbsu-0002Dp-R3
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 09:27:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j14-20020a1c230e000000b002e748b9a48bso7396951wmj.0
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ut2olzrp9AuPu5yCw+i3exqRUeLcgNF0bC6la2O5LxI=;
 b=EWkbx+RFeIoqJA7ckRbNNDuaT2xWAmPm5Co5oXN64l06zowFUSIVR5+5fYBi8F4ejk
 EZooUrTIBsvrnwhXMDEcXFDcUxvbEoDiVxFRKVKMxLjPVwrs6sS7VtcaziwiNiah3oGI
 //pWysg84iBpZEYZL9pAgQCBHujjECjw77XhEbpGGoSOO+TN6V4kSkPjgTGRLqK6TYBx
 kDfxHBbG56hsb4wzzfJhrAdRqclOSVGDIWJWFT7fPXsky6gNA5zMklNK2Gq/Z2Sz2xsU
 VozYwbpSi+IMhioBZxMYHp8QN9+CDQ8X06z0viH7BmQLxxLtaMW5Q4y9+ZD/puVampS+
 x6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ut2olzrp9AuPu5yCw+i3exqRUeLcgNF0bC6la2O5LxI=;
 b=ZkH3HEc5eXIYBSC1OL/VkKkJus6KtPCaTso9763f/3dENYbg4C3L/hZg8sDGFPjKqP
 EgywpxwTxYr6oBc2PL9LcnGW+oW+DWv11mEkT+IlM/mWymm4dpisXThE4hLNOfpctLCI
 eAUx+SuQl/Lbo20JGyv90wCr1E5fTWYXWOOzsciwYg5gLj18v4ChWyEc0nLob6ywHFap
 9kyCV1QdioW+ZSUJA48Ody5ShoU1PkTQ8Q4e8kLMBYIPdENkmitI+qqC8wFbHOJUFlOk
 JpV4XZ2eL2jIHdPWqc6GT4O6356xoXd+4XD7cHOhtjiYF+anzB3Qjapu7+1GLXWiCdt2
 Uvrw==
X-Gm-Message-State: AOAM5338TS/Dleeu9Daw9V+o41+rRWRDIEfytYSOGxYV3EMl6xBx5iYt
 wUY5mZeLSM3JMpDFBF9LkDYIvRwas8aVELe4
X-Google-Smtp-Source: ABdhPJyQqsrXTwQE6U83mQ4xv/hUS3R66+MKW1vwSpY6smQrU9WQTwJEWm09kH8k4I3CXt46pKxg0Q==
X-Received: by 2002:a1c:4407:: with SMTP id r7mr20155324wma.150.1630070822011; 
 Fri, 27 Aug 2021 06:27:02 -0700 (PDT)
Received: from larix (19.11.114.78.rev.sfr.net. [78.114.11.19])
 by smtp.gmail.com with ESMTPSA id q195sm5743923wme.37.2021.08.27.06.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 06:27:01 -0700 (PDT)
Date: Fri, 27 Aug 2021 15:29:12 +0200
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 4/6] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Message-ID: <YSjoqGLKjcwCeBtn@larix>
References: <20210810084505.2257983-1-jean-philippe@linaro.org>
 <20210810084505.2257983-5-jean-philippe@linaro.org>
 <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71dc152e-269b-fc32-e478-e2164008ff04@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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

On Tue, Aug 17, 2021 at 03:42:22PM +0200, Eric Auger wrote:
> > diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
> > index 770c286be7..f30eb16cbf 100644
> > --- a/hw/virtio/virtio-iommu-pci.c
> > +++ b/hw/virtio/virtio-iommu-pci.c
> > @@ -48,16 +48,9 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
> >      VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
> >  
> >      if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
> > -        MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
> > -
> > -        error_setg(errp,
> > -                   "%s machine fails to create iommu-map device tree bindings",
> > -                   mc->name);
> >          error_append_hint(errp,
> >                            "Check your machine implements a hotplug handler "
> >                            "for the virtio-iommu-pci device\n");
> > -        error_append_hint(errp, "Check the guest is booted without FW or with "
> > -                          "-no-acpi\n");
> We may check the vms->iommu is not already set to something else (to
> VIRT_IOMMU_SMMUV3 for instance).

Since that check is machine specific, virt_machine_device_plug_cb() in
hw/arm/virt.c may be a good place for it. The change feels unrelated to
this series but it's simple enough that I'm tempted to just append the
patch at the end. It also deals with trying to instantiate multiple
virtio-iommu devices, which isn't supported either.

Thanks,
Jean

