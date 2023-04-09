Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4026DC017
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Apr 2023 15:42:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plVHv-0007gK-TM; Sun, 09 Apr 2023 09:41:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1plVHs-0007fR-PR; Sun, 09 Apr 2023 09:40:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1plVHr-0004Z5-4q; Sun, 09 Apr 2023 09:40:56 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 20E464000C;
 Sun,  9 Apr 2023 16:40:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 2A64FDD;
 Sun,  9 Apr 2023 16:40:50 +0300 (MSK)
Message-ID: <a3075e7e-9f7b-105c-a952-f0604d541c39@msgid.tls.msk.ru>
Date: Sun, 9 Apr 2023 16:40:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3] target/i386: Change wrong XFRM value
Content-Language: en-US
To: Yang Zhong <yang.zhong@linux.intel.com>, pbonzini@redhat.com
Cc: qemu-devel@nongnu.org, seanjc@google.com,
 christian.ehrhardt@canonical.com, kai.huang@intel.com,
 weijiang.yang@intel.com, qemu-stable <qemu-stable@nongnu.org>
References: <20230406064041.420039-1-yang.zhong@linux.intel.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230406064041.420039-1-yang.zhong@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -97
X-Spam_score: -9.8
X-Spam_bar: ---------
X-Spam_report: (-9.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.888,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

06.04.2023 09:40, Yang Zhong wrote:
> The previous patch wrongly replaced FEAT_XSAVE_XCR0_{LO|HI} with
> FEAT_XSAVE_XSS_{LO|HI} in CPUID(EAX=12,ECX=1):{ECX,EDX}, which made
> SGX enclave only supported SSE and x87 feature(xfrm=0x3).
> 
> Fixes: 301e90675c3f ("target/i386: Enable support for XSAVES based features")

This seems to be -stable material, no?

/mjt

