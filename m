Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E3533C8F7
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 23:01:44 +0100 (CET)
Received: from localhost ([::1]:55350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLvHR-0003Sx-KN
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 18:01:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lLvF7-0002dN-6J
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:59:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23740)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lLvF4-0003RP-9E
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 17:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615845552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0sAdWO4ZdIXvOCADVqyAsPWdMJD7AAKFcKxuNzuqJlw=;
 b=e+ECU1cmIDw6nZUe7Q+1ef9/KFp+ah6sHcu/itkX5lDzi7uvl9Ay/yIN7sKmu19mLawnid
 I2mnf5Z6whQ/ZWsx75SVq8E8EWa7yIfaSP/FpZFrxfOklYgLSuse+pUppSCoNmeIx12ghe
 8gV43s5rxdMqvU+bmc//FJz9u8P7sEs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-_FTdtmaKPO2zfdis35A18g-1; Mon, 15 Mar 2021 17:59:09 -0400
X-MC-Unique: _FTdtmaKPO2zfdis35A18g-1
Received: by mail-wm1-f69.google.com with SMTP id f9so8788068wml.0
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 14:59:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0sAdWO4ZdIXvOCADVqyAsPWdMJD7AAKFcKxuNzuqJlw=;
 b=ZvsftX+ZWfifMdB937JYqiudtBpB5BEDcDbUWdmFMAa1j+VtQRQItYIwm6xTSyCWKM
 VL1OafSUgAmMsfNFuGABzBJznf2mHYFnENT6UsIDpQ33xzMdzHYTyxMlzrfzix9//0Nt
 Bstf+R2Z39YVclKSEl09DGpfn+E8fiyaclvWklPC707/ZrfAWDNJfrwFFaG+r9tbhfzy
 YO+Uc5mgYeBvz+okOiPac/pWR/cRWmK98vbqLipfRX9Bp6LjP278YYfxXFg1/5RUFJKS
 B10He+Gog20CQyDBeFv9lKM1WZjYb1dndp0Abmkrzzvv9aKSdNYlmFov5gsjUu+ZaioL
 oc/w==
X-Gm-Message-State: AOAM533Wmj9ppStuXX5I3cEDoODHYIb46lXH+QA7mZ9feNjl7D/NSrJJ
 Q97HmZLORJTnFqeUYEgcCCvxCvDIMkl19B7T1gqMaEBp3M+qlxb7Lu7uoCgTDv+a58CnJbeX7RH
 PE+OdP8dYxhd3x4k=
X-Received: by 2002:adf:f303:: with SMTP id i3mr1562562wro.67.1615845548439;
 Mon, 15 Mar 2021 14:59:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9+vyrd1I+92EL20rI44L1S5ROyrhgrdiL0AFHe0kZZNff7NOT4PgB8NqRrM3U4EzhxIb4OA==
X-Received: by 2002:adf:f303:: with SMTP id i3mr1562549wro.67.1615845548255;
 Mon, 15 Mar 2021 14:59:08 -0700 (PDT)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id y16sm20006907wrh.3.2021.03.15.14.59.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 14:59:07 -0700 (PDT)
Date: Mon, 15 Mar 2021 17:59:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: Windows 10 won't run on default x86_64 machine anymore
Message-ID: <20210315175753-mutt-send-email-mst@kernel.org>
References: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
MIME-Version: 1.0
In-Reply-To: <YE+SHIG8qQFMsEJl@diablo.13thmonkey.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 15, 2021 at 05:58:04PM +0100, Reinoud Zandijk wrote:
> Hi,
> 
> with the introduction of the following patch from 17th of February, Win10
> won't boot anymore without explicitly setting the machine to be 5.2 compatible
> like pc-1440fx-5.2. The default 6.0 will cause it to panic and gives as reason
> only "ACPI error".


Thanks for the report!
Could you provide a bit more detail please?
Which windows version is used, which qemu command line, etc etc.

Also does this only affect pre-installed guests? what if you
install a fresh copy of windows?

> It might work to counter a bug in Linux but this is not the place to do the
> patch. The BSDs don't care and will boot fine with full ACPI regardless of the
> machine chosen. Windows 10 however DOES care and gets confused.
> 
> I think its better to revert this and fix Linux ;) or make it a selectable
> feature as a workaround that's by default OFF :)
> 
> With regards,
> Reinoud
> 
> 
> The patch concerned is:
> 
> commit 6be8cf56bc8bda2ed9a070bdb04446191f31acc9
> Author: Isaku Yamahata <isaku.yamahata@intel.com>
> Date:   Wed Feb 17 21:51:12 2021 -0800
> 
>     acpi/core: always set SCI_EN when SMM isn't supported
>     
>     If SMM is not supported, ACPI fixed hardware doesn't support
>     legacy-mode. ACPI-only platform. Where SCI_EN in PM1_CNT register is
>     always set.
>     The bit tells OS legacy mode(SCI_EN cleared) or ACPI mode(SCI_EN set).
>     
>     With the next patch (setting fadt.smi_cmd = 0 when smm isn't enabled),
>     guest Linux tries to switch to ACPI mode, finds smi_cmd = 0, and then
>     fails to initialize acpi subsystem. This patch proactively fixes it.
>     
>     This patch changes guest ABI. To keep compatibility, use
>     "smm-compat" introduced by earlier patch. If the property is true,
>     disable new behavior.
>     
>     ACPI spec 4.8.10.1 PM1 Event Grouping
>     PM1 Eanble Registers
>     > For ACPI-only platforms (where SCI_EN is always set)
>     
>     Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>     Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
>     Message-Id:
> <500f62081626997e46f96377393d3662211763a8.1613615732.git.isaku.yamahata@intel.com>
>     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
>     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> 
>  hw/acpi/core.c         | 11 ++++++++++-
>  hw/acpi/ich9.c         |  2 +-
>  hw/acpi/piix4.c        |  3 ++-
>  hw/core/machine.c      |  5 ++++-
>  hw/isa/vt82c686.c      |  2 +-
>  include/hw/acpi/acpi.h |  4 +++-
>  6 files changed, 21 insertions(+), 6 deletions(-)
> 
> 



