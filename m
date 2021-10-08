Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7853426D6A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 17:22:39 +0200 (CEST)
Received: from localhost ([::1]:56576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYrhm-0005Gq-Qq
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 11:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrgU-0003jo-Qe
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:21:18 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mYrgR-00025f-AG
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 11:21:18 -0400
Received: by mail-wr1-x436.google.com with SMTP id o20so30832138wro.3
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 08:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1x64kse4Zr0c//FOG48TBDK9XBZTgCF9BcgvQ0vjh2o=;
 b=HMv2Wf/CfsDaH7icTHBNG8eEyNvsU9WfasCDlntzy3+B4aMzdKR4xjsZEU4HvTYT6s
 qtOy085OHxxkWjXMwUSYs9NYg++TRTzhjB5wJFvTAyHWvbkF4DpsAg7gZ18+m4dIP9It
 /IMjt9ccgMDrM6vq7hMrv5oMD07qMch79X8+wlKOIawbMNzFPFXNlOAvH0IYGCX54Txn
 o0DTUhKHFSCx7oBOky9S/XddGacH/FV6cbQQ6Zb/H8474inojbkqT3ZyhAGxf2FbafUh
 VVg3e5Zr0pteOP1QoyqV4hxD06EXalsxos9CAJszYdNZOywUuzBrlCPUx0J5hK8bdMZO
 jtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1x64kse4Zr0c//FOG48TBDK9XBZTgCF9BcgvQ0vjh2o=;
 b=4bg1qCbfOjzPTd0gY3CzkIb1AiFrmjDtY7wMGtn3xI/lsHAW8Rx9eNMC7u7Rc+j3in
 UxYM8PAFPqh9az5rxITDcWyYp7Qh4d0qKnE19QUqXLuSLvJype2CPR4T0oTE8k7i4YoS
 x7nI2L44gQb6APx9xPzdYvfLUOsg3eFyEmN9YQEd1Fqc2jWDxsj69q19ekrjdCi9waHT
 p1AvuDcMHHmU/ZtctktR3Ii34y+jImQoCRUE44wPGsfTLR2dsjll5LA3gRHkMKJm/Wox
 YiF5VMU3S1GozEBvYYIlBKLs0n/kWC60sUP7jFtqd4ri4fpE0Dq9dIf3MkbJbuhHcFHf
 Gp2Q==
X-Gm-Message-State: AOAM532vMncndvg1S/z1YtwHlDj+jvVcSqAzRc3GAHZqCsOpKWkX1fjU
 I6yO9xHjJcVoFtX61/g2Wi2qyA==
X-Google-Smtp-Source: ABdhPJxR8d2Sl974TXe8mLXppFIR2f30aR364+TQzWlOOVOxk5wUaCHNspHK9NKTA6/5saVWS6FYqQ==
X-Received: by 2002:a1c:3b06:: with SMTP id i6mr4137708wma.172.1633706473977; 
 Fri, 08 Oct 2021 08:21:13 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id h17sm2864488wrx.55.2021.10.08.08.21.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 08:21:13 -0700 (PDT)
Date: Fri, 8 Oct 2021 16:20:51 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v4 03/11] hw/arm/virt: Remove device tree restriction for
 virtio-iommu
Message-ID: <YWBh02zKwxJ9IGU1@myrica>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
 <20211001173358.863017-4-jean-philippe@linaro.org>
 <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4732c80-d813-d16b-c91b-1884b33accb8@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 01:57:35PM +0200, Eric Auger wrote:
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
> actually this does not work. To add a hint you need the *errp to be set.
> Otherwise when running through this path you will get
> 
> emu-system-x86_64: ../util/error.c:158: error_append_hint: Assertion
> `err && errp != &error_abort && errp != &error_fatal' failed.
> 
> replace the error_append_hint with an error_setg (without the \n)

Woops sorry, will fix

Thanks,
Jean


