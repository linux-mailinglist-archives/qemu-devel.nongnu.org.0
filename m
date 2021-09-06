Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F040195E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 12:00:20 +0200 (CEST)
Received: from localhost ([::1]:56612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNBQJ-0007tr-3S
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 06:00:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNBOt-0006ya-Uf
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:58:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNBOs-0001LV-6X
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 05:58:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630922329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZbQMl5J7M5IF9S7E3ujoshf8dI8GnwxUCGqqZr1RkFQ=;
 b=dnROekVAuamMd3kvmUZj5tKIhGMhe7RtRGZ0Y3rxWjTvy4UX8/nOqTsGTqFUXib6nwgQc7
 i0fCH//GyFieEsjht7fZLNkzPddN7Ya9RA5pKud/P4l26kIKaw5Cp4oXbHo6ooR1L8ukgq
 KWZ7NJuYgpHZNXToOD0uQcf3apgjJgc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-PLx5x31NPreJ4ow1oHMDig-1; Mon, 06 Sep 2021 05:58:47 -0400
X-MC-Unique: PLx5x31NPreJ4ow1oHMDig-1
Received: by mail-wm1-f69.google.com with SMTP id
 h1-20020a05600c350100b002e751bf6733so3016730wmq.8
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 02:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZbQMl5J7M5IF9S7E3ujoshf8dI8GnwxUCGqqZr1RkFQ=;
 b=blAWpmb6BJfO5RK0bdyKRQMuBSMIlm5rIMZmwRyzaD+Wn1OangDGFrsC7p2vtDJJrM
 BkbNBCUJQlnxXb2b9SzUXbTG1NrO3kpLil2JUF+FGw83AxPdqGMu+apqciE4XC9UTeLe
 jO1TbjaZjMxIvBpBLUyiZQyd1pKAcIeCHG1OGSVLFE+TKa5n8QIRJZIaW6TeLPc0LYCo
 tKU7yBYqVFL2M60ppJ8aQ9p7rHBitfpo7iu+PydLgVd27Z02GfVJe8Cvtw1ds7qHJivv
 CvW1QhVS48W7xlWCYdHFnpLG6CXlGy1yfqHxAq0G18gq711Qfji7hM+mevU7EX3IsmHo
 ILHQ==
X-Gm-Message-State: AOAM530E9JlW+WRjRfcFX57DugVBeakjXvzPnE83cnpnPlUO7HOeEwT3
 HHgKrGkgORYTLmKP3znfe4bn03EKuTCZfF14sYO/Ko/IPqkWYn/iIsCge8f6MifTGc4xDQxhZ+d
 pQibLm/Q5MM4pcgo=
X-Received: by 2002:adf:f08b:: with SMTP id n11mr12414833wro.176.1630922326743; 
 Mon, 06 Sep 2021 02:58:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTEjmatabs5se9QFJViWNbNX0cHirayBDsHSy59yYzXgu5xIcLfJVA54slCqyMgrrxrrD1VA==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr12414817wro.176.1630922326547; 
 Mon, 06 Sep 2021 02:58:46 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id k16sm7402931wrh.24.2021.09.06.02.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 02:58:45 -0700 (PDT)
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6a9c2fde-317d-bd31-5a8c-135446b881dc@redhat.com>
Date: Mon, 6 Sep 2021 11:58:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-7-mst@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.832, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Ani,

On 9/4/21 11:36 PM, Michael S. Tsirkin wrote:
> From: Ani Sinha <ani@anisinha.ca>
> 
> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> This brings in support for whole lot of subsystems that some targets like
> mips does not need. They are added just to satisfy symbol dependencies. This
> is ugly and should be avoided. Targets should be able to pull in just what they
> need and no more. For example, mips only needs support for PIIX4 and does not
> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> etc. This change is an effort to clean this up.
> In this change, new config variables are added for various acpi hotplug
> subsystems. Targets like mips can only enable PIIX4 support and not the rest
> of all the other modules which were being previously pulled in as a part of
> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> are not required by mips (for example, symbols specific to pci hotplug etc)
> are available to satisfy the dependencies.
> 
> Currently, this change only addresses issues with mips malta targets. In future
> we might be able to clean up other targets which are similarly pulling in lot
> of unnecessary hotplug modules by enabling ACPI_X86.
> 
> This change should also address issues such as the following:
> https://gitlab.com/qemu-project/qemu/-/issues/221
> https://gitlab.com/qemu-project/qemu/-/issues/193

FYI per https://docs.gitlab.com/ee/administration/issue_closing_pattern.html
this should have been:

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/193
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/221

Can we close these issues manually?

> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Message-Id: <20210812071409.492299-1-ani@anisinha.ca>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  configs/devices/mips-softmmu/common.mak |  5 +--
>  hw/acpi/acpi-cpu-hotplug-stub.c         | 50 +++++++++++++++++++++++++
>  hw/acpi/acpi-mem-hotplug-stub.c         | 35 +++++++++++++++++
>  hw/acpi/acpi-nvdimm-stub.c              |  8 ++++
>  hw/acpi/acpi-pci-hotplug-stub.c         | 47 +++++++++++++++++++++++
>  hw/acpi/Kconfig                         | 10 +++++
>  hw/acpi/meson.build                     | 14 +++++--
>  7 files changed, 161 insertions(+), 8 deletions(-)
>  create mode 100644 hw/acpi/acpi-cpu-hotplug-stub.c
>  create mode 100644 hw/acpi/acpi-mem-hotplug-stub.c
>  create mode 100644 hw/acpi/acpi-nvdimm-stub.c
>  create mode 100644 hw/acpi/acpi-pci-hotplug-stub.c


