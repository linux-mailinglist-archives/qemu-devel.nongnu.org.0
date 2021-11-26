Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C486045EDBC
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Nov 2021 13:16:02 +0100 (CET)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqa92-00044K-JX
	for lists+qemu-devel@lfdr.de; Fri, 26 Nov 2021 07:16:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqa2G-00033Q-GE; Fri, 26 Nov 2021 07:09:01 -0500
Received: from [201.28.113.2] (port=52438 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1mqa2E-0001Ve-0l; Fri, 26 Nov 2021 07:08:59 -0500
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Fri, 26 Nov 2021 09:08:54 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id 6DC8E800CFF;
 Fri, 26 Nov 2021 09:08:54 -0300 (-03)
Subject: Re: [PATCH v2] target/ppc: fix Hash64 MMU update of PTE bit R
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20211125183322.47230-1-leandro.lupori@eldorado.org.br>
 <YaA0nkWqcGdZ7jM2@yekko> <96b6e427-e9e6-5f09-2858-a203bf6b44be@kaod.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
Message-ID: <8fa4778d-dca4-9122-6e06-6371c0c7eae4@eldorado.org.br>
Date: Fri, 26 Nov 2021 09:08:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <96b6e427-e9e6-5f09-2858-a203bf6b44be@kaod.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 26 Nov 2021 12:08:54.0691 (UTC)
 FILETIME=[62057F30:01D7E2BE]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.993,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/11/2021 06:18, Cédric Le Goater wrote:
> 
> Hello,
> 
> Curiously, I didn't get the v2 email.
> 

I've received an e-mail from postmaster, saying that delivery to 
recipients @kaod.org have been delayed, but I don't know why.


