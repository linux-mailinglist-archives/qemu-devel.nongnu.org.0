Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DBBC2FD2A4
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:33:05 +0100 (CET)
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EXg-0007eb-Jt
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2EWi-0007CN-9Q
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:32:04 -0500
Received: from relay64.bu.edu ([128.197.228.104]:58603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2EWg-0000Po-Kc
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:32:03 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10KEUhgt027673
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 20 Jan 2021 09:30:47 -0500
Date: Wed, 20 Jan 2021 09:30:43 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] fuzz: refine the ide/ahci fuzzer configs
Message-ID: <20210120143043.aic5t4iwcxqr5piv@mozz.bu.edu>
References: <20210120060745.558970-1-alxndr@bu.edu>
 <f404e320-5ae7-d01d-bce7-88add14700dc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f404e320-5ae7-d01d-bce7-88add14700dc@redhat.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210120 1003, Philippe Mathieu-Daudé wrote:
> On 1/20/21 7:07 AM, Alexander Bulekov wrote:
> > Disks work differently depending on the x86 machine type (SATA vs PATA).
> > Additionally, we should fuzz the atapi code paths, which might contain
> > vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> > cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> > machine types.
> 
> Yet another point for using qgraph generated configs ;)
> 
Yes. Though in this particular case, ahci-test.c and ide-test.c still
do their own disk setup, and -drive arguments. I don't think PATA is
built out within libqos at all, yet.

