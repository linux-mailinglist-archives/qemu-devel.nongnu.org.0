Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0169A6FF19F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 14:34:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5Tm-0003Lc-5l; Thu, 11 May 2023 08:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1px5Ti-0003L8-54; Thu, 11 May 2023 08:33:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1px5Ta-0007qi-PH; Thu, 11 May 2023 08:32:58 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 246D55413;
 Thu, 11 May 2023 15:32:52 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 35D9B3DA1;
 Thu, 11 May 2023 15:32:51 +0300 (MSK)
Message-ID: <d60cbe36-0bc0-b991-6fb7-b942527988f1@msgid.tls.msk.ru>
Date: Thu, 11 May 2023 15:32:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] linux-user/s390x: Fix single-stepping SVC
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>, 
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20230510230213.330134-1-iii@linux.ibm.com>
 <20230510230213.330134-2-iii@linux.ibm.com>
 <10879612-818e-a1af-5994-56ef84c524cb@msgid.tls.msk.ru>
 <cfb547465b6b6bd27c75bea8fdc4bb7be3229c93.camel@linux.ibm.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <cfb547465b6b6bd27c75bea8fdc4bb7be3229c93.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -89
X-Spam_score: -9.0
X-Spam_bar: ---------
X-Spam_report: (-9.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.124,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

11.05.2023 14:20, Ilya Leoshkevich wrote:
> On Thu, 2023-05-11 at 13:55 +0300, Michael Tokarev wrote:

>> Is it a -stable material?

> While I would personally love to see this in -stable, I don't think it
> fits the official criteria - it's not a security fix and it's not a
> regression.

I'm not sure I follow. It's definitely okay to include a bug fix into
-stable, this has been done countless times in the past..

/mjt

