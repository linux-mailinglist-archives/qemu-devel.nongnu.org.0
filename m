Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E74E2468
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 11:33:39 +0100 (CET)
Received: from localhost ([::1]:48268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWFM2-0002kZ-HX
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 06:33:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWFKC-00012i-Eb
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nWFKA-0003ZE-Nu
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 06:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647858702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OEGHcTljqkhWRVdBveaAF5rFPl3LP61n3uqXLIewPxY=;
 b=KBy/fpIefbAYnhKV1zFaa5Z+PulCVu172qmB7gVKaFPxuCurlLGFX0P2AyOTfe/PdwG7bb
 6GT0EJYQuVW2GGr1/bVhDNUUrM+ejZ6qHMqO/khCQBipL/TWAjJC06Bhxrn602/j7hM3Jx
 cXW/ae6RmW2rQ/NeWwxV2SJcyBqAxfk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-bkhvc2k4Mja3Kf444n6I-Q-1; Mon, 21 Mar 2022 06:31:40 -0400
X-MC-Unique: bkhvc2k4Mja3Kf444n6I-Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 i6-20020a1c5406000000b0038c97ed0db5so1860212wmb.7
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 03:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=OEGHcTljqkhWRVdBveaAF5rFPl3LP61n3uqXLIewPxY=;
 b=AEbMu4IjJ9rBOBA1wlYPUscxuxCD3nr/1ufmSZPYkz9bUiAXY9N7dWXzY8uEIwBn9E
 86FCkBIho86kqJD4Mt2g5+6QZf1SPOajb58ZP8wdYn62kfIlTSp8PlKC6snhtcFntzfD
 Z+KViVw4UP/ZrMm6OJjSndj9u+ZVbDzqmJfxInbf5vtzxY7SIH4F8aD5RaTbHuoDBImH
 QnGY0059HGBpyPGHDG3NjFie4bMFw4fbVyVeblbiw1BQPw4mlebQ/dHdcnObAe9jaM2A
 q1YARSPBnl75sQT2wa7DRQ6MLC6nQWmCWGDt/lHT+Nl5lEngOSL0Cx0POpPhz2+da6n0
 j+3Q==
X-Gm-Message-State: AOAM533CZa1ro/qKv1SDC/DGWJSEDtwhIzWNo+BYLFxiEHFPkhFXMd9C
 BA5UADJIDec9XH5gE4JtMx7nzOSV1jVsaQ/WjlhjDM3xn+QbVFy02TxlDatbvjsvdnc01ULv76O
 wRXL3+rPJMa6qUSHhRkwhIIJyAyv0uETV5CzNaTfakPA4sh1sf7noiJvkseUrVJI=
X-Received: by 2002:a05:600c:1e1f:b0:38b:d7ea:99b9 with SMTP id
 ay31-20020a05600c1e1f00b0038bd7ea99b9mr19033225wmb.8.1647858699492; 
 Mon, 21 Mar 2022 03:31:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6SbVXvw2zz1NG0NhgKWciccKn8mpDR3NEyYPIBDosV9VehJ0Q6BPk1xqaPFyBI1waYqDjKg==
X-Received: by 2002:a05:600c:1e1f:b0:38b:d7ea:99b9 with SMTP id
 ay31-20020a05600c1e1f00b0038bd7ea99b9mr19033200wmb.8.1647858699113; 
 Mon, 21 Mar 2022 03:31:39 -0700 (PDT)
Received: from [10.33.192.213] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 m34-20020a05600c3b2200b00380e3225af9sm14943754wms.0.2022.03.21.03.31.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 03:31:38 -0700 (PDT)
Message-ID: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
Date: Mon, 21 Mar 2022 11:31:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
To: QEMU Developers <qemu-devel@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Memory leak in via_isa_realize()
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


  Hi!

FYI, I'm seeing a memory leak in via_isa_realize() when building
QEMU with sanitizers enabled or when running QEMU through valgrind:

$ valgrind --leak-check=full --show-leak-kinds=definite ./qemu-system-mips64el --nographic -M fuloong2e
==210405== Memcheck, a memory error detector
==210405== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
==210405== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright info
==210405== Command: ./qemu-system-mips64el --nographic -M fuloong2e
==210405==
==210405== Warning: set address range perms: large range [0x15c9f000, 0x55c9f000) (defined)
==210405== Warning: set address range perms: large range [0x59ea4000, 0x99ea4000) (defined)
==210405== Warning: set address range perms: large range [0x99ea4000, 0xaa0a4000) (noaccess)
QEMU 6.2.90 monitor - type 'help' for more information
(qemu) q
==210405==
==210405== HEAP SUMMARY:
==210405==     in use at exit: 8,409,442 bytes in 23,516 blocks
==210405==   total heap usage: 37,073 allocs, 13,557 frees, 32,674,469 bytes allocated
==210405==
==210405== 8 bytes in 1 blocks are definitely lost in loss record 715 of 6,085
==210405==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
==210405==    by 0x7059475: g_malloc (in /usr/lib64/libglib-2.0.so.0.5600.4)
==210405==    by 0x96C52C: qemu_extend_irqs (irq.c:57)
==210405==    by 0x96C5B8: qemu_allocate_irqs (irq.c:66)
==210405==    by 0x5FFA47: via_isa_realize (vt82c686.c:591)
==210405==    by 0x5FFCDA: vt82c686b_realize (vt82c686.c:646)
==210405==    by 0x681502: pci_qdev_realize (pci.c:2192)
==210405==    by 0x969A5D: device_set_realized (qdev.c:531)
==210405==    by 0x97354A: property_set_bool (object.c:2273)
==210405==    by 0x9715A0: object_property_set (object.c:1408)
==210405==    by 0x975938: object_property_set_qobject (qom-qobject.c:28)
==210405==    by 0x971907: object_property_set_bool (object.c:1477)
==210405==
==210405== LEAK SUMMARY:
==210405==    definitely lost: 8 bytes in 1 blocks
==210405==    indirectly lost: 0 bytes in 0 blocks
==210405==      possibly lost: 3,794 bytes in 45 blocks
==210405==    still reachable: 8,405,640 bytes in 23,470 blocks
==210405==                       of which reachable via heuristic:
==210405==                         newarray           : 1,536 bytes in 16 blocks
==210405==         suppressed: 0 bytes in 0 blocks
==210405== Reachable blocks (those to which a pointer was found) are not shown.
==210405== To see them, rerun with: --leak-check=full --show-leak-kinds=all
==210405==
==210405== For lists of detected and suppressed errors, rerun with: -s
==210405== ERROR SUMMARY: 46 errors from 46 contexts (suppressed: 0 from 0)

Same problem happens with qemu-system-ppc64 and the pegasos2 machine.

No clue how to properly fix this... is it safe to free the pointer
at the end of the function?

  Thomas


