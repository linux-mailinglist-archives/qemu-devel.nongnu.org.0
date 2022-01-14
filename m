Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A461F48E979
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:52:01 +0100 (CET)
Received: from localhost ([::1]:47816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8L7g-0004yW-QU
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n8L4F-0002B7-S2
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n8L4D-0002W3-Jo
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642160904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PlWJqcqdluyCu9qi4KDq3i2QKpKWDkqlutnxxDc69xI=;
 b=OcDUtvGEqQcKN4qFW59it1SR8MiV0UjG7JCAJWVBuf2XNBu0mU6Q7ciRuDQHmjXqQFxR4x
 Gt+f+8P3h9IdZkvKt9jyyG43r68gWIYvmuaWAN8NAMIbQU6g/wQVqv1oWx9ZKJIelMwTb/
 SeMrigUJ0hUDjE9LI8A7y285LPYqzHs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-396-BneQyNR-P-2cW2IIuRn5Bg-1; Fri, 14 Jan 2022 06:48:23 -0500
X-MC-Unique: BneQyNR-P-2cW2IIuRn5Bg-1
Received: by mail-ed1-f72.google.com with SMTP id
 c8-20020a05640227c800b003fdc1684cdeso8170457ede.12
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:48:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PlWJqcqdluyCu9qi4KDq3i2QKpKWDkqlutnxxDc69xI=;
 b=PCcBALYzF93XpGSHo3a7NiW1msF4siRjr7dcE8CSkhuaC/XYQR+MVsq+BM2MbtAFPv
 aCX8H74vXRntn+udCrHC2/G0+5zOxJbx/pBXFb9gEHdXZe9btIazwLfkezYuc40aV4LX
 Kj8uhaEhQRxPPKNdCRY6oN7FpNRPmdn/tF9eUMBYMyCA/JbcFq8RRFXmaZ6uJgaY4uKu
 GZmsgoN6fHpZAleFdecm9y2USWh77Ro2dWZ7DNqumAJr/IjVTycpT60PEUD70qlTyEgt
 uJIwx6CXzr84kfrMeemeSst7bb0uG/SQn2rs/KtH0FjZXo05JBFJQJr3/9P3jUNRPFPf
 mqCg==
X-Gm-Message-State: AOAM53388SmBDJkCAuthGxLkyzaVk+OgZL4e5bDSdRXkjZ+lV5iShwSq
 1mmqSZ9Ax3sW0QYxu6JYvyYpvZ0FtPW/ZHde6uXy89Xwxcx8gUXfthH0F6KmsTCSXUWPJ0l1RR8
 2PICgyORA6XSOmaM=
X-Received: by 2002:a17:906:6a20:: with SMTP id
 qw32mr6971105ejc.724.1642160902071; 
 Fri, 14 Jan 2022 03:48:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvSqqsUVgMKwQFda9bRZ2HR3o6kMUF/9X3TawRIfJTzAMsphoHUuLmI9yOL7xR9Hc+rt87hA==
X-Received: by 2002:a17:906:6a20:: with SMTP id
 qw32mr6971085ejc.724.1642160901769; 
 Fri, 14 Jan 2022 03:48:21 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id e4sm1742435eje.103.2022.01.14.03.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 03:48:21 -0800 (PST)
Date: Fri, 14 Jan 2022 12:48:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 1/4] tests: acpi: manually pad OEM_ID/OEM_TABLE_ID for
 test_oem_fields() test
Message-ID: <20220114124820.7aa72a3a@redhat.com>
In-Reply-To: <20220112084124-mutt-send-email-mst@kernel.org>
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-2-imammedo@redhat.com>
 <20220112084124-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Marian Postevca <posteuca@mutex.one>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 08:44:19 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, Jan 12, 2022 at 08:03:29AM -0500, Igor Mammedov wrote:
> > The next commit will revert OEM fields padding with whitespace to
> > padding with '\0' as it was before [1]. As result test_oem_fields() will
> > fail due to unexpectedly smaller ID sizes read from QEMU ACPI tables.
> > 
> > Pad OEM_ID/OEM_TABLE_ID manually with spaces so that values the test
> > puts on QEMU CLI and expected values match.
> > 
> > 1) 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> That's kind of ugly in that we do not test
> shorter names then.  How about we pad with \0 instead?


test_acpi_q35_slic() should cover short OEM_TABLE_ID.

also padding in this patch makes test_oem_fields() cleaner
and simplifies 3/4, switching to \0 here would require
merging this patch with the fix itself to avoid breaking
bisection.

If you still prefer to have test_oem_fields() test short
names, I can post following on top that can to it without
breaking bisection:

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 90c9f6a0a2..0fd7cf1f89 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -71,8 +71,8 @@
 
 #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
 
-#define OEM_ID             "TEST  "
-#define OEM_TABLE_ID       "OEM     "
+#define OEM_ID             "TEST"
+#define OEM_TABLE_ID       "OEM"
 #define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
                            OEM_TABLE_ID "'"
 
@@ -1530,8 +1530,8 @@ static void test_oem_fields(test_data *data)
             continue;
         }
 
-        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
-        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
+        g_assert(strncmp((char *)sdt->aml + 10, OEM_ID, 6) == 0);
+        g_assert(strncmp((char *)sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
     }
 }
 


> And add a comment explaining why it's done.
> 
> > ---
> >  tests/qtest/bios-tables-test.c | 15 ++++++---------
> >  1 file changed, 6 insertions(+), 9 deletions(-)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index e6b72d9026..90c9f6a0a2 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -71,9 +71,10 @@
> >  
> >  #define ACPI_REBUILD_EXPECTED_AML "TEST_ACPI_REBUILD_AML"
> >  
> > -#define OEM_ID             "TEST"
> > -#define OEM_TABLE_ID       "OEM"
> > -#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
> > +#define OEM_ID             "TEST  "
> > +#define OEM_TABLE_ID       "OEM     "
> > +#define OEM_TEST_ARGS      "-machine x-oem-id='" OEM_ID "',x-oem-table-id='" \
> > +                           OEM_TABLE_ID "'"
> >  
> >  typedef struct {
> >      bool tcg_only;
> > @@ -1519,11 +1520,7 @@ static void test_acpi_q35_slic(void)
> >  static void test_oem_fields(test_data *data)
> >  {
> >      int i;
> > -    char oem_id[6];
> > -    char oem_table_id[8];
> >  
> > -    strpadcpy(oem_id, sizeof oem_id, OEM_ID, ' ');
> > -    strpadcpy(oem_table_id, sizeof oem_table_id, OEM_TABLE_ID, ' ');
> >      for (i = 0; i < data->tables->len; ++i) {
> >          AcpiSdtTable *sdt;
> >  
> > @@ -1533,8 +1530,8 @@ static void test_oem_fields(test_data *data)
> >              continue;
> >          }
> >  
> > -        g_assert(memcmp(sdt->aml + 10, oem_id, 6) == 0);
> > -        g_assert(memcmp(sdt->aml + 16, oem_table_id, 8) == 0);
> > +        g_assert(memcmp(sdt->aml + 10, OEM_ID, 6) == 0);
> > +        g_assert(memcmp(sdt->aml + 16, OEM_TABLE_ID, 8) == 0);
> >      }
> >  }
> >  
> > -- 
> > 2.31.1  
> 


