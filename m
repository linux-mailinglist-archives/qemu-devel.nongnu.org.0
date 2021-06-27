Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B30703B52FB
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Jun 2021 13:13:17 +0200 (CEST)
Received: from localhost ([::1]:36134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxSiy-0005JE-QJ
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 07:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1lxSgi-0003ag-It; Sun, 27 Jun 2021 07:10:56 -0400
Received: from mail.csgraf.de ([85.25.223.15]:32830 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1lxSgg-0003dr-MQ; Sun, 27 Jun 2021 07:10:56 -0400
Received: from MacBook-Air.alex.local
 (dynamic-077-002-101-004.77.2.pool.telefonica.de [77.2.101.4])
 by csgraf.de (Postfix) with ESMTPSA id 3A9AC60801D7;
 Sun, 27 Jun 2021 13:10:45 +0200 (CEST)
Subject: Re: [PATCH v3 1/1] yank: Unregister function when using TLS migration
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org
References: <20210601054030.1153249-1-leobras.c@gmail.com>
 <YMdEK6evcYtpbfMv@work-vm>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <7cdf3e49-c68b-f5e5-ae1f-8274203a0f11@csgraf.de>
Date: Sun, 27 Jun 2021 13:10:44 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMdEK6evcYtpbfMv@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.765,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, lukasstraub2@web.de,
 berrange@redhat.com, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 14.06.21 13:57, Dr. David Alan Gilbert wrote:
> cc'ing in qemu-stable - I think we'd probably want this on 6.0
> (It's currently merged as 7de2e8565335c13fb3516cddbe2e40e366cce273 ).
> Although you'll probably also want the missing dependency fix
> Philippe is working (See: 
> Mathieu- ( 42) [RFC PATCH] migration: Add missing dependency on GNUTLS )


Current master does not compile for me anymore (on macOS) due to this
change. Can we please either disable yank support and revert this patch,
pick the GNUTLS dependency patch you refer to quickly and work on a real
fix afterwards or get the proposed fix in the "missing dependency on
GNUTLS" discussion done quickly?

Having a broken tree is going to make bisection super painful later.


Alex



