Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B153F3DE79A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 09:53:39 +0200 (CEST)
Received: from localhost ([::1]:44154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mApF4-0005Cz-BV
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 03:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mApEA-0004Wp-EG
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:52:42 -0400
Received: from smtpout3.3005.mail-out.ovh.net ([217.182.185.173]:60907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1mApE8-0001J5-Lf
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 03:52:42 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.124])
 by mo3005.mail-out.ovh.net (Postfix) with ESMTPS id 2928C13B34A;
 Tue,  3 Aug 2021 07:52:29 +0000 (UTC)
Received: from kaod.org (37.59.142.102) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 3 Aug
 2021 09:52:28 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-102R0040e5fad7d-e551-4536-9c5d-62c903b929d2,
 5E3C02DC97B6587DB5C86C619C1D74B9FF6F86D3) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Subject: Re: need help with my config
To: Lindsay Ryan <Ryan.Lindsay@petermac.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>
References: <MEYP282MB168775224F9A7690C9F5AEF9F9EC9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
 <82ae0532-50c2-7a67-af16-04226cb2986b@redhat.com>
 <39f8272b-2c2f-08d6-1fb5-cd519fdf2bbd@kaod.org>
 <MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <b14c4fc3-6659-6d2e-11a7-26cfb8000931@kaod.org>
Date: Tue, 3 Aug 2021 09:52:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <MEYP282MB1687AFC06D7168F3B4A3B9CEF9EF9@MEYP282MB1687.AUSP282.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.102]
X-ClientProxiedBy: DAG6EX2.mxp5.local (172.16.2.52) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 242ba3ba-fc78-4df2-bc68-2872df792dc5
X-Ovh-Tracer-Id: 17707309311353260838
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrieefgdduudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeehnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepvedvgfeiffelueefvdegueduheehffehueetueefieefvefhjeeihefgheejffdvnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgrohgurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopefthigrnhdrnfhinhgushgrhiesphgvthgvrhhmrggtrdhorhhg
Received-SPF: pass client-ip=217.182.185.173; envelope-from=clg@kaod.org;
 helo=smtpout3.3005.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

On 8/3/21 1:22 AM, Lindsay Ryan wrote:
> Hi Cedric, 
> Thanks for replying.
> I think I want to go down the PowerNV Power 9
> Which I will need the OpenPower firmware. 
> Looks like the webpage for downloading prebuild witherspoon and skiboot is down/dead. Hasn't been working for me for 24hours anyway

Indeed :/

> Is that the only place to download that firmware?

Until we find a new hosting place, probably GH, you can try to build 
the FW images :

  https://github.com/open-power/op-build

from :

  https://github.com/open-power/op-build/archive/refs/tags/v2.6.tar.gz

or you can use these v2.6 files :

  https://www.kaod.org/qemu/powernv/

Cheers,

C. 


