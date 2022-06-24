Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D9C559A5F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 15:33:53 +0200 (CEST)
Received: from localhost ([::1]:35718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4jRY-0001qO-Oy
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 09:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jQB-0000uZ-26; Fri, 24 Jun 2022 09:32:27 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jQ9-0003Ha-Ac; Fri, 24 Jun 2022 09:32:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juW11aS3P8iUB06dpWXOs27VO1b4ci38WWDiyrb7+LU=; b=SJdInpKvpXD30ADbsjS5nKZp9x
 0p5DCNMCUFQ0dYM4+8BAnOFty9amPg/zTKdAKFYYK3z7vkRai/NUsLnqTEQ7NlFl5Jnt3R5NNa83y
 3OrYSG98ToUeTZkkeU1gN2xA4wtNRMLBB3OeGKo3GroCRZfb685lmbQI74KFZZtPpeNLDVrCy4Uyr
 GBc2detfbpD1ZaMzYNQHuLijHk5VeG//1W7T1POtHqtpIr9ngw0DSbmtMkOqZBh+4xZQO8JcrWCJT
 I94dYntEVoh/VMILIBWct5wLh+B7MYaKQFZFe7/GJ8hStWMXcHJjcGuXq1bO/AtPUlJfHYqp+Sqjn
 v/vNKn5gNeQ+YTKtsaj8ZmqnoLFswiZN2ntSiYTa8uRnbNDuzrcA3T90dLzIX7rR1xzwGAowIRCMv
 /08PZrqlF+/Kpj82ZjfA1B+NBgVDJWsgk8xp325ul5k8H7eBu/MK+YuqWCoWccaj71dAWkMI3ch7p
 A4Dzv6KoZUVdajk+unY0SoewkD6z4wpw4VjPRNd16uxf7LE4/Dk0fcegAiQ9RgXE7P8wxmXJcRb2w
 NntH3qP/BHxd8E4nNX5IeeCZ20bIzit4F8PZB/jmXjLqEuwWaBX9qsCRPgNyiQo9Fmj+2K8k10r6R
 WuFtJud7iEFRjvxRF/JrZtGeeU51yk8h91kwoVGJ4=;
Received: from [2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1o4jOo-0002zc-28; Fri, 24 Jun 2022 14:31:06 +0100
Message-ID: <792ebc6d-b1e8-6b1b-2aae-123a472d85d0@ilande.co.uk>
Date: Fri, 24 Jun 2022 14:32:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com,
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com,
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-46-mark.cave-ayland@ilande.co.uk>
 <CAFEAcA9CxLKNZzfvaoUFSRtykEymu23er+zj=7GA1V2nRtcU9A@mail.gmail.com>
 <939ffd58-3a89-ea5b-157d-d4a9bd4dffa4@ilande.co.uk>
 <a425db75-5636-8b29-26d2-9bef52c8eb25@ilande.co.uk>
 <CAFEAcA-F_v_S3TMbtQvboBCzg9OsXM3YZ-Bs6yVabTpE9_yJ5Q@mail.gmail.com>
 <ee98844e-93e6-1c43-ae1c-57af166d9beb@ilande.co.uk>
 <CAFEAcA-5P+45sZeprHCsEWiXCQ_pojdPG9U042nmJEmr=Wi-_w@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA-5P+45sZeprHCsEWiXCQ_pojdPG9U042nmJEmr=Wi-_w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:e500:b82f:56f9:46d7:80ab
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 45/50] lasips2: use qdev gpio for output IRQ
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/06/2022 15:13, Peter Maydell wrote:

> On Mon, 20 Jun 2022 at 14:22, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> On 20/06/2022 11:17, Peter Maydell wrote:
>>> Well, I think that "unnamed GPIO out" lines should be for
>>> actual GPIO lines, ie on a GPIO controller or similar.
>>> If you want an outbound IRQ line and don't want to name it,
>>> that's what sysbus IRQ lines do. Otherwise, name the GPIO line.
>>
>> That's interesting - I've always been under the impression that this was the other
>> way around, i.e. for a TYPE_DEVICE then unnamed gpios are equivalent to IRQs, and
>> that gpio lines for any other non-IRQ purpose should be named :/
> 
> Well, named GPIO lines are relatively new, so if you look at older
> devices you'll probably find plenty that use unnamed GPIO lines
> for various things including IRQ lines. But I think that for clarity
> if you create something called "gpio_out" the obvious thing is that
> that's a GPIO output, and if you create something called "sysbus_irq"
> the obvious thing is that that's an IRQ line, and if you want to
> do something that's neither of those then the clearest thing is
> to name the GPIO.

Ultimately I'm not too concerned about the choice between sysbus IRQs instead of gpio 
outputs, since making the change later is quite trivial. I've gone ahead and updated 
this patch to use a sysbus IRQ instead of an unnamed gpio out for v2.


ATB,

Mark.

