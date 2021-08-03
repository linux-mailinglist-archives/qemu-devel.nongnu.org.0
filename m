Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1C3DEBFA
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:35:50 +0200 (CEST)
Received: from localhost ([::1]:45238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsi5-0004wl-Cu
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:35:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mAsgg-0004An-51
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:34:22 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:33451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mAsge-0005wB-CH
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:34:21 -0400
Received: by mail-pl1-x629.google.com with SMTP id a20so23412489plm.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=uRPMjxnoHWnpCJvny+MkNfYYwgG3ROUqeN2JE5KBw4k=;
 b=klgJxeYsAnSOVwIVdkQj8aAiRwG1H/99qR/nSv7we1V7gU5NOrA3EZA2jaLFeul8qv
 ypj+aH59kmEbHSZHLaxwADFvPAx56UMd9It0D2JILy2vlMlUtcYZH3ft7kg9rPyKuL5x
 m/u3cvLEbq/VskZcjYZS9nIoXsi9+3iOfS1FbSh4oVn+GYU0i5IJM00bB09qyfL1Fcu7
 TIG8GXzAK8uLNoIX9nOF1HIxlgDPC7HW+fDvB80/l6xy8EeLAq6pq+cyidgHotMC/28c
 NG/CZKHZcnG+ILupKW9lrJjGuc2/mErwAFXERCz8tqKmeQr8WqtY+dISxHk0/buKzWIy
 kmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=uRPMjxnoHWnpCJvny+MkNfYYwgG3ROUqeN2JE5KBw4k=;
 b=DoupoBNgzUk2AiqSrw8EtyDfiIgmeJVl36bJUsr4PKQYPnRqBLjmEnQ2kSU/1pWPzr
 vYIyDwfuzcSVpAKFYQQDmo3mHa1bOFkUoHZX3lG3Ygw48hi1TcZYyoo+BfQnZrHE7xEL
 28kpoCwq6mkom2xI6xiqwzVrTJtBTwv51WakJTez1Ut2ErBne37FvLFUjDYkJ0tCEDDN
 z9GMt74Ej4k8Uf3XIKW6C+udNjOvDcNcqTfcfY4fBjoooW0vfIC9WIsp4963+YvqAsJw
 PgtiBFv3rnqC9RVQr70YNqhL8fM2J4XJop0yne7f6ywHnSbYmCnOmAfjQ0EkFkPPmfnN
 r9ZQ==
X-Gm-Message-State: AOAM531Y5KwqTsR4KTH0oA4HuMdJguQgM1yZK6xBmjLH6NZSrAVSSC/v
 9dz10HtylWRU0H36LcvfVZcXrw==
X-Google-Smtp-Source: ABdhPJzbjckux1/9TYQR46aUnJvqWm2ObHq4mt04h+zOw62MYHWj2Jm0iKdHSMrm7M/UzONi/mSqQw==
X-Received: by 2002:aa7:9ac4:0:b029:3c4:3e72:95fa with SMTP id
 x4-20020aa79ac40000b02903c43e7295famr1295270pfp.59.1627990458013; 
 Tue, 03 Aug 2021 04:34:18 -0700 (PDT)
Received: from anisinha-lenovo ([116.72.128.183])
 by smtp.googlemail.com with ESMTPSA id
 h24sm15533460pfn.180.2021.08.03.04.34.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:34:17 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 3 Aug 2021 17:04:00 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
In-Reply-To: <alpine.DEB.2.22.394.2107291136370.390674@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108031703560.51080@anisinha-lenovo>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210728085437-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.22.394.2107291003380.387306@anisinha-lenovo>
 <alpine.DEB.2.22.394.2107291136370.390674@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x629.google.com
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

ping ...

On Thu, 29 Jul 2021, Ani Sinha wrote:

>
>
> On Thu, 29 Jul 2021, Ani Sinha wrote:
>
> >
> >
> > On Wed, 28 Jul 2021, Michael S. Tsirkin wrote:
> >
> > > On Mon, Jul 26, 2021 at 10:27:43PM +0530, Ani Sinha wrote:
> > > > All existing code using acpi_get_i386_pci_host() checks for a non-null
> > > > return value from this function call. Instead of returning early when the value
> > > > returned is NULL, assert instead. Since there are only two possible host buses
> > > > for i386 - q35 and i440fx, a null value return from the function does not make
> > > > sense in most cases and is likely an error situation.
> > >
> > > add "on i386"?
> > >
> > > > Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
> > >
> > > This that seems inappropriate, this is not a bugfix.
> > >
> >
> > Forgot to answer this. I started this patch because I saw a gap that was
> > introduced with the above patch. In acpi_pcihp_disable_root_bus(), Julia's
> > code did not check for null return value from acpi_get_i386_pci_host().
> > See v2. Hence, I added the fixes tag. Then Igor suggested that I assert
> > instead and I also thought perhaps assertion is a better idea. Hence v3. I
> > am not conflicted after reading your argument. We should assert only when
> > a certain invariant is always respected. Otherwise we should not assert.
> > If you think acpi_get_i386_pci_host() can be called from non-i386 path as
> > well, maybe v2 approach is better.
>
> Also I should point out that at this moment, only ich9 and piix4 end up
> calling acpi_pcihp_disable_root_bus(). Hence, we are ok either way for
> now. In the future, if other archs end of calling this function, then the
> question is, do we gracefully fail by simply returning in case of null
> host bridge or do we assert? In its current form, it will ungracefully
> crash somewhere.
>
>

