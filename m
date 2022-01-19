Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B61084937AF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 10:48:20 +0100 (CET)
Received: from localhost ([::1]:60814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nA7Zj-0004O7-RB
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 04:48:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nA7O9-0004yC-QA
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:36:21 -0500
Received: from mail.ispras.ru ([83.149.199.84]:59416)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nA7O6-0007QA-SL
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 04:36:21 -0500
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 9140440D403D;
 Wed, 19 Jan 2022 09:35:43 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] plugins: add a drcov plugin
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 NDNF <arkaisp2021@gmail.com>
References: <163491872706.304355.11795681036780988723.stgit@pc-System-Product-Name>
 <87v91l0vvt.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <155b5061-bc5b-6a23-ea5a-1d0fd367dc16@ispras.ru>
Date: Wed, 19 Jan 2022 12:35:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <87v91l0vvt.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: arkadiy.ivanov@ispras.ru, qemu-devel@nongnu.org, pavel.dovgaluk@ispras.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.10.2021 22:03, Alex Bennée wrote:
> 
> NDNF <arkaisp2021@gmail.com> writes:
> 
>> These patches adds the ability to generate files in drcov format.
>> Primary goal this scripts is to have coverage
>> logfiles thatwork in Lighthouse.
> 
> Queued with some fixes to plugins/next, thanks.
> 

ping

