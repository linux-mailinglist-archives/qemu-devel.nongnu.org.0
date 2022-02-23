Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965DA4C185B
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 17:18:37 +0100 (CET)
Received: from localhost ([::1]:39348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMuLc-0000Dq-6m
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 11:18:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMuIi-0007mn-QC
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:15:36 -0500
Received: from [2607:f8b0:4864:20::436] (port=47036
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMuIg-00068r-Ld
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 11:15:36 -0500
Received: by mail-pf1-x436.google.com with SMTP id i21so15762490pfd.13
 for <qemu-devel@nongnu.org>; Wed, 23 Feb 2022 08:15:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=rHD0uA5h/ZI8RcIC7Z+cBe/FhPFaff0CVsDFIJp9VK8=;
 b=XTLdOLkSg5O8fFJMdMBHcqiZj0gao4ABOTGPY2HQuQH1rTFZ2XcB8DuIx505wPaG9p
 RGG7ZeboGU5WEht2VyDHv1C7RiI7Ca+tZkb3qdjpW8Gld3LRSBhTDB1QXpY4ZgPG1jnZ
 9qZDrv8QyXhE5DiGVLFVh32z0wC7APRzh09JJDYZb69Ep2HnXfpqtAq9o1sGLsz0Ephq
 FjSXHltWJ50REwHVuoTWKGZ3fuxwts3j5BS7MFklZ77wqqXwxRRBUNXDSAYBLGEKvUqf
 YY//4huofGktr6Nn//O5TBbnOX+omqxZmK9ebk9UX0UzFQfN8T1kSKV/oUnHwAX2FMtS
 3dXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rHD0uA5h/ZI8RcIC7Z+cBe/FhPFaff0CVsDFIJp9VK8=;
 b=Gk4K27PBhq00r3uiV2gDOMfEx/i7bm7vnAS0NjO4IfbEEqc9yoz8l5EF19djd13aO0
 juKlIm4RLP4XS1Wr9XEw706khdeMcv6c5id18/6NNsgoTdxQn6RxUrh3abtB/KOJC7J1
 JsZtVV4876JlCqaMVVPCFzPDgZDFthBhEmW469dc//cYQ9JScwFwAtgyWcCDx69Lgtqv
 G4U9EQE74tBFqCRwPPsv6fVK78+0zR0LRcP7DOpk9fKAXfnltVbtskCksXIOyxWsKaaM
 017G5irtGtU4E+Buet3F427+9DzocxORPiDv+mDwFc1mHwHJyABEu3UocAdQc7gf6fs7
 pIdQ==
X-Gm-Message-State: AOAM531cb4mJIpB4ii5ZLujDYq7cAsFxpE+7bzILt1x0ct0t5uGsgNs3
 Wx3SkVyaoHt/p37/CBlpXfk=
X-Google-Smtp-Source: ABdhPJyXj2jRc8phTBqj+m+2jEFAadVd1e8qCM9QooJzkVQ+8RXA9WRveDxCHfkvvllO0eSRjrix3w==
X-Received: by 2002:a63:ec13:0:b0:373:aa37:193b with SMTP id
 j19-20020a63ec13000000b00373aa37193bmr202013pgh.535.1645632929733; 
 Wed, 23 Feb 2022 08:15:29 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id d18sm22454856pfv.204.2022.02.23.08.15.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 08:15:29 -0800 (PST)
Message-ID: <c91392a4-f75b-4e5d-9e6c-04777fb7ca79@gmail.com>
Date: Wed, 23 Feb 2022 17:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Fix a potential memory leak bug in write_boot_rom() (v6.2.0).
Content-Language: en-US
To: wliang@stu.xidian.edu.cn, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <6e7748f1.25d8.17f2705c420.Coremail.wliang@stu.xidian.edu.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <6e7748f1.25d8.17f2705c420.Coremail.wliang@stu.xidian.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 23/2/22 15:39, wliang@stu.xidian.edu.cn wrote:
> Hi all,
> 
> I find a memory leak bug in QEMU 6.2.0, which is in 
> write_boot_rom()(./hw/arm/aspeed.c).
> 
> Specifically, at line 276, a memory chunk is allocated with g_new0() and 
> assigned to the variable 'storage'. However, if the branch takes true at 
> line 277, there will be only an error report at line 278 but not a free 
> operation for 'storage' before function returns. As a result, a memory 
> leak bug is triggered.
> 
> 
> 259    BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
> ...
> 276    storage = g_new0(uint8_t, rom_size);
> 277    if (blk_pread(blk, 0, storage, rom_size) < 0) {
> 278        error_setg(errp, "failed to read the initial flash content");
> 279        return;
> 280    }
> 
> 
> I believe that the problem can be fixed by adding a g_free() before the 
> function returns.
> 
> 
> 277    if (blk_pread(blk, 0, storage, rom_size) < 0) {
> 278        error_setg(errp, "failed to read the initial flash content");
> +++    g_free(storage);
> 279        return;
> 280    }
> 
> 
> I'm looking forward to your confirmation.

Correct.

Or using g_autofree:

-- >8 --
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index d911dc904f..170e773ef8 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -257,7 +257,7 @@ static void write_boot_rom(DriveInfo *dinfo, hwaddr 
addr, size_t rom_size,
                             Error **errp)
  {
      BlockBackend *blk = blk_by_legacy_dinfo(dinfo);
-    uint8_t *storage;
+    g_autofree void *storage = NULL;
      int64_t size;

      /* The block backend size should have already been 'validated' by
@@ -273,14 +273,13 @@ static void write_boot_rom(DriveInfo *dinfo, 
hwaddr addr, size_t rom_size,
          rom_size = size;
      }

-    storage = g_new0(uint8_t, rom_size);
+    storage = g_malloc0(rom_size);
      if (blk_pread(blk, 0, storage, rom_size) < 0) {
          error_setg(errp, "failed to read the initial flash content");
          return;
      }

      rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
-    g_free(storage);
  }
---

