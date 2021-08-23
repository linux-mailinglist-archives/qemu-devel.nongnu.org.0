Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E412F3F4AF6
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:43:52 +0200 (CEST)
Received: from localhost ([::1]:33814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI9It-0001se-Vt
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mI99l-0005gR-VJ
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:34:26 -0400
Received: from mail-ma1ind01olkn0169.outbound.protection.outlook.com
 ([104.47.100.169]:33328 helo=IND01-MA1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Qiuhao.Li@outlook.com>)
 id 1mI99i-0000Bi-3X
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 08:34:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MA0HH7LvMu+ZtheVmdziJXBMLAbR/nwAQ4Rd9BqQUfZPZNLdE2ywm0KnD84BK4aNFDuN2Pxb/EdqGjQlK28W9mnoIbFg/wFLp32O/G5drdJ29X86ho5/QuHS0YBfWWtOtlk//+xvVe5vwrrd7O0zSajqLz1+LNVO1PM7lfbbRpsyD6WDayosv3iRhL6O6V6Sqduw5wYL3dYLYuBaGy3vKDlFtp6gNV4x8fyxAd/jseZ2mQrXcaaVD9mylIV2iFGm7ZQ1YRjcEBKh+MkxaZqpF/058XvcWiQeNyy9CxZLwAcNgAyIRRfrQyEcs8iLyNH8BYjKP7IPwuSpZfQn8N/AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGvO3K7ZAhEgy1gD9xoYpehtwPOmM41dt9aM9E/J8Jw=;
 b=OU5votlLG57KLWTXqqu9VZY8rvTLcNxoCdzXb5OAjmSheBrDplBVbbFnSXDkIEVUrkQh2T4K2ibtwniBtzVZvUFRi6FITjsqsZFlQ7w2skbKctKo3tiP4XcTZQCOjLFkmjT+v/ilqnfycpzZ3D6ZpaANXbhbEO4nOXUdCjLa9mb57j0OmRzb6DioWFh60KHQc9mhpgUDH1Uved3EAS+n8ffwAo2bUOD6VOZTTRVqa79XvAlhHiTdaik4qHLYPPEr6FZBwpxTizM8W6tR6vdSJU909OIWKH0RWKpBboobGRoYAi6xta3YTlhRzrcZEJWkedDA+Lv1IIm7rzzJpbudMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGvO3K7ZAhEgy1gD9xoYpehtwPOmM41dt9aM9E/J8Jw=;
 b=tXcsHncgk0C6rdenQ54nAayF96UoWdcWSd8IYWEmIbio8+PRtolh5ywRPznVFdcvRERCkh1OOzcVKAQpH6fe7y9tDqe1WwAFT1ZhbZe4763p3ZT5T+Jwq7ite6Fn/vqLLL0SXdp9Ec3UndUgMrsloveFPecJe5TGmpVtCFdjcU/ZM86WkdvdT8f9hPXBXpMJz2hezWyUAeojcb2ns2VNmGJgmFhKDxeObye2Yo1nRob0rdI7Vwq2dfzMu7/1juaCf1TaUQ0vmfkd4fcatlTP4iBX/TZgSx+T6azuca0O1mXMzpyUZgiFuZC59281UQ1BdJ3BpqgJv7IPrfcRq8VHOg==
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:72::9)
 by PN0PR01MB5496.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:63::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.23; Mon, 23 Aug
 2021 12:34:14 +0000
Received: from PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c]) by PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::41ec:5dc2:fd60:e64c%6]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 12:34:14 +0000
Message-ID: <PN0PR01MB6352A955D162E07966CC03B7FCC49@PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM>
Subject: fuzz: fuzz_dma_read_cb() may overlap with MMIO regions
From: Qiuhao Li <Qiuhao.Li@outlook.com>
To: Alexander Bulekov <alxndr@bu.edu>
Date: Mon, 23 Aug 2021 20:34:04 +0800
In-Reply-To: <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
References: <reply-76b541d3da83db84dd2a5b0ba3bba9ff@gitlab.com>
 <issue_92358130@gitlab.com> <note_656820217@gitlab.com>
 <note_657261050@gitlab.com> <note_657305687@gitlab.com>
 <20210823081403.l74lp7gay5tjy2m5@mozz.bu.edu>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.0-1 
Content-Transfer-Encoding: 8bit
X-TMN: [ftzuqBmS5rF3huA4gwQYlBM+6LQ2su7y]
X-ClientProxiedBy: HKAPR03CA0024.apcprd03.prod.outlook.com
 (2603:1096:203:c9::11) To PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:72::9)
X-Microsoft-Original-Message-ID: <e4a13631eb10f95df6b83e54bb8d6bf5c9c84b3a.camel@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.93.209] (104.192.108.9) by
 HKAPR03CA0024.apcprd03.prod.outlook.com (2603:1096:203:c9::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.9 via Frontend Transport; Mon, 23 Aug 2021 12:34:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 375594ab-14fd-4cb3-616b-08d9663250f5
X-MS-TrafficTypeDiagnostic: PN0PR01MB5496:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hIQzUraD7+/pfw4YYcqbSujrHmVd0mjOcyQ9+MuProa6C5g7z+PbQ+GxD7uUmAsCdNFFKby+4ZtErckC0jG/Sw2lPcQcF+fndQMUl9cyWcJfKw3+/xdK+LPkS78pIY6h/bMCVuG+J5HR73D7lT/mzkHqbiTADqjC6+HrQZ9G3SmGxudIWedV7Ir613OaLPoo/ofATCnIksnjSWp/iLkFZZru2xzVve+2kYh0+vs3pKC/7KRAfm+MgFn+d2vRFAH1xYqzli/UvkMWOcXJLiDEhDLaUS3jFZ4qgDYGtKQ9XBhh8Hkxl5dV7JvsF9TEOmhdpJHy2LGWw3ppNL01gjr3brHPHrlyHj6i8IfKQ9i0EBz/i2jC9qLui1JpJQGO6PDR1MZm+fGtY1F+Xicg4oBdDMo9nNJvrJ7N8GPgGwf2SApIW5sEoJv/W/xPUpp5DwV6gqF7eFzxogodgTHYmQehUTPiyx/v/lsE97kVy3nzdy8=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: l9wTShh8E+3nckTlOBSI/EMSEm5LqqH2uQpGTK8e2lfN9zYaHx7c7F5B0RmSPizHgAviM9xVH/FUQTRpc4ZAhrfwJ4I+7R8HZ88TzoPDuMtHJo4pTkKbKaK2YnOAMgAoIetBymw3eYbe4mR2wJ6/UQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375594ab-14fd-4cb3-616b-08d9663250f5
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB6352.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 12:34:14.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB5496
Received-SPF: pass client-ip=104.47.100.169;
 envelope-from=Qiuhao.Li@outlook.com;
 helo=IND01-MA1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

I think the check in fuzz_dma_read_cb() is buggy because it doesn't
consider when the write address is not in the mmio region but can
overlap. For example, the mmio region is 0xe0000000 to 0xe0001000, and
the write address is 0xdffff000 (not ram) and length is 0x2000. In this
case, the address_space_translate() will return the sparse_mem_mr we
created, thus bypassing the check and call qtest_memwrite().

Perhaps we need more detailed checks to ensure that the entire write
operation occurs in the ram or won't overlap with mmio regions. What do
you think?


mr1 = address_space_translate(first_cpu->as,
                              addr, &addr1, &l, true,
                              MEMTXATTRS_UNSPECIFIED);

if (!(memory_region_is_ram(mr1) ||
      memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
    l = memory_access_size(mr1, l, addr1);
} else {
    /* ROM/RAM case */
    // mr1 == sparse_mem_mr but it's not RAM or ROM <--
    // May overlap with mmio regions                <--
    ...
    qtest_memwrite(qts_global, addr, buf, l);


Thanks.
  Qiuhao Li

On Mon, 2021-08-23 at 04:14 -0400, Alexander Bulekov wrote:
> I'm not sure I understand. We try to avoid writing to MMIO regions in
> fuzz_dma_read_cb to avoid such false-positives. E.g. that's why we have
> code to do address_space_translate and manually walk the AddressSpace
> and verify that we are writing to RAM, before doing the actual
> qtest_memwrite. There is a fix to that code that need to be applied,
> but
> those have to wait for the 6.1 release. BTW, since this is about the
> generic-fuzzer rather than this bug, I cc-ed qemu-devel. Let's continue
> the discussion there.
> 
> -Alex
> 
> On 210823 0132, 李秋豪 (@QiuhaoLi) wrote:
> > 
> > 
> > 
> > 李秋豪 commented on a discussion:
> > https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> > 
> > Ok, I add a reply to my report about #540 and #541.
> > 
> > Btw, it suddenly occurred to me that our generic-fuzzer can also make
> > reentry issues. For example, a device tries to read from a mmio
> > region while being fuzzed, but the fuzz_dma_read_cb() will write to
> > that region, thus leading to positive-false reentry issues. In short,
> > we change a read action to write. Should we add checks?
> > 
> > -- 
> > Reply to this email directly or view it on GitLab:
> > https://gitlab.com/qemu-project/qemu/-/issues/541#note_657305687
> > You're receiving this email because of your account on gitlab.com.
> > 
> > 
> 



