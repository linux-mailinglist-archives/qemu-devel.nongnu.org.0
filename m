Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9AC4CD2E3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:58:56 +0100 (CET)
Received: from localhost ([::1]:42896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5eB-0002Cn-Ke
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:58:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5YF-0004wT-9z
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:52:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58282)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nQ5YD-0003d8-O4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:52:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646391165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qPCKhliNjC5w/vPfb/TAz8BmgaV2mxuagBwPeoitokg=;
 b=DaM8t4LmXv+MmGxp0AvejJK0kVMB1sBc/meuPA6zIJNI2ALhjhSKShRKqYY9NJk80jTJbo
 9o7GoHZP8XD+lIiW6bIyWoOFd5WObRA+LM8K6OnBd1J9T1xWVZrFIy2h+WT+LqT3pmzvXj
 wln/h/sdY0F+3yodaz1bjEDl3fTQkoo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-bNvZyld5P52NecaIzUpGwA-1; Fri, 04 Mar 2022 05:52:44 -0500
X-MC-Unique: bNvZyld5P52NecaIzUpGwA-1
Received: by mail-ej1-f70.google.com with SMTP id
 nb1-20020a1709071c8100b006d03c250b6fso4225257ejc.11
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:52:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPCKhliNjC5w/vPfb/TAz8BmgaV2mxuagBwPeoitokg=;
 b=7dfp+Ey3XzglMx75QQPqLd5FRdiq4EpK0QacDBtUctySwCTdG9MWwI5aRp1S1uI70i
 AXUgskQJCUTRgpY5NxNHP1v2RaryEOx3BuYYsQl7sI2zCAbQ1+laHbPr+4vCx/mtnErZ
 YA2PY7gyhA5lM69dHfxZnF1yxBRd156CAy/MQOobu4wxmVsxGGW8iJefYgpf52U1/UEB
 Mf3/i888DjTi6KW315LuCEN0pFisyXXm4npdeVYhWxqCJXWxGQfhwT7yeuv7yLgQn9Gl
 sl+Uh0Kf5MdlzzNIyZRjabjuZ7jf+YSwnrdErCpeNfpBLbcf4MOGckHukIatpbWXvww+
 ieGA==
X-Gm-Message-State: AOAM532CO+VK71Kh1OS/lluut8cXfOPuHV+b0dpQ2qGtsDCzV3xELXp2
 GzQpbSMnq2AhDQScke92VPl8Mugh96HWLKQQnOFzEG6bleQY4qOA+Vl9EyJXk5QC+ZZJsEeDO+F
 vdDyEMZytO5Bcb3E=
X-Received: by 2002:a50:d097:0:b0:415:cec5:3b31 with SMTP id
 v23-20020a50d097000000b00415cec53b31mr9091232edd.377.1646391162993; 
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwshiRJLMsuKD8PogzyCtuqSm3Vpb2M660ALgkEmTbZs7/+uX1EsbFqaMB5UFbOfO32/F8vUw==
X-Received: by 2002:a50:d097:0:b0:415:cec5:3b31 with SMTP id
 v23-20020a50d097000000b00415cec53b31mr9091206edd.377.1646391162721; 
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
Received: from localhost ([185.140.112.229]) by smtp.gmail.com with ESMTPSA id
 r9-20020a05640251c900b00415d3012600sm1965193edd.50.2022.03.04.02.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:52:42 -0800 (PST)
Date: Fri, 4 Mar 2022 11:52:40 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH] hw/arm/virt: Validate memory size on the first NUMA node
Message-ID: <20220304115240.71d241ad@redhat.com>
In-Reply-To: <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
References: <20220228075203.60064-1-gshan@redhat.com>
 <20220228100820.477e2311@redhat.com>
 <41eb791c-a74a-7ed6-df05-cd1867ecbb5f@redhat.com>
 <20220301114257.2bppjnjqj7dgxztc@sirius.home.kraxel.org>
 <ee76dcac-8914-2f24-9920-9d93aa29c22d@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Shan Gavin <shan.gavin@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Mar 2022 11:25:25 +0800
Gavin Shan <gshan@redhat.com> wrote:

> Hi Gerd,
> 
> On 3/1/22 7:42 PM, Gerd Hoffmann wrote:
> >>> Unless it architecturally wrong thing i.e. (node size less than 128Mb)
> >>> ,in which case limiting it in QEMU would be justified, I'd prefer
> >>> firmware being fixed or it reporting more useful for user error message.  
> >>
> >> [include EDK2 developers]
> >>
> >> I don't think 128MB node memory size is architecturally required.
> >> I also thought EDK2 would be better place to provide a precise error
> >> mesage and discussed it through with EDK2 developers. Lets see what
> >> are their thoughts this time.  
> > 
> > Useful error reporting that early in the firmware initialization is a
> > rather hard problem, it's much easier for qemu to catch those problems
> > and print a useful error message.
> > 
> > Fixing the firmware would be possible.  The firmware simply uses the
> > memory of the first numa note in the early initialization phase, which
> > could be changed to look for additional numa nodes.  It's IMHO simply
> > not worth the trouble though.  numa nodes with less memory than 128M
> > simply doesn't happen in practice, except when QE does questionable
> > scaleability testing (scale up the number of numa nodes without also
> > scaling up the total amount of memory, ending up with rather tiny
> > numa nodes and a configuration nobody actually uses in practice).
> >   
> 
> I still don't think QEMU is best place to have this kind of limitation,
> which the first NUMA node should have 128MB memory at least. For example,
> the limitation exists in EDK2-version-A.0 and the limitation is removed
> in EDK2-version-A.1. The QEMU can't boot the guest using EDK2-version-A.1,
> but we should succeed.

if firmware is not an option, I wouldn't opposed to printing warning
message from QEMU if you can detect that you are running broken edk2
and under condition that no new infa/hooks are invented for this.
(assuming it's worth all the effort at all)

Maybe put it in virt-arm specific machine_done.

> If it's not worthwhile to be fixed in EDK2, it might be doable to improve
> the error message printed by EDK2. Otherwise, we would ignore this issue
> because 128MB node memory size isn't used in practice. If the EDK2 error
> message can be improved, we might have something like below:
> 
> ASSERT [MemoryInit] /home/lacos/src/upstream/qemu/roms/edk2/ArmVirtPkg/Library/QemuVirtMemInfoLib/QemuVirtMemInfoPeiLibConstructor.c(93): NewSize >= 0x08000000
> 
> to
> 
> The first NUMA node should have more than 128MB memory
> 
> Thanks,
> Gavin
> 


