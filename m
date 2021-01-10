Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABA2F075D
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 14:13:19 +0100 (CET)
Received: from localhost ([::1]:52082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyaX0-0003qF-25
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 08:13:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaUq-000356-80
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:11:04 -0500
Received: from mail-oln040092253043.outbound.protection.outlook.com
 ([40.92.253.43]:13035 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1kyaUn-0000zK-6P
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 08:11:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVIK7MUI+v4OpOXdbjs7pADxe7ATKetmA+IOaHmGUFW1o3sdJtr7Zuq0uYf3u4X4iJhKKrDs5fqbavS49VXmbaQV0X2OsTJvpHMfaznNFD+XZpIMLtCypdTXgcmVd/zy/dzVZhUbvOsaZMvLD0MqKaV2WTQNWpIMrQm+hHGfIi6ICuhhYa/dg6S8s9seMIhXsvRtxrfFUCk29E8kHxRSljz4lsNf8EQsea1I6k8nhtl7sISKsCsfd0RAVaLUuOV9gVDHwm4Ykdi4TEaS0LQpp63o+ZAF2W0NWSl8VlP+3YVD6iVzHMgJ6XBFP5hOsuqTwlFaxNeCSJS73SWkicHUkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVOUVMmC/aVT3Jh3evjONtVxGeA2STIyhf/SqJiJrUY=;
 b=lhR1WWYPnKS+B65b1rgFp9jLuz8ygL64q7TlYtXB81IWFnquQUHpziqImRLDWzMBGe0U3Z4+weQp51V0u2YM8hAFAF8+zSVT7GEdSZZC0bh39l4pxPU57zjSBf/M+YW9KlfMB0Vv+uE8Hnnhi3EHh3FpI2GSEhwPDJAFPray4j2ky5zQISCk2xbrHR+yjJ1m+gDfatGwgyHWN1XCCYIJvCEr4qklnuDL6vxnEuNIlApmOX613EGwUPw207tSddIzDYiqQXDLFgYGQtc+FS7qZC9jUnWea1Vkm5AhS0s4c3Fs8U01/DEe9/6CmvZ6wKSBhZIeAgm/Yn+NUdOo8ChueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVOUVMmC/aVT3Jh3evjONtVxGeA2STIyhf/SqJiJrUY=;
 b=j711TiuaYeEtbqlLp3/PYOU70hgtbv0L+iPQiXjFwQeV8n/WWAWpZ6rlS9WM2DysEEs9jwuo2OQ73Fuz9DGs6BIWgRxteEoH2YKN1WWBT+Bff1qIvk98ds+JY6wCGgYWpOGzhiNYbSXYtXn6JlZ5zUmeaNY9/xHDFwCJSZDuvZHyNTvzcN7qw/fpkAocAUaTnlboOhcW4RzM6X18xjBqny+lJzeL28EX8SLRiZCmqO7XZhYq8xFYvmm3wuDaReEqH8Nig8xNaWE2ENqZK3G8wxK7Pvcb2Ncd5wD8PP3CgGUGsQ3yUb6W2myzqs4wghINrbB8ENOwwigswXvEEAvjsg==
Received: from HK2APC01FT043.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebc::52) by
 HK2APC01HT037.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebc::345)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sun, 10 Jan
 2021 13:10:40 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebc::4f) by HK2APC01FT043.mail.protection.outlook.com
 (2a01:111:e400:7ebc::348) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:10:40 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:15773A3FF76325E0D7FEFA0F10A0FD7F5332796F79425AEE9CF8D88FC5091F61;
 UpperCasedChecksum:C9F400BE80EFE5E9B4A2E78620229DF0CF8B1FB8311C11B6088CD5ED191E6051;
 SizeAsReceived:8818; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3742.011; Sun, 10 Jan 2021
 13:10:40 +0000
Message-ID: <SYCPR01MB35026BAE41BDF24E076ABBF1FCAC0@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: [PATCH v4 1/7] fuzz: accelerate non-crash detection
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Sun, 10 Jan 2021 21:10:27 +0800
In-Reply-To: <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
References: <ME3P282MB17456B93AE422008F433C50DFCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB174544643E941EFC9EAA2287FCD80@ME3P282MB1745.AUSP282.PROD.OUTLOOK.COM>
 <20210107041827.sztisz72urbhxflx@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [a7rl0TuWNlOaU8mGGC4vjuHGB/atMjyK]
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <f37a1c2726c61a6fcc69c247a04f2a675ac832e4.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (104.225.148.19) by
 SJ0PR03CA0119.namprd03.prod.outlook.com (2603:10b6:a03:333::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sun, 10 Jan 2021 13:10:35 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dbc7789c-e863-41ce-c2e7-08d8b5692149
X-MS-TrafficTypeDiagnostic: HK2APC01HT037:
X-MS-Exchange-MinimumUrlDomainAge: launchpad.net#6194
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8u16qDGzV9NLtuiL3xhQu93PxCzWoNph51EEE4OqKiYihnAUBtlCl7AJq3tx/Fi0P2PNp4twGG59+Ejr3iRUxnYmKEVARo2QSo4q+M4oHDaMAcfkgZRmCDSbgp+l1SAg5K19K0MDK3oQEKfL7s8JhoSvn4rRYBO1uIa5q1Z8UlGlwaqdhw+xYyHDXk6bGHqrrliFU/zbUnHXs8jsz36WN45Q1BNZhzDwSUtBSOzO4LZ2O14jRSK2EOCIfrb1nmV8rq6qaR1SvpZRdHEWEPV3X8NoS7uS0IXuu0hYTyw3qtM=
X-MS-Exchange-AntiSpam-MessageData: 2OtJioxAEqrPO5cR4N8CqQN4aQ6bV8Orey3oWKi1salWF9tnhLmwxaZV0bNn3Iih65HpIU8XO+bGFC50qbaRwvyI2GO/Qh55k6pGAQdivAfXBYCZUEdKUbnM1z8RTk/oSFX7cYTvIuPzloW1C4C0iw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2021 13:10:40.7141 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc7789c-e863-41ce-c2e7-08d8b5692149
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT043.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2APC01HT037
Received-SPF: pass client-ip=40.92.253.43; envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-SG2-obe.outbound.protection.outlook.com
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

Hi Alex,

After reviewed this patch again, I think this get-stuck bug may be
caused by code:

-    return CRASH_TOKEN in output
+    for line in iter(rc.stdout.readline, b''):
+        if "CLOSED" in line:
+            return False
+        if CRASH_TOKEN in line:
+            return True

I assumed there are only two end cases in lines of stdout, but while we
are trimming the trace input, the crash output (second-to-last line)
may changes, in which case we will go through the output and fail to
find "CLOSED" and CRASH_TOKEN, thus get stuck in the loop above.

To fix this bug and get a more trimmed input trace, we can:

Use the first three words of the second-to-last line instead of the
whole string, which indicate the type of crash as the token.

-        CRASH_TOKEN = output.splitlines()[-2]
+        CRASH_TOKEN = " ".join(outs.splitlines()[-2].split()[0:3])

If we reach the end of a subprocess' output, return False.

+        if line == "":
+            return False

I fix it in [PATCH v7 1/7] and give an example. Could you review again?
Thanks :-)

FYI, I mentioned this situation firstly in [PATCH 1/4], where I gave a
more detailed example:

https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05888.html

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


