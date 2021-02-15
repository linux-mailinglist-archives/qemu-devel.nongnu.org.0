Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6230C31BF7E
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 17:38:22 +0100 (CET)
Received: from localhost ([::1]:49570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBgtB-0007T5-GX
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 11:38:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lBfjt-0003Rf-KX
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:24:43 -0500
Received: from mailex.trusted-objects.com ([149.202.244.204]:11256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <v.dupaquis@trusted-objects.com>)
 id 1lBfjq-0001yy-VP
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 10:24:41 -0500
Received: from [192.170.0.219] (88.127.245.42) by S76918.EX76918.lan
 (2001:41d0:117:dd00::95ca:f4cc) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P521) id 15.1.2176.2; Mon, 15
 Feb 2021 16:09:27 +0100
Subject: Malfunctionning qemu-system-arm ?
From: vincent Dupaquis <v.dupaquis@trusted-objects.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20210211141515.8755-1-peter.maydell@linaro.org>
 <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
Message-ID: <e00943e0-b9a7-1688-b169-3650e8e4290e@trusted-objects.com>
Date: Mon, 15 Feb 2021 16:09:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <14af0670-caaf-caf1-0b90-fb10c7db13b0@trusted-objects.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: fr-FR
X-Originating-IP: [88.127.245.42]
X-ClientProxiedBy: S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc) To
 S76918.EX76918.lan (2001:41d0:117:dd00::95ca:f4cc)
Received-SPF: none client-ip=149.202.244.204;
 envelope-from=v.dupaquis@trusted-objects.com; helo=mailex.trusted-objects.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 15 Feb 2021 11:36:38 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

    Hello,

    I am using qemu-system-arm with a netduino2 target, supposingly
integrating a STM32F2xx chip.

    I tested using the STM HAL in order to make a simple program run,
and I just failed to have it running correctly, it satyed stuck on the
starting HAL_init() call.

    Debugging the code, it appeared that stepping-in was making the code
work while when running it it failed (stayed stuck in an infinite loop,
but no obvious arm violations).

    Has anyone any idea of what could be the cause for this ? I am using
the latest STM32 HAL, with a qemu version 5.1.0 on a Ubuntu 20.04
machine. What is the level of support this type of target is supposed to
have, and posibly which limitations should I take into account ?

    Best regards,
        Vincent.


-- 

*Vincent Dupaquis*
Software security & Cryptography expert
06 24 58 17 05
/Europarc de Pichaury Bâtiment B8 1330 rue Guillibert Gautier de la
Lauzière 13290 Aix-en-Provence/

www.trusted-objects.com <http://www.trusted-objects.com>

