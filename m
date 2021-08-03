Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDF53DEC03
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 13:36:15 +0200 (CEST)
Received: from localhost ([::1]:46982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAsiU-00068Z-Fa
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 07:36:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mAshF-0004ka-Cd
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:34:57 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:41695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mAshC-0006Z0-PP
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 07:34:56 -0400
Received: by mail-pj1-x1029.google.com with SMTP id
 q17-20020a17090a2e11b02901757deaf2c8so4308884pjd.0
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=rGxlvywmsqgjfdBGgDqAqDiKj4pLmtyn/aw+nyefOSA=;
 b=KmouhKTB30TGiDwZjFPxZYbS1N6etrXl54L6M9E4DJBPAs9563MRdjfTELN0USM4rd
 yVVbwTF9gGLDZGJBKP9k2pxNlKVsi1PpqI4GtX3SvaClIjL/DameM/19ITRt+L3BrNGu
 SRTiwY9a/qKeg30BlH5w1rRT0hecG6lctJRmlHO8Hi8bpv0gz2JsZiA+HdcIvzDGSf3U
 YGCS73j9YKknff2UHFE12x99ELfvuodg7Pnaz7dMinY0BaW7qfxZR2Z2ZQFPmVZJtI1w
 /NLKdniePKNezaVIKODEzmxTNwmW+wNwq+N8ulq4mSQFgWmbbGKRWZvOYxr0HPAKiO6X
 ZzRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=rGxlvywmsqgjfdBGgDqAqDiKj4pLmtyn/aw+nyefOSA=;
 b=quLPTUABvTHc+Wb9cFcd/pzIIChj3CvzNb3Dd5qK8ybgNzaftRcNDz8Z85N51o14qP
 HZvRI3/YCPuOmdGH4h8Gj4J0EO0fug9eKq9GzHzgrldoBRztWNZjgse0/C8bH5f3/aes
 qIKYaw3KxiOVuKpd5mX6RroD2Hb/rqc+90OPm/XBb5NwQnsBNB1wWtHXq2vCR6t8eIN/
 eWv4Vn4ZDxWyM+BijlHM7QOeWnoECGaK3mhex9vdFqKw0vc869O8U8zsE6pK+/0lkZhR
 8dNM4p7WDKNOacjQztr/xGWEqy0F5Es7BjqoPTxS3ELl/6M90La2dzmQoMv6+c/5YcSa
 HQaA==
X-Gm-Message-State: AOAM5335HFQzc+A1Gc/mydAkh75DheAQlaMXoqz/utss9x+rJppQ9l7i
 RiRRBICH35nxVwQAalahT3XNFQ==
X-Google-Smtp-Source: ABdhPJyIZDlkdQ7xZW4PQ/S6QQdEYPqyifBdbWAadDespic18nESsOKNLbh/vN8QAKiSiC0mFLwy3A==
X-Received: by 2002:a17:902:b711:b029:11e:6480:258a with SMTP id
 d17-20020a170902b711b029011e6480258amr1037457pls.41.1627990492316; 
 Tue, 03 Aug 2021 04:34:52 -0700 (PDT)
Received: from anisinha-lenovo ([116.72.128.183])
 by smtp.googlemail.com with ESMTPSA id g11sm13948680pju.13.2021.08.03.04.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 04:34:51 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Tue, 3 Aug 2021 17:04:36 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH] hw/i386/ich9: add comment explaining an argument to
 acpi_pcihp_reset call
In-Reply-To: <alpine.DEB.2.22.394.2107291843440.426350@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2108031704310.51080@anisinha-lenovo>
References: <20210727044546.246363-1-ani@anisinha.ca>
 <alpine.DEB.2.22.394.2107291843440.426350@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::1029;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1029.google.com
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ping ...

On Thu, 29 Jul 2021, Ani Sinha wrote:

> ping ...
>
> On Tue, 27 Jul 2021, Ani Sinha wrote:
>
> > acpi_pcihp_reset() call from ich9/pm_reset() passes an unconditional truth value
> > as the second argument. Added a commnet here to explain the reason why the
> > argument is being passed unconditionally.
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > ---
> >  hw/acpi/ich9.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index 778e27b659..b2e3c46075 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -281,6 +281,11 @@ static void pm_reset(void *opaque)
> >      pm->smi_en_wmask = ~0;
> >
> >      if (pm->use_acpi_hotplug_bridge) {
> > +        /*
> > +         * PCI Express root buses do not support hot-plug, for
> > +         * details see docs/pcie.txt. Hence, the second argument
> > +         * is unconditionally true.
> > +         */
> >          acpi_pcihp_reset(&pm->acpi_pci_hotplug, true);
> >      }
> >
> > --
> > 2.25.1
> >
> >
>

