Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D89CD54E040
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 13:52:09 +0200 (CEST)
Received: from localhost ([::1]:34426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1o2g-00037g-H2
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 07:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1nc8-0008Ot-Me
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1o1nc3-0000YO-QT
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 07:24:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655378673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSixXjbz3wTSSN2pBUb6nL/XEkzEz78qoY9j4p3B7PY=;
 b=Vflcr6+Ux8Gezq0+XpHpcC5bz12Z20MgNo0NLNXtRxJkWdGqXr6Ic0naAKkdK63LsjWuVP
 cKKQHU7Dt7No1/rVZ44WAa2TtQOjx4HcRIU0zfkh4PDosJztlGF+w93SmFKkhn4/KgTNTb
 tBuE4G471Frzb4iWLrQkmH2d49dV4fE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-KRdNOF3qOSu82vaRoBqzog-1; Thu, 16 Jun 2022 07:24:32 -0400
X-MC-Unique: KRdNOF3qOSu82vaRoBqzog-1
Received: by mail-wm1-f69.google.com with SMTP id
 l3-20020a05600c1d0300b0039c7efa2526so765609wms.3
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 04:24:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GSixXjbz3wTSSN2pBUb6nL/XEkzEz78qoY9j4p3B7PY=;
 b=TVHWoQnvGkHj+cSB/96YwpmEcLhwdkT0fIczRByIzfY31uMT8XFEOscF62BPWh/V68
 QYcRtDzDFih16smOQBTz0ppPCRhe5KHLLWkCS/1UxIPNjdTImABPRqTSgJ5TCO6nqkts
 0CYPFu10vBM+hMlzHhtH8Sm86q53XQBMAV/QdzLC3LhtXxkAJ1BZ2BSYXNjJSteb14L5
 N2By5blnibSD+Y6Ar+ApB6MtNm8DBFwVvPmSSmxZk2KRaJSDb/ssNlUk89qHQRaSf3ae
 3QgDUcTqCa9+2cy87a1ttf6FmeBlyzWJBcS93CUTGLH3FxsGXcJX7wRONyc8d0EIcVhH
 Ex5Q==
X-Gm-Message-State: AJIora/dJ1YxJWUIJNNchbIC0fx4f33OcKk6nq2bS+b2sYs5iAqNwcWN
 S8Lxhc1jDYwYIWkIihxsyccAUHcVROcA/tUPG/q79h4v1XcT7cF9n5GxmC5M4Lblm6dlEqdhOGl
 DVOEgIweXIya8YCo=
X-Received: by 2002:a05:600c:1d1c:b0:39c:7ac8:1faa with SMTP id
 l28-20020a05600c1d1c00b0039c7ac81faamr4530678wms.202.1655378671363; 
 Thu, 16 Jun 2022 04:24:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s5/1JJj4psmbkoMftm9ZP8ntGTdyLUPn0UbrEyP70DjlRhqCRBD5rFEu0hhuOz4xtxcSVFmQ==
X-Received: by 2002:a05:600c:1d1c:b0:39c:7ac8:1faa with SMTP id
 l28-20020a05600c1d1c00b0039c7ac81faamr4530649wms.202.1655378671080; 
 Thu, 16 Jun 2022 04:24:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 k17-20020a5d6e91000000b0021a39f5ba3bsm715652wrz.7.2022.06.16.04.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 04:24:30 -0700 (PDT)
Date: Thu, 16 Jun 2022 13:24:29 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Robert Hoo <robert.hu@linux.intel.com>
Cc: mst@redhat.com, xiaoguangrong.eric@gmail.com, ani@anisinha.ca,
 dan.j.williams@intel.com, jingqi.liu@intel.com, qemu-devel@nongnu.org,
 robert.hu@intel.com
Subject: Re: [QEMU PATCH v2 1/6] tests/acpi: allow SSDT changes
Message-ID: <20220616132429.502f5257@redhat.com>
In-Reply-To: <20220530034047.730356-2-robert.hu@linux.intel.com>
References: <20220530034047.730356-1-robert.hu@linux.intel.com>
 <20220530034047.730356-2-robert.hu@linux.intel.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 30 May 2022 11:40:42 +0800
Robert Hoo <robert.hu@linux.intel.com> wrote:

> Signed-off-by: Robert Hoo <robert.hu@linux.intel.com>
> Reviewed-by: Jingqi Liu <jingqi.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..eb8bae1407 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/pc/SSDT.dimmpxm",
> +"tests/data/acpi/q35/SSDT.dimmpxm",


