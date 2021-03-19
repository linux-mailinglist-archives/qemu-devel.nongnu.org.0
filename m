Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D155342070
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:03:02 +0100 (CET)
Received: from localhost ([::1]:35516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNGeT-0003t5-9w
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:03:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lNGVF-0004cG-JY; Fri, 19 Mar 2021 10:53:32 -0400
Received: from relay68.bu.edu ([128.197.228.73]:54022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1lNGVC-0004Fe-QY; Fri, 19 Mar 2021 10:53:29 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 12JEq9uC028422
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Mar 2021 10:52:13 -0400
Date: Fri, 19 Mar 2021 10:52:09 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 1/2] floppy: add a regression test for CVE-2020-25741
Message-ID: <20210319145209.xw63h62mgkxyafpb@mozz.bu.edu>
References: <20200827113806.1850687-1-ppandit@redhat.com>
 <20210319050906.14875-1-alxndr@bu.edu>
 <87lfajsn7w.fsf@dusky.pond.sub.org>
 <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a572879-02d6-d525-627c-892bd3903c25@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-block@nongnu.org, Li Qiang <liq3ea@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210319 1026, Paolo Bonzini wrote:
> On 19/03/21 06:53, Markus Armbruster wrote:
> > I guess this is a reproducer.  Please also describe actual and expected
> > result.  Same for PATCH 2.
> 
> Isn't it in the patch itself?
> 
> Alexander, I think these reproducers are self-contained enough (no writes to
> PCI configuration space to set up the device) that we can place them in
> fdc-test.c.
> 

Will do
-Alex

> Paolo
> 

