Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7DA3EA592
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 15:23:42 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEAgQ-0002t8-1G
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 09:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mEAfd-0002Eg-OS
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:22:53 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:39880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mEAfb-00063s-SS
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 09:22:53 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 u21-20020a17090a8915b02901782c36f543so15135228pjn.4
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ham6LYVb40/CfFwnYToaV3Cc2bW4bPawCxY0n2u+YDk=;
 b=XWfKd+q0KYQ+A6JdcBG3Mwf/4sLLSyaPBCoj6CQdtxg/L46MCX1yqPpLiZp49VWXf3
 LSmWC1h6lcUrqtdKWocOCLtYvW+5L0qFkQx+HMDigmoMC7EsuvtWX0GWDq+FmJiXgoWA
 33tXM+c42sTuhypIkaSvAjKNE2ZUcUx4bf/SlSx8g0d4KSeIdxgbareXslFvjKwjFpC3
 q5F39bMZqOSOHI+WwEluCVpGMMdzeLX9aXLhFLWR9JnksKd2KVVOYrq0xe9494uCHdQu
 SaVCK/r0s4GX8Ar/9w+EjB4Rgc2MilAxgBkRuivE+mk+8fg/s6RBDLuboCzf/wAhgP/S
 g1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ham6LYVb40/CfFwnYToaV3Cc2bW4bPawCxY0n2u+YDk=;
 b=adwWGtg7py0OFSmsgxeXwnV/jkUqxkz3F0GhfvYru/+xMKVaVmAqXpmJVXoGaZg+SL
 /XFhKJxDisqqCFNy1oy95HUYpCBwawLPUI8LPgFC8pKrhc6MpEQZdNQKP8PbSxmhgcIZ
 sbMLjIcbEUakk1plX0vPMKXmXngho8jAZKm2lgbvrZmxRx5/ae5ROautrkK1nMRG+u0V
 5SU/AwnaqPeEd20tpPuJHjcCiCSP8JbT2ME889I1DHo8xGkpTStoA240RxRYfNYVhk3m
 Jv8UkySJm5/buho8Uc+6o48g8m0paDHV2+r+YQKOqLe1XXUWhQJtyDwwLXDeog2/wFPe
 Ht8Q==
X-Gm-Message-State: AOAM530yNlNeJOtdEbfZ3Ws3qGOKv2r1LfvWfyGzxYuXLPL3xzlfMzn1
 zZOTBszsD73JkU4y26PPb96hMw==
X-Google-Smtp-Source: ABdhPJzIcLTJulohauXSWJZq1Xw4qlyIn2DWsYEhWmCFUGpBi1nmcEsaYhXYxYET3KVevxUx4+K6cQ==
X-Received: by 2002:a63:fe52:: with SMTP id x18mr3959624pgj.84.1628774569525; 
 Thu, 12 Aug 2021 06:22:49 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.139.156])
 by smtp.googlemail.com with ESMTPSA id w14sm1349336pfn.91.2021.08.12.06.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 06:22:48 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 12 Aug 2021 18:52:41 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/acpi: refactor acpi hp modules so that targets can
 just use what they need
In-Reply-To: <20210812071409.492299-1-ani@anisinha.ca>
Message-ID: <alpine.DEB.2.22.394.2108121851040.528313@anisinha-lenovo>
References: <20210812071409.492299-1-ani@anisinha.ca>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Igor Mammedov <imammedo@redhat.com>, philmd@redhat.com,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 12 Aug 2021, Ani Sinha wrote:

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

I do not have a cross compiled mips64 vmlinux handy, so can't verify that
issue #193 was indeed resolved. I have verified that #221 was indeed
fixed.

