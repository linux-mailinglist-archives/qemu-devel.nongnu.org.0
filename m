Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9127B2E097C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 12:22:43 +0100 (CET)
Received: from localhost ([::1]:45476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krfkY-0003pd-N8
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 06:22:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfjg-00031k-Iq
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:21:48 -0500
Received: from mail-oln040092253097.outbound.protection.outlook.com
 ([40.92.253.97]:5984 helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1krfje-0002v2-Mk
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 06:21:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5dIXszkP9S7WSb/heMs7GaNkZ2BwERR1/vt7mfeYTm+BW9qZ94Z0tJMeEtuu6sk7Ji6R1ucyqrAtny2rLhAaIzfr1sgfNzBtdLwcHzZrBer/9Y5L7gZLrl41VPuXf/WANZYU0JwXKtL2zBnlhCo/WziMCHPArkyWs3AKktxKISTD3oMVXJA17+TfylOXWmcQXVW5BgvXXXNVqS8TbV12kkpGxxcpIRTe5S8lQiA74hwq5UbNTJhQL1M3thUzDJq9Olv5sqBkB+pqcd4XtlcZJygNT6RyIjJS8nYcn1LLUqiZVAf4i4EPV7O247bdWh73D+ShG6aKMFwdo6E3QI+Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/aGlBia3tccuyy8I/+5K/UPpKKx9FUIufyFd2pzFU=;
 b=jszuDTNelfmgzM8g0Iok5q/nxuBG1/iAjL6C9YB5JTboV0G8p/fRI3XhrC2ah1orgLPveMj2gooTaDeV9NRWczldQZdBPBsaD8MKYAYF2VKpbc/gNrRX4m5gry3A86xsK0c58XLFuPRTS6ejK7njykLJuUN3+EQUSEnDaXZqt7SlQ7PV8fbUnmofJPMzCMK8QOUK0Pl6ntg9g1QCg6DysPOmVbp14q0BlCW9/yM1gbjGlYKUuFgNGZ8LfMUN0JQTkX3jP25t6WZLoD0qzFPCeQMbVm3FDVqHv/0erZ/Bu55h9mbO3Bcl1UnO5mrt4HrtBBmgYz+zADZMxhqT9jXsjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Z/aGlBia3tccuyy8I/+5K/UPpKKx9FUIufyFd2pzFU=;
 b=TkP2tVXqtO0kcel9M+9/jTG41voQ/VVOyyy8sEQ8uMLxATsW217H2KZtJamSOo+Y6ZjhbWy/YsikhhUDRfC4iNumvaJPJ9TMSN43uKy3yCsMIGYHh0rFJVPF6WUOaD+NqYR956kbkk8dWpANmmTLTvPLk3B6+n1T3OoVqxNr9gJgNF+1KTXaUJNc4ZEi+PQUPhIxBta+/0QqhIPbGowxQfxUmLj43qQxintxU3kI+yYMSag8n1qDl+mpNTwMRXkJepF8zkxgRgtgyrMg3xodQPKlWayKT+0g8V/MmVK3/0U941AQIh8nNQyoV5UwTD/9wipj1uXB89jhdeceLYYJlw==
Received: from PU1APC01FT044.eop-APC01.prod.protection.outlook.com
 (2a01:111:e400:7ebe::44) by
 PU1APC01HT216.eop-APC01.prod.protection.outlook.com (2a01:111:e400:7ebe::422)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22; Tue, 22 Dec
 2020 11:21:32 +0000
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM (2a01:111:e400:7ebe::42)
 by PU1APC01FT044.mail.protection.outlook.com
 (2a01:111:e400:7ebe::276) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.22 via Frontend
 Transport; Tue, 22 Dec 2020 11:21:32 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:7ECE12636DEF42B5912E07EBAB81E324B4A8FF7873307AA1973A138121F13EB4;
 UpperCasedChecksum:B520DD1FB4723F2B8CAABF3A644EA50D69DDB4D5F58B5CD0FA192AB7FEB11183;
 SizeAsReceived:8829; Count:47
Received: from SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2]) by SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 ([fe80::55ae:9314:d035:d6d2%7]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 11:21:32 +0000
Message-ID: <SYYP282MB1501A23C21301A8151E13AB1FCDF0@SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 3/4] fuzz: setting bits in operand of out/write to zero
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Tue, 22 Dec 2020 19:21:25 +0800
In-Reply-To: <20201221203543.vlezaw2sxiq7wpde@mozz.bu.edu>
References: <ME3P282MB1492BFA2302041F2AB420EBEFCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB149243C4D0FE93B71E6B8AA6FCC20@ME3P282MB1492.AUSP282.PROD.OUTLOOK.COM>
 <20201221203543.vlezaw2sxiq7wpde@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-TMN: [91JE9mEzr+rNUAIGSJiAE+0Zg9MotEOo]
X-ClientProxiedBy: OS0P286CA0054.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9e::23) To SYYP282MB1501.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:da::15)
X-Microsoft-Original-Message-ID: <4f4d95defa9b8f7364987b1e933c3e20a446c092.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (204.124.180.84) by
 OS0P286CA0054.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:9e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3676.29 via Frontend Transport; Tue, 22 Dec 2020 11:21:30 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 88606a68-e9fe-4992-af37-08d8a66bbc83
X-MS-TrafficTypeDiagnostic: PU1APC01HT216:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtfiLYKsxonlzSy+z8ep+S1nJslMH31rnA3Ejf98ARbVDKiF5YYN9txEvGDz7KGt3vIZnU4eB2oLo+wgNsMFoZnol3eEU19or2rmqZxyUDgRWw5c8WyRXM5AcQm4NeXufAf9zciC22xLt2Lx6WciWA4PtTKrATCVquhMlC2J55RzSb9nDYUBdykmosOPus1okXux4tCZF+H68BnLcNEbXz1qjqBh1Y6/1iGrm5p9I3qeaOH5IY9RqLSQYfWFf3X2
X-MS-Exchange-AntiSpam-MessageData: Ajn2zz9x02V2rXg/57lfXSFl6ydreVHFn/RLVEkIOILzpYwdWI2wosfG5X57L4X76wTFEWa9nIiAwkRKn+LnA7x9LVEqp8K8tGohca0oolnehX5hISBiY7OAlSYuJTLL9BDpMf8U/+CsgZVjF345YQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 11:21:32.6417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-Network-Message-Id: 88606a68-e9fe-4992-af37-08d8a66bbc83
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT044.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1APC01HT216
Received-SPF: pass client-ip=40.92.253.97; envelope-from=Qiuhao.Li@outlook.com;
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

On Mon, 2020-12-21 at 15:35 -0500, Alexander Bulekov wrote:
> On 201220 0256, Qiuhao Li wrote:
> > Simplifying the crash cases by opportunistically setting bits in
> > operands of
> > out/write to zero may help to debug, since usually bit one means
> > turn on
> > or
> > trigger a function while zero is the default turn-off setting.
> > 
> > Tested Bug 1908062. Refined vs. Original result:
> > 
> > outl 0xcf8 0x8000081c            outl 0xcf8 0x8000081c
> > outb 0xcfc 0xc3                  outb 0xcfc 0xc3
> > outl 0xcf8 0x0               <-- outl 0xcf8 0x8000082f
> > outl 0xcf8 0x80000804            outl 0xcf8 0x80000804
> > outl 0xcfc 0x10000006        <-- outl 0xcfc 0x9b2765be
> > write 0xc300001024 0x2 0x10  <-- write 0xc300001024 0x2 0x0055
> > write 0xc300001028 0x1 0x5a      write 0xc300001028 0x1 0x5a
> > write 0xc30000101c 0x1 0x01      write 0xc30000101c 0x1 0x01
> > writel 0xc30000100c 0x2a6f6c63   writel 0xc30000100c 0x2a6f6c63
> > write 0xc300001018 0x1 0x80  <-- write 0xc300001018 0x1 0xa4
> > write 0x5c 0x1 0x10          <-- write 0x5c 0x1 0x19
> > write 0xc300003002 0x1 0x0   <-- write 0xc300003002 0x1 0x8a
> > 
> > Signed-off-by: Qiuhao Li <Qiuhao.Li@outlook.com>
> 
> Looks good. One nit below.
> 
> Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
> 
> 
> > ---
> >  scripts/oss-fuzz/minimize_qtest_trace.py | 42
> > +++++++++++++++++++++++-
> >  1 file changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/oss-fuzz/minimize_qtest_trace.py
> > b/scripts/oss-fuzz/minimize_qtest_trace.py
> > index 855c3bcb54..f3e88064c4 100755
> > --- a/scripts/oss-fuzz/minimize_qtest_trace.py
> > +++ b/scripts/oss-fuzz/minimize_qtest_trace.py
> > @@ -172,7 +172,47 @@ def minimize_trace(inpath, outpath):
> >                      newtrace[i] = prior
> >                      del newtrace[i+1]
> >          i += 1
> > -    check_if_trace_crashes(newtrace, outpath)
> > +
> > +    assert(check_if_trace_crashes(newtrace, outpath))
> > +
> > +    TIMEOUT = (end-start)*2 # input is short now
> > +
> > +    # try setting bits in operands of out/write to zero
> > +    i = 0
> > +    while i < len(newtrace):
> > +        if (not newtrace[i].startswith("write ") and not
> > +           newtrace[i].startswith("out")):
> > +           i += 1
> > +           continue
> > +        # write ADDR SIZE DATA
> > +        # outx ADDR VALUE
> > +        print("\nzero setting bits: {}".format(newtrace[i]))
> > +
> > +        prefix = " ".join(newtrace[i].split()[:-1])
> > +        data = newtrace[i].split()[-1]
> > +        data_bin = bin(int(data, 16))
> > +        data_bin_list = list(data_bin)
> > +
> > +        for j in range(2, len(data_bin_list)):
> > +            prior = newtrace[i]
> > +            if (data_bin_list[j] == '1'):
> > +                data_bin_list[j] = '0'
> > +                data_try = hex(int("".join(data_bin_list), 2))
> > +                # It seems qtest only accect hex with one byte
> > zero padding
>                                          ^^ "accepts padded hex-
> values."

Thanks.

> 
> > +                if len(data_try) % 2 == 1:
> > +                    data_try = data_try[:2] + "0" + data_try[2:-1]
> > +
> > +                newtrace[i] = "{prefix} {data_try}\n".format(
> > +                        prefix=prefix,
> > +                        data_try=data_try)
> > +
> > +                if not check_if_trace_crashes(newtrace, outpath):
> > +                    data_bin_list[j] = '1'
> > +                    newtrace[i] = prior
> > +
> > +        i += 1
> > +
> > +    assert(check_if_trace_crashes(newtrace, outpath))
> >  
> >  
> >  if __name__ == '__main__':
> > -- 
> > 2.25.1
> > 


