Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291B3D9D7B
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 08:11:07 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8zG5-0006jI-Vv
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 02:11:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8zFH-0005yF-0M
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:10:15 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:39857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1m8zFF-0004py-2Z
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 02:10:14 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so13922015pjm.4
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 23:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=sDTTqrxd61FNyOVX3pdwcm7+ImoPSfRMeUyyWKvnuu8=;
 b=dg8yFBwEIY8GG/AkV456CPr/d2J3QrwMjbaj5AgqdmQe0VPBJ48LimVvy6EyvcSO/k
 DwumZdzq+BiC6RVymmacaWUB7LpEBpUU0hcGK7ocrw5elF0PB/RWZRPq21gfXlTBGjE6
 ViZCbPn9fj005HEW72lMf1hYakO0buzCHw4Oe5LPqLYxSo9pPLuF3f2T9YB8qdCOVv7S
 fnq3KYNS9YY5fXgJafBQ1rMeRnnBC7xkQLsPCiMOMC6Vj+YZw1pmWcNILgAcYy/pn/A5
 TJ75O5/kPepT/6TB1MTwMHeB49Hfi3nsNjNbe4CpELn1SEFqY1DMd4wOviYfBdrpqwea
 gA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=sDTTqrxd61FNyOVX3pdwcm7+ImoPSfRMeUyyWKvnuu8=;
 b=DzFuvKU4FF12a9sWz2Vb0nyWEjJnl7YKTTA8YVXBQPfviQaYPLXBFetF0CXtqJUCGO
 v5c5srIJCEdqHpJ1JJpdA5WA2Re3mkc91UdNPEL6d0eTVfjqKKVS6PHLrBvtUhwAWYDl
 0GT5AUx7afgTx3Zg9m5Ri/aW8lL629LMRwgWS1AepYyli4Ywty/R/ABUuRrMpFMTthzZ
 kIie31w8dP/wT9q1EsMvH1DZ8OdtNxTyMUnbvSRvW6pXscvW/i0JoqFrqUmFasqzN8mw
 tWFKd9wl3EnwbhEK/I5CwBdGFTFJjLc8cPEXGHfTB+YQ4ksBNpVVVvindXsZlM1jLmKx
 1lkA==
X-Gm-Message-State: AOAM531VtN1G59sWDVx89G5v/lKOWsc6CDd2mv5T5wJ5O6fp6TOkuifZ
 smuH2DNyxwvq8+XrAN3EUA4VkQ==
X-Google-Smtp-Source: ABdhPJyIhcO+MNsQOgcEnH2OWJs1BxYsw2X9Qh1PzAAyCzAy1rnGK7qiwMAhiyQ+AEkA7SuDtk5s3g==
X-Received: by 2002:a65:51c9:: with SMTP id i9mr2458399pgq.102.1627539011278; 
 Wed, 28 Jul 2021 23:10:11 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.242.235])
 by smtp.googlemail.com with ESMTPSA id t8sm2291575pgh.18.2021.07.28.23.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 23:10:10 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 29 Jul 2021 11:40:04 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <alpine.DEB.2.22.394.2107291003380.387306@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2107291136370.390674@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210728085437-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2107291003380.387306@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1032.google.com
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 29 Jul 2021, Ani Sinha wrote:

>
>
> On Wed, 28 Jul 2021, Michael S. Tsirkin wrote:
>
> > On Mon, Jul 26, 2021 at 10:27:43PM +0530, Ani Sinha wrote:
> > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > return value from this function call. Instead of returning early when the value
> > > returned is NULL, assert instead. Since there are only two possible host buses
> > > for i386 - q35 and i440fx, a null value return from the function does not make
> > > sense in most cases and is likely an error situation.
> >
> > add "on i386"?
> >
> > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> >
> > This that seems inappropriate, this is not a bugfix.
> >
>
> Forgot to answer this. I started this patch because I saw a gap that was
> introduced with the above patch. In acpi_pcihp_disable_root_bus(), Julia's
> code did not check for null return value from acpi_get_i386_pci_host().
> See v2. Hence, I added the fixes tag. Then Igor suggested that I assert
> instead and I also thought perhaps assertion is a better idea. Hence v3. I
> am not conflicted after reading your argument. We should assert only when
> a certain invariant is always respected. Otherwise we should not assert.
> If you think acpi_get_i386_pci_host() can be called from non-i386 path as
> well, maybe v2 approach is better.

Also I should point out that at this moment, only ich9 and piix4 end up
calling acpi_pcihp_disable_root_bus(). Hence, we are ok either way for
now. In the future, if other archs end of calling this function, then the
question is, do we gracefully fail by simply returning in case of null
host bridge or do we assert? In its current form, it will ungracefully
crash somewhere.


