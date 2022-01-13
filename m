Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7ED48D591
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:23:57 +0100 (CET)
Received: from localhost ([::1]:53596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xGt-0003JN-TA
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:23:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7xFj-0002Ct-R8
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:22:44 -0500
Received: from [2607:f8b0:4864:20::635] (port=42806
 helo=mail-pl1-x635.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1n7xFa-0007SG-E9
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:22:43 -0500
Received: by mail-pl1-x635.google.com with SMTP id t18so8937535plg.9
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 02:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=700PndZgsS1OjSA3eb2j6VxkOaBFCxfmKGpAPF08QGc=;
 b=bNuEO9KPM6FE1djm0PP6SYoxw3K5Z6QpmARdD35HJoe8PPuyzcX1KbuRoGCJpYjcuI
 CW9LQPefNMjJXZ9HVRp8goiWQNEObqUxaOhx2d+SnAa9ak4BoDDcZ/NHmP7Y6iI+1Bov
 F4hDG5M0P0i4vi4za2yKTk7pazK5pjt5MqdsH3r5LYtBzpKroe5TfAfhu4UyuZNl61hV
 SI435UBtjgR6P4hfoReMZLxys0yN7c7Zha86kTJM0Hj4EzhkCmGVj+KrJFdF/lNpmusS
 ri+BO8t5uRz2WYqLPji/ZNfvDxoI2NK4l7JAqA+emsftIHINAuLMCkFkWtxLsHf3LLIr
 tzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=700PndZgsS1OjSA3eb2j6VxkOaBFCxfmKGpAPF08QGc=;
 b=skqKrvSNoZGoiJ3pwMo6Jg6DZyYcLCGJ+s0Tt+U+Z/A3kqZ12UnxJ17tKxVAsbM1MA
 01vo5E/9b+AvyEs91Ov8jocFdG479XanWkvJP4+Gkf6mYBZGyOiNKJSOmyLR6WHVgCkz
 HHvhrctlfQGNj7EQOlDV1zUvQuZW0AHFEhJ5hQmAcyfMAT/XDWK46TVoc4xUzQNbwmF2
 iBh3TCzkQ821fYrxLfcOidpy/6MS78VbGuKhU/wvjCiYEqz5WCpYCcbT3Tlwy3xZN1V8
 /MV7UWaXZvDZ5ruFEY8CGqL935DV1XguF1CE0zXggrv6/hs9YwSWoYYlkVNavBI2TJy8
 hgew==
X-Gm-Message-State: AOAM533aZ3rp1tdK4C9g05GKZ1AgqC8o4jsTNjVd3BX6OMFct9gtD3aM
 3hQ0oOziqiZPgkyqYfUo5J98Ig==
X-Google-Smtp-Source: ABdhPJzeftEC4/t23dKWqldJrDLoSOSy5atQ8EEM5+dIJeRJZ4WnHx3bwmCNtoUqnQslOMPRiIhPRQ==
X-Received: by 2002:a17:902:6949:b0:14a:752c:58f2 with SMTP id
 k9-20020a170902694900b0014a752c58f2mr3736133plt.159.1642069351992; 
 Thu, 13 Jan 2022 02:22:31 -0800 (PST)
Received: from [10.7.18.10] ([84.252.93.9])
 by smtp.googlemail.com with ESMTPSA id n26sm1942053pgb.91.2022.01.13.02.22.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jan 2022 02:22:31 -0800 (PST)
Date: Thu, 13 Jan 2022 15:52:25 +0530 (IST)
From: Ani Sinha <ani@anisinha.ca>
X-X-Sender: ani@athabasca.local
To: "Dmitry V. Orekhov" <dima.orekhov@gmail.com>
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
In-Reply-To: <a98aeef0-aa94-0555-bcee-d19a79e37ad6@gmail.com>
Message-ID: <alpine.OSX.2.20.2201131550280.66766@athabasca.local>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
 <a98aeef0-aa94-0555-bcee-d19a79e37ad6@gmail.com>
User-Agent: Alpine 2.20 (OSX 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::635
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x635.google.com
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
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 13 Jan 2022, Dmitry V. Orekhov wrote:
> I can't apply the patch to the qemu-6.1.0 source code on my own.
> There is no acpi_table_begin function in the qemu-6.1.0 source code
> (hw/acpi/aml-buld.c).
>
Try the following patch :

From 10620c384bf05f0a7561c1afd0ec8ad5af9b7c0f Mon Sep 17 00:00:00 2001
From: Ani Sinha <ani@anisinha.ca>
Date: Thu, 13 Jan 2022 15:48:16 +0530
Subject: [PATCH] acpi: fix OEM ID/OEM Table ID padding for qemu 6.1.1

Replace whitespace padding with '\0' padding in accordance with spec
and expectations of guest OS.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/aml-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index d5103e6..0df053c 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1703,9 +1703,9 @@ build_header(BIOSLinker *linker, GArray *table_data,
     h->length = cpu_to_le32(len);
     h->revision = rev;

-    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, ' ');
+    strpadcpy((char *)h->oem_id, sizeof h->oem_id, oem_id, '\0');
     strpadcpy((char *)h->oem_table_id, sizeof h->oem_table_id,
-              oem_table_id, ' ');
+              oem_table_id, '\0');

     h->oem_revision = cpu_to_le32(1);
     memcpy(h->asl_compiler_id, ACPI_BUILD_APPNAME8, 4);
-- 
2.6.3


