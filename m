Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8977640235F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 08:23:59 +0200 (CEST)
Received: from localhost ([::1]:60208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNUWU-0002C1-M2
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 02:23:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUVD-0001BL-TR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mNUVC-0004dc-8i
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 02:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630995757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3fjIjyV+luo+mjdMwd92NXBYM+xdCsPqZ3+Ski7784o=;
 b=cOSMXeBB4Z9pNRMvARKKPpAvNpMUTUwaKIvbCaekzZ0ZQXXuNFmtL4WNwfvXFdLm4Vhpje
 Z+ynh/gRhFdh/qHuDBVTp1S8JWBnnMgeqDJ7OBT8thbrRcs5GXw9gRlcFaMwSJeXoye+9C
 p01lxLhfnJPAUzAKGMuVTrg4a9XuWlw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164--7RR8d5UOUO3IGn-uoy1JQ-1; Tue, 07 Sep 2021 02:22:36 -0400
X-MC-Unique: -7RR8d5UOUO3IGn-uoy1JQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 x10-20020a7bc20a000000b002f8cf761457so180018wmi.1
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 23:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3fjIjyV+luo+mjdMwd92NXBYM+xdCsPqZ3+Ski7784o=;
 b=LyiENDreRZ2FbBBsUwOZPVHna82bKzaH+lZMiD3TK09NHC+ugQIU06EO9R3ZfvncLE
 p7Y+g/KVvZFmPLXx4sD4cFNhTXnpt6/sbhhKeF7bRE6oiuQm6/AnbgvVI/eB4xYuZ/uV
 45RGKetf9PLNXZC0CCntg3Wf5vpnD5DRwuSCxYi3fFF6yXZ5rbat7RxYX8WjOTpMGu5W
 vyByBgk2EJrKTetwSDWcLVbfGtt51ATpiUrUeEOGKKn5Vh1TtG1+eTat5zkXEpbDVcN+
 588wuo6o7WO0UrzACqVJ62sGb1mIIWQN6m9gpkxgJ0Y9sQah9qMwQgich2HqOa88NYRW
 otWQ==
X-Gm-Message-State: AOAM530ybv6XJjFrQ2t+/soKl7MKEwAZ+Jj+AA6yZsgUva6zfQgQwl1n
 PVkinfBSyjMNL34svhBnW+xZWvpBwd5UGlPD3YVEMvKHh7Qu5xoPgydgDx582JWeNKbT3QpgtKu
 i2tJ11pDCTIeI4Xg=
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr2173009wmq.99.1630995753411; 
 Mon, 06 Sep 2021 23:22:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNQwGK6xtyFudDyYihpVqo+k7OQ+0S7H3EiAptaXkLnro0sUmHaI16csxr52zM8Vea4drJqA==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr2172974wmq.99.1630995753113; 
 Mon, 06 Sep 2021 23:22:33 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id x13sm1143882wrg.62.2021.09.06.23.22.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 23:22:32 -0700 (PDT)
Subject: Re: [PATCH] hw/display/ati_2d: Fix buffer overflow in ati_2d_blt
 (CVE-2021-3638)
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210906153103.1661195-1-philmd@redhat.com>
 <CAA8xKjXkDwPYxSAeRb+2mfHRrbiL_kh9unVkemFXLfF68UXePA@mail.gmail.com>
 <3ef43b0d-4b89-85a4-f2bf-b7f8a256d1db@redhat.com>
 <bb39ee8c-a567-591a-a1c4-822683bb723@eik.bme.hu>
 <8ba32305-3e9f-a770-0406-7612ed4aeece@redhat.com>
Message-ID: <3ee3ca31-0d6c-a439-74c0-6397c3492893@redhat.com>
Date: Tue, 7 Sep 2021 08:22:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <8ba32305-3e9f-a770-0406-7612ed4aeece@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mauro Matteo Cascella <mcascell@redhat.com>,
 Qiang Liu <qiangliu@zju.edu.cn>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Gaoning Pan <pgn@zju.edu.cn>,
 Ziming Zhang <ezrakiez@gmail.com>, Salvatore Bonaccorso <carnil@debian.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/21 7:38 AM, Philippe Mathieu-Daudé wrote:
> On 9/6/21 9:52 PM, BALATON Zoltan wrote:
>> On Mon, 6 Sep 2021, Philippe Mathieu-Daudé wrote:
>>> (Forgot to Cc Alex for eventual reproducer)
>>>
>>> On 9/6/21 6:44 PM, Mauro Matteo Cascella wrote:
>>>> On Mon, Sep 6, 2021 at 5:31 PM Philippe Mathieu-Daudé
>>>> <philmd@redhat.com> wrote:
>>>>>
>>>>> When building QEMU with DEBUG_ATI defined then running with
>>>>> '-device ati-vga,romfile="" -d unimp,guest_errors -trace ati\*'
>>>>> we get:
>>>>>
>>>>>   ati_mm_write 4 0x16c0 DP_CNTL <- 0x1
>>>>>   ati_mm_write 4 0x146c DP_GUI_MASTER_CNTL <- 0x2
>>>>>   ati_mm_write 4 0x16c8 DP_MIX <- 0xff0000
>>>>>   ati_mm_write 4 0x16c4 DP_DATATYPE <- 0x2
>>>>>   ati_mm_write 4 0x224 CRTC_OFFSET <- 0x0
>>>>>   ati_mm_write 4 0x142c DST_PITCH_OFFSET <- 0xfe00000
>>>>>   ati_mm_write 4 0x1420 DST_Y <- 0x3fff
>>>>>   ati_mm_write 4 0x1410 DST_HEIGHT <- 0x3fff
>>>>>   ati_mm_write 4 0x1588 DST_WIDTH_X <- 0x3fff3fff
>>>>>   ati_2d_blt: vram:0x7fff5fa00000 addr:0 ds:0x7fff61273800
>>>>> stride:2560 bpp:32 rop:0xff
>>>>>   ati_2d_blt: 0 0 0, 0 127 0, (0,0) -> (16383,16383) 16383x16383 > ^
>>>>>   ati_2d_blt: pixman_fill(dst:0x7fff5fa00000, stride:254, bpp:8,
>>>>> x:16383, y:16383, w:16383, h:16383, xor:0xff000000)
>>>>>   Thread 3 "qemu-system-i38" received signal SIGSEGV, Segmentation
>>>>> fault.
>>>>>   (gdb) bt
>>>>>   #0  0x00007ffff7f62ce0 in sse2_fill.lto_priv () at
>>>>> /lib64/libpixman-1.so.0
>>>>>   #1  0x00007ffff7f09278 in pixman_fill () at /lib64/libpixman-1.so.0
>>>>>   #2  0x0000555557b5a9af in ati_2d_blt (s=0x631000028800) at
>>>>> hw/display/ati_2d.c:196
>>>>>   #3  0x0000555557b4b5a2 in ati_mm_write (opaque=0x631000028800,
>>>>> addr=5512, data=1073692671, size=4) at hw/display/ati.c:843
>>>>>   #4  0x0000555558b90ec4 in memory_region_write_accessor
>>>>> (mr=0x631000039cc0, addr=5512, ..., size=4, ...) at
>>>>> softmmu/memory.c:492
>>>>>
>>>>> Commit 584acf34cb0 ("ati-vga: Fix reverse bit blts") introduced
>>>>> the local dst_x and dst_y which adjust the (x, y) coordinates
>>>>> depending on the direction in the SRCCOPY ROP3 operation, but
>>>>> forgot to address the same issue for the PATCOPY, BLACKNESS and
>>>>> WHITENESS operations, which also call pixman_fill().
>>>>>
>>>>> Fix that now by using the adjusted coordinates in the pixman_fill
>>>>> call, and update the related debug printf().
>>>>>
>>>>> Reported-by: Qiang Liu <qiangliu@zju.edu.cn>
>>>>> Fixes: 584acf34cb0 ("ati-vga: Fix reverse bit blts")
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> ---
>>>>>  hw/display/ati_2d.c | 6 +++---
>>>>>  1 file changed, 3 insertions(+), 3 deletions(-)

>> I don't think assigning a CVE to a bug that is in an experimental and
>> largely unused part and happens when one enables debug code really worth
>> the hassle, this could be handled as a normal bug. As long as the
> 
> CVE assignment can happens outside of QEMU community, we try to make it
> clear what is the "security boundary" but researchers filling CVEs
> might not understand it well.

BTW see commit b317006a3f1 ("docs/secure-coding-practices: Describe how
to use 'null-co' block driver") which is related to your suggestion.


