Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC61F648D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jun 2020 11:19:56 +0200 (CEST)
Received: from localhost ([::1]:41904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jjJNL-0008Gt-It
	for lists+qemu-devel@lfdr.de; Thu, 11 Jun 2020 05:19:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjJMS-0007nR-Iv
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 05:19:00 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:20893
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jjJMR-00025s-Tu
 for qemu-devel@nongnu.org; Thu, 11 Jun 2020 05:19:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591867138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZPrm3cl7admQpiBRpdK1penV5q335GTbrJUgsfPP69o=;
 b=aXWEwMzIFdxOMTIXtXB2DvsRnVVpUPSZvz5FLuOc3wSXygjLVXLeBdfGy001wgNkEGlPpV
 rvrRgRMVY38a4hodXwMUXeJ5YsR1+Spz1ai9G0JaKrVTbeJyFaUuHK9mrokjx8jOwrT34P
 HjOf15Wb6xr4bYx+1VE0G8de3TYV/kQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-irRxrzfKMauYmFddZtwcdw-1; Thu, 11 Jun 2020 05:18:56 -0400
X-MC-Unique: irRxrzfKMauYmFddZtwcdw-1
Received: by mail-wm1-f72.google.com with SMTP id a18so896139wmm.3
 for <qemu-devel@nongnu.org>; Thu, 11 Jun 2020 02:18:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZPrm3cl7admQpiBRpdK1penV5q335GTbrJUgsfPP69o=;
 b=um6eu5tmXYtZcmsE4nciPGKe4IHycDut8fEr767z4bHC0g/kK35Li3YE5OSDdfcaTa
 7Bedvmpb8ryYIcSRjOjgN9IcHi0Vqfkp52oI13dbl6cmH4k/0gMweZSPKRfE3cqKNzGk
 XyP4qnpEdd2ktOjkCkSZPvX8aaVmqwPFOZmYXsbmWaaEoXHgxQNyLCn3ut8O35JwwgNm
 /3ijWg//Uz+rilM19ZC2Ct8mAxKJZCDYfcts5hG4xSyQQHyn5wwVqNJOmQSJtaJtwjam
 nAWloqVm55qry3vorzZpM/pzc/DCqk9GoBiAviofTT1RJlhUgMXF05SfjdB08CtLygI1
 MgeA==
X-Gm-Message-State: AOAM530VDxSIp9TM4WvHl8i6TM1SyKGtXjuxzlvtxjBDdhFlkr9EnKIQ
 I7IZ7EK+uz4eJ3mIcjtnWkShc8+QRyF7pDDLumkK94N/XT20BX06RSkDZxVaJGCyLz8vdK0d8v2
 XmBuSGm9ZRtEgd4s=
X-Received: by 2002:a5d:54c3:: with SMTP id x3mr8266238wrv.312.1591867135502; 
 Thu, 11 Jun 2020 02:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0iWMk6/fl5/hw32zWpOWAKIjjptIRmmLkqebAoWCfbQzjez5K9SFuh8bhSnZHTJ5D4o7vOQ==
X-Received: by 2002:a5d:54c3:: with SMTP id x3mr8266213wrv.312.1591867135288; 
 Thu, 11 Jun 2020 02:18:55 -0700 (PDT)
Received: from redhat.com (bzq-79-181-55-232.red.bezeqint.net. [79.181.55.232])
 by smtp.gmail.com with ESMTPSA id l17sm4060295wrq.17.2020.06.11.02.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 02:18:54 -0700 (PDT)
Date: Thu, 11 Jun 2020 05:18:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v8 01/10] qtest: allow DSDT acpi table changes
Message-ID: <20200611051318-mutt-send-email-mst@kernel.org>
References: <20200611072919.16638-1-kraxel@redhat.com>
 <20200611072919.16638-2-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200611072919.16638-2-kraxel@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/11 03:29:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 11, 2020 at 09:29:10AM +0200, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

OK, thanks! What is still missing is resulting ASL
differences in the expected files for reviewers.
See ./tests/qtest/bios-tables-test.c step 7.

I'm working on a tool that will show the changes
more easily so they can be included with each
change, but that will do for now.

Thanks and sorry about all the bureaucracy.

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..6a052c50447a 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,18 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/DSDT",
> +"tests/data/acpi/pc/DSDT.acpihmat",
> +"tests/data/acpi/pc/DSDT.bridge",
> +"tests/data/acpi/pc/DSDT.cphp",
> +"tests/data/acpi/pc/DSDT.dimmpxm",
> +"tests/data/acpi/pc/DSDT.ipmikcs",
> +"tests/data/acpi/pc/DSDT.memhp",
> +"tests/data/acpi/pc/DSDT.numamem",
> +"tests/data/acpi/q35/DSDT",
> +"tests/data/acpi/q35/DSDT.acpihmat",
> +"tests/data/acpi/q35/DSDT.bridge",
> +"tests/data/acpi/q35/DSDT.cphp",
> +"tests/data/acpi/q35/DSDT.dimmpxm",
> +"tests/data/acpi/q35/DSDT.ipmibt",
> +"tests/data/acpi/q35/DSDT.memhp",
> +"tests/data/acpi/q35/DSDT.mmio64",
> +"tests/data/acpi/q35/DSDT.numamem",
> -- 
> 2.18.4


