Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38B13E8A36
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 08:29:01 +0200 (CEST)
Received: from localhost ([::1]:60496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDhjY-00076D-Vg
	for lists+qemu-devel@lfdr.de; Wed, 11 Aug 2021 02:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clamky@hotmail.com>)
 id 1mDhhW-0005hx-CF
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:26:54 -0400
Received: from mail-vi1eur06olkn2093.outbound.protection.outlook.com
 ([40.92.17.93]:20762 helo=EUR06-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clamky@hotmail.com>)
 id 1mDhhU-0002AQ-NZ
 for qemu-devel@nongnu.org; Wed, 11 Aug 2021 02:26:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAtX+r/T2CYe7p04MR6P8UI5wgQ/9cCFF2gxKOUJ/TeV12y4Ezc6rQ9VJhgp0a2qtZoWvSmsm6cEQ+hYzGeH6XDw+zzEIGrPH5sQUuhhy4MdEBpS/edtpkxn88LL5bRiT4+EswWKlF6qarVvd2qACK6/Y7FBHoAKoglrkTDHrnP2G+GJ6w03DUTFm1tvhKWl/hEicZ9C4B+5T4fCh5ghsMNVzD3uEo8V3umf9hPaktBYFtdEtSipYKYND3En2vEk4wfj9R/5HAmbQ+S26U4IyaVKwLsEhsZQQGqDI6jntgujJ1M8dtQt4rScwtNHQQQL8GzjfAtAA+9yJWiJAkjHGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lHtAmgSKX8jD8gX5A/GJydZ0sm6ty/XGN4SbuxUG3Y=;
 b=DZPfTfgqkk9FUgyqRg4Is5p2DwD9lOLSXDDzefqxPqBgkFsenLFqd8KItFcfju1/o6iN04wHXmtik1Ps69REKoM9syQAVuPwGMAqdcvM8nvUXuDcDQtCx0LVtJ2XD1hyGVWp9kAtUiOpr+EtYSPEqBf3+pPGjBqIo21YXUFsF2rL4qxq5KhZ0I3Z795jsdfdQOBkDd3yosrsEa2PSvQ/BpzcRduOXwftjSZBgWLdWNpOJGI6vDuOhYnY3LFIRkJ1a24JmR9E0lnCgD/GebIhZFmOR0rPrN3ZPk3P/hpR5f66pV4MmsNjEcVZG8jiIwwJgAvcPZ30lBqmhqLJxTxxZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lHtAmgSKX8jD8gX5A/GJydZ0sm6ty/XGN4SbuxUG3Y=;
 b=tx/XJYRl6MZKclReka7xFWq17mgusCymUOymoqMQZApYu8CcJy+V9A7Ru7TOIK5bpPAVb8XGVvMXbRo1MLTYb247KIvloaSO8UD/Bi1YPjRpV17krKECxkgzmp1ZN2Z/QB3+51Z8uETJFu20269PJDfh7WQ9DyzKOi+YKINAm8VpJatqA5nlpYGeeEI8jE9+cxl4jWXNU3Nm/L4vapYgNoBx/UVFQwmRsz+JwKf9MtlaJgp2DhqdDKOZRO0t2ZwWlYlAKskeaFlEVafyZjvCrSstHyE+W1SMpUHzhxW5fO0UuDKCjidq+S8sWiqhzTckKPkUjv0YUvaA4ynNVDewwQ==
Received: from AM7EUR06FT068.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::4e) by
 AM7EUR06HT147.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::154)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 11 Aug
 2021 06:26:49 +0000
Received: from VE1P192MB0733.EURP192.PROD.OUTLOOK.COM (2a01:111:e400:fc36::4b)
 by AM7EUR06FT068.mail.protection.outlook.com
 (2a01:111:e400:fc36::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 06:26:49 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:ED5448EF07EBBE8D0379E1956BB09647E81990B97BED0DD6F99FB5A4E43402F0;
 UpperCasedChecksum:CBE3A13832691A4AF651C436B81AC04B8E3B5AE0725EC45FE14ADDAFDA5A3D2B;
 SizeAsReceived:7562; Count:45
Received: from VE1P192MB0733.EURP192.PROD.OUTLOOK.COM
 ([fe80::8cd1:ed9a:cd45:87f9]) by VE1P192MB0733.EURP192.PROD.OUTLOOK.COM
 ([fe80::8cd1:ed9a:cd45:87f9%6]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 06:26:49 +0000
From: <clamky@hotmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 3/7] MAINTAINERS: update audio entry.
In-Reply-To: <20210811052227.agdafmkwz7spbp5u@sirius.home.kraxel.org>
References: <20210810083450.2377374-1-kraxel@redhat.com>
 <20210810083450.2377374-4-kraxel@redhat.com>
 <VE1P192MB073307355A0CA329534F9A49DEF79@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
 <20210811052227.agdafmkwz7spbp5u@sirius.home.kraxel.org>
Date: Wed, 11 Aug 2021 09:26:47 +0300
Message-ID: <VE1P192MB0733ED7BB482A45E5768464CDEF89@VE1P192MB0733.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain
X-TMN: [cFTQqtAY/dLAAifOC/O60u5+/OcvhbModPscCI89+cOWwuM89UmZE5OX8ffNt1hd]
X-ClientProxiedBy: AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29)
 To VE1P192MB0733.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:800:160::17)
X-Microsoft-Original-Message-ID: <875ywcijiw.fsf@hotmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from archlinux (2a00:1370:8117:66af:96c6:91ff:fead:dcbf) by
 AM0PR03CA0052.eurprd03.prod.outlook.com (2603:10a6:208::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 06:26:48 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 9ad77e99-8aef-45f2-6920-08d95c91002e
X-MS-TrafficTypeDiagnostic: AM7EUR06HT147:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXDD/3aVbjmNhO4gHvBAwbQlNg2TE9y9lq+8rVjLrtuirJUnq1eDg0D84dGO1q4PCszZyRVv8/xw30ScAhv9F1oSEci9hN4/ng9vo5wDXFwOBlqNBZ4v6XwI/Ul2bOwIwoKRUL+6uuX2lq/1Fnun79n/gFBwyrBnRthfS5zla/cuLoYZ7PqhmQmxeLuYpk+1uD23ET4OmD3Gnrt8r33pBzWD1+vVyCHWnT7Gh5SJDWVa0g0JSRUeMtaIT+DGmsCCav3J4AeUCxMC+RVWKys9qM8Gyw3JRYpjXgCS0Jy8GLdgE0q31hUaKJod+kNqKk+dyyxbMFXZgeyTqBU7Rdi1ZO4GXsrg0xPZNQp0ySv8xDFrf27piBEXLZbqgnsNqotzKGqRxKj/gF1ypG7DV4Lg2tvSxarBAe54p8TfZZaMPtrEAnVjh8CtqaQr/GBo0gQv
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Krc3WeGrqARSo/ymhIdzJGnlaAlmK58+eSyGHHYbsl3Yuj5jC85hrEOCgjIHDK0Al2KPaewOq9yhJ+J6irvwbXCQ4SdUgHp4Menh0ZZZecT/7X1zu1o+LqEFafQJld9bYLwNR0LhLLuM/bjRViT1LlDcxs4oZzTxBRXiyzrp4k/E8LtDFZz/mo1rX6c4swqy2Xg0yrHSINvT8I3Ei9O00A==
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ad77e99-8aef-45f2-6920-08d95c91002e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 06:26:49.4622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR06FT068.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT147
Received-SPF: pass client-ip=40.92.17.93; envelope-from=clamky@hotmail.com;
 helo=EUR06-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Gerd Hoffmann <kraxel@redhat.com> writes:

> On Tue, Aug 10, 2021 at 03:17:43PM +0300, clamky@hotmail.com wrote:
>> Gerd Hoffmann <kraxel@redhat.com> writes:
>> 
>> Hell Gerd.
>> 
>> > New maintainer wanted. Downgrade status to "Odd Fixes" for now.
>> 
>> I can try to retake it.
>
> qemu development happens in public on the qemu-devel mailing list,
> not behind closed doors.  Same goes for maintenance, updates to the
> MAINTAINERS file and related discussions are happening on the mailing
> list too.
>
> So, of you want seriously step up you should start by saying so in
> public, on the mailing list, not to me privately.
>
> take care,
>   Gerd

