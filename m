Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C50635E385
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 18:11:16 +0200 (CEST)
Received: from localhost ([::1]:45160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLdD-0000Q9-Jz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 12:11:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWLYc-00046g-8L
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:06:31 -0400
Received: from 8.mo51.mail-out.ovh.net ([46.105.45.231]:52776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1lWLYa-0005lE-1c
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 12:06:29 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.249])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 1E56E27DA2D;
 Tue, 13 Apr 2021 18:06:21 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Tue, 13 Apr
 2021 18:06:20 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001267d2cc2-cad8-4386-849a-64f4c3b6481d,
 4BE79BB08BA9582E888D4556D96BF37B7B4E8F35) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 90.89.73.13
Subject: Re: RFC: Adding new system, quanta-q71l
To: Patrick Venture <venture@google.com>, <peter.maydell@linaro.org>, Andrew
 Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>
References: <CAO=notxyM2Xu5e-iYKGHXEhgwWOb+CFmES8XjaBrx7JZcs+4sQ@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <dfc72c15-71f7-46e3-46fe-a1a391b0922e@kaod.org>
Date: Tue, 13 Apr 2021 18:06:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAO=notxyM2Xu5e-iYKGHXEhgwWOb+CFmES8XjaBrx7JZcs+4sQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 401973e3-fc74-4c27-9f16-5a27e95eef16
X-Ovh-Tracer-Id: 13942300025485822758
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrudekledgleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheeghfehlefgueduvdevgedvjefgtedvvdfhtedugefgheetleevieegjeelhffgnecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehvvghnthhurhgvsehgohhoghhlvgdrtghomh
Received-SPF: pass client-ip=46.105.45.231; envelope-from=clg@kaod.org;
 helo=8.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/13/21 5:47 PM, Patrick Venture wrote:
> HI;
> 
> My team is actively engaged now in producing Qemu support for new
> devices and boards, and I previously worked on the quanta-q71l board
> for OpenBmc.  I'm currently fixing up the configuration to build
> again, and I'd like to introduce a board for it in Aspeed.  The
> palmetto doesn't really represent it, there's only 128MiB of RAM for
> it, for instance, and it has its own idiosyncrasies.
> 
> To introduce a new board to the Aspeed Qemu, do I also need to send
> over a firmware for acceptance testing?

No but it's always better for non regression tests.  

Simply send a patch like : 

  http://patchwork.ozlabs.org/project/qemu-devel/patch/20210407171637.777743-19-clg@kaod.org/

I will queue it.

Thanks,

C. 



