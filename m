Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F333236DFA0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 21:38:33 +0200 (CEST)
Received: from localhost ([::1]:52604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbq13-0007oH-03
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 15:38:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lbpv8-0005D0-1R
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:32:27 -0400
Received: from [201.28.113.2] (port=60248 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>) id 1lbpv3-0003f4-6U
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 15:32:25 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 28 Apr 2021 16:32:14 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by power9a (Postfix) with ESMTPS id 759D08013BA
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 16:32:14 -0300 (-03)
Subject: Re: [PATCH v4] target/ppc: code motion from translate_init.c.inc to
 gdbstub.c
To: qemu-devel@nongnu.org
References: <20210426184706.48040-1-bruno.larsen@eldorado.org.br>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <4201dd61-d867-b112-b581-a30f90c4dbad@eldorado.org.br>
Date: Wed, 28 Apr 2021 16:32:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210426184706.48040-1-bruno.larsen@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-OriginalArrivalTime: 28 Apr 2021 19:32:14.0635 (UTC)
 FILETIME=[313FD7B0:01D73C65]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a test. Please disregard


