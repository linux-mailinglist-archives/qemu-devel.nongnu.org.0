Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF1585F09
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 11:53:35 +0200 (CEST)
Received: from localhost ([::1]:47952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvf70-0004IL-2w
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 05:53:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54441)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hvf68-0003Mk-8i
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1hvf67-0005kE-3U
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 05:52:40 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:60476)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1hvf66-0005eZ-OC; Thu, 08 Aug 2019 05:52:39 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1129829|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.265738-0.0165207-0.717741; FP=0|0|0|0|0|-1|-1|-1;
 HT=e02c03277; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS; RN=6; RT=6; SR=0;
 TI=SMTPD_---.F8QE5-D_1565257629; 
Received: from 172.16.28.186(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.F8QE5-D_1565257629)
 by smtp.aliyun-inc.com(10.147.42.16); Thu, 08 Aug 2019 17:47:12 +0800
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
From: liuzhiwei <zhiwei_liu@c-sky.com>
Message-ID: <97a6ae9f-2845-4a3c-2a31-367787622268@c-sky.com>
Date: Thu, 8 Aug 2019 17:39:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 121.197.200.217
Subject: [Qemu-devel] RISC-V: Vector && DSP Extension
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
Cc: palmer@sifive.com, Alistair.Francis@wdc.com, sagark@eecs.berkeley.edu,
 bastian@mail.uni-paderborn.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

    My workmate  and I have been working on Vector & Dsp extension, and 
I'd like to share develop status  with folks.

    The spec references for  Vector extension is riscv-v-spec-0.7.1, and 
riscv-p-spec-0.5 for DSP extension. The code of vector extension is 
ready and under testing,  the first patch will be sent about two weeks 
later. After that we will forward working on DSP extension, and send the 
first patch in middle  October.

     Could the maintainers  tell me whether the specs referenced are 
appropriate? Is anyone working on these extensions?  I'd like to get 
your status, and maybe discuss questions and work togather.

Best Regards

LIU Zhiwei



