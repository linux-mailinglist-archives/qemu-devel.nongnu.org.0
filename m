Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1469E2E097B
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 12:22:10 +0100 (CET)
Received: from localhost ([::1]:43358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfk0-0002x7-JG
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 06:22:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfio-0002W6-Fs
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:20:54 -0500
Received: from mail-oln040092255045.outbound.protection.outlook.com
 ([40.92.255.45]:30144 helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfik-0002a3-MJ
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:20:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXkIdpBbQG1xsXaL3Y0w/8DqD+OnjqZNLFXyq6dedZ0wo5vzP5QxImg3zeadDb1DlVX1LuFSMn/0UH4vKJT5irdfhNVFj2rF+vWvEt/+tN7Md9jwl60rDcNo8ue6FcjcwsWEpXSNyNIOJFAqpIRsVMhc2dkm2PBVexbgyO/zD2RZ5So4OK/2z263ps9HFNluA0GC+fRXGYtsJJryTRuaAto97grsgXHhy+iLJVAl+tm6Ucng7vYaIVaFvqG87GR5tlFdp3hXxXfMPDUs+Y4stG6BZNg4ob4vpy5RPRhEqcx9KVzMyhOaPxK2V+28ykJq19O/3rJ7cozjT5LJ49jpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWxwLcZ4J6CEmPezP1WSwYrEPsZToEb6GgAFmIo6du8=;
 b=SaKYFW4IHd77PIyCyihx55BheBxS5t/Gr7cAQlrNJ3Jhxfv7WVXliGlv7qJ7PGN/CzF7m6UsV/Q/JbnwUxpIdjhCXZ7YfEf+vfALHAmOxtX6EKJc3K4K/M1B/5rBivk9m5iZR47cdRG3sWCO3u6wVjrDjQlLCcyT8sdgTkeqPPLzIrKy+On9VPNPYUYKbKBlWJVdLpYGReUBbczrx2D5j5Xnxq0q46KqRu8b3N9ZvuUi7bCqfRhhRBKbGaFtw3FmzyV3eV7VLone8qDAFJeaqqwqSK3R7uhIgBstp3vAIWgiI6bpCGJd+l2DNT6J/uq7o2tixOjQfLPox82prQNljQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pWxwLcZ4J6CEmPezP1WSwYrEPsZToEb6GgAFmIo6du8=;
 b=Q8QC4Ph8o/kEEW/Kf6qMo0oaoND1+4jSyEchNce1AvZ+5xcSVVW6ajDn/PbEH4w+zQg0ttycSTO31R7xFgZHTOb+nEzPnRIqO4Rtsv34PJVNZDbmV1VX1OE709/f+u/bIqhrLcCIUb73zIR7QkNdC9Wa0faQDCggQoNAPz/hYZHojV46KX5mRscLDKKOXrO7vWgDc2ELpOfGEk47ZxYeJVF1D+SqF6V8yZFYj+bg7m3Gw6ygEbhEYPrOf8TNYMO/palshbJOrg4TIduGnvof5yByXbZ9vfMG6HtiAL/jPgTb7f6wtppk9SAzCrOY4rUkVrtJ/W4lg+C8YQ0CZWRksg==
Received: from PU1APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::47) by
 PU1APC01HT116.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::365)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Tue, 22 Dec
 2020 11:20:43 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::42)
 by PU1APC01FT044.mail.protection.outlook.com
 (2a01:111:e400:7ebe::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Tue, 22 Dec 2020 11:20:43 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D1B150F53F46F9C19EB081379205B4953D7504162D68F45599BCE572481FEB90;
 UpperCasedChecksum:709DE1312A8519168956FC1FC46930F7E2E18D1C7702677AA9BBEA95278268DC;
 SizeAsReceived:8802; Count:47
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 11:20:43 +0000
Message-ID: <SYYP282MB15010A7D93C3D85E2438B808FCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 2/4] fuzz: split QTest writes from the rightmost byte
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org
Date: Tue, 22 Dec 2020 19:20:34 +0800
In-Reply-To: <87r1nj3p4j.fsf@stormtrooper.vrmnet>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB1492172012FA8E0D08819C07FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <87r1nj3p4j.fsf@stormtrooper.vrmnet>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [wE4wmwVAZ+Y2jCWyQsR0dpX47da2hVqd]
X-ClientProxiedBy: OSAPR01CA0319.jpnprd01.prod.outlook.com
 (2603:1096:604:2a::19) To SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:da::15)
X-Microsoft-Original-Message-ID: <e1d6da7f4c5362d06f1de7391f2d82e5d5842cfc.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (204.124.180.84) by
 OSAPR01CA0319.jpnprd01.prod.outlook.com (2603:1096:604:2a::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Tue, 22 Dec 2020 11:20:40 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fd9aadba-be62-4d3d-c588-08d8a66b9f48
X-MS-TrafficTypeDiagnostic: PU1APC01HT116:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b0hkVoPsT6qmpxagFo1T0VOB2//gkWIxBhr0x13Qgvs7D2IbNgizXNGomTjrmkdatpqIF5+iJ2BYhX4ff4PufAtFdvtj3LLNxzrodupjqPvfSKcalQE/0GlCjiqbm2fTiBUcc1WojSTRXkVUImbov6XgmFVmIW5NlO1LQgqw6cfPdlB/z0XzqFTVlGpYJmws5c1M8UHeZ3qrN71nrYys9Xh7SZjeP80K+yBAkusszB5jPmf84LOazQASmrbiQ79j
X-MS-Exchange-AntiSpam-MessageData: 6w1ALrqk33lxqvUQGS4VaDvFsilx0Dv1FjyrBScrVczq3nbAxPeMm1ouKHEEmSkEGgyf6BnGRxkdxBdt05DqRoab9FBWxom+YFtEUf12D7eB9jW028Ppy4Mp9X0GCqa6nc6h4/p4dCQqbOAhKVL9qQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 11:20:43.6634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: fd9aadba-be62-4d3d-c588-08d8a66b9f48
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT116
Received-SPF: pass client-ip=40.92.255.45; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-HK2-obe.outbound.protection.outlook.com
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
Cc: darren.kenny@oracle.com, bsd@redhat.com, thuth@redhat.com,
 stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-12-21 at 15:01 -0500, Alexander Bulekov wrote:
> Qiuhao Li <Qiuhao.Li@outlook.com> writes:
> 
> > Currently, we split the write commands' data from the middle. If it
> > does not
> > work, try to move the pivot "left" and retry until there is no
> > space left.
> > But, this is complete for ram writes but not for IO writes.
> > 
> > For example, there is an IO write command:
> > 
> >   write addr uuxxxxuu
> > 
> > u is the unnecessary byte for the crash. Unlike ram write commands,
> > in most
> > case, a split IO write won't trigger the same crash, So if we split
> > from the
> > middle, we will get:
> > 
> >   write addr uu (will be removed in next round)
> >   write addr xxxxuu
> > 
> > For xxxxuu, since split it from the middle and retry to the
> > leftmost byte
> > won't get the same crash, we will be stopped from removing the last
> > two
> > bytes.
> > 
> 
> Good catch! I missed this case.
> 
> > Therefore, we should split QTest writes from the rightmost byte.
> > 
> > Tested with Bug 1908062. Refined vs. Original result:
> > 
> > outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
> > outb 0xcfc 0xc3                  outb 0xcfc 0xc3
> > outl 0xcf8 0x8000082f            outl 0xcf8 0x8000082f
> > outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
> > outl 0xcfc 0x9b2765be            outl 0xcfc 0x9b2765be
> > write 0xc300001024 0x2 0x0055    write 0xc300001024 0x2 0x0055
> > write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
> > write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
> > writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
> > write 0xc300001018 0x1 0xa4  <-- write 0xc300001016 0x3 0xa4a4a4
> > write 0x5c 0x1 0x19              write 0x5c 0x1 0x19
> > write 0xc300003002 0x1 0x8a      write 0xc300003002 0x1 0x8a
> > 
> 
> Can we wrap-around to the right when we hit the end of the input on
> the
> left, instead of going byte-by-byte? Otherwise, i think we would need
> O(n) operations to reach the leftmost in a write, rather than
> O(logN).
> 
> i.e.
> xxxxuu ->
> xxx xuu ->
> xx xxuu ->
> x xxxuu ->
> xxxxu u
> 
> I think the case where we would need to wrap around the entire input
> usually happens for smaller writes, so it shouldn't slow the
> minimizer
> down too much
> 
> -Alex

If we want to achieve O(logN), should we change the step size besides
using a wrap-around strategy?

@@ -164,8 +164,8 @@ def minimize_trace(inpath, outpath):
                     if check_if_trace_crashes(newtrace, outpath):
                         break
                     else:
-                        leftlength -= 1
-                        rightlength += 1
+                        leftlength -= leftlength/2
+                        rightlength = length - leftlength


And how about using a binary search directly? Like:


        binary_search(newtrace, i,leftlen=1, len)

               base case: leftlen >= len


                        xxxxuu len=6
                             +
                             |
                             +
                      xxx,xuu  (1+6)/2=3
                             +
              +--------------+-------------+
              |                            |
              +                            +
       xx,xxuu (1+3)/2=2            xxxx,uu (3+6)/2=4
              +                       success
              |
       +------+--------------+
       |                     |
       |                     |
       +                     +
x,xxxuu (1+2)/2=1     xx,xxuu (2+3)/2=2
     base case            base case
> 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > index d3b09e6567..855c3bcb54 100755
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > @@ -140,7 +140,7 @@ def minimize_trace(inpath, outpath):
> > 
> >          # 3.) If it is a qtest write command: write addr len data,
> > try to split
> >          # it into two separate write commands. If splitting the
> > write down the
> > -        # middle does not work, try to move the pivot "left" and
> > retry, until
> > +        # rightmost does not work, try to move the pivot "left"
> > and retry, until
> >          # there is no space left. The idea is to prune
> > unneccessary bytes from
> >          # long writes, while accommodating arbitrary MemoryRegion
> > access sizes
> >          # and alignments.
> > @@ -149,7 +149,7 @@ def minimize_trace(inpath, outpath):
> >              length = int(newtrace[i].split()[2], 16)
> >              data = newtrace[i].split()[3][2:]
> >              if length > 1:
> > -                leftlength = int(length/2)
> > +                leftlength = length - 1
> >                  rightlength = length - leftlength
> >                  newtrace.insert(i+1, "")
> >                  while leftlength > 0:
> > --
> > 2.25.1


