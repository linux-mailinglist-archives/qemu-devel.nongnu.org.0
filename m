Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3C148C76B
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 16:41:00 +0100 (CET)
Received: from localhost ([::1]:52610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7fkA-0008PF-8h
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 10:40:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fMP-0003j4-EE
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:16:25 -0500
Received: from [2607:f8b0:4864:20::1031] (port=44847
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7fMN-00009J-E1
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 10:16:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 n30-20020a17090a5aa100b001b2b6509685so5282680pji.3
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 07:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=QoiLayZg1TEyTnAOEUyMVhBONnMd4OxxDG8g32CdQss=;
 b=2LUZPGcWJtZdDZHvDx4e5hzIG5N9CmMe2h7kjlee/eVCARbf9CVKJJCyEbUMM6Hv+u
 95mUN4+zmZOMwnuRxe74lwh/YYLkJ94hH48QE7EG9NlDnXN+XWQR4/9QXOeFF/oCZf6k
 7dgZkWG7DPI/Xa7GJOZYEZlCzKySrSYe2I6tf/g+AyA9PB33a8KKJ9/gm5fFSkTJNFCT
 xvZQfM7ufir4Evb+GUVz3GI4pXXz7RwCbmgsL5oCI6W7/mXxi16hIJ2x9SJHl2dmxmzd
 42y/lf1RzS9sYelnJL2szI0Qfp5xI473VqOIvljUFozPR3j8I2trG6JRATBR05HftqW3
 wHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=QoiLayZg1TEyTnAOEUyMVhBONnMd4OxxDG8g32CdQss=;
 b=czY+2gm6P2cMELx6SoYoG3t5Ocs4G/38M0YFYPSNzDU1SFr8FNorwaMuoBFhyru+FF
 dyty+ifMH7dneDsscC1uS39mRZhkAoGscAf0fpGpfA+KD0LtnEQmd/Q0Saavz7BCyMoC
 bBHpHbR+eek/a0aFu36iTd38UVaYi7amQtKbR+xW4ucnzo1tBeWS5iS/xKd6xHAWQic0
 2mp+ZEjsMk52T5DnJNcU8CA3px5RFhhn3rgRmstSZagUpzWSvLTkI6Qyzs+d0OvuiEjI
 i30+ZB5iV1/nzqDL44Nzr5PumEZowQYfqdPvboRCZu7gvQoYKNXRIQX/9rf4QXfG6bD+
 SoVQ==
X-Gm-Message-State: AOAM5337qy1eVoqFDb/axjWO0mTS0Zc3m6F0rgvUJPNJhmqjtgFe7Y30
 vf0eSCe+jqdjUyF1fUneRCa62g==
X-Google-Smtp-Source: ABdhPJwjK1DCty5ghW1HSYqWqei3OMMFcm7wXL5nVy3Au8rnFAqw9skkYbQHrYA6F2sJYjgGX6i/DA==
X-Received: by 2002:a17:902:e74a:b0:14a:3b22:5ca5 with SMTP id
 p10-20020a170902e74a00b0014a3b225ca5mr9972599plf.96.1642000581855; 
 Wed, 12 Jan 2022 07:16:21 -0800 (PST)
Received: from [10.6.18.10] ([84.252.93.8])
 by smtp.googlemail.com with ESMTPSA id b4sm6071933pjh.44.2022.01.12.07.16.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Jan 2022 07:16:21 -0800 (PST)
Date: Wed, 12 Jan 2022 20:46:16 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <20220112083938-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.OSX.2.20.2201122045140.60839@athabasca.local>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <20220112083938-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, "Dmitry V . Orekhov" <dima.orekhov@gmail.com>,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 12 Jan 2022, Michael S. Tsirkin wrote:

> On Wed, Jan 12, 2022 at 08:03:31AM -0500, Igor Mammedov wrote:
> > Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> > fields in headers of ACPI tables. While it doesn't have impact on
> > default values since QEMU uses 6 and 8 characters long values
> > respectively, it broke usecase where IDs are provided on QEMU CLI.
> > It shouldn't affect guest (but may cause licensing verification
> > issues in guest OS).
> > One of the broken usecases is user supplied SLIC table with IDs
> > shorter than max possible length, where [2] mangles IDs with extra
> > spaces in RSDT and FADT tables whereas guest OS expects those to
> > mirror the respective values of the used SLIC table.
> >
> > Fix it by replacing whitespace padding with '\0' padding in
> > accordance with [1] and expectations of guest OS
> >
> > 1) ACPI spec, v2.0b
> >        17.2 AML Grammar Definition
> >        ...
> >        //OEM ID of up to 6 characters. If the OEM ID is
> >        //shorter than 6 characters, it can be terminated
> >        //with a NULL character.
> >
> > 2)
> > Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
>
>
> and add:
>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/707

He did that already with the "Resolves:" line below.
>
> ?
>
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/707
> > Reported-by: Dmitry V. Orekhov <dima.orekhov@gmail.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Cc: qemu-stable@nongnu.org
> > ---
> >  hw/acpi/aml-build.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> > index b3b3310df3..65148d5b9d 100644
> > --- a/hw/acpi/aml-build.c
> > +++ b/hw/acpi/aml-build.c
> > @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
> >      build_append_int_noprefix(array, 0, 4); /* Length */
> >      build_append_int_noprefix(array, desc->rev, 1); /* Revision */
> >      build_append_int_noprefix(array, 0, 1); /* Checksum */
> > -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> > +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
> >      /* OEM Table ID */
> > -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> > +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
> >      build_append_int_noprefix(array, 1, 4); /* OEM Revision */
> >      g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
> >      build_append_int_noprefix(array, 1, 4); /* Creator Revision */
> > --
> > 2.31.1
>
>

