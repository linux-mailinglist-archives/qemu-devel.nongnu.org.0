Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA78F2E0983
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 12:24:16 +0100 (CET)
Received: from localhost ([::1]:47726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfm3-0004nt-Ni
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 06:24:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfky-0004Ik-Ew
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:23:08 -0500
Received: from mail-oln040092254066.outbound.protection.outlook.com
 ([40.92.254.66]:37952 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfkw-0003Ja-MK
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:23:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SwO060kq40QejS0yK23XSKodCMDB5gk1Y/+KZc35C3nGoqJVYJcRe2GprRUw+W1a16vrs9yexW+lHKI/7XbpD56QMMfnj+LVP5kqJvURd9j0h1OcXCrgo4VCFRmsRUB76BUOVOdMUAnzMeWpwEPojvubQQdJCEDdw2W5zbm4YhU4iTNMxC6Q2PojFPTicgzgxE1alX4C2KCKW944EicparmrchW9k35x48teK6Kuf/ArlTYl0yylTpS/bRsZrcB+D5kV+p3mC7XY3S901oW4WikamGP+cDca6FjeOUrUFdRgf2R/C/gyiBRkvpxrd6EujKHFam0mIKTDf2K3USDb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+vBAnvFrwQooYomRRe4w3GCMsMly0M8VlPsdEoghQM=;
 b=dCUmf/haey086MFx3qEZJQEPLWTTVffPVgfIsN1uTFiXzXhLf94Pf0rBry7MoCcPT5uB6Fcg9C9H4uW8i+AKM2LRM+UI4odJyR5lP5C4S7FOEDgEKL6KpbmSyPI89zr8iFcmZ/HYBP0WvvyEV0PWwPB/+RqwiVixsSE2WQdInjTFjPyS3fG2Z2a65sanT0aW84EFqKtW8MrVpiwHX3rKphMoNXtChoq87Pn6OX097mNLxiYMxCiVYmwCSHqEcxs9hmQW5mFHsJjjxeOVi5W370xgZg5IwcCQL8gRzDRxO7G6T9cuIUG89T2FIr3hPdOlkPNjqMfqz92719sckC2sIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+vBAnvFrwQooYomRRe4w3GCMsMly0M8VlPsdEoghQM=;
 b=Xn1qqZtqJgznjx1kAaPngfeAV0sCSO1Per8VGbIOid2kRUKTQ75lpxaoyJpIAysclR94dm+F6pNtluul9BQOZDK0F+5IRsQnWqYUIqyTkUtHEXD0NKlVNrrd/25LN6GGamKlMMuiuWBz6LCV5UaglI+cXFWdLzgMWlvR1BO+ZyvjlPExQtlpQKe8AbVGJm9WXgevqTSPEqIgf6/ShIHwL8lfQBYEsIND+it5SGaW+AcEAAYKXW0OubMxlHgliwJCYp5tQ5YYILFxnUEj54sgJQuEIo8Cp9M9btwjDEmN9Dt8E9ejk1mn6Os+gD6CjzdvSLmEwuHHyvptKQZ82DJapA==
Received: from PU1APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::4f) by
 PU1APC01HT208.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::188)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Tue, 22 Dec
 2020 11:22:55 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::42)
 by PU1APC01FT044.mail.protection.outlook.com
 (2a01:111:e400:7ebe::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Tue, 22 Dec 2020 11:22:54 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:2D5E95E677D4B194301AEFADEAE7F3F90D4E77E74D147B06439F9D543129A773;
 UpperCasedChecksum:98AB6A953BE12D2C14F949C107DD5A4D1B83991A024EA9C6FA1B87563B11871A;
 SizeAsReceived:8831; Count:47
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 11:22:54 +0000
Message-ID: <SYYP282MB150122E885AC35FD9E63E851FCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 4/4] fuzz: delay IO until they can't trigger the crash
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Tue, 22 Dec 2020 19:22:45 +0800
In-Reply-To: <20201221211704.qiai5j75fmcqrueo@mozz.bu.edu>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB14920C8592A1D04D4A5685D9FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <20201221211704.qiai5j75fmcqrueo@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [yjJClbkJq6H10BWA2mi4gWCwS+gTC+hq]
X-ClientProxiedBy: OSAPR01CA0306.jpnprd01.prod.outlook.com
 (2603:1096:604:2c::30) To SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:da::15)
X-Microsoft-Original-Message-ID: <36fbd985d54468def88409bbed4f852277e7e307.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (204.124.180.84) by
 OSAPR01CA0306.jpnprd01.prod.outlook.com (2603:1096:604:2c::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Tue, 22 Dec 2020 11:22:51 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 4bebe4a1-12fb-440d-3a62-08d8a66bed25
X-MS-TrafficTypeDiagnostic: PU1APC01HT208:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YLLfEwtFtvqag/NT4HwOF9K4M5EU3+P6hjPMtyvR8S10rAQTao6O+dBO1Jt9bSYYDv35xWD2uScFBNNrP2WkvGiZE+wacCK9pdz2RKXYKGxxsgiVAhXjYZbGRX8pnlKIKayCRwGe4uKhHvB0+EPzfVljGUmBOIS14yBKURg6ZcfpAiuXPzGWVM3MjmEBX8h6s/xPQS87ZjfARuvwD+kGQKzdLzYB0/jJrn/ODCZVSd5MCLNCjJDaaCQl1WxMhMiB
X-MS-Exchange-AntiSpam-MessageData: gFFcLf+DxQ6fxgBK11YgwEDvo/2Ci9Sgm2u+CFZ7rbLAVNt37ZObxAiFQIYlL16yuAT5sskTJpbHaY8Jjd/HXwVXUpogxrqm+n1BQK8OKxwSCTEAB5sVZAxr1z2l5LYYEh6XMLZJLbT9DfAmuhsj9g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 11:22:54.2888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bebe4a1-12fb-440d-3a62-08d8a66bed25
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT208
Received-SPF: pass client-ip=40.92.254.66; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, darren.kenny@oracle.com,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-12-21 at 16:17 -0500, Alexander Bulekov wrote:
> On 201220 0256, Qiuhao Li wrote:
> > Since programmers usually trigger an IO just before they need it.
> > Try to
> > delay some IO instructions may help us better understanding the
> > timing
> > context when debug.
> > 
> > Tested with Bug 1908062. Refined vs. Original result:
> > 
> > outl 0xcf8 0x8000081c            outl 0xcf8 0x0
> > outb 0xcfc 0xc3                | outl 0xcf8 0x8000081c
> > outl 0xcf8 0x80000804          | outb 0xcfc 0xc3
> > outl 0xcfc 0x10000006          | outl 0xcf8 0x80000804
> > write 0xc300001028 0x1 0x5a    | outl 0xcfc 0x10000006
> > write 0xc300001024 0x2 0x10    | write 0xc300001028 0x1 0x5a
> > write 0xc30000101c 0x1 0x01    | writel 0xc30000100c 0x2a6f6c63
> > write 0xc300003002 0x1 0x0     v write 0xc300001024 0x2 0x10
> > write 0x5c 0x1 0x10              write 0xc30000101c 0x1 0x01
> > writel 0xc30000100c 0x2a6f6c63   write 0xc300001018 0x1 0x80
> > write 0xc300001018 0x1 0x80      write 0x5c 0x1 0x10
> > outl 0xcf8 0x0                   write 0xc300003002 0x1 0x0
> > 
> 
> In this example, I can remove the outl 0xcf8 0x0, and I still see the
> crash, so maybe the 1st step in the minimizer is failing somewhere.. 

I think it might because of our one-time scan and remove strategy,
which is not suitable for timing dependent instructions.

For example, instruction A will indicate an address where the config
chunk locates, and instruction B will make the configuration active. If
we have the following instruction sequence:

...
A1
B1
A2
B2
...

A2 and B2 are the actual instructions that trigger the bug.

If we scan from top to bottom, after we remove A1, the behavior of B1
might be unknowable, including not to crash the program. But we will
successfully remove B1 later cause A2 and B2 will crash the process
anyway:

...
A1
A2
B2
...

Now one more trimming will remove A1.

As for the example I gave, the instructions before the delaying
minimizer are like this:

outl 0xcf8 0x8000081c
outb 0xcfc 0xc3
outl 0xcf8 0x0                <--- The A instruction, didn't be removed
(outl 0xcfc 0x0)              <--- The B instruction, removed
outl 0xcf8 0x80000804
outl 0xcfc 0x10000006
write 0xc300001024 0x2 0x10
write 0xc300001028 0x1 0x5a
write 0xc30000101c 0x1 0x01
writel 0xc30000100c 0x2a6f6c63
write 0xc300001018 0x1 0x80
write 0x5c 0x1 0x10
write 0xc300003002 0x1 0x0

If we run the remove minimizer again, The A instruction outl 0xcf8 0x0
will be removed.

Since we only remove instructions, this iterative algorithm is
converging. Maybe we can keep removing the trace until the
len(newtrace) become unchanged.

> 
> Is the Refined one better? To me the original one read as:
> "Do a bunch of PCI configuration to map an MMIO BAR, then interact
> with
> the MMIO range and trigger some DMA activity". I also know exactly
> the
> line that will trigger the DMA activity and access 0x5c. With the
> refined one, I'm not so sure. Which line now causes the DMA read from
> 0x5c? writel 0xc30000100c? write 0xc300001018?
> Is there another example where this type of reordering makes the
> result
> easier to read?
> 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 21
> > +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > index f3e88064c4..da7aa73b3c 100755
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > @@ -214,6 +214,27 @@ def minimize_trace(inpath, outpath):
> >  
> >      assert(check_if_trace_crashes(newtrace, outpath))
> >  
> > +    # delay IO instructions until they can't trigger the crash
> > +    # Note: O(n^2) and many timeouts, kinda slow
> 
> Maybe do a binary search instead of a linear scan for the optimal
> position
> to save some time?
> Also, if you re-run this multiple times, you can end up with
> different
> results, since some lines might not really be tied to a position
> (e.g.
> the outl cf8 0x0 in your example). Maybe it's not a problem, but i'm
> still not sure that this is making the result easier to read.
> -Alex

I'm not familiar with the PCI configuration and DMA mechanism in QEMU.
This patch is just random thinking based on empiricism. Maybe I should
add the "RFC" tag :). In version 2, I won't post this patch.

BTW, may I ask where I can learn about these IO emulations? How do you
know the address corresponding to the PCI bar and DMA?

> 
> > +    i = len(newtrace) - 1
> > +    while i >= 0:
> > +        tmp_i = newtrace[i]
> > +        if len(tmp_i) < 2:
> > +            i -= 1
> > +            continue
> > +        print("Delaying ", newtrace[i])
> > +        for j in reversed(range(i+1, len(newtrace)+1)):
> > +            newtrace.insert(j, tmp_i)
> > +            del newtrace[i]
> > +            if check_if_trace_crashes(newtrace, outpath):
> > +                break
> > +            newtrace.insert(i, tmp_i)
> > +            del newtrace[j]
> > +        i -= 1
> > +
> > +    assert(check_if_trace_crashes(newtrace, outpath))
> > +    # maybe another removing round
> > +
> >  
> >  if __name__ == '__main__':
> >      if len(sys.argv) < 3:
> > -- 
> > 2.25.1
> > 


