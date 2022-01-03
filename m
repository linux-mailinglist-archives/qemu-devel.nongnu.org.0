Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A1E4830BF
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 12:53:31 +0100 (CET)
Received: from localhost ([::1]:51670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Lu6-0004K5-5o
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 06:53:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4Ls0-0002bt-D3
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:51:21 -0500
Received: from [2607:f8b0:4864:20::52f] (port=41619
 helo=mail-pg1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n4Lrx-00058Z-Vq
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 06:51:19 -0500
Received: by mail-pg1-x52f.google.com with SMTP id f8so19871949pgf.8
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 03:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=63ZFdEOtqSvg0xZjqAggJ+4KpQskQfk8HGyey34Y54A=;
 b=USj7Ot2eli294rX9yBx55eVstygJmoNtDbVRmNautaLD9A4FtvvJljaXjHLNdEIR07
 2NL69oDrx/wGlJrjEZ435ts9h4oSnoEMvrXCleWMyDnS75xdMklop4DiIaHV/zc2xGdO
 bCOm5XGPV2OW26de6YIfWHnmmeg6uZtL52meqKUttQlkkZ8LHZ6OYdElmSy142Nh4oRJ
 zuh7V0e67en32CTa5wun2OLHhUZ3qWodvUVGQluJ8DyebLH3Sic2dAKouWpaVj6HvhRj
 6SJtnIlwetyfGhtddXAGdR8+GnbXpbBqGBPzmPhnJF3HbDK6YsFmTEJGMxFk1nbZde6h
 8tKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=63ZFdEOtqSvg0xZjqAggJ+4KpQskQfk8HGyey34Y54A=;
 b=s2/y+VEvD+GfTsrp8tYMfeiflvRflxq2WHGIN+JHGGfpseU+2EAYrMzSMYBAwbRf+1
 6dK+DInZppBo8O7pPIRcFNLhsw6Hp4JBEiSxrtfNiwuK1mz4yj2zfjQTAfNInYBM3TTc
 TpqSEGkdWtTvaNMIc6sUgA+xqZq2H85pBeJpkPLQe0I+5M8PZ+U8UUh+udJEyOH61JvI
 SdQ7tPK0MfmrrHcsPs1KjQl5BMYb9tyCrG+JDxNUKlsKsw//5FQNLV7Opfwv1FzmMSOL
 NiNaqGLLSH5pA1QQ0s9BdK75aFNmT8+8fbfgUOgaQELhqQylTf9SKbQjblUTca6guoR7
 6+/g==
X-Gm-Message-State: AOAM531FE6ATyUzZkFpynH1eFiPTBTiNfWlPxxDTkrUjghvz6qIuUv4c
 vrfSKQrKblPMbVBQa6KsaOGhNA==
X-Google-Smtp-Source: ABdhPJxaZ2I3/vb8o5dl2g+s05x/XSR+HDbHscTP7TIKXe/66ebg8Kmr4+NwP+cw8iTroRQslk7U4g==
X-Received: by 2002:a05:6a00:853:b0:4bb:a8c5:873 with SMTP id
 q19-20020a056a00085300b004bba8c50873mr40374634pfk.2.1641210675178; 
 Mon, 03 Jan 2022 03:51:15 -0800 (PST)
Received: from anisinha-lenovo ([115.96.198.244])
 by smtp.googlemail.com with ESMTPSA id
 s12sm42009749pfg.148.2022.01.03.03.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 03:51:14 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Mon, 3 Jan 2022 17:21:08 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v6 5/7] tests/acpi/bios-tables-test: Allow changes to
 virt/PPTT file
In-Reply-To: <20220103084636.2496-6-wangyanan55@huawei.com>
Message-ID: <alpine.DEB.2.22.394.2201031720510.14895@anisinha-lenovo>
References: <20220103084636.2496-1-wangyanan55@huawei.com>
 <20220103084636.2496-6-wangyanan55@huawei.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::52f;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52f.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Eric Auger <eauger@redhat.com>, wanghaibin.wang@huawei.com,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Mon, 3 Jan 2022, Yanan Wang wrote:

> List test/data/acpi/virt/PPTT as the expected files allowed to
> be changed in tests/qtest/bios-tables-test-allowed-diff.h
>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..cb143a55a6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/PPTT",
> --
> 2.27.0
>
>

