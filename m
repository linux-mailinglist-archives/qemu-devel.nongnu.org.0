Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8ED448DA64
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 16:03:45 +0100 (CET)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n81dg-0003wR-Ay
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 10:03:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dima.orekhov@gmail.com>)
 id 1n7wnH-00013u-IS; Thu, 13 Jan 2022 04:53:19 -0500
Received: from [2a00:1450:4864:20::12d] (port=35589
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dima.orekhov@gmail.com>)
 id 1n7wnF-0002vN-5e; Thu, 13 Jan 2022 04:53:19 -0500
Received: by mail-lf1-x12d.google.com with SMTP id g11so17592074lfu.2;
 Thu, 13 Jan 2022 01:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to;
 bh=K/HmJOdln8UIBOiVsmLC3860ldFjHvdqt8Crizf6QT8=;
 b=ZSey185JeAa2cXJxqIU3FFVaIT5wSO54q/4r9EBPgaoXjTQDHiJpldtH6g4NCdBozz
 2O/NVEFzerw8cEZU5UKVos8m/5gx2kN1uDhmY+H+nfZa7I6MBVlDqkuGZpRhkVMhgAH9
 3C48tdw6/7gTYtfz/vJ+EehDKuEZwnurw60oZs/5QGjbr0wWeV9CnzUUtgKirx/t22Rd
 pg6vsDoH6nK8C7m56XLVhmYd9w4niTosj9kLqxqFUSyv2yu6PIjsKiEnj3CIvPKzvQHh
 bOg4vlaEcQaVF7lCNivREfqeBLLHkkyCe4D9Cs4jCcqK6uWJ/gqz5Smrz2m7aaNNul18
 lAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to;
 bh=K/HmJOdln8UIBOiVsmLC3860ldFjHvdqt8Crizf6QT8=;
 b=L4hUA0a+1SR04D5wN5/o/pIfpJs04Tl5QIrzuzkHCtn6GJvCPyb1ld6CSF1/8YQ98y
 IqrYPq6+DW1kSZy3/GzGCn3XuBuZBnWPa9AATnL4dXp4w/hB4tuHDfiOuB3kVwBZcf7P
 pnks6aux1i6E9wMlwcW5xm1UHaBvB3/P1vFQRX5JSxmoJ11gEIjDtW45bN0aD03IQPxH
 QIUr8D+l6af3QOeLUQ38pxmTyqrNOO/Is/TSUScmem52C9kTzxJkKf+34LdZDru91HGl
 iXGFufr549d4fUcUR4uVl1mx9LsxA4Csgyt8zavDS/eMwm9UqyygYL9xYDLNNeo1JblF
 DA9Q==
X-Gm-Message-State: AOAM531GTCkBlhug294U3ke76LkJAvmwikK9ud7Uc+Gvr5sh3mAj/Z+l
 PwVxQjRhDXHr5xpsTkA9CF9aORs8r/3g5w==
X-Google-Smtp-Source: ABdhPJywAJP4Tg88Y/UJE11Q7gj9Z9PybjnAY6uKrDo7iYELdL+iug3Wa7QrbjWW5ZzIm7qWM7MP7Q==
X-Received: by 2002:a2e:9d08:: with SMTP id t8mr2417028lji.256.1642067592903; 
 Thu, 13 Jan 2022 01:53:12 -0800 (PST)
Received: from [192.168.0.4] ([85.140.218.44])
 by smtp.googlemail.com with ESMTPSA id c21sm239865lfi.95.2022.01.13.01.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 01:53:12 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------LnjaTFzSRax3njt0VPy0ZzKx"
Message-ID: <a98aeef0-aa94-0555-bcee-d19a79e37ad6@gmail.com>
Date: Thu, 13 Jan 2022 12:53:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/4] acpi: fix OEM ID/OEM Table ID padding
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20220112130332.1648664-1-imammedo@redhat.com>
 <20220112130332.1648664-4-imammedo@redhat.com>
From: "Dmitry V. Orekhov" <dima.orekhov@gmail.com>
In-Reply-To: <20220112130332.1648664-4-imammedo@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=dima.orekhov@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 13 Jan 2022 09:54:20 -0500
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
Cc: Ani Sinha <ani@anisinha.ca>, qemu-stable@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------LnjaTFzSRax3njt0VPy0ZzKx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/12/22 16:03, Igor Mammedov wrote:
> Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
> fields in headers of ACPI tables. While it doesn't have impact on
> default values since QEMU uses 6 and 8 characters long values
> respectively, it broke usecase where IDs are provided on QEMU CLI.
> It shouldn't affect guest (but may cause licensing verification
> issues in guest OS).
> One of the broken usecases is user supplied SLIC table with IDs
> shorter than max possible length, where [2] mangles IDs with extra
> spaces in RSDT and FADT tables whereas guest OS expects those to
> mirror the respective values of the used SLIC table.
>
> Fix it by replacing whitespace padding with '\0' padding in
> accordance with [1] and expectations of guest OS
>
> 1) ACPI spec, v2.0b
>         17.2 AML Grammar Definition
>         ...
>         //OEM ID of up to 6 characters. If the OEM ID is
>         //shorter than 6 characters, it can be terminated
>         //with a NULL character.
>
> 2)
> Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/707
> Reported-by: Dmitry V. Orekhov<dima.orekhov@gmail.com>
> Signed-off-by: Igor Mammedov<imammedo@redhat.com>
> Cc:qemu-stable@nongnu.org
> ---
>   hw/acpi/aml-build.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index b3b3310df3..65148d5b9d 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
>       build_append_int_noprefix(array, 0, 4); /* Length */
>       build_append_int_noprefix(array, desc->rev, 1); /* Revision */
>       build_append_int_noprefix(array, 0, 1); /* Checksum */
> -    build_append_padded_str(array, desc->oem_id, 6, ' '); /* OEMID */
> +    build_append_padded_str(array, desc->oem_id, 6, '\0'); /* OEMID */
>       /* OEM Table ID */
> -    build_append_padded_str(array, desc->oem_table_id, 8, ' ');
> +    build_append_padded_str(array, desc->oem_table_id, 8, '\0');
>       build_append_int_noprefix(array, 1, 4); /* OEM Revision */
>       g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
>       build_append_int_noprefix(array, 1, 4); /* Creator Revision */

I can't apply the patch to the qemu-6.1.0 source code on my own.
There is no acpi_table_begin function in the qemu-6.1.0 source code (hw/acpi/aml-buld.c).

--------------LnjaTFzSRax3njt0VPy0ZzKx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/12/22 16:03, Igor Mammedov wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220112130332.1648664-4-imammedo@redhat.com">
      <pre class="moz-quote-pre" wrap="">Commit [2] broke original '\0' padding of OEM ID and OEM Table ID
fields in headers of ACPI tables. While it doesn't have impact on
default values since QEMU uses 6 and 8 characters long values
respectively, it broke usecase where IDs are provided on QEMU CLI.
It shouldn't affect guest (but may cause licensing verification
issues in guest OS).
One of the broken usecases is user supplied SLIC table with IDs
shorter than max possible length, where [2] mangles IDs with extra
spaces in RSDT and FADT tables whereas guest OS expects those to
mirror the respective values of the used SLIC table.

Fix it by replacing whitespace padding with '\0' padding in
accordance with [1] and expectations of guest OS

1) ACPI spec, v2.0b
       17.2 AML Grammar Definition
       ...
       //OEM ID of up to 6 characters. If the OEM ID is
       //shorter than 6 characters, it can be terminated
       //with a NULL character.

2)
Fixes: 602b458201 ("acpi: Permit OEM ID and OEM table ID fields to be changed")
Resolves: <a class="moz-txt-link-freetext" href="https://gitlab.com/qemu-project/qemu/-/issues/707">https://gitlab.com/qemu-project/qemu/-/issues/707</a>
Reported-by: Dmitry V. Orekhov <a class="moz-txt-link-rfc2396E" href="mailto:dima.orekhov@gmail.com">&lt;dima.orekhov@gmail.com&gt;</a>
Signed-off-by: Igor Mammedov <a class="moz-txt-link-rfc2396E" href="mailto:imammedo@redhat.com">&lt;imammedo@redhat.com&gt;</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:qemu-stable@nongnu.org">qemu-stable@nongnu.org</a>
---
 hw/acpi/aml-build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index b3b3310df3..65148d5b9d 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1724,9 +1724,9 @@ void acpi_table_begin(AcpiTable *desc, GArray *array)
     build_append_int_noprefix(array, 0, 4); /* Length */
     build_append_int_noprefix(array, desc-&gt;rev, 1); /* Revision */
     build_append_int_noprefix(array, 0, 1); /* Checksum */
-    build_append_padded_str(array, desc-&gt;oem_id, 6, ' '); /* OEMID */
+    build_append_padded_str(array, desc-&gt;oem_id, 6, '\0'); /* OEMID */
     /* OEM Table ID */
-    build_append_padded_str(array, desc-&gt;oem_table_id, 8, ' ');
+    build_append_padded_str(array, desc-&gt;oem_table_id, 8, '\0');
     build_append_int_noprefix(array, 1, 4); /* OEM Revision */
     g_array_append_vals(array, ACPI_BUILD_APPNAME8, 4); /* Creator ID */
     build_append_int_noprefix(array, 1, 4); /* Creator Revision */
</pre>
    </blockquote>
    <pre class="bz_comment_text" id="comment_text_7">I can't apply the patch to the qemu-6.1.0 source code on my own.
There is no acpi_table_begin function in the qemu-6.1.0 source code (hw/acpi/aml-buld.c).</pre>
  </body>
</html>
--------------LnjaTFzSRax3njt0VPy0ZzKx--


