Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C33331FC4
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 08:29:50 +0100 (CET)
Received: from localhost ([::1]:44494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJWoO-0005v2-MU
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 02:29:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJWmW-00053r-UL
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:27:52 -0500
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.218]:36701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.wagner@ulal.de>)
 id 1lJWmU-0007Fe-Or
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 02:27:52 -0500
ARC-Seal: i=1; a=rsa-sha256; t=1615274867; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=EViwTo38WuwsuXM+J+S/vDq9EFO9nN7NGAWHuBzKAZYylJaPTvFBXNS7ZXcIH/0IcZ
 sKuRiySOpNx/gPW48wE2XYmxgm36vNMar7fo1LZejE9KS3TfS83Hgfk2m7H9kpIcoX4l
 40GaqhRV/hlTZoHSUZ8m77C88IBuQBarS0b0kkVHngASLrwBZwco3DKDf+WiczYdAlyI
 Vsx374jo1Yq6oPWT9jqmbHPUsI/7ncXhuZ4Gnu5P0f+Wnn7qLVa1aEjqA9/L6GKmgGc0
 OICSrt1XO9dPZtbbadNCwzgL70C0PVgWHIB8JBC6edQ1UVWkQtTVBkXloTzKgsSNP2am
 PWig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1615274867;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Yqh3ytejkzwqWKWxB3PRtf7ZS4koPgJK5xlPpopSm9Y=;
 b=YgwXyikx0gQE/IkV1FKMerz3kCEtbvfH4JbNgxuhq3OqQy+Fx3CYxCR1+PTTknLM7O
 iXFHp714IiDYl3xdVeDHjnJwNGWBpLioJOjSwwZIoIT6ZrQ8LCV5WNfPLu6zAsm6N2+b
 m9EmdTBqsDGo22DGgb01nOwvr6xrEdjgNBv4nlL5shBIa+MIXbPq13P4M217S6F5ArUc
 RnUGpJ7kI4/CLfXabSgz/HxftDBcEeO15ss0ftuFapMQq4BwmnmYcFUihE5HK2pXOWvl
 BLbNhCXi4pojh+xXYqBRFrTD5h8IOlO6oJbUQC4p8cqCiPV0kD1piibsONxC1vgqddZZ
 QIHw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1615274867;
 s=strato-dkim-0002; d=ulal.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=Yqh3ytejkzwqWKWxB3PRtf7ZS4koPgJK5xlPpopSm9Y=;
 b=tWbuoxuKGorNz8DqOdIONar8teiZLeB5FTPQ52Hr84K22pbfHZHcWA2LDRuVwKTYZG
 HYOCN9Wuz4TE/3ivQp7/rrNqMCF+X0fn5/3ZB2QtQR9wMDCUX7NiUdPs0X23efloTvzF
 jH0BwIOTIkQGCGmW2nJ+m+HhxNROqhW2q6yQqN5FK6VK6qad5YWyseQfnTUdpeqEVVtp
 pGe9WOorw+A/KlzyRF7lRi/RbvZS2RjygnrXd0TsbTijXyUWVz06u+4oLeGZOP2lONyu
 XO1abMu5pBi4aaDkhKchuKQ4OLXbSBPcs0llkS0gLF9D3DvDG1+mm+RISOB15/pc3XGI
 Fb8g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":LWABbUGmf/p3d3fx281mbpk9zOkHG9L8L9MnY9md4b2JSSHyzkN3ON0Uun6F+zrkVqc/ZmTClqkOE9IdMVvnQ2O6vlW7Z+qlJRBbUq68WzKpoQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2003:c3:9719:3d00:bb52:98ae:ee53:17cd]
 by smtp.strato.de (RZmta 47.20.3 AUTH)
 with ESMTPSA id c075a1x297RkFCG
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 9 Mar 2021 08:27:46 +0100 (CET)
Subject: Re: [PATCH] hw/char: disable ibex uart receive if the buffer is full
To: Alistair Francis <alistair23@gmail.com>
References: <20210215231528.2718086-1-alexander.wagner@ulal.de>
 <CAKmqyKM4ewocr51Qhx8R1XR=r2rcgyuBLTqhpi-MYVpFko_Rcg@mail.gmail.com>
From: Alexander Wagner <alexander.wagner@ulal.de>
Message-ID: <19c50d64-fe9d-8c72-2002-3586abac821c@ulal.de>
Date: Tue, 9 Mar 2021 08:27:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKM4ewocr51Qhx8R1XR=r2rcgyuBLTqhpi-MYVpFko_Rcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: none client-ip=81.169.146.218;
 envelope-from=alexander.wagner@ulal.de; helo=mo4-p00-ob.smtp.rzone.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 08.03.21 14:47, Alistair Francis wrote:
>>   hw/char/ibex_uart.c         | 20 +++++++++++++++-----
>>   include/hw/char/ibex_uart.h |  4 ++++
>>   2 files changed, 19 insertions(+), 5 deletions(-)
>>
>> diff --git a/hw/char/ibex_uart.c b/hw/char/ibex_uart.c
>> index 89f1182c9b..dac09d53d6 100644
>> --- a/hw/char/ibex_uart.c
>> +++ b/hw/char/ibex_uart.c
>> @@ -66,7 +66,8 @@ static int ibex_uart_can_receive(void *opaque)
>>   {
>>       IbexUartState *s = opaque;
>>
>> -    if (s->uart_ctrl & R_CTRL_RX_ENABLE_MASK) {
>> +    if ((s->uart_ctrl & R_CTRL_RX_ENABLE_MASK)
>> +           && !(s->uart_status & R_STATUS_RXFULL_MASK)) {
>>           return 1;
>>       }
>>
>> @@ -83,6 +84,8 @@ static void ibex_uart_receive(void *opaque, const uint8_t *buf, int size)
>>
>>       s->uart_status &= ~R_STATUS_RXIDLE_MASK;
>>       s->uart_status &= ~R_STATUS_RXEMPTY_MASK;
>> +    s->uart_status |= R_STATUS_RXFULL_MASK;
> Doesn't this mean we set RXFULL on every receive? Shouldn't this check
> the rx_level first?
>
> Alistair

Thank you for having a look! :)

Yes, this is correct. The RXFULL is currently set on every receive. The 
RXFULL is used to indicate to QEMU that the device cannot receive any 
further bytes.

As the FIFO buffers are currently not yet implemented I thought it would 
make sense to behave like the OT UART could only receive one byte at a time.

Alex


