Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6314FE0C8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 14:51:51 +0200 (CEST)
Received: from localhost ([::1]:55346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neFzp-0003ta-GQ
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 08:51:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1neFy9-0002Ge-QP
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:50:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55056)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vkuznets@redhat.com>)
 id 1neFy6-0000gA-KC
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 08:50:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649767801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UzZOxdO5MUApOqjYFaoIWwuPPWLZvbaIAmGsaXL3ZHw=;
 b=eMN/jg5ymGODrIyG0THQtYV0asQo8lC8Kz6oe1fCMZg1KvFXjyzkI9BhNLZmJ2adwCNmzN
 PwK1H2VmviGd71dBrtGuk4rt0Xz2p4JlbA6PYsGVErNEVexlCFP2BAdeLNIVQ7HKpuf2HE
 7/4rFThnOmdqcxJFxJLCI7jARpGYAsY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-qJ03EmagMAyn1mHjkdTd2A-1; Tue, 12 Apr 2022 08:48:23 -0400
X-MC-Unique: qJ03EmagMAyn1mHjkdTd2A-1
Received: by mail-ej1-f72.google.com with SMTP id
 cs18-20020a170906dc9200b006e87d61a5ccso2729291ejc.19
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 05:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=UzZOxdO5MUApOqjYFaoIWwuPPWLZvbaIAmGsaXL3ZHw=;
 b=2Gnt64YhYsWrTv9KhUyz8/S+WNQ04bEnUU8FF+OxYphVsnsixBoFufWah9iq5bacCv
 eUgpMuFrQT1VFKLqiJSMTOcQ7l7X6VKe9mjAb3UZr4YJpJLgjUcHPYSWDA4u07wy0p7i
 4D4kU+T+fJ00Js9thw4/QH8ezP9WiJ5cpf18sMweMkxSjAwJB7FqQbe9usVuBBNvtign
 gRnAwiWFQTD13iGpZsnw2Ta/PX9SWOXTtZWvkMe7kxnRX/DnMIewGZ70PipCdVhOu3/h
 je/7zXhnN+HvK4S9Mv4fp/ED653OinPvkBzupOwsOPrEA/ETB4bHHpkMJje2ONGlXCCM
 s30Q==
X-Gm-Message-State: AOAM5322CreuQBogECu78Q8exeYKRXHO6Rx/ZNhdvHfYlgnKkpAGR32B
 KOTuXYwsK/RxVuBfjyvvG9th7g+Wgxc/X72GMMKgGwLN1YFDyQIr2/q7erqXlI9FHqdOUO9vQNz
 3cnNgRmkWpG9vw+mBGyIr2DMjUXm+Y72NNMaoBDoIUpqJ+hBqcdtjDEVZaxwb5RRJeYI=
X-Received: by 2002:a17:907:7b84:b0:6e8:b8c2:6fe2 with SMTP id
 ne4-20020a1709077b8400b006e8b8c26fe2mr1861389ejc.401.1649767701698; 
 Tue, 12 Apr 2022 05:48:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw4l+a+YnZ4mM+K/GgbztX9pH3HjEvKHZapGEyT152DXZBgXvIJhLc6dqMRsZQj+c00aWNjew==
X-Received: by 2002:a17:907:7b84:b0:6e8:b8c2:6fe2 with SMTP id
 ne4-20020a1709077b8400b006e8b8c26fe2mr1861362ejc.401.1649767701396; 
 Tue, 12 Apr 2022 05:48:21 -0700 (PDT)
Received: from fedora (nat-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b006b0e62bee84sm13171177ejm.115.2022.04.12.05.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 05:48:20 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Divya Garg <divya.garg@nutanix.com>
Subject: Re: [Qemu-devel] [PATCH 6/8] i386/kvm: hv-stimer requires hv-time
 and hv-synic
In-Reply-To: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
References: <2dde6caa-8d02-7022-d2c2-aa56c408f5f2@nutanix.com>
Date: Tue, 12 Apr 2022 14:48:20 +0200
Message-ID: <87tuay5uy3.fsf@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vkuznets@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=vkuznets@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Divya Garg <divya.garg@nutanix.com> writes:

> Hi Vitaly Kuznetsov !
> I was working on hyperv flags and saw that we introduced new 
> dependencies some
> time back 
> (https://sourcegraph.com/github.com/qemu/qemu/-/commit/c686193072a47032d83cb4e131dc49ae30f9e5d7?visible=1).
> After these changes, if we try to live migrate a vm from older qemu to newer
> one having these changes, it fails showing dependency issue.
>
> I was wondering if this is the expected behaviour or if there is any work
> around for handing it ? Or something needs to be done to ensure backward
> compatibility ?

Hi Divya,

configurations with 'hv-stimer' and without 'hv-synic'/'hv-time' were
always incorrect as Windows can't use the feature, that's why the
dependencies were added. It is true that it doesn't seem to be possible
to forward-migrate such VMs to newer QEMU versions. We could've tied
these new dependencies to newer machine types I guess (so old machine
types would not fail to start) but we didn't do that back in 4.1 and
it's been awhile since... Not sure whether it would make much sense to
introduce something for pre-4.1 machine types now.

Out of curiosity, why do such "incorrect" configurations exist? Can you
just update them to include missing flags on older QEMU so they migrate
to newer ones without issues?

-- 
Vitaly


