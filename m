Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 782595BF4DE
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 05:38:11 +0200 (CEST)
Received: from localhost ([::1]:60744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaqYr-0004Sk-9M
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 23:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqX9-0002mT-0m
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:36:23 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:43690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oaqX7-0003Mv-Ar
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 23:36:22 -0400
Received: by mail-pg1-x52c.google.com with SMTP id v4so4636647pgi.10
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 20:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:from:to:cc:subject:date;
 bh=XTK1AEMLeWi+QR+6ss5HmHhYJD8qrWb2RJXVIIuUrow=;
 b=7ln2HliOSWpiJswp9oRmrfmeShkVAozTJTgehOvnr7gmvNXJ6YnEltfCrrXijHaiSq
 BmI0WGalaVizYsKopcMfBJXQuaowFUCtGssGvNIYsTkFojG2pTSxViBiYPm0KoY8X+Xb
 CG+U6uJdp+ZXJ2Gv43C2PgCuTibZeU8k3gvFPU1fG/SE9u1/JrsAewdzNcFECQ0EvuR1
 A4FfUUi0hXf1SWFucs6Kx3zMQ/qarIB2n7XSX6EcTJOahR2UAO4U/IemM7qP1TfEzUfB
 /9riTOTYbyurYgre5S48DF2JAnQ3lTDYHC3H5wCjM9s6fwBr93+KYenSTSChdMOkwTVf
 0kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:date
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=XTK1AEMLeWi+QR+6ss5HmHhYJD8qrWb2RJXVIIuUrow=;
 b=c/P5sTD1gMCBHPCUBVORzrXoqWmeOM+K4YHKMrg441UkjMsLgtI5jCRQjP95D5gblo
 4Tk/YTPNnAOyeLQU+0rXNVKJUOXvp5slrtrU9kr3FvJPhaN3WOO8n1Xng5Gw46SNERfR
 SnSWsDbCTJozhArDFfLqWbBtcFiFOXIezuEZRRFtEHK4kf9TLQvhI0ExcM5kLhsOw4r/
 pg9+K1V9QMn8LLmSexpMv/Bg4I2zdW0spspDl9lJV6AvB2ab4IyV+Dlj8ZrjvQ6aPNCJ
 s4xaIk2+fTCLHn1KUM5RX8UQTGhYTS1rOkZktR2HYKNb+pe0njr2h0sbNBVWUoRPz90M
 7F8w==
X-Gm-Message-State: ACrzQf2jxG1gY4YSop9MpygVcpXb5KwGYs1AcraizQh/NOk75/Syyr4p
 sb+f73vrgZ4CBbTkS8Prn6XpdA==
X-Google-Smtp-Source: AMsMyM4I1IHRwaSK5BpAJzCInEjOqpaC+pc1vowvTnJ9VsccUFYyKDl5inmY13Qze5yVgnw+4xGCwA==
X-Received: by 2002:a63:1945:0:b0:439:d86c:3343 with SMTP id
 5-20020a631945000000b00439d86c3343mr17241373pgz.402.1663731379052; 
 Tue, 20 Sep 2022 20:36:19 -0700 (PDT)
Received: from anisinha-lenovo ([203.163.244.51])
 by smtp.googlemail.com with ESMTPSA id
 u6-20020a17090add4600b002002f9eb8c4sm729308pjv.12.2022.09.20.20.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 20:36:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 21 Sep 2022 09:06:12 +0530 (IST)
To: Miguel Luis <miguel.luis@oracle.com>
cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, mst@redhat.com, 
 imammedo@redhat.com, ani@anisinha.ca, shannon.zhaosl@gmail.com, 
 peter.maydell@linaro.org
Subject: Re: [PATCH 1/3] tests/acpi: virt: allow acpi GTDT changes
In-Reply-To: <20220920162137.75239-2-miguel.luis@oracle.com>
Message-ID: <f5da8d15-5176-ea8b-df68-9655ca10c0db@anisinha.ca>
References: <20220920162137.75239-1-miguel.luis@oracle.com>
 <20220920162137.75239-2-miguel.luis@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::52c;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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



On Tue, 20 Sep 2022, Miguel Luis wrote:

> Step 3 from bios-tables-test.c documented procedure.
>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>

Acked-by: Ani Sinha <ani@anisinha.ca>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..957bd1b4f6 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/GTDT",
> +"tests/data/acpi/virt/GTDT.memhp",
> +"tests/data/acpi/virt/GTDT.numamem",
> --
> 2.36.0
>
>

