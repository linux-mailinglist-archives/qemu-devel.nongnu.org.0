Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 084DF2C47AA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:31:54 +0100 (CET)
Received: from localhost ([::1]:55226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khza2-0002MZ-0z
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1khzYH-0001og-Jm
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:30:01 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:60358
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1khzYG-0001eE-2e
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:30:01 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id A00BE122C6D; Wed, 25 Nov 2020 10:29:58 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 63BBE122C3F;
 Wed, 25 Nov 2020 10:29:54 -0800 (PST)
Date: Wed, 25 Nov 2020 10:29:52 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
Message-ID: <20201125182952.3zxnokjnofqs3xdy@mail.bwidawsk.net>
References: <20201111054724.794888-1-ben.widawsky@intel.com>
 <20201116172107.00005ad9@Huawei.com>
 <20201116180626.g7swvwu5jhgzwc6o@intel.com>
 <20201117140914.000076d1@Huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117140914.000076d1@Huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.4,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Vishal Verma <vishal.l.verma@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20-11-17 14:09:14, Jonathan Cameron wrote:

[snip]

> 
> Agreed, it was the intermediate state that I wasn't keen on of structures defined
> but then given 0 size.  I'd rather just look at them all once.  If that sometimes
> means introducing a file that isn't even referenced for a few patches, that's
> fine by me.

I've pushed v2 which hopefully addressed most of the feedback from you (it also
should fix some of the BIOS table failures from v1). My next plan is to
implement a few more firmware commands, and work on supporting interleaving
using the work from Phil. I will repost to the list after that.

https://gitlab.com/bwidawsk/qemu/-/tree/cxl-2.0v2

