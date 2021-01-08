Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031B2EEB77
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 03:49:49 +0100 (CET)
Received: from localhost ([::1]:53088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxhqV-0003b5-VJ
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 21:49:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxhp1-00038Y-55
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:48:15 -0500
Received: from mail-oln040092254106.outbound.protection.outlook.com
 ([40.92.254.106]:13536 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kxhoy-0004Ki-6d
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 21:48:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X42ecu0SKrlgfQjlX0tCqf4GD973c9MuMnNUg0iA+9eHCYx2UjGbQwcq1teGuTYJ8zRniB5vLqxIhAjSrrtMlhJjIj+ubweSp/5PeLc2MnAVjB5o/H/DAwNb2FSoMsbt6if1x6fT/L0nyolhrd+7q8RbC6Y94LwztkxfzBZERIiBTkqAJMENuEbP8GsjB0LOX9pXX6QqMaJ/UcZB/jJL1V3oorFsVK2IVjmfRjzAYVp0T35YDGRUamjGlrnJCGrzx6u18mrY9rG1jMMJ/gRq9CyZPG7g2jzZCpx27D+pSanrfa8sSsLAuVige8Gg1z+RX7gV8aJ7zGL6glGODqjPQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrcIVPlMJ9+fyX/FGVwl8zsExB2sNKDq14yZleHBjVA=;
 b=cz86wh3LUbmXd0eSXc3tbYZkcvsR61dfXOLBjDT7nQ6SenZWhW/NK7bduBjLtWqmbIS33ijw/3jXtz3W0haSSzhN7LYw4TMZXCYHhCFZWBoCDQ2G7m1nJgr0/cF1JNWo2Rfu9LY/4YUsA7xf6dQrVctDn2bxpMiLsZj0bNWKA84hog68PKbrN2L2prqpd/4EmvpDRMRNFeDH//HT2jT1sIgF8ufKxaw9PEUshhRoyBqPoSwXBNdf3p+SOybu32VrMZUlYcrKw3we9gQBNt5aBStOczIA3YHlJNUcQdYfPHv9bpQ+gjBdofbgVo0o0WXmmugsxvoGunr8inQ79oRxaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XrcIVPlMJ9+fyX/FGVwl8zsExB2sNKDq14yZleHBjVA=;
 b=bbg5p1SzQmzzQiVK9ttKmOohjhnTaSV1F+Q5kLL5AxpURnI29y5UpFoAA98RywTSTmvRgkS/Kf8Uq1BGOfpXFikM6GNMdRMYEVqk6ipoQN3N2ylwzoduEdJzFZHWt60HTyPYKMThOaywtZ5h2jGMlkCkAEX27mC8y3f8+aHD5MQq6+UoYaqgk9/ZMpAlN+L9/RzUhYUXq+sJnoN4D89G9oOoZOq2iwzo7ChoIdr1vSDU5QbqNsreokgmA1UM21qtKdxTpOBIH0YLB3O2ZhSkvndj8Oa06AolOpsmuL/8KQW1JxTpxR9aQOMEZtMLF96dtxi73eSyESPgnIpu5E8kaw==
Received: from HK2APC01FT029.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::4d) by
 HK2APC01HT078.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::332)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 02:48:02 +0000
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4b) by HK2APC01FT029.mail.protection.outlook.com
 (2a01:111:e400:7ebc::195) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24 via Frontend
 Transport; Fri, 8 Jan 2021 02:48:01 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:07BA07119D08A6DA62FCC5F30663562EE8D2F13635142D140546A21EAF47037C;
 UpperCasedChecksum:50204B1A11E4DAA4014863E50ABFC91A356388ACB8F741CD7A69F22D6FAEA2F0;
 SizeAsReceived:8813; Count:47
Received: from MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50]) by MEAPR01MB3494.ausprd01.prod.outlook.com
 ([fe80::2d4d:a683:7f83:cf50%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 02:48:01 +0000
Message-ID: <MEAPR01MB3494AC8CFE790CB7A4A94B4CFCAE0@MEAPR01MB3494.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v4 1/7] fuzz: accelerate non-crash detection
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Fri, 08 Jan 2021 10:47:35 +0800
In-Reply-To: <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174544643E941EFC9EAA2287FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [CZ7s0dlya4b0pH67nwZbEk3n/Ok+g2hi]
X-ClientProxiedBy: AM0PR06CA0113.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::18) To MEAPR01MB3494.ausprd01.prod.outlook.com
 (2603:10c6:201:39::11)
X-Microsoft-Original-Message-ID: <1739809f5be68bebc9ffea0d8774d49b51f891d5.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.193.8.207) by
 AM0PR06CA0113.eurprd06.prod.outlook.com (2603:10a6:208:ab::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 02:47:56 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: fb05aab8-4669-4fe6-4bd1-08d8b37fd0d3
X-MS-TrafficTypeDiagnostic: HK2APC01HT078:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nqUhPFxFKhDlBlAmKlBC2zaGGj+1pNfrOpp9fxCfMBW8ZkAfrAbHx8gVYTIPfXe/kmnBWBHPZ5nlqoIoN1FB1F75AAhn18ogBe16JvrbaEcZrhrtfMTFV774LPL7C+ML/pBFSiHJcK4h0oKrvpouweOb09M4zD4IosJyWSLvStpnlB3zCQsUhA9/RN4JTYVJuIiK+U/c9K7Cc8DLty/T8hddC0W2KuhNsDUesBtc9+39Lrxrl4TLRPY3/P3xgiTM6dCem6RCuT5usvcbHUh6VW/WOA8+RmJ+wyMSyW74VrA=
X-MS-Exchange-AntiSpam-MessageData: rB8WPav3s3CjEvyi28ma5PGxf8zyBoujOu/I3oqnosUGyTnnGpmvCHAm3YM3SJ0xd7el977eWxfv80JcF+4lZLT9tf0hZj69mVLHT1Sf8+30iphJftyhs8A20GSgnt4+Af92GkhyOu74CLy0jdyV7w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 02:48:01.8122 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: fb05aab8-4669-4fe6-4bd1-08d8b37fd0d3
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT029.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT078
Received-SPF: pass client-ip=40.92.254.106; envelope-from=Qiuhao.Li@outlook.com;
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

On Wed, 2021-01-06 at 23:18 -0500, Alexander Bulekov wrote:
> On 201229 1240, Qiuhao Li wrote:
> > We spend much time waiting for the timeout program during the
> > minimization
> > process until it passes a time limit. This patch hacks the CLOSED
> > (indicates
> > the redirection file closed) notification in QTest's output if it
> > doesn't
> > crash.
> > 
> > Test with quadrupled trace input at:
> >   https://bugs.launchpad.net/qemu/+bug/1890333/comments/1
> > 
> > Original version:
> >   real	1m37.246s
> >   user	0m13.069s
> >   sys	0m8.399s
> > 
> > Refined version:
> >   real	0m45.904s
> >   user	0m16.874s
> >   sys	0m10.042s
> > 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 41 ++++++++++++++++--
> > ------
> >  1 file changed, 28 insertions(+), 13 deletions(-)
> > 
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > index 5e405a0d5f..aa69c7963e 100755
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > @@ -29,30 +29,46 @@ whether the crash occred. Optionally, manually
> > set a string that idenitifes the
> >  crash by setting CRASH_TOKEN=
> >  """.format((sys.argv[0])))
> >  
> > +deduplication_note = """\n\
> > +Note: While trimming the input, sometimes the mutated trace
> > triggers a different
> > +crash output but indicates the same bug. Under this situation, our
> > minimizer is
> > +incapable of recognizing and stopped from removing it. In the
> > future, we may
> > +use a more sophisticated crash case deduplication method.
> > +\n"""
> > +
> >  def check_if_trace_crashes(trace, path):
> > -    global CRASH_TOKEN
> >      with open(path, "w") as tracefile:
> >          tracefile.write("".join(trace))
> >  
> > -    rc = subprocess.Popen("timeout -s 9 {timeout}s {qemu_path}
> > {qemu_args} 2>&1\
> > +    proc = subprocess.Popen("timeout {timeout}s {qemu_path}
> > {qemu_args} 2>&1\
> 
> Why remove the -s 9 here? I ran into a case where the minimizer got
> stuck on one iteration. Adding back "sigkill" to the timeout can be a
> safety net to catch those bad cases.
> -Alex

Oops, I thought SIGKILL is the default signal timeout will send.
Fixed in version 5, thanks.

> 
> >      < {trace_path}".format(timeout=TIMEOUT,
> >                             qemu_path=QEMU_PATH,
> >                             qemu_args=QEMU_ARGS,
> >                             trace_path=path),
> >                            shell=True,
> >                            stdin=subprocess.PIPE,
> > -                          stdout=subprocess.PIPE)
> > -    stdo = rc.communicate()[0]
> > -    output = stdo.decode('unicode_escape')
> > -    if rc.returncode == 137:    # Timed Out
> > -        return False
> > -    if len(output.splitlines()) < 2:
> > -        return False
> > -
> > +                          stdout=subprocess.PIPE,
> > +                          encoding="utf-8")
> > +    global CRASH_TOKEN
> >      if CRASH_TOKEN is None:
> > -        CRASH_TOKEN = output.splitlines()[-2]
> > +        try:
> > +            outs, _ = proc.communicate(timeout=5)
> > +            CRASH_TOKEN = outs.splitlines()[-2]
> > +        except subprocess.TimeoutExpired:
> > +            print("subprocess.TimeoutExpired")
> > +            return False
> > +        print("Identifying Crashes by this string:
> > {}".format(CRASH_TOKEN))
> > +        global deduplication_note
> > +        print(deduplication_note)
> > +        return True
> >  
> > -    return CRASH_TOKEN in output
> > +    for line in iter(proc.stdout.readline, b''):
> > +        if "CLOSED" in line:
> > +            return False
> > +        if CRASH_TOKEN in line:
> > +            return True
> > +
> > +    return False
> >  
> >  
> >  def minimize_trace(inpath, outpath):
> > @@ -66,7 +82,6 @@ def minimize_trace(inpath, outpath):
> >      print("Crashed in {} seconds".format(end-start))
> >      TIMEOUT = (end-start)*5
> >      print("Setting the timeout for {} seconds".format(TIMEOUT))
> > -    print("Identifying Crashes by this string:
> > {}".format(CRASH_TOKEN))
> >  
> >      i = 0
> >      newtrace = trace[:]
> > -- 
> > 2.25.1
> > 


