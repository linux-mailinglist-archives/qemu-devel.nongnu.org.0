Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F51A66DF90
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 14:55:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHmQ7-0004lL-Sq; Tue, 17 Jan 2023 08:54:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1pHmQ5-0004ks-Qz
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:54:33 -0500
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben.dooks@codethink.co.uk>)
 id 1pHmQ3-0006Br-VQ
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 08:54:33 -0500
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=[192.168.0.16])
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1pHm4j-006WN6-8u; Tue, 17 Jan 2023 13:32:30 +0000
Message-ID: <c29fe486-d510-2c0e-ed38-9f05c0f4679f@codethink.co.uk>
Date: Tue, 17 Jan 2023 13:32:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] hw/net/can: Add mcp25625 model
Content-Language: en-GB
To: Ben Dooks <ben.dooks@codethink.co.uk>, jasowang@redhat.com,
 pisa@cmp.felk.cvut.cz, fnu.vikram@xilinx.com, qemu-devel@nongnu.org
Cc: Nazar Kazakov <nazar.kazakov@codethink.co.uk>,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>,
 Frank Chang <frank.chang@sifive.com>
References: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230104122220.110412-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=188.40.203.114;
 envelope-from=ben.dooks@codethink.co.uk; helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.097,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 04/01/2023 12:22, Ben Dooks wrote:
> From: Ben Dooks <ben.dooks@sifive.com>
> 
> Add support for Microchip MCP25625 SPI based CAN controller which is
> very similar to the MCP2515 (and covered by the same Linux driver).
> 
> This can be added to any machine with SPI support in the machine
> model file.
> 
> Example for using this when configured into a machine:
> 
> 	-object can-bus,id=canbus0 \
> 	-object can-host-socketcan,id=canhost0,if=vcan0,canbus=canbus0 \
> 	-global driver=mcp25625,property=canbus,value=canbus0
> 
> There is tracing support with --trace "*mcp25*"
> 
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> Co-developed-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> Co-developed-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Signed-off-by: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>

Has anyone had chance to review this, it would be great to get
this moving along.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


