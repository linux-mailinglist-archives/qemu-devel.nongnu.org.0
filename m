Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17412D9349
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 07:36:21 +0100 (CET)
Received: from localhost ([::1]:42146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kohT2-0004JD-Fw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 01:36:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kohQp-0002VW-Pg
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 01:34:03 -0500
Received: from mail.ispras.ru ([83.149.199.84]:49772)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1kohQn-0007Ab-J8
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 01:34:03 -0500
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 526A940A3659;
 Mon, 14 Dec 2020 06:33:52 +0000 (UTC)
Subject: Re: [PATCH] icount: improve exec nocache usage
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <160741865825.348476.7169239332367828943.stgit@pasha-ThinkPad-X280>
 <bce56bb4-dd59-d408-ca17-1df944ef6259@linaro.org>
 <766d28d8-9c54-9740-5f10-4c0852c5b8f6@ispras.ru>
 <c50c27a0-7e94-b120-bef9-60ddfcd28e3c@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <486b6222-e2d0-5b0c-f972-247d6b4d021f@ispras.ru>
Date: Mon, 14 Dec 2020 09:33:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c50c27a0-7e94-b120-bef9-60ddfcd28e3c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12.12.2020 17:31, Richard Henderson wrote:
> On 12/12/20 12:22 AM, Pavel Dovgalyuk wrote:
>> However, we can't cache them directly, because hash table can include only one
>> block with the specific pc.
> 
> That's not true at all.

Thanks, I missed, that icount is used for TB comparison in hash container.

Pavel Dovgalyuk

