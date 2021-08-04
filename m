Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D23E01E4
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:26:52 +0200 (CEST)
Received: from localhost ([::1]:44850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGv5-0004Mw-9f
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBGoV-0005mX-9i
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:20:03 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a]:38854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mBGoT-0006fp-E0
 for qemu-devel@nongnu.org; Wed, 04 Aug 2021 09:20:03 -0400
Received: by mail-pl1-x62a.google.com with SMTP id e21so2968179pla.5
 for <qemu-devel@nongnu.org>; Wed, 04 Aug 2021 06:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=cRVaCATpSYoKvUuiNpwfdUJ16KfRKFP3k+qspHupHyc=;
 b=pshHSgzogxtkneCzAqAPznHvMcLbq7jt80KGq0zQ8PgKeNqucDu5xj04SMrhEtqZyF
 8bc5KlxLZavolt54ZhnnkDiRTurIikQtTkfLJ7NNGj0E0TGejGuwxojSjBKUE8+6XlFc
 Ng0KTAU5W0GqvxNExYIpaFLmf6dcn6P1NWjVDifG1as9jwbQFUm+fibCjy1HgQpC6ucZ
 Iqar5DD/y9PmkAxgppAErKxwUQcIQxld7qgqQ25P7jV2ozk96ym6tNB77DLtd1VwCXWd
 ltXiJu/S4zvcfr+gMTe3qwrcQBF/g094Y8oCeHS6xBPvTPh8wZzj+Iat1it+QYizuK25
 oOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=cRVaCATpSYoKvUuiNpwfdUJ16KfRKFP3k+qspHupHyc=;
 b=FRqrglf/9YUzb5DeEh+lUL6rtNElDeIDFYPEMJqkRHoUL4z2rhJdT/Sq+3HeLxiswM
 /Sgpcv8L6XOIziV+8d+WQ4fA6Q4XWnz3Yr6OX6M6K0OuGD4R8AhCUGHVizSkyRzrQBgj
 kB8lpiWO1wbm2hPaazCBfcTJeb4dpP+4txXEhDkgQtMgigAcngryKw5e7q007Im6BwSv
 bfNzC6Rvv8YSCsaMesTw5/MIcg0Wfr05aRiFXSq2X7utt2lyTsVpKZTcNsOtvVOpa8ad
 u96FsVZ860o4rZ5Zf73WkPd85XSWvr88iIkKb4oxmi5KDvVlIhh+em0RwaHS2jDRcObO
 7Swg==
X-Gm-Message-State: AOAM532Fhvz7iMSJF8mlZGuovr/9h9ExnVgQC+yEYaDf16Te7rpqXe+6
 HGVPC0AI+bwokxi9i9k0pkDdpQ==
X-Google-Smtp-Source: ABdhPJzbcIz3GWMdXLaVqbMb4uVSnvH54+RpDTLB0Cy5FLm+RlWVZrT56pZdjjlPicpiCg8Zu0F89A==
X-Received: by 2002:a63:303:: with SMTP id 3mr1246573pgd.439.1628083198820;
 Wed, 04 Aug 2021 06:19:58 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.146.220])
 by smtp.googlemail.com with ESMTPSA id 20sm3767316pgg.36.2021.08.04.06.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Aug 2021 06:19:58 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 4 Aug 2021 18:49:53 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH] hw/i386/ich9: add comment explaining an argument to
 acpi_pcihp_reset call
In-Reply-To: <20210803100859-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.22.394.2108041849200.123294@anisinha-lenovo>
References: <20210727044546.246363-1-ani@anisinha.ca>
 <20210803100859-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::62a;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62a.google.com
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Tue, 3 Aug 2021, Michael S. Tsirkin wrote:

> On Tue, Jul 27, 2021 at 10:15:46AM +0530, Ani Sinha wrote:
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
>
>
> I don't see this comment as especially elluminating, sorry.

Ok fine. I do not feel strongly about this one either.

Ani

