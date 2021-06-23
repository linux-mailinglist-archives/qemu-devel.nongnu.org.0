Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D808B3B164D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 10:57:17 +0200 (CEST)
Received: from localhost ([::1]:41908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvyhA-0001o0-VG
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 04:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyfN-0007ch-1r
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:55:25 -0400
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:48474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lvyfH-0003X5-5b
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 04:55:24 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.139])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 2507D2A8E1D;
 Wed, 23 Jun 2021 10:55:04 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.10; Wed, 23 Jun
 2021 10:55:02 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d3038f65-c5ce-4007-befe-afe2ac0c27cd,
 B7AA0C2FA2B81B44B633B8B15AC1C2D9682E7D4C) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 92.184.105.222
Subject: Re: [PATCH] sd: mmc: Fix SET_BLOCK_COUNT command argument
To: Bin Meng <bmeng.cn@gmail.com>
References: <20210623083004.245894-1-clg@kaod.org>
 <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <1d9dcb0c-e2f3-455f-fb35-1ea6b7db1d50@kaod.org>
Date: Wed, 23 Jun 2021 10:55:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmXMKphSdgE0xMJT2Tzu5okf00SJcskPfK742PwZv-X1RQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c6d7bdeb-becf-411e-99e0-a622a5bad82f
X-Ovh-Tracer-Id: 17791470329155259299
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeegfedgudduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeekudeuudevleegudeugeekleffveeludejteffiedvledvgfekueefudehheefnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegsmhgvnhhgrdgtnhesghhmrghilhdrtghomh
Received-SPF: pass client-ip=46.105.48.137; envelope-from=clg@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/21 10:39 AM, Bin Meng wrote:
> On Wed, Jun 23, 2021 at 4:30 PM Cédric Le Goater <clg@kaod.org> wrote:
>>
>> The number of blocks is defined in the lower bits [15:0]
> 
> I checked the physical spec v8.00 and it says bits [31:0] for CMD23 argument.

May be that's an eMMC thing. That's what I read from the specs :

 [31] Reliable Write Request
 [30:16] set to 0
 [15:0] number of blocks

Thanks,

C.

