Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 407E72BA59B
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 10:13:18 +0100 (CET)
Received: from localhost ([::1]:56202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg2Tl-0001nI-C7
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 04:13:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1kg2SV-0001A1-Fq
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:11:59 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:53942
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefan.weil@weilnetz.de>)
 id 1kg2ST-0000Fh-BQ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 04:11:59 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 854E2DA3AB0;
 Fri, 20 Nov 2020 10:11:53 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id TAkNUgbcgvmN; Fri, 20 Nov 2020 10:11:12 +0100 (CET)
Received: from mobile-151-123.wlan.uni-mannheim.de
 (mobile-151-123.wlan.uni-mannheim.de [134.155.151.123])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 7281EDA01E6;
 Fri, 20 Nov 2020 10:11:11 +0100 (CET)
Subject: Re: Peter Maydell
To: Paolo Bonzini <pbonzini@redhat.com>, Liviu Ionescu <ilg@livius.net>,
 cavinnarsinghani@gmail.com
References: <5A06DC2D-E6A3-4249-B05F-A424D684BD26@gmail.com>
 <1C01B0E2-8730-40F4-8C75-B8FE3E851747@livius.net>
 <a0f17e81-5113-2e49-4275-f70674c6edaf@redhat.com>
From: Stefan Weil <stefan.weil@weilnetz.de>
Message-ID: <5e7c012d-1205-9ad8-07ba-6c1b7a826ae9@weilnetz.de>
Date: Fri, 20 Nov 2020 10:11:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <a0f17e81-5113-2e49-4275-f70674c6edaf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71;
 envelope-from=stefan.weil@weilnetz.de; helo=v2201612906741603.powersrv.de
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20.11.20 um 09:54 schrieb Paolo Bonzini:

> On 20/11/20 09:44, Liviu Ionescu wrote:
>>> On 20 Nov 2020, at 07:43, cavinnarsinghani@gmail.com wrote:
>>>
>>> This issue is about the Qemu Will the Qemu work on the new m1
>>> macbook pro? And if yes, when will the arm version of Qemu be
>>> available for public
>>
>> I already distribute a binary version of the xPack QEMU Arm fork
>> which runs on Raspberry Pi OS (and most aarch64 Linux distributions),
>> and it emulates Cortex-M boards quite fine, so there should be no
>> major problems for the mainstream QEMU to run on Apple Silicon.
>
> As far as I understand Apple enforces W^X (a memory region cannot be 
> both writable and executable) on ARM hardware.  Richard Henderson and 
> Joelle van Dyne are working on it.
>
> Paolo


It might work with TCI (which does not require such memory regions).

Stefan


