Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABB34FB6D8
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 11:04:00 +0200 (CEST)
Received: from localhost ([::1]:44946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndpxn-0002qf-02
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 05:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndptS-0001YF-9t; Mon, 11 Apr 2022 04:59:30 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:47132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1ndptP-0000hW-4q; Mon, 11 Apr 2022 04:59:29 -0400
Received: from mail.aspeedtech.com ([192.168.0.24])
 by twspam01.aspeedtech.com with ESMTP id 23B8kigb091894;
 Mon, 11 Apr 2022 16:46:44 +0800 (GMT-8)
 (envelope-from jamin_lin@aspeedtech.com)
Received: from aspeedtech.com (192.168.70.87) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 11 Apr
 2022 16:58:21 +0800
Date: Mon, 11 Apr 2022 16:58:16 +0800
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v5 0/9] Add support for AST1030 SoC
Message-ID: <20220411085815.GA5967@aspeedtech.com>
References: <20220401083850.15266-1-jamin_lin@aspeedtech.com>
 <66783c6a-4942-23c5-1052-0dcab389e177@kaod.org>
 <20220411020727.GA2461@aspeedtech.com>
 <77936087-0391-6b9e-6087-e62f016f799b@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77936087-0391-6b9e-6087-e62f016f799b@kaod.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Originating-IP: [192.168.70.87]
X-ClientProxiedBy: TWMBX02.aspeed.com (192.168.0.24) To TWMBX02.aspeed.com
 (192.168.0.24)
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com 23B8kigb091894
Received-SPF: pass client-ip=211.20.114.71;
 envelope-from=jamin_lin@aspeedtech.com; helo=twspam01.aspeedtech.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, SCC_BODY_URI_ONLY=0.833,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Troy Lee <troy_lee@aspeedtech.com>, Beraldo Leal <bleal@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:STM32F205" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 04/11/2022 08:23, Cédric Le Goater wrote:
> Hello Jamin,
> 
> [ ... ]
> 
> >> Do we want to be in sync with the zephyr naming and use ast10x0.c ?
> >>
> >>      https://github.com/zephyrproject-rtos/zephyr/tree/main/soc/arm/aspeed
> >>
> > We used aspeed_ast10xx.c to support minibmc family such as ast1030 and
> > may support ast1060 in the future.
> > If need, I can submit the new patch to change its filename to aspeed_ast10x0.c.
> 
> I did the rename. Please check what I did in :
> 
>    https://github.com/legoater/qemu/commits/aspeed-7.0
> 
> and tell me if you agree.
>
Agree and thanks for your help.
Thanks-Jamin
> Thanks,
> 
> C.
> 

