Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AD96241CE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 12:59:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot6Bq-00079N-5s; Thu, 10 Nov 2022 06:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot6Bj-00078K-0I
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:57:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot6Bh-0008OG-8O
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 06:57:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7rjg4c7S1Ipm7+p5gNCE8Mp0q98fdAgNQxh48WNR38c=; b=YGWxdXPDvGKqEaeVFV/OCAEyMU
 9pXZmaew+nfSbszWlZYRkZ7VpT2XiyLJyMy5SYT6w0dtZZpr18McjXI18jbyV9hoQt2+BybZ6aChx
 TURCE7anxYEhZjBSLfPrl6Ip+WqyMM17CwIzQI5aY4kq254AjtJT5tA8g9jAbDTr6+kUlU8fSoSo6
 Mp7zNim+sK2nTe5ZH1i3dmi5fLWaShkXdk0V3nnkNEIYCyJIPoc7LIbwxeZynChRko5/3YvCzmlZy
 EOS8uwOImRHpSzUO/l6lyvg/ICTtk0bQCV6wjFlqzWLyInNi9I8piabm9qMOn4J2VqM2YGS7Yg1CK
 QzZLewVW2WNAx89iJSuicpEJqwdYR+SaMTU0wUmmZXkZuAPXUwhhdpbR5qoYwEi89tUFCUPLrXEt6
 4uRKmqTHq5NxgkX5CWNs/bYFoGlVV8rHlbWQxJaDnJ4sAYy650Wwp11p+76jpWJSwfFMe9s9Q1iCU
 gwu62gXwfUHcJa2WfLNsiQDsbzuS2YVHQGUpmvfrsdn1J+67vXvBs9GxD35iBEUoAhdMLheNIRfVa
 F/OAqttOAL4FjZOfKt3Sm4X/D17P2E7w4+9Kfv2ca/uwg0lZhyS8HB4KPMC99r7yZ5VqRjidFPwV1
 IqejMZRAGzI/uDFTCOLB392qAxNiH9vgwNcLnlC9c=;
Received: from host86-149-46-27.range86-149.btcentralplus.com ([86.149.46.27]
 helo=[10.8.0.10])
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1ot6BW-0001AK-1D; Thu, 10 Nov 2022 11:57:34 +0000
Message-ID: <9bce8eb9-d023-8cfd-1c95-aa55e43599de@ilande.co.uk>
Date: Thu, 10 Nov 2022 11:57:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org
References: <20221109170009.3498451-1-peter.maydell@linaro.org>
 <cfbb4196-90e2-bb1a-eb2f-c49465b58f04@ilande.co.uk>
 <CAFEAcA9RQzPMZkde=8Kfh09uxV9RC1rsb-UtEWPhcjj1Kf4e_A@mail.gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <CAFEAcA9RQzPMZkde=8Kfh09uxV9RC1rsb-UtEWPhcjj1Kf4e_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 86.149.46.27
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0 0/2] hw/input/ps2: Convert to 3-phase reset
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/11/2022 11:22, Peter Maydell wrote:

> On Thu, 10 Nov 2022 at 10:36, Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>> I haven't used the new ResettableClass myself previously, however it seems to match
>> the excellent documentation at https://qemu.readthedocs.io/en/latest/devel/reset.html
>> so feel free to add my Acked-by tag.
>>
>> One part that did stand out to me in the docs is the part that reads "For now
>> migration of a device or bus in reset is not supported. Care must be taken not to
>> delay resettable_release_reset() after its resettable_assert_reset() counterpart". Is
>> this still a valid concern and something we need to think about? I'm thinking about
>> if a guest triggers a SCSI bus or PCI bus reset for example.
> 
> That only matters if there's a way for the guest to hold the device
> in reset, as opposed to resetting it as a point event. This is
> theoretically possible to do with the new API, and was simply
> impossible with the old API because with the old one reset was
> always a one-shot point event.

I see, thanks. And the documentation confirms that resettable_reset() is an assert 
immediately followed by a release so that shouldn't be an issue for 
device_cold_reset() and bus_cold_reset() calling the new Resettable inteface.


ATB,

Mark.

