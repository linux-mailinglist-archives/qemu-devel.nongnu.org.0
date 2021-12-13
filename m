Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D66B847267C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 10:53:27 +0100 (CET)
Received: from localhost ([::1]:35930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwi1P-0002ax-1M
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 04:53:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mengpg2@engene.se>) id 1mwhy9-0007ZM-5S
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:50:05 -0500
Received: from [2a00:1450:4864:20::432] (port=39713
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <mengpg2@engene.se>) id 1mwhy3-0006Q1-5w
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 04:50:03 -0500
Received: by mail-wr1-x432.google.com with SMTP id a18so25976567wrn.6
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 01:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=engene-se.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-language;
 bh=mNN8tqmrdqKDx4eUpF34IyJ4VEGXmrRRNjSNCLfFP7g=;
 b=IHrV+YOYZgUAzj7wB09J29Hy/hcnefmrLMURh76Qdv2ddU45JRgfrrMKAd2Iqf37j9
 DF/alUzx74QZCSlsgkrICfd2zXP5n1IqPePlI8wQJ1ckrLUBX4vPBs5GhTwFMgyMmZsl
 UBd5wLBVAh/pr3wofGhFmUynhLZIjYPG49O5dwpZcC4aHiZWCSSvXqImxduuMXaldUYu
 TOe2R7j8gUCY1I6eUZN/CqKBn8byhJlYm7TP4RjSjdiJYXF+xNPgJPb4n5vt6R8Tt1kM
 3eXVzbOXOe9tDwgUpxULSTWOJuM5DppM45SwQq6gKXKXs/SqNG84lNd1Cvck1jVjr7x0
 9iMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-language;
 bh=mNN8tqmrdqKDx4eUpF34IyJ4VEGXmrRRNjSNCLfFP7g=;
 b=mgncASQvVAoLwwLgSJkQngK2uAITIKLJEseZQU6r5ZMLxc9f+Clu0V02DSUEVi6Tlb
 xVgKbHMjUoMVSLqfyJgICtzbzoP3vLXMz9oUCbInPglvTNBJ82JxcKmdtLnOPoF1wPW3
 mwFvoyrqYWHljPcoR6TF5s91BhY5bjhNkomLL11urxnQYmi2nraRSysA7IgiNh4A3p1C
 ZyStWCgxzllX5KGN+9pFTN6Tr9eh6GsylXBMelhrrgFPWafJTdnXpIIdUCPtPNCE19QL
 SGKEr8HPHV8oPx5QwY1JUsqbNRbxpyMzWJ3dClUoJCwTY3wsiQmprFj3uz4hoPX0NY3X
 D+YQ==
X-Gm-Message-State: AOAM531mm0srt2SE26t30/hNhrGZMw0g+scdtlxM6qdWDIFjoS4pcbg6
 KbxRpEiBhEBzMBwbb93BkPeVJ2v9ptdy5Q==
X-Google-Smtp-Source: ABdhPJwTruwUIbVpb4/n8LtRAR1t9dMXZ14BaZQ25/HRVAwrokegP4+0fMMxpKASnD0pCuTK2dOIDg==
X-Received: by 2002:a5d:53cb:: with SMTP id a11mr31048518wrw.357.1639388985209; 
 Mon, 13 Dec 2021 01:49:45 -0800 (PST)
Received: from [192.168.86.87]
 (42.153.192.178.dynamic.wline.res.cust.swisscom.ch. [178.192.153.42])
 by smtp.gmail.com with ESMTPSA id bd18sm6517780wmb.43.2021.12.13.01.49.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Dec 2021 01:49:44 -0800 (PST)
From: Marcus Engene <mengpg2@engene.se>
Subject: Qemu Userspace Emulator with library + method
To: qemu-devel@nongnu.org
Message-ID: <2e540a20-9733-4ba4-520c-31cf6d9eac93@engene.se>
Date: Mon, 13 Dec 2021 10:49:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------48F2B5E1BD7044A8DF4B9543"
Content-Language: en-US
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: neutral client-ip=2a00:1450:4864:20::432;
 envelope-from=mengpg2@engene.se; helo=mail-wr1-x432.google.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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

This is a multi-part message in MIME format.
--------------48F2B5E1BD7044A8DF4B9543
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I'd like to do instruction traces with library+function name included.

 From what I understand *in_asm* only shows instructions when they are 
being JIT:ed.
If I call a function twice I only see the instructions once so it makes 
sense.

As a workaround, I tried to do a plugin. I looked at the examples in 
contrib/plugins and it seems to work nicely. I see all instructions in 
userspace:

0000004000802100 48 89 e7                             movq %rsp, %rdi
0000004000802103 e8 08 0e 00 00                       callq 0x4000802f10
0000004000802f10 f3 0f 1e fa                          endbr64
0000004000802f14 55                                   pushq %rbp
0000004000802f15 48 89 e5                             movq %rsp, %rbp
0000004000802f18 41 57                                pushq %r15

However, for it to be super useful, I'd also like to see what library or 
source file each instruction lives, and what function we're in.

Example output from perf + intel_pt

a.out 602812 [006] 206712.277263361: 7f8d50217084 brk+0x4 
(/usr/lib/x86_64-linux-gnu/ld-2.31.so)     mov $0xc, %eax
a.out 602812 [006] 206712.277263361:      7f8d50217089 brk+0x9 
(/usr/lib/x86_64-linux-gnu/ld-2.31.so)         syscall
a.out 602812 [006] 206712.277264027:      7f8d5021708b brk+0xb 
(/usr/lib/x86_64-linux-gnu/ld-2.31.so)         cmp $0xfffffffffffff000, %rax
a.out 602812 [006] 206712.277264027:      7f8d50217091 brk+0x11 
(/usr/lib/x86_64-linux-gnu/ld-2.31.so)         jnbe 0x7f8d502170a8
a.out 602812 [006] 206712.277264027:      7f8d50217093 brk+0x13 
(/usr/lib/x86_64-linux-gnu/ld-2.31.so)         movq  %rax, 0x1106e(%rip)

Is this doable? Do you have any advice on where to start?

I tried to get the "symbol" in the plugin, but I only get null values.

Kind regards,
Marcus



--------------48F2B5E1BD7044A8DF4B9543
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi,</p>
    <p>I'd like to do instruction traces with library+function name
      included.<br>
      <br>
      From what I understand <b>in_asm</b> only shows instructions when
      they are being JIT:ed. <br>
      If I call a function twice I only see the instructions once so it
      makes sense.</p>
    <p>As a workaround, I tried to do a plugin. I looked at the examples
      in contrib/plugins and it seems to work nicely. I see all
      instructions in userspace:<br>
      <br>
      <font face="monospace">0000004000802100 48 89
        e7                             movq %rsp, %rdi<br>
        0000004000802103 e8 08 0e 00 00                       callq
        0x4000802f10<br>
        0000004000802f10 f3 0f 1e fa                          endbr64 <br>
        0000004000802f14 55                                   pushq %rbp<br>
        0000004000802f15 48 89 e5                             movq %rsp,
        %rbp<br>
        0000004000802f18 41 57                                pushq %r15</font><br>
      <br>
      However, for it to be super useful, I'd also like to see what
      library or source file each instruction lives, and what function
      we're in.<br>
      <br>
      Example output from perf + intel_pt<br>
      <br>
      <font face="monospace">a.out 602812 [006] 206712.277263361:     
        7f8d50217084 brk+0x4 (/usr/lib/x86_64-linux-gnu/ld-2.31.so)    
            mov $0xc, %eax<br>
        a.out 602812 [006] 206712.277263361:      7f8d50217089 brk+0x9
        (/usr/lib/x86_64-linux-gnu/ld-2.31.so)         syscall <br>
        a.out 602812 [006] 206712.277264027:      7f8d5021708b brk+0xb
        (/usr/lib/x86_64-linux-gnu/ld-2.31.so)         cmp
        $0xfffffffffffff000, %rax<br>
        a.out 602812 [006] 206712.277264027:      7f8d50217091 brk+0x11
        (/usr/lib/x86_64-linux-gnu/ld-2.31.so)         jnbe
        0x7f8d502170a8<br>
        a.out 602812 [006] 206712.277264027:      7f8d50217093 brk+0x13
        (/usr/lib/x86_64-linux-gnu/ld-2.31.so)         movq  %rax,
        0x1106e(%rip)</font></p>
    <p>Is this doable? Do you have any advice on where to start?</p>
    <p>I tried to get the "symbol" in the plugin, but I only get null
      values.<br>
    </p>
    <p>Kind regards,<br>
      Marcus</p>
    <p><br>
    </p>
  </body>
</html>

--------------48F2B5E1BD7044A8DF4B9543--

