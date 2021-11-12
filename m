Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D298644EB64
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 17:30:59 +0100 (CET)
Received: from localhost ([::1]:53726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlZS6-0001Mc-TW
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 11:30:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlZPj-0000JM-PX; Fri, 12 Nov 2021 11:28:31 -0500
Received: from [201.28.113.2] (port=43476 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1mlZPg-0000ro-Pw; Fri, 12 Nov 2021 11:28:30 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 12 Nov 2021 13:28:23 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTP id 6561880009B;
 Fri, 12 Nov 2021 13:28:23 -0300 (-03)
Subject: Re: Fwd: New Defects reported by Coverity Scan for QEMU
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 QEMU Developers <qemu-devel@nongnu.org>, QEMU PowerPC <qemu-ppc@nongnu.org>
References: <618af1a42c458_27197b2b2515bd79b8920c6@prd-scan-dashboard-0.mail>
 <9db2efb6-5161-6c17-f7aa-4d8b7e1aba98@kaod.org>
From: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>
Message-ID: <92434193-3727-8994-9ebd-b823665aa90a@eldorado.org.br>
Date: Fri, 12 Nov 2021 13:28:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <9db2efb6-5161-6c17-f7aa-4d8b7e1aba98@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Nov 2021 16:28:23.0650 (UTC)
 FILETIME=[500F9C20:01D7D7E2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.449,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/11/2021 05:18, Cédric Le Goater wrote:
> Hello Luis,
> 
> Coverity found a couple of issues which seem related to the DFP patchset.
> Could you please take a look ?
> 
> Thanks,
> 
> C.
> 
> 
> -------- Forwarded Message --------
> Subject: New Defects reported by Coverity Scan for QEMU
> Date: Tue, 9 Nov 2021 22:09:40 +0000
> From: scan-admin@coverity.com
> To: clg@kaod.org
> 
> Hi,
> 
> Please find the latest report on new defect(s) introduced to QEMU found 
> with Coverity Scan.
> 
> 16 new defect(s) introduced to QEMU found with Coverity Scan.
> 19 defect(s), reported by Coverity Scan earlier, were marked fixed in 
> the recent build analyzed by Coverity Scan.
> 
> New defect(s) Reported-by: Coverity Scan
> Showing 16 of 16 defect(s)
> 
> 
> ** CID 1465791:  Uninitialized variables  (UNINIT)
> 
> 
> ________________________________________________________________________________________________________ 
> 
> *** CID 1465791:  Uninitialized variables  (UNINIT)
> /qemu/target/ppc/dfp_helper.c: 1202 in helper_DENBCD()
> 1196         
> }                                                                        \
> 1197         
> dfp_finalize_decimal##size(&dfp);                                        \
> 1198         
> dfp_set_FPRF_from_FRT(&dfp);                                             \
> 1199         set_dfp##size(t, 
> &dfp.vt);                                               \
> 1200     }
> 1201
>>>>     CID 1465791:  Uninitialized variables  (UNINIT)
>>>>     Using uninitialized element of array "dfp.vt" when calling 
>>>> "set_dfp64".
> 1202     DFP_HELPER_ENBCD(DENBCD, 64)
> 1203     DFP_HELPER_ENBCD(DENBCDQ, 128)

Hi Cédric,

The only change was the helper name that is now uppercase, so nothing 
new here. The underlying cause is that dfp_finalize_decimal64 only sets 
dfp->vt.VsrD(1) and set_dfp64 receives a pointer to the complete struct.

But since set_dfp64 also only access VsrD(1), it shouldn't be a real 
problem AFAICT. The same applies to CID 1465776~1465786 and 1465788~1465790.

> ** CID 1465787:    (BAD_SHIFT)
> /qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 356 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 370 in helper_CFUGED()
> /qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
> 
> 
> ________________________________________________________________________________________________________ 
> 
> *** CID 1465787:    (BAD_SHIFT)
> /qemu/target/ppc/int_helper.c: 369 in helper_CFUGED()
> 363             /*
> 364              * Discards the processed bits from 'src' and 'mask'. 
> Note that we are
> 365              * removing 'n' trailing zeros from 'mask', but the 
> logical shift will
> 366              * add 'n' leading zeros back, so the population count 
> of 'mask' is kept
> 367              * the same.
> 368              */
>>>>     CID 1465787:    (BAD_SHIFT)
>>>>     In expression "src >>= n", right shifting by more than 63 bits 
>>>> has undefined behavior.  The shift amount, "n", is as much as 64.

Similar case here, the helper was just renamed. The value of "n" comes 
from ctz64(mask) and mask == 0 is a trivial case handled before anything 
else.

Thanks,
Matheus K. Ferst
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br/>
Analista de Software
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

