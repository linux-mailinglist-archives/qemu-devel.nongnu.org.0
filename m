Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D58047DF80
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 08:22:26 +0100 (CET)
Received: from localhost ([::1]:34750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0IQj-0008Kh-If
	for lists+qemu-devel@lfdr.de; Thu, 23 Dec 2021 02:22:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IK7-00069X-Uo
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:15:35 -0500
Received: from [2607:f8b0:4864:20::42a] (port=46927
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n0IK6-00045W-Gc
 for qemu-devel@nongnu.org; Thu, 23 Dec 2021 02:15:35 -0500
Received: by mail-pf1-x42a.google.com with SMTP id t123so4466519pfc.13
 for <qemu-devel@nongnu.org>; Wed, 22 Dec 2021 23:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=2rrFFU/aSesNQoYTp23MWcpBh1oZPuzzTljAHMB8xPQ=;
 b=SFNT4NBJp4oFg/oATZ1DuQwH1+eeHzCqmVC4lG5gX8tgWcRmwayb1ONVt7aMu1Ctwf
 tpz5DyhKSBbtXlR2JJentndhfwpVxuabvkg77VIzGfw59UA1rVn8stcjlG6qg0jCgAD1
 UmsueG0ZhpKHIy3zw2SC1stlkdB8/oocQgThZqfV4sgXlXLvbJIVDbR+GqHfGLCsMgqy
 XwEMGIPrxjksfzWZUS8wBLKnNtU6g9OObGz6MLLWazvbN4J0RO4K3fbZjLYO2fUlGvZs
 /Sbo5nREZqbfREAmS5ZvMUQn6j+OMaHNPjA5wpf048u3NiZf4kahsvaNnaxELMQs4vVs
 bhKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=2rrFFU/aSesNQoYTp23MWcpBh1oZPuzzTljAHMB8xPQ=;
 b=No92YDJmKTyAbUFLWR8gxwqItcnot2FNqaDtc8vcDh0bnZbg+lLNmzPjQDpK0j5ykP
 gIKYMHSq0JcATEB3DU8LZSfsNjGQzZAWGYD8Mr3R2RIA33FcmoPxHLqikw96ci4a4tRz
 FUYwObgucVoyBBLsuXSrBIC5vYsCvscWID7abSCGOUmL1h83VAgFVWA+MAdgB7gNKlzm
 qhfe8hdl7if1gCKs3xE1JNuWi8Y+Tv45bxy+5mOuAp/NdwrINnn/JSgguHbSaHayXek0
 MGG8Mlihfy7ZulJPLJBE8sEpCLKZqE1QactM/DqbPwWdkB5/8mM8cPUypHMf1/807QM/
 6msg==
X-Gm-Message-State: AOAM532UY+B3ZKan1n9NPbDgRGv7RjKpIE82MFILizrNF4vKe2rhFPrl
 PN4A8mYgARNFIhHfbbwJ4e91bQ==
X-Google-Smtp-Source: ABdhPJxgddofHncIbZNJ+th9/5ZgUD3TWhIVkbpk4+a7h5+202bT+qr8OZ015Be+gUP3ErQ4C0Xgow==
X-Received: by 2002:a05:6a00:d64:b0:4ba:cb6f:87e0 with SMTP id
 n36-20020a056a000d6400b004bacb6f87e0mr1244908pfv.72.1640243733230; 
 Wed, 22 Dec 2021 23:15:33 -0800 (PST)
Received: from [192.168.1.7] ([115.96.109.44])
 by smtp.googlemail.com with ESMTPSA id mh3sm8973806pjb.26.2021.12.22.23.15.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 Dec 2021 23:15:32 -0800 (PST)
Date: Thu, 23 Dec 2021 12:45:27 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 1/3] tests: acpi: prepare for updated TPM related tables
In-Reply-To: <20211223022310.575496-2-stefanb@linux.ibm.com>
Message-ID: <alpine.OSX.2.20.2112231245120.2839@athabasca.local>
References: <20211223022310.575496-1-stefanb@linux.ibm.com>
 <20211223022310.575496-2-stefanb@linux.ibm.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42a.google.com
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
Cc: marcandre.lureau@redhat.com, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Wed, 22 Dec 2021, Stefan Berger wrote:

> Replace existing TPM related tables, that are about to change, with
> empty files.
>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Ani Sinha <ani@anisinha.ca>
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> Message-id: 20211110133559.3370990-2-stefanb@linux.ibm.com
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..5d80e408d4 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/q35/DSDT.tis.tpm12",
> +"tests/data/acpi/q35/DSDT.tis.tpm2",
> --
> 2.31.1
>
>

