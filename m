Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C22165B8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 07:02:14 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsfkD-0005bB-B0
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 01:02:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jsfis-0004JL-L6
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 01:00:50 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42908)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1jsfik-0001mQ-Ch
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 01:00:47 -0400
Received: from [192.168.0.183] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id D248E40A929E;
 Tue,  7 Jul 2020 05:00:38 +0000 (UTC)
Subject: Re: [PATCH 00/13] Reverse debugging
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <159316678008.10508.6615172353109944370.stgit@pasha-ThinkPad-X280>
 <dfc29ce7-1560-6c07-fac7-7aa7f90f9616@ispras.ru> <87lfjwpgei.fsf@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <badefa6e-b9e1-4364-749c-01e3b156a6d0@ispras.ru>
Date: Tue, 7 Jul 2020 08:00:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87lfjwpgei.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 01:00:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: kwolf@redhat.com, wrampazz@redhat.com, ehabkost@redhat.com,
 mtosatti@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com, mreitz@redhat.com,
 philmd@redhat.com, zhiwei_liu@c-sky.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.07.2020 22:55, Alex Bennée wrote:
> 
> Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru> writes:
> 
>> Ping.
> 
> I started going through this and then ran into some merge conflicts. Are
> all the pre-requisite patches now merged via Paolo's tree?
> 

Yes, everything is merged.
I pulled the latest master minute ago and got no conflicts with the patches.

Pavel Dovgalyuk

