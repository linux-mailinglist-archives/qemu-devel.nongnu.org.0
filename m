Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6624846E9F0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 15:27:42 +0100 (CET)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvKOb-0003Gz-70
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 09:27:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mvKND-0001Fw-9H
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:26:15 -0500
Received: from [2a00:1450:4864:20::434] (port=33667
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mvKN3-0003dB-9S
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 09:26:13 -0500
Received: by mail-wr1-x434.google.com with SMTP id d24so10095125wra.0
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 06:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BXyOdlEVnkQu2lDkeh45DqHjOA59moTyMRJwCErRE+c=;
 b=ZLF8sIczrzI2TSr4ww0ToWWTWnf5cVxsZVH3IUcM94WOHdmP32ndOXk/4EhqnfTUhE
 X6bUk8/EKOg2uRcEIWC4oWHCa7S9fWRJBdOlIdqiHjgp4OAjj+7YtxReDtT95rJlmq5s
 nWBSuY8gC/rABF2InFRY6bTowsU5n53BXwVdJ8VKxwPN5Cxvf5dacSZKPid9sC+0K5pA
 lBm2aaBjQ7LAmOJwfackcAtoih5sKJEUu0n7GEzmzP+/tNH78SiEyb8KDZzZ8lZLRAhQ
 +1lvFiSepRM/Cs3W62R/t0bJLLFDfPVm1HVyZELQpoJc2TxUtFT7ggtZEJvoT9gvOoi6
 unjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BXyOdlEVnkQu2lDkeh45DqHjOA59moTyMRJwCErRE+c=;
 b=ykeor6hAig0sELpXeGTZlwmmfTgD/1PfFgEuQX91H+AXuxpL1TTLr5lcjqR4aBZ2NV
 Lze8jkJpSX3bWu1ATfrYSlai/BpwzxeaCRYKnXZwAzIGVW1Obd/CFGG9qyP3I8n9E2Ql
 GhZ/Lsdye8h74yuZ9PIg5LMnEwV4DNg+t+/GWBBvIi2yEXquV8CqRh1uEc95qLnvnNJN
 NH5etyc/Vzg+kOGC3RGgEV6sKy6QNXkY2JsPfKCenHfmInumwgrvX8UCfq4IwKiaRAsa
 aCjHoL1ZUnOUp66k1WaEFo/xbMCUj85RvU0LLREUjzZTgJ06e5SDToUfsBkhACbPE8DW
 ds+w==
X-Gm-Message-State: AOAM532lb2EiTuPxnXcXXQ4sDMI26s9C2K35ns0sSdFwD+/x/Up64n7t
 21NhgqqYD6rz/tWpZmPI9NoHMQ==
X-Google-Smtp-Source: ABdhPJwYmpdQGDqbXXhi1nZ9ftMBfxEem9xVAO5+xGhotoPLJYZs30BOwGG81DwcEyjMDXiHDpuYfg==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr7017694wrr.228.1639059956118; 
 Thu, 09 Dec 2021 06:25:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f7sm7732932wri.74.2021.12.09.06.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 06:25:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 887591FF96;
 Thu,  9 Dec 2021 14:25:54 +0000 (GMT)
References: <20211203175734.00002212@Huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: RFC: x86 memory map, where to put CXL ranges?
Date: Thu, 09 Dec 2021 14:19:59 +0000
In-reply-to: <20211203175734.00002212@Huawei.com>
Message-ID: <877dcdlurx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 shameerali.kolothum.thodi@huawei.com, linuxarm@huawei.com,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Jonathan Cameron <Jonathan.Cameron@Huawei.com> writes:

> Hi All,
>
> For CXL emulation we require a couple of types of memory range that
> are then provided to the OS via the CEDT ACPI table.
>
> 1) CXL Host Bridge Structures point to CXL Host Bridge Component Register=
s.
> Small regions for each CXL Host bridge that are mapped into the memory sp=
ace.
> 64k each.  In theory we may have a huge number of these but in reality I
> think 16 will do for any reasonable system.
>
> 2) CXL Fixed Memory Window Structures (CFMWS)
> Large PA space ranges (multiple TB) to which various CXL devices can be a=
ssigned
> and their address decoders appropriately programmed.
> Each such CFMWS will have particular characteristics such as interleaving=
 across
> multiple host bridges.  The can potentially be huge but are a system
> characteristic.  For emulation purposes it won't matter if they move arou=
nd
> dependent on what else is the machine has configured. So I'd like to
> just configure their size rather than fully specify them at the command l=
ine
> and possibly clash on PA space with something else.  Alternatively could
> leave them as fully specified at the command line (address and size) and =
just
> error out if the hit memory already in use for something else.
>
> Now unfortunately there are no systems out there yet that we can just
> copy the memory map from...
>
> Coming form an Arm background I have only a vague idea of how this should=
 be
> done for x86 so apologies if it is a stupid question.
>
> My current approach is to put these above device_memory and moving
> the pci hole up appropriately.

Which board model would be be talking about here? virt? Or maybe we need
a new one?

If it's virt I would look at extended_memmap which floats above the
configured RAM size and means less shuffling around of the relatively
crowded lower address space.

I have no idea about how this is handled on x86 though.

> Is that the right choice?
>
> On Arm I currently have the Host Bridge Structures low down in the MemMap=
 and the CFMWS
> can go above the device memory.  Comments on that also welcome.
>
> In Ben's RFC the host bridge component register location was marked as a =
TODO
> and a arbitrary address used in the meantime so time to figure out how to=
 clean
> that up.
>
> Thanks,
>
> Jonathan


--=20
Alex Benn=C3=A9e

