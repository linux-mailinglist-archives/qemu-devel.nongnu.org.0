Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36037AB49
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:03:18 +0200 (CEST)
Received: from localhost ([::1]:47734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgUqr-0007wr-27
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUlE-0001er-Rr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:57:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgUlA-00030V-Aw
 for qemu-devel@nongnu.org; Tue, 11 May 2021 11:57:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620748643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lIgcljXV9ZKB4Fe5KupzLEDFWLSpvBRSQiUeKegIsdI=;
 b=Ht0plT05fL/NR+Q65y2zvqToCC1Tvuvvb2W+vo9gt/MW5VJcSePhyb5yEQARA4CitHL3Kd
 vy6LeDphnSeVC2dr68eCcR/KqNtlG3QEi3SLK5Hs+XJWecCq4atR0Jb+ySMGDZBpMOxeOr
 cg0dySg58+K0P0E1//U7IW3yex0u62A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-JJa1x0dKOZSSzYxAL4LaLQ-1; Tue, 11 May 2021 11:57:21 -0400
X-MC-Unique: JJa1x0dKOZSSzYxAL4LaLQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so8852973wrm.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 08:57:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lIgcljXV9ZKB4Fe5KupzLEDFWLSpvBRSQiUeKegIsdI=;
 b=B4/uXZY2SVaEIFIUGnjDFbbpJQGkzIwyj3rPHrfn3CMIcDld48lCi38OA15zhGqovf
 WaoBEk48fi6SRdXBct4heRqCrzQGSIVCY+ikEOnTP0OzJaQNJlDpmQItYaIH8dTt608j
 VgZHWs2odtWHR1sAgS4d59FNX7lIYFKES9z3VVie4SISAGnH+enmMuuQ/y+TKmJq4khC
 7FGxSNFFDDnjwSzWNK/6yRHq+O/kh6AUwDw4Hs8uZAwzhQ2IH1gY9cnGvemXtj0hhAfx
 DbYh9x6D5UzgOjMPh36u/2Cr7nJkyK96WBhKB6zm+eg+XqfgC4sIrYBM0Runt5FBvZqw
 uf5g==
X-Gm-Message-State: AOAM531aVWj8fHzRgv1KExxfocpz+gh6uEPdDJ+U1YYzMxDa5riYTEdk
 xdJ2u0rG+HrMvTxjSkWhxV567nSy0pgoyQLNYRFneWqxw+eoLw/QeSWNYGzT7aeFqhB+1SsUQH2
 wFKB6zTLyYZdWSOY=
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr32286460wmh.56.1620748638597; 
 Tue, 11 May 2021 08:57:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7ekZkwJkTrpSvBf/C6j016ekHrqKv1qs/V7wmASY3g72JAAhxWWClbiu9y5DtwxJ209Xf1w==
X-Received: by 2002:a1c:21d7:: with SMTP id h206mr32286437wmh.56.1620748638336; 
 Tue, 11 May 2021 08:57:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b7sm27862790wri.83.2021.05.11.08.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 08:57:17 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] buildsys: Do not use internal fdt library when
 asked for the system one
To: qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ed80da42-74e1-d112-5cd2-8c7456ce6e4b@redhat.com>
Date: Tue, 11 May 2021 17:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 5:53 PM, Philippe Mathieu-Daudé wrote:
> Attempt to fix the issue reported by John when building
> with an outdated libfdt.

Unencoded version of this cover:

For now it changes:

  hw/ppc/spapr_hcall.c: In function ‘h_update_dt’:
  hw/ppc/spapr_hcall.c:1966:9: warning: implicit declaration of function
‘fdt_check_full’; did you mean ‘fdt_check_header’?
[-Wimplicit-function-declaration]
   1966 |     if (fdt_check_full(fdt, cb)) {
        |         ^~~~~~~~~~~~~~
        |         fdt_check_header
  hw/ppc/spapr_hcall.c:1966:9: warning: nested extern declaration of
‘fdt_check_full’ [-Wnested-externs]
  [...]
  /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/hw_ppc_spapr_hcall.c.o: in
function `h_update_dt':
  hw/ppc/spapr_hcall.c:1966: undefined reference to `fdt_check_full'
  collect2: error: ld returned 1 exit status

by:

  qemu/meson.build:1352:4: ERROR: Running configure command failed.
  The following clauses were found for PSERIES

    CONFIG_PSERIES=y
    config PSERIES depends on FDT

which is not better, but one step at a time...

John said: https://gitlab.com/qemu-project/qemu/-/issues/255#note_572421108

  Distributions usually don't used embedded copies of libraries,
  so the configure script should require the correct minimum version.

Personally I'd rather allow users to build the most of QEMU with what is
available, that is all possible machines except pSeries, making pSeries
machine selected by default and deselected if not possible, with this
change:

-- >8 --
diff --git a/default-configs/devices/ppc64-softmmu.mak
b/default-configs/devices/ppc64-softmmu.mak
index cca52665d90..62339661fca 100644
--- a/default-configs/devices/ppc64-softmmu.mak
+++ b/default-configs/devices/ppc64-softmmu.mak
@@ -5,6 +5,3 @@ include ppc-softmmu.mak

 # For PowerNV
 CONFIG_POWERNV=y
-
-# For pSeries
-CONFIG_PSERIES=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 3935b73456f..706debd4fee 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -1,5 +1,6 @@
 config PSERIES
     bool
+    default y
     depends on FDT
     imply PCI_DEVICES
     imply TEST_DEVICES
---

But I suppose it breaks user expectations.

Thoughts?

;)


