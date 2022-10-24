Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E3060B389
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 19:09:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1on0GW-0006jf-6c; Mon, 24 Oct 2022 12:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1on0GQ-0006cT-Ih
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 12:25:22 -0400
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1on0GN-0001zS-Bw
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 12:25:22 -0400
X-IronPort-RemoteIP: 209.85.166.69
X-IronPort-MID: 233131376
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:2IoeI6CsPqi/7xVW/5jhw5YqxClBgxIJ4kV8jS/XYbTApDhzgWBVy
 GocXz2OMqyMZDT3fd51aYzi8EMEupLcy9ZrTANkpHpgcSl2pJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyCULOZ82QsaDhNs/jf8EkHUMna41v0gHRvPZing3eDzxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu+Tnn8iG9Y+DiDX4pZiYJVOtzAZzsAEPgfXA9JHAatfo23hc9mcU
 7yhv7TpIesiFvSkdOjwz3C0usyxVEFL0OavHJSxjSCc5x3tSUOrnfNBMG8zAKIG5KVnL0wT9
 PNNfVjhbjjb7w636LeyS+0ph8N6ace1bcUQvXZvyTyfBvEjKXzBa/+StJkIgXFp2J4IQ6e2i
 8kxMFKDaDzJZw1JNk0/Ao94keu17pX6W2cD8wvO/PFovQA/yiR97L/uDID5dufSBst5mUyJl
 m/f5FnmV0Ry2Nu3jGDtHmiXrvbCmD6+VI8MGbmQ8Plsj1uOgGsJB3UruUCTpPC4jgu/XIsaJ
 RJFvCUpqqc2+QqgSdyVswCEnUNodyU0A7J4e9DWIinTokYIy2513lQ5cwM=
IronPort-HdrOrdr: A9a23:HNRShK+KhpPZenKbp8Buk+D+I+orL9Y04lQ7vn2ZKCYlCvBw8v
 rEoB1173HJYVoqNU3I2urwXZVoOEm8yXct2+ks1NSZLWvbUQmTXfhfBOLZqlWLJ8SUzIFgPM
 lbH5SWR+eAaWSSIPyKhzWQApIL+vHC2qatnOLfx3BmQUVRbb165QsRMHf5LqQzfnghOaYE
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2022 12:25:15 -0400
Received: by mail-io1-f69.google.com with SMTP id
 y26-20020a5d9b1a000000b006bc71505e97so6713359ion.16
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 09:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OUkj68GizAw6MKOxn5P2/2vMzmgzXkuV3sm86tNq+sM=;
 b=VdCN/2ZtRyRfZw3I0KpPHCi/UqY68PXBKS4bE815GCX5Fd0vndUXVYzdRtctb45dPG
 QxyHvomYIC4fOGUkRwI04gJpeF/YSJwJY/z/j+8YSZB8aYxFcZK3Ofquc6U0N/2Ixzvb
 H4Z1RFxQffS5gZ7u9YFH941DIAjnD8HntRIhWEjxkrA016xMii7U2+KrInfDx0figUW2
 KAurtjNmT2JF8oFTS/i3YdjNg7i9jxbRhV7nw8+u8RwV+PaiG6MPNlnZabmdXsz6G+BD
 o+ex6uGy0fB6ImSb8SLKy6ZfuZSrcIPM1CPdIeBw3OjuovZjvND3XT91vmvlNFu1FpJ4
 2acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OUkj68GizAw6MKOxn5P2/2vMzmgzXkuV3sm86tNq+sM=;
 b=SiTPoGxBRBGvEl23CO1WSuKxMarvD+3Adsh0V/FWIH45V9fVALuFN2IWBPGgaOwNVX
 J0gCRd+b+aOW3qRvO8DRnkOrinYU2ZzM9nKTwVNrG5a/tpA3mrv4D3a/v8faefAVRQxO
 Tup4MbIu3eMOTiKt+zU2Gzr2GXrn/GunQjJBzhAGbcKLCsKbhKViA2s1Z7zI/ZyanEMl
 ngqyOkt3Hl1Ep4xXJXh+frf0Wma8TLlVDMclnI+EY+aNH/6b+tvozzuFaUGpp5yZ2L3a
 AYa9euag8bar+7j0B8RLXF/Cy0hn659/bMqobYxfXCbOtOP1JEijsdKVVDwn7N4YwB+D
 9IFQ==
X-Gm-Message-State: ACrzQf1oee0enIKJcjblcQd9riw1PkZbr285Lc5K3Ytg8Xlistb96mbT
 xlBagdgB2JPX/moHXsHm6VLsnvIYtDVZFYwDK0+3tUqXIYZFUafxg/4wv328lxwsutmbjYIw6PN
 KYWfaG7ttH92pS1kvS8FX0OP7gd4gLQ==
X-Received: by 2002:a05:6602:1509:b0:69b:35ba:4720 with SMTP id
 g9-20020a056602150900b0069b35ba4720mr20245995iow.155.1666628714535; 
 Mon, 24 Oct 2022 09:25:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7P3lnGm65xzsRXfL/+HKBIYg0Or2jam1zNjjf/ZkHPZYQGfPsIRQfGr7l4d1XaUE5XHRWJcQ==
X-Received: by 2002:a05:6602:1509:b0:69b:35ba:4720 with SMTP id
 g9-20020a056602150900b0069b35ba4720mr20245981iow.155.1666628714257; 
 Mon, 24 Oct 2022 09:25:14 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a026303000000b00363e4730a41sm7508321jac.175.2022.10.24.09.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 09:25:14 -0700 (PDT)
Date: Mon, 24 Oct 2022 12:24:53 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: "Christian A. Ehrhardt" <lk@c--e.de>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eric DeVolder <eric.devolder@oracle.com>,
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] hw/acpi/erst.c: Fix memory handling issues
Message-ID: <20221024162453.4cwxxam6u3s5ia7v@mozz.bu.edu>
References: <20221024100323-mutt-send-email-mst@kernel.org>
 <20221024154233.1043347-1-lk@c--e.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221024154233.1043347-1-lk@c--e.de>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 221024 1742, Christian A. Ehrhardt wrote:
> - Fix memset argument order: The second argument is
>   the value, the length goes last.
> - Fix an integer overflow reported by Alexander Bulekov.
> 
> Both issues allow the guest to overrun the host buffer
> allocated for the ERST memory device.
> 
> Cc: Eric DeVolder <eric.devolder@oracle.com
> Cc: Alexander Bulekov <alxndr@bu.edu>
> Cc: qemu-stable@nongnu.org
> Fixes: f7e26ffa590 ("ACPI ERST: support for ACPI ERST feature")
> Tested-by: Alexander Bulekov <alxndr@bu.edu>

Reviewed-by: Alexander Bulekov <alxndr@bu.edu>

> Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
> ---
>  hw/acpi/erst.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
> index df856b2669..aefcc03ad6 100644
> --- a/hw/acpi/erst.c
> +++ b/hw/acpi/erst.c
> @@ -635,7 +635,7 @@ static unsigned read_erst_record(ERSTDeviceState *s)
>          if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>              rc = STATUS_FAILED;
>          }
> -        if ((s->record_offset + record_length) > exchange_length) {
> +        if (record_length > exchange_length - s->record_offset) {
>              rc = STATUS_FAILED;
>          }
>          /* If all is ok, copy the record to the exchange buffer */
> @@ -684,7 +684,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>      if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
>          return STATUS_FAILED;
>      }
> -    if ((s->record_offset + record_length) > exchange_length) {
> +    if (record_length > exchange_length - s->record_offset) {
>          return STATUS_FAILED;
>      }
>  
> @@ -716,7 +716,7 @@ static unsigned write_erst_record(ERSTDeviceState *s)
>      if (nvram) {
>          /* Write the record into the slot */
>          memcpy(nvram, exchange, record_length);
> -        memset(nvram + record_length, exchange_length - record_length, 0xFF);
> +        memset(nvram + record_length, 0xFF, exchange_length - record_length);
>          /* If a new record, increment the record_count */
>          if (!record_found) {
>              uint32_t record_count;
> -- 
> 2.34.1
> 
> 

