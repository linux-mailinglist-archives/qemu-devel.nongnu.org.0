Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0E232E362
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 09:08:47 +0100 (CET)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI5Vt-0007uV-RR
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 03:08:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1lI5Uu-0007T4-6G
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 03:07:44 -0500
Received: from mail-pu1apc01olkn0817.outbound.protection.outlook.com
 ([2a01:111:f400:febe::817]:42937
 helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1lI5Us-0008OK-3h
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 03:07:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=amThYuafrLv6pqch4HPMdiwT6UgkZ4C3ZfHhGEm8/Kp2TzSelhapwVXKZ4n+D1z+SYSfmeBeH/EpGRVzVyuMR1oyEjVpVdS8epLufwiT1rftkctj2cgnKIsi2Xv5rA8Ko9vOiUeTzgbXNFog6hXlDLtjClbyT9c2IiVH6bfRtENDVOHCz7HURcP5/3euKcTQvi/smlbD3ZmHvrR4nHZUj1GxWDbYud/4DazNUfdgqnJdaOwY4xuYa15pRiVywaWDj0xMFISAz+F3VkkeJJyrQ63L8aGdkSnJuIB0SsBBFMvNzvA+4CjC8S7kLbcmN3q2v7zyUOSw7v6x6H9QoDCx0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk7deWONZqFJIeNexY3C9UKxmbpJCvz47VYlBR2mbVQ=;
 b=lgyoA2DtcDw/74w1Aa1Ebgx+Wxrp3bpmYTCONIHx5Vda++HjsYj7pSZK8mdUbYOI1cGg6wj/eZ84ZfuaHS1lIkTQbJ1NHT4kPWBKgKdoahyDYcDSVjVJYkOF+a9TyBMnAsO8aw4pyyjmSQMhHOMGnew55MXnS7mNo79uBRvukd0YoxWvtLxB+a7OK7NP0y7wuSL1BufiJNY1YG7qto3/0E21JZ9xkRmfFjGdS4tPJR3//TtguZNJ8IU2BeiNYOKXwKX7S1ctY3GkHqjRgKJdUYOWzGs7eoFDnh3/ZapQmxiICLSEBW27lYC2l5+ynAOkaNsZOhV/sNjTUJQ8icy8Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lk7deWONZqFJIeNexY3C9UKxmbpJCvz47VYlBR2mbVQ=;
 b=pDPpiF93m5jOhHsMRXPBEdckhvqTBhhQQLrrK1Wy+5+Ozn8k3Nir6MEV7h1XRhk0pE7G7+Uya9ldeKV5puvCYAAd4L0ziBf8O2D1Y4VB9/PsVIJp0x14NFsCKK4jEAxaXD36z2ab9I48ybaoZ61ZKROEPNGKIYfDKNGkJJgl9Fbegeq6aiNY33iHCK7FVXG/DGYU9P68s6KXu8UIMML4z/sFL5nZXQuTNDJ6pLcpePwb5zpLqjZpDyykzZlVvfEV8PIXEr1c3J9tYy9IPkgxaO7TtgW5K9fFWRvsDsdxFIiZZHUnFwDoCoDbYcQgofWOXiE1CzGg/NW4BDFPEfvTHA==
Received: from SG2APC01FT012.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebd::46) by
 SG2APC01HT012.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebd::213)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Fri, 5 Mar
 2021 07:52:16 +0000
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 (2a01:111:e400:7ebd::52) by SG2APC01FT012.mail.protection.outlook.com
 (2a01:111:e400:7ebd::184) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19 via Frontend
 Transport; Fri, 5 Mar 2021 07:52:16 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:B1C7502AA263BA07F0DB304349F257759C27F751C0871BDB54CFCA374C712D68;
 UpperCasedChecksum:AC0744430C84E82D38845EF90334A743954F9D89C0A2A3BDCD186CD3BEFAABFF;
 SizeAsReceived:8714; Count:47
Received: from SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780]) by SYCPR01MB3502.ausprd01.prod.outlook.com
 ([fe80::b5dd:6210:81a:7780%5]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 07:52:14 +0000
Message-ID: <SYCPR01MB3502665CD5F77329DD5EF672FC969@SYCPR01MB3502.ausprd01.prod.outlook.com>
Subject: Re: About libfuzzer in qemu
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>, Yan Zhiqiang <yanz3q@gmail.com>
Date: Fri, 05 Mar 2021 15:51:43 +0800
In-Reply-To: <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
References: <CAB7jVHGXcAdYg+z=Dgwb5LBhTxjWG_BALdwh+0CvUUucTzFehg@mail.gmail.com>
 <20210304152326.6fqgrncqgsvlrxhc@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1-1 
Content-Transfer-Encoding: 8bit
X-TMN: [Ny/qZjrD1rdqn2309cCzAC1mgK6NU57M]
X-ClientProxiedBy: OS2PR01CA0118.jpnprd01.prod.outlook.com (2603:1096:602::12)
 To SYCPR01MB3502.ausprd01.prod.outlook.com
 (2603:10c6:10:3e::12)
X-Microsoft-Original-Message-ID: <52f6ca356f42937f8ff8a3b909a72269a7d434e7.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.0.1] (204.124.180.76) by
 OS2PR01CA0118.jpnprd01.prod.outlook.com (2603:1096:602::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.18 via Frontend Transport; Fri, 5 Mar 2021 07:52:03 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 88c70619-db2a-4f5c-409b-08d8dfab91b5
X-MS-TrafficTypeDiagnostic: SG2APC01HT012:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBLUI984zIZs0l5X9VRSmV4xzKY9WabISzcxgQ/2vDQY1eU/TI44O48B7R/8L06nH8zrNVln2o1nqeeBxXabvpp91ojr7JKnXq/dAF1POFC0gHU/mb6UYl90CBJbEfH6c55sfTNYApD1ldyRehbWUjnpVBFenopN02vNI2g6wjmiS24HdkdbjtXhLjtpSJdVplZc3a9ZTKMKpDkN0JdrlFsN3PBOALnGeMLLcX62EUC6jHJqCMuYOUTHFSi7/a+6yYAjZVyTkPeMCr9Ouz8s/XM1B/r8r0k+Usxis02b3e9WsaVcftmWWghBNNILZjVUgQNrYhtEiN04O3zwcOIbK6YN0P3+3x0WLRCCj61j3h9ZKrlVJGZ2Y4CzhpEeNzHF5eO1MyC4hPf85Khy7nlkKn9o/iC1wCZXcbfWEG2fR8o=
X-MS-Exchange-AntiSpam-MessageData: KVy7aMMbKBge/fJHqSWe2hmtgGGp0YPPvQ+DqXBABhBTWrnHaPOUEUBlagxn5DLZppjRuObud0VEvGUv+2cIk76ZlVWMuc/2rwYekvYeVq6y1LmXMVBKBxgYpLaQ3d5KqKtvRObOcuVSLP3AYQRePQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c70619-db2a-4f5c-409b-08d8dfab91b5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 07:52:13.4183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT012.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2APC01HT012
Received-SPF: pass client-ip=2a01:111:f400:febe::817;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=APC01-PU1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2021-03-04 at 10:23 -0500, Alexander Bulekov wrote:
> On 210304 1843, Yan Zhiqiang wrote:
> > Hello Alex,
> > I'm learning the fuzz in QEMU recently, I review the fuzz code
> > under
> > /tests/qtest/fuzz which is written by you.
> > I learn a lot from it, but I stuck when I want to debug the fuzz
> > code.
> > I use the gdb with command as follows:
> > 
> > >  gdb -q --args ./qemu-fuzz-i386 --fuzz-target=generic-fuzz-
> > > virtio-vga
> > > ./fuzz-output
> > 
> > and set breakpoint at generic_fuzz.c:generic_fuzz.
> > It acctually stop when hit the breakpoint. But the function
> > argument Size
> > is zero and then goto _Exit(0). (try many times but always the
> > same)
> 
> Hi Zhiqiang,
> Happy to have more people look at the fuzzing code.
> We run each input in a forked process. Maybe you need to run 
> "set follow-fork-mode child" in gdb?

Hi Alex,

Just curious why you choose to use the libfuzzer at first instead of
AFL and its descendants like AFL++ since they use a forkserver by
design, and the performance also seems better [1].

[1] https://www.fuzzbench.com/reports/2021-02-13-paper/index.html

Thank you.
  Qiuhao Li




