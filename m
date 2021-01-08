Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A142EECC1
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 06:00:24 +0100 (CET)
Received: from localhost ([::1]:60300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxjst-0002TD-BQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 00:00:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxjQi-0000pv-9c
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:31:17 -0500
Received: from relay64.bu.edu ([128.197.228.104]:50285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1kxjQg-00067J-OH
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 23:31:15 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 1084U8Yb010599
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 7 Jan 2021 23:30:11 -0500
Date: Thu, 7 Jan 2021 23:30:08 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH v5 0/7] fuzz: improve crash case minimization
Message-ID: <20210108043008.nqo3dssgduwjuyar@mozz.bu.edu>
References: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MEAPR01MB349464ED835FE8243FB09100FCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Qiuhao,
Can you add my Reviewed-by: tags to the patches that I have reviewed?
Thanks
-Alex

On 210108 1044, Qiuhao Li wrote:
> Extend and refine the crash case minimization process.
> 
> Test input:
>   Bug 1909261 full_reproducer
>   6500 QTest instructions (write mostly)
> 
> Refined (-M1 minimization level) vs. Original version:
>   real  38m31.942s  <-- real  532m57.192s
>   user  28m18.188s  <-- user  89m0.536s
>   sys   12m42.239s  <-- sys   50m33.074s
>   2558 instructions <-- 2846 instructions
> 
> Test Enviroment:
>   i7-8550U, 16GB LPDDR3, SSD 
>   Ubuntu 20.04.1 5.4.0-58-generic x86_64
>   Python 3.8.5
> 
> v5:
>   Fix: send SIGKILL on timeout
>   Fix: rename minimization functions
> 
> v4:
>   Fix: messy diff in [PATCH v3 4/7]
> 
> v3:
>   Fix: checkpatch.pl errors
> 
> v2: 
>   New: [PATCH v2 1/7]
>   New: [PATCH v2 2/7]
>   New: [PATCH v2 4/7]
>   New: [PATCH v2 6/7]
>   New: [PATCH v2 7/7]
>   Fix: [PATCH 2/4] split using binary approach
>   Fix: [PATCH 3/4] typo in comments
>   Discard: [PATCH 1/4] the hardcoded regex match for crash detection
>   Discard: [PATCH 4/4] the delaying minimizer
>   
> Thanks for the suggestions from:
>   Alexander Bulekov
> 
> Qiuhao Li (7):
>   fuzz: accelerate non-crash detection
>   fuzz: double the IOs to remove for every loop
>   fuzz: split write operand using binary approach
>   fuzz: remove IO commands iteratively
>   fuzz: set bits in operand of write/out to zero
>   fuzz: add minimization options
>   fuzz: heuristic split write based on past IOs
> 
>  scripts/oss-fuzz/minimize_qtest_trace.py | 257 ++++++++++++++++++-----
>  1 file changed, 210 insertions(+), 47 deletions(-)
> 
> -- 
> 2.25.1
> 

