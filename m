Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3476528A00C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Oct 2020 12:40:29 +0200 (CEST)
Received: from localhost ([::1]:46412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kRCId-0004xY-Op
	for lists+qemu-devel@lfdr.de; Sat, 10 Oct 2020 06:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kRCHJ-0004V1-Ef
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 06:39:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:38750 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pannengyuan@huawei.com>)
 id 1kRCHH-00085Y-1m
 for qemu-devel@nongnu.org; Sat, 10 Oct 2020 06:39:05 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CFB1EDD1362511CD6A02;
 Sat, 10 Oct 2020 18:38:46 +0800 (CST)
Received: from [10.174.178.98] (10.174.178.98) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.487.0; Sat, 10 Oct 2020 18:38:45 +0800
Subject: Re: [RFC PATCH 2/2] .mailmap: Fix more contributor entries
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20201004172644.2027440-1-f4bug@amsat.org>
 <20201004172644.2027440-3-f4bug@amsat.org>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <cfadfafb-f496-8d94-ef93-e49ed566993e@huawei.com>
Date: Sat, 10 Oct 2020 18:38:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201004172644.2027440-3-f4bug@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.98]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35;
 envelope-from=pannengyuan@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/10 06:38:47
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.208,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew
 Melnychenko <andrew@daynix.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Anup Patel <anup.patel@wdc.com>, David Carlier <devnexen@gmail.com>,
 Erik Smit <erik.lucas.smit@gmail.com>, Marek Dolata <mkdolata@us.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2020/10/5 1:26, Philippe Mathieu-Daudé wrote:
> These authors have some incorrect author email field.
> For each of them, there is one commit with the replaced
> entry.
> 
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Andrew Melnychenko <andrew@daynix.com>
> Cc: David Carlier <devnexen@gmail.com>
> Cc: Erik Smit <erik.lucas.smit@gmail.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: Pan Nengyuan <pannengyuan@huawei.com>
> Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---

Acked-by: Pan Nengyuan <pannengyuan@huawei.com>

