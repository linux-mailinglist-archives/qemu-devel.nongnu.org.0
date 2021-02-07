Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56D31276C
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Feb 2021 21:38:11 +0100 (CET)
Received: from localhost ([::1]:53790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8qor-0008F1-Ji
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 15:38:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8qn6-0007DA-19
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 15:36:21 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:52530
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8qn4-0004RE-68
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 15:36:19 -0500
Received: from host109-153-84-1.range109-153.btcentralplus.com ([109.153.84.1]
 helo=[192.168.1.65]) by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1l8qnG-0006n3-MA; Sun, 07 Feb 2021 20:36:36 +0000
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: qemu-devel@nongnu.org, peter.maydell@linaro.org, cfontana@suse.de,
 philmd@redhat.com
References: <20210128221728.14887-1-mark.cave-ayland@ilande.co.uk>
Message-ID: <e44c6eda-3165-0b9c-bfd8-bdbb0a1ea0d0@ilande.co.uk>
Date: Sun, 7 Feb 2021 20:36:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210128221728.14887-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 109.153.84.1
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/2] utils/fifo8: minor updates
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/01/2021 22:17, Mark Cave-Ayland wrote:

> This patchset contains a couple of minor updates to QEMU's Fifo8 implementation
> conceived whilst working on the next revision of the ESP series.
> 
> Patch 1 has already been reviewed on-list whilst patch 2 adds a new
> VMSTATE_FIFO8_TEST macro which is required to allow the updated ESP series
> to handle incoming migrations from previous QEMU versions.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> 
> Mark Cave-Ayland (2):
>    utils/fifo8: change fatal errors from abort() to assert()
>    utils/fifo8: add VMSTATE_FIFO8_TEST macro
> 
>   include/qemu/fifo8.h | 16 ++++++++++------
>   util/fifo8.c         | 16 ++++------------
>   2 files changed, 14 insertions(+), 18 deletions(-)

I've applied these to my qemu-sparc branch and will send a PR shortly since they are 
a pre-requisite to the respin of the ESP patchset.


ATB,

Mark.

