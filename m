Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0B0353A11
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 00:26:00 +0200 (CEST)
Received: from localhost ([::1]:50764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTBBv-0005oH-0G
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 18:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgplap30@gmail.com>)
 id 1lT1XU-0008By-4s
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 08:07:36 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:34697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sgplap30@gmail.com>)
 id 1lT1XP-0001ar-Nt
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 08:07:35 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 cl21-20020a17090af695b02900c61ac0f0e9so7403897pjb.1
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Ay9S+QovUN2HEee3GX6E38NYMTvL5DIu+rei6/ckhZY=;
 b=dXUKu3WkDWwXA+pZqqhiRQ2gYeGqVL7mgkLxCXcGWNnKQrozbZ2LF6KNgrB6yX/+zU
 zQUJXlSNHjfm8bEc4djZRmqZD4Nptfy4LVfHQgE6VHtf5aoHgxCkTS4ULjYuN0ibDh4j
 uLN5jkZgEaVksTclAlEYlpw3gbQJtDQXB8zLv3r5g//RAG3UgSWqpZLV7qHptMycxtAt
 VC4bGlEWe4SRb3Nu9WeNyg/J+ocmCC60tPaz1aLVP3TjnWYDY4EGBsSI9VWeR/WSC5jC
 lH4ACNVPu9FV1+4uF/4uzaGPYOJE0yr3OkmNRG+f9qy2gqd+D5rNM9DKW//tEuBqRF6D
 2uYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Ay9S+QovUN2HEee3GX6E38NYMTvL5DIu+rei6/ckhZY=;
 b=m5TK2btjCTYOt93hNVIuxxQLnYadF79d6Ah1mrIczmmsoYdO2SfyfkGSCD689dlWSf
 xu5XNeMQIER8O2dF3LbcTn5IYGtNIaAKm+flGxy+ypBmBZOJxl9uQveVGoozGcBV8CtA
 zE/4YsiioccvYL3miLHz/H8esT8onmY2zwtZpTNmGMWXOyPfH1XwmmWb1NQYmon5g51v
 zTMeNVO8g4Fu7m4Hx5zsZysLZcNKlL9Pu/FLYy2gZtsCEdwaGwyV9UrPWJnSXKJfQzkL
 tZLzO3grxELyOEx9RNTeWUpzOzNZMweAPf+joH46ll8XFjUc4f5wxlDfc+L9OKIoh1KW
 xJiQ==
X-Gm-Message-State: AOAM532sBSBdMbHXeXr/gXgmAZJOONSqV6p07MjzXh88hUHaRVVV9jt/
 p/PUOLj7D4WQ7d4KWIOTEN4=
X-Google-Smtp-Source: ABdhPJxIZtfkzkj3CP61DUJ+CAOkjm3tJ1SD8sQe8DQUpoG4ZplgOdVIq+mjyT3yToU72Jc83u1nwQ==
X-Received: by 2002:a17:902:a415:b029:e7:137b:ef9c with SMTP id
 p21-20020a170902a415b02900e7137bef9cmr19825754plq.28.1617538049270; 
 Sun, 04 Apr 2021 05:07:29 -0700 (PDT)
Received: from [192.168.50.193] (bb116-14-124-222.singnet.com.sg.
 [116.14.124.222])
 by smtp.gmail.com with ESMTPSA id j188sm13310381pfd.64.2021.04.04.05.07.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Apr 2021 05:07:29 -0700 (PDT)
From: CKIM <sgplap30@gmail.com>
Subject: qemu-system-sparc64 instruction set architecture compatibility (sparc
 v8+ vs sparc v9)
To: qemu-devel@nongnu.org
Message-ID: <33e27175-688d-3f9e-d999-cda18122f3d9@gmail.com>
Date: Sun, 4 Apr 2021 20:07:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=sgplap30@gmail.com; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 04 Apr 2021 18:24:46 -0400
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
Cc: cheolyon38@naver.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm not sure if this is right mailing list for this question but I 
really appreciate if someone can answer to my question.

I have very old binary (testgen) which was built from old sparc station. 
(no source code)

If I run "file testgen", I get the following.
ELF 32-bit MSB executable SPARC32PLUS Version 1, V8+ Required, 
UltraSPARC1 Extensions Required, statically linked, not stripped

I want to run this binary from qemu as the sparc station (sun4u sparc 
SUNW,Sun-Fire-V440) is very unstable.


Can QEMU (qemu-system-sparc64) support sparc32 application with v8+ ?


I tried to install a few packages listed at 
https://wiki.qemu.org/Documentation/Platforms/SPARC

I was able to install most of sun4m / sun4u guests listed in the wiki 
and network setup was also ok but none of them could run the "testgen" 
binary.

I always get "Cannot execute ELF binary" error message.

example with QEMU 5.2.0 version:
qemu-system-sparc64 -m 512 -drive 
file=disk_image_netbsd64.raw,format=raw,index=0, \
-net nic,macaddr=52:54:00:fa:ce:10,model=e1000 \
-net tap -nographic \
-cdrom NetBSD-9.1-sparc64.iso \
-boot d

I found the cpu type is set "TI-UltraSparc-IIi" as default.

I couldn't find any option related to the instruction set architecture. 
(qemu-system-sparc64 --help)

If I try the "niagara" machine example (OpenSPARCT1_Arch.1.5.tar.bz2), I 
get:

# isainfo -v
64-bit sparcv9 applications
         asi_blk_init
32-bit sparc applications
         asi_blk_init v8plus div32 mul32

It shows v8plus explicitly so I guess the niagara guest should be able 
to run my "testgen" binary but I couldn't find any information about the 
network setup for the OpenSPARCT1_Arch.1.5.tar.bz2. So I can't copy my 
project files onto the guest machine.

My Sun physical server shows:
uname -a
SunOS sinuc035 5.8 Generic_117350-62 sun4u sparc SUNW,Sun-Fire-V440

I understand the sparc v7, v8, v8+, v9 are not chip architectures but 
they are Instruction Set Architectures so I think the binary could run 
on sun4u or sun4v, niagara ...

Can anyone know how to run the sparc32 v8+ binary from QEMU ?
Is it something the iso file need to be changed or qemu issue?

I appreciate if any useful info or hint. Thanks!


Best Regards,
CKIM

