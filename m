Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899D4E2730
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 14:05:52 +0100 (CET)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWHjL-00082b-GQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 09:05:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWHi3-0007FI-LE
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:04:31 -0400
Received: from [2607:f8b0:4864:20::1036] (port=43651
 helo=mail-pj1-x1036.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nWHi1-0003p6-Qv
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 09:04:31 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so8258299pjq.2
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 06:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=V2CnSCANrbgCTPbXDzNLCYi4ux+1gAuJmfvSfLPIpaU=;
 b=Ek5/kUCSRsvfZpuaBw8VeeV/UDS81MPhXJZ2PIkK2eZPouIzQ40v9j/vsLS6SsEUvv
 nKXF1Y8BENZMPuTGx00OjNpNGA/3zp6nHVkWfoplxphlCyYtP4c19CaIomWWjM+1GOjh
 a2LeqzD3OCL8BdfsTHG35GbAdCm8cN6hYJ4uSUiM3pmCUXUdDpoxu925HiBqheUJtzRm
 mr7IoPqCuxezck7SdCt5AKR53HWEb/xE6zHw0T0IGeLDcovwL0jOiLK+j95oI29yNTf6
 ocC9IxIzZrWwzX+i0SUbRlWuf/iKoMbIwUgN2JGYP7UsD9YYbX21w9lBD9F/dWzhaO/K
 vJBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V2CnSCANrbgCTPbXDzNLCYi4ux+1gAuJmfvSfLPIpaU=;
 b=EDHWyFfB6zSj/127Qc6pWd1JmZQVNdcPjWlBIvQ7uRZBIhBzaODH+Sz8zip1vKUUS8
 74F/tuT383fuS8Uc+oZavLBsWODecgS/G99VI7XHaa+03u1MmwKjc4S3IO39ScI8xwHt
 1G9690t4dJWfsrQLwWn8pVaT4FGxnNlx+yfAYxs9p76N2q6mTs2WcOzBiF+5Yp4Y767N
 dHZeYHkhjceSBrLQc7HGrYNBKe0FFb0vA1LFi0/15GrP7iVJdtIVzWqnafEZ1VoWtNy4
 YzgqxS92YmqIzlF7dsqufRw2SSkBshzGCCG6xyg2b2r4wTwcIo+yZlk8wY/YHrtAcZkE
 Ofhg==
X-Gm-Message-State: AOAM5319KFGvvWUFhQX9JtHcVQ2lPaGpK7YQjKbVEmVV9HhZE8vwFEU2
 QaRDG66eCXx0Q4BDr0A1MEA=
X-Google-Smtp-Source: ABdhPJzGXRsyB9XfaKiVD940bCmIoPBWZEwLR5RtpUZoA7tfzYeo9VobK/EcSO8hZabOaI1f1oJ+MA==
X-Received: by 2002:a17:902:7045:b0:153:a8b1:d666 with SMTP id
 h5-20020a170902704500b00153a8b1d666mr12702806plt.75.1647867867569; 
 Mon, 21 Mar 2022 06:04:27 -0700 (PDT)
Received: from [192.168.64.175] (138.red-95-127-187.staticip.rima-tde.net.
 [95.127.187.138]) by smtp.gmail.com with ESMTPSA id
 v23-20020a17090a521700b001bbfc181c93sm19973780pjh.19.2022.03.21.06.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Mar 2022 06:04:27 -0700 (PDT)
Message-ID: <89a014e0-8850-e628-dea5-76999513a18e@gmail.com>
Date: Mon, 21 Mar 2022 14:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: Memory leak in via_isa_realize()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <d60cb762-40a5-f918-02aa-463758205af5@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1036
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1036.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing Bernhard who did a similar cleanup recently.

On 21/3/22 11:31, Thomas Huth wrote:
> 
>   Hi!
> 
> FYI, I'm seeing a memory leak in via_isa_realize() when building
> QEMU with sanitizers enabled or when running QEMU through valgrind:
> 
> $ valgrind --leak-check=full --show-leak-kinds=definite 
> ./qemu-system-mips64el --nographic -M fuloong2e
> ==210405== Memcheck, a memory error detector
> ==210405== Copyright (C) 2002-2017, and GNU GPL'd, by Julian Seward et al.
> ==210405== Using Valgrind-3.17.0 and LibVEX; rerun with -h for copyright 
> info
> ==210405== Command: ./qemu-system-mips64el --nographic -M fuloong2e
> ==210405==
> ==210405== Warning: set address range perms: large range [0x15c9f000, 
> 0x55c9f000) (defined)
> ==210405== Warning: set address range perms: large range [0x59ea4000, 
> 0x99ea4000) (defined)
> ==210405== Warning: set address range perms: large range [0x99ea4000, 
> 0xaa0a4000) (noaccess)
> QEMU 6.2.90 monitor - type 'help' for more information
> (qemu) q
> ==210405==
> ==210405== HEAP SUMMARY:
> ==210405==     in use at exit: 8,409,442 bytes in 23,516 blocks
> ==210405==   total heap usage: 37,073 allocs, 13,557 frees, 32,674,469 
> bytes allocated
> ==210405==
> ==210405== 8 bytes in 1 blocks are definitely lost in loss record 715 of 
> 6,085
> ==210405==    at 0x4C360A5: malloc (vg_replace_malloc.c:380)
> ==210405==    by 0x7059475: g_malloc (in 
> /usr/lib64/libglib-2.0.so.0.5600.4)
> ==210405==    by 0x96C52C: qemu_extend_irqs (irq.c:57)
> ==210405==    by 0x96C5B8: qemu_allocate_irqs (irq.c:66)
> ==210405==    by 0x5FFA47: via_isa_realize (vt82c686.c:591)
> ==210405==    by 0x5FFCDA: vt82c686b_realize (vt82c686.c:646)
> ==210405==    by 0x681502: pci_qdev_realize (pci.c:2192)
> ==210405==    by 0x969A5D: device_set_realized (qdev.c:531)
> ==210405==    by 0x97354A: property_set_bool (object.c:2273)
> ==210405==    by 0x9715A0: object_property_set (object.c:1408)
> ==210405==    by 0x975938: object_property_set_qobject (qom-qobject.c:28)
> ==210405==    by 0x971907: object_property_set_bool (object.c:1477)
> ==210405==
> ==210405== LEAK SUMMARY:
> ==210405==    definitely lost: 8 bytes in 1 blocks
> ==210405==    indirectly lost: 0 bytes in 0 blocks
> ==210405==      possibly lost: 3,794 bytes in 45 blocks
> ==210405==    still reachable: 8,405,640 bytes in 23,470 blocks
> ==210405==                       of which reachable via heuristic:
> ==210405==                         newarray           : 1,536 bytes in 
> 16 blocks
> ==210405==         suppressed: 0 bytes in 0 blocks
> ==210405== Reachable blocks (those to which a pointer was found) are not 
> shown.
> ==210405== To see them, rerun with: --leak-check=full --show-leak-kinds=all
> ==210405==
> ==210405== For lists of detected and suppressed errors, rerun with: -s
> ==210405== ERROR SUMMARY: 46 errors from 46 contexts (suppressed: 0 from 0)
> 
> Same problem happens with qemu-system-ppc64 and the pegasos2 machine.
> 
> No clue how to properly fix this... is it safe to free the pointer
> at the end of the function?
> 
>   Thomas
> 


