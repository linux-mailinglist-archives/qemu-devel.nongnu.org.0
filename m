Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D057613FF8
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 22:35:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcPX-00034U-DT; Mon, 31 Oct 2022 17:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opcKG-0002UB-B7
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:28:12 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opcKE-0003wU-R6
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 17:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9m7H/3Q/FXS65/SUk/btrFqsbKaAQVhy5jDnHGmjlow=; b=u4fjqxi6ND1+xofMFJMxdLhrWb
 uPuTjh99HJ1QDDUsOE5lljJWaYllux8XnJuUDd0GyTJ3c3Q0mRuH5nznuussUNkfVxDxW/nUYsC5L
 ke9qrj2xX6gFfRFyZfV0lx2A5in/o+dkwMtkLbCkpYrjNyxxNrHFX7ZAF5b3JzYmvAtMtQ5zd9pRn
 /VDsfPnG9cymYoxpRj2KuEsZf12OG2UntCRZHpKmMeqzA1tMFAmDJlSI7rde7nSYj0XiMI9NZlj5y
 vp0oFynFNNovDFxFh2ZME5YhxMlt2A5Tjjm9vK8rAb/4zGGCQcKT1buy6cM0GwDFRkhiMfTwdYaXc
 TC6GD0VINrVx4uns9qvkm4N0B/CSc4JO8rIz0mwru3eywFlafBkjtYzd94TTtlPAA4VQns3P+HORU
 2qZji54IOHZvT/TLLP3mSaltnibpPFZdQbpu/0z5iVAa1MnaryPdPfMUhFs9a2P8yY89qq1mWsVyY
 wAEYPA+vQ7vxEDgBbjeizIGuW3I//aDiyy7CP2tuUgaDTZIEDBHjWqP6VwLHmrigIaJZmjZ7WKj1R
 xgDEMQiEZ+pX1dJJetYqfLeYPnhA/tS557rTTwKtpCE6s8H4dclJQMZSRXB9CMBTCUH3WsgWdVaIc
 jkBT/Uyn0+j3dHl4NYNL8QNhkMGuopIBgfUuTZJ9Q=;
Received: from [2a00:23c4:8ba8:7100:6571:576d:97b8:647b]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1opcK3-0000X9-TV; Mon, 31 Oct 2022 21:27:59 +0000
Message-ID: <66f22ccc-d83f-2bdd-3628-9e550a3d83f6@ilande.co.uk>
Date: Mon, 31 Oct 2022 21:27:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
 <1792277.8fnDRLUPHX@silver> <4c5f0a3a-18bb-dfca-61f6-28b48538b42c@linaro.org>
 <CAJSP0QUB+6Ttoeo6aDoH3WAdCK3AyXH+=4Oe_U7Lr8GrtNHtoQ@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAJSP0QUB+6Ttoeo6aDoH3WAdCK3AyXH+=4Oe_U7Lr8GrtNHtoQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba8:7100:6571:576d:97b8:647b
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On 31/10/2022 20:53, Stefan Hajnoczi wrote:

> On Mon, 31 Oct 2022 at 16:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> On 11/1/22 04:56, Christian Schoenebeck wrote:
>>> On Wednesday, October 26, 2022 4:10:54 AM CET Richard Henderson wrote:
>>> BTW Richard, could you add a message-id tag to your queued TCG patches?
>>
>> Sometimes I remember, but I don't use the same tooling for my own work as I do for queuing
>> other people's.  I haven't found much value in it.
>>
>>
>>> If you
>>> are using patchwork client then it suffices to add "msgid=on" to .pwclientrc
>>
>> I am not.
> 
> Tools that boil down to git-am(1) need to add the -m (--message-id) flag.

FWIW in my local QEMU git checkout I've run "git config am.messageid true" which 
alters .git/config so that the -m flag is enabled by default for "git am" commands.


ATB,

Mark.

