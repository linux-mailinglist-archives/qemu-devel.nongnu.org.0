Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878584723D1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:31:02 +0100 (CET)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwhfh-000215-4t
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:31:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhdd-0000eC-Gj
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:28:53 -0500
Received: from [2a00:1450:4864:20::32e] (port=47030
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mwhdb-0002Zc-DL
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:28:52 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso11123805wmr.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TbRclA0JRK5WACnWqXlQkHSiMsRTyVH7r+/VtpofiJ8=;
 b=SZUeUuwosDn7kPJSeQ/FIMdHjbCAOrimUj4S29RlTrd2I0o7e4NCs0OjoHY75Km2dY
 n7pbs7pM47YISRa6eVolvWNTMir1MG5tf4QEpNv8t0AwIjIZ0nmAF9swoiuFx8sAZrjA
 z0x+vWX9pukSH+sbS2rO+hteQQ/BJlTZVKZGvNiugA3CObUIThqR+1N5fF4I5rtttmc8
 mYnOEEQZcbX7QkChaGZTA/TEUkKq5Bxlwjuozdljfh67hOW5CC2rLP9kSWFMMgmTjg5c
 DUrlfeFF8JS2ol9VtfbuHi4Bce8RWN+56H2DtsTy3gLNOjbgrF2GspmcbPPY4pT1tgRA
 u+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TbRclA0JRK5WACnWqXlQkHSiMsRTyVH7r+/VtpofiJ8=;
 b=Y2miASOzExAjP4FeNf7Jvvy9J1zUK31aT62MyzvLJ1EyyYdlKHFNXwjyrWB6L8ND3a
 E14ZR0w3Z0rgjlHBQbQBLX9U+BYHlvWhncQd/gavCej0CF4DEjO6JzQNEBSq7knoyLb3
 Qy/TFlZg4AmkueActRuiw0CUke8hP2SzZHkYWm6DsRneRv6Risvk+BwQMGNIa1+x9RhJ
 WPFtDLzMMACtECrJ68I/zPVPOWqrMfZLGjLTJN0DxaQxt7pMNjGeuZOoaEn/YvWLTv3/
 TsajoluYC6OSxPLVViG2LDLsurgvF0uIqU3nRWVR2SjljzzgDu6x9DgVzhKRGx9CYwNS
 QxFQ==
X-Gm-Message-State: AOAM532ZaFshzPg9xauRpDcKWWqPUw173D8UYeBpO51TP3Z1q0hQEnRh
 1ovIMB5UWw3HaStdkQd2tCEQVA==
X-Google-Smtp-Source: ABdhPJy4/CWZ1faefNpgBtfkqDEHI7+Nck+c1U4BBucVFazjnkmm6OlJjIr5mq5Lvrhwh88jujIQ4Q==
X-Received: by 2002:a05:600c:1d0e:: with SMTP id
 l14mr35262827wms.64.1639387727452; 
 Mon, 13 Dec 2021 01:28:47 -0800 (PST)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id r11sm10267146wrw.5.2021.12.13.01.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 01:28:46 -0800 (PST)
Date: Mon, 13 Dec 2021 09:28:25 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [PATCH v7 0/8] virtio-iommu: Add ACPI support (Arm part + tests)
Message-ID: <YbcSOcEy//0DSMtL@myrica>
References: <20211210170415.583179-1-jean-philippe@linaro.org>
 <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwxxRfOPbVU+QcYOkGL_pemLWH5x9z9pnhMgKoKOkAgSxw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Dec 12, 2021 at 10:19:47AM +0530, Ani Sinha wrote:
> On Fri, Dec 10, 2021 at 10:35 PM Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > Add ACPI support for virtio-iommu on the virt machine, by instantiating
> > a VIOT table. Also add the tests for the ACPI table.
> >
> > Since last posting [1], I rebased onto v6.2.0-rc4. Note that v6 of this
> > series [2] only contained the table and x86 support, which have been
> > merged. Everything has now been reviewed and should be good to go.
> >
> > * Patches 1-2 add the VIOT table for the virt machine
> > * Patches 3-4 are minor fixes
> > * Patches 5-8 add tests for the VIOT table. They contain the tests for
> >   q35 as well, which didn't make it last time because they depended on
> >   another fix that has now been merged.
> 
> I believe the entire patchset has been reviewed and you are re-sending
> it so that it gets pulled in after the release?

Yes

Thanks,
Jean


