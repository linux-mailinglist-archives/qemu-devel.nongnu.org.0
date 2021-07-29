Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7023C3D9CD7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 06:39:36 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8xpX-00036L-04
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 00:39:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8xod-0002PO-Sp
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 00:38:39 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8xob-00035u-87
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 00:38:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso7349882pjf.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 21:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=DPtNr4TtsDGysOlejr8AfVkm0XbRaQOSa1tdLlX+goA=;
 b=0bJucDLurh+QAi7jPgYeFwSlF5q9VD7gkjen0GvS2ey6j/cReay+vfvIpr/sfG8U5i
 re9HXm2x4AC84eDlNoc/1pdc1Mgzuk03AU4dImJfw3cfNVakEOrbdzQQAmGqM0hT7a/r
 3WlQAVpt/4gl/hz6g/CdV130ouODN5lwgklLc5dxJIe19b2dgKOOEdNxdyDuJLZ2RNrS
 DJj0aFc/EQshW7EFRRSixdUwHQjS/wxTt+e7Q3OTCEAszTuK9coJ3IbiQDbGRfAcr29+
 ZNwDROo8oB0E/McCSQLvPLZ+nk2IG9kUGpFyXzZExIHJI69ljDCHN0QhUoq49OlBPKOx
 i4rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=DPtNr4TtsDGysOlejr8AfVkm0XbRaQOSa1tdLlX+goA=;
 b=auq7eleG6sT+qQEzhIlkyrVfh7VUxxaNYM68ikf4EMdF2pZJvHGKdmCIVPB/HO+91o
 CVN+UUfzm4e/ak9ITs2NHwuBKTDCXTVKqeClakFatLV+Q7sYJ535cXRwtnyQz+zOiuKe
 E5ssw1C4RvXOtDh7ZSSZvDODNe9bCt41zA3wRZdvHjhe6znQ6ubEOW9cGwtNByIsZhY+
 XKqx3npous/ZZmkAH5Uht/TigqK2YAY/irPFCRDVlirM5MI1z5WqBDOiCUW6L3rTNB63
 qmaq4bGFz/zEX6GTs27UBGcaS5jO6l99LSH8Hr6x+mycnwo0bTu5z53dyJ1vqJSnSHOJ
 GhGg==
X-Gm-Message-State: AOAM532Z5vRuc3tNol/FTKRkNty7GBPWYJ+mWW6fvyQAyAHd2lJnnpvy
 UkUYkgp8efCH5Qw3B9grdkBVjg==
X-Google-Smtp-Source: ABdhPJwqKCrb7u+D4xrwAoj7bqMBFdOhkCXl7ocrS4ZM5421dy4PIyxHpTlNYKBoRilQ3qJR2gBhjA==
X-Received: by 2002:a17:90a:4d0b:: with SMTP id
 c11mr9052017pjg.82.1627533515463; 
 Wed, 28 Jul 2021 21:38:35 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.235])
 by smtp.googlemail.com with ESMTPSA id j12sm1576226pfj.208.2021.07.28.21.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 21:38:34 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 29 Jul 2021 10:08:18 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <20210728085437-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2107291003380.387306@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210728085437-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 28 Jul 2021, Michael S. Tsirkin wrote:

> On Mon, Jul 26, 2021 at 10:27:43PM +0530, Ani Sinha wrote:
> > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > return value from this function call. Instead of returning early when the value
> > returned is NULL, assert instead. Since there are only two possible host buses
> > for i386 - q35 and i440fx, a null value return from the function does not make
> > sense in most cases and is likely an error situation.
>
> add "on i386"?
>
> > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
>
> This that seems inappropriate, this is not a bugfix.
>

Forgot to answer this. I started this patch because I saw a gap that was
introduced with the above patch. In acpi_pcihp_disable_root_bus(), Julia's
code did not check for null return value from acpi_get_i386_pci_host().
See v2. Hence, I added the fixes tag. Then Igor suggested that I assert
instead and I also thought perhaps assertion is a better idea. Hence v3. I
am not conflicted after reading your argument. We should assert only when
a certain invariant is always respected. Otherwise we should not assert.
If you think acpi_get_i386_pci_host() can be called from non-i386 path as
well, maybe v2 approach is better.



