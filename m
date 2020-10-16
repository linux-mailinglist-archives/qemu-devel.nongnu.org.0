Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C207C2907B2
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Oct 2020 16:48:53 +0200 (CEST)
Received: from localhost ([::1]:38394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kTR2K-0003it-IF
	for lists+qemu-devel@lfdr.de; Fri, 16 Oct 2020 10:48:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kTQyv-0001cg-DH
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 10:45:25 -0400
Received: from relay68.bu.edu ([128.197.228.73]:54008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kTQyr-0002ML-IV
 for qemu-devel@nongnu.org; Fri, 16 Oct 2020 10:45:19 -0400
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 09GEiCS4026878
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 16 Oct 2020 10:44:16 -0400
Date: Fri, 16 Oct 2020 10:44:11 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 14/16] fuzz: add general-fuzz configs for oss-fuzz
Message-ID: <20201016144411.crtfqld45t5slzei@mozz.bu.edu>
References: <20201015134137.205958-1-alxndr@bu.edu>
 <20201015134137.205958-15-alxndr@bu.edu>
 <beac36ec-1e23-6118-ce9c-ce5b19ac2394@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <beac36ec-1e23-6118-ce9c-ce5b19ac2394@redhat.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/16 10:45:14
X-ACL-Warn: Detected OS   = Linux 2.6.x
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
 qemu-devel@nongnu.org, f4bug@amsat.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, dimastep@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 201016 1532, Paolo Bonzini wrote:
> On 15/10/20 15:41, Alexander Bulekov wrote:
> > +typedef struct general_fuzz_config {
> > +    const char *name, *args, *objects;
> > +} general_fuzz_config;
> > +
> > +GArray *get_general_fuzz_configs(void);
> 
> Can't it be even a "const struct general_fuzz_config
> general_fuzz_configs[] = ..." instead of a GArray?  Not a huge
> difference, but still.
> 

Now that I think about it, I don't see why not.. I'll send a v5 soon.
-Alex

> Paolo
> 

