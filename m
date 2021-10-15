Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B8642EA71
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 09:41:58 +0200 (CEST)
Received: from localhost ([::1]:47014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbHqn-0000YT-AM
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 03:41:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbHSw-00044y-GP
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:17:18 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:39385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mbHSu-0003SS-EX
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:17:18 -0400
Received: from [192.168.100.1] ([82.142.24.54]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M7JvQ-1meaqU1J3U-007mvZ; Fri, 15 Oct 2021 09:17:14 +0200
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20211013212132.31519-1-mark.cave-ayland@ilande.co.uk>
 <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH 4/8] mac_via: add GPIO for A/UX mode
Message-ID: <500bb7ea-6e59-a3d9-2da6-4efc192c894f@vivier.eu>
Date: Fri, 15 Oct 2021 09:17:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211013212132.31519-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:U7i69e8GGcYh1V7o10TZ5Cqo5Jdxrde1R7ueCFK+BoqDodRf37r
 hJ0Wn54bmEa4O/yUf8j9bhKqMxjXloM7Mh8KzpdTkpfom37GINhXwHAC0Ii+FpwNIj0Ud9O
 wbGkKuqTNXM0G4smY+4sqRGMA20tWmRbE3X+CD1iFqQJRskKj8CoJ7RfTohc7SjeIcB1HGg
 CSm9v8R82cokU1b+Kxx3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BR7YEgl4bi8=:UpNfpp95Oan/4EeNLN5qpR
 WxqOwBFK9upnyZk+xcl83uM6ZdK9PMj+7UPjG9MEWzGSJNJbceWK5aM3PoiKZrm3Kj+gvOp+7
 C8m3UlsrXjRRXEbLUETkqgE3a9K9QotVr7W1hUL8W2Q1pVravpJDD+b0rxAynsTrBn/UcGJwG
 AZ+3akKd2N8ZUKlXOSkQJB3DE4p/1tg9CpJdvCQr5oAMYCu6X5tEAnIET7v/se06yzaGKyv6f
 d9KfkFEyQHVBqhsbjqcInd0GTA5pt6i8XaxFaNedH8bh8TO97rNEm4nPEWCzJUPnd3FwQw3xZ
 WL9fxz009rg7aV6A7xGcYaSwfLWlI8lns9SRMwwG7kLtAqtO0zM802rIG+41Wx73SCBdjWaHS
 HX6C6QN8gi6pafWvIeJB04dle53FIzDumloGqi5WouYnZTTsq2lbKr5ZwhaeST5ZkRE+o5v7R
 MVrpa4By6TbX327A2T6nF7OZl82zMFWLseN7B88GyAcfS8t9k8QhrLXD7iIQB3kLJRylWVWOw
 cPaKJG4Tft8IgMKA4XcJrhnFZPh3AP3Bhhbf9A85RTRuO0eJ0noc/MHNAIDvGPPVNNgze9Sox
 93wBtbsbqs9K/U00OvhA+9zPynPR1SOywAlE5R7qvWVT0fV3CBFDcwbgTLw2Z4WzfXhhzc0eO
 LczbhVFXdWicvfKm0rbSe2UnZmiIfSqOHYgeZ/0z2xD4RPuaZJgilIzeVtz0E0NWmg5+Izths
 wIAzaXOIMQfv9HEbudE4Gh5m1blQH+ougTplKg==
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 13/10/2021 à 23:21, Mark Cave-Ayland a écrit :
> Add a new auxmode GPIO that is updated when port B bit 6 is changed indicating
> whether the hardware is configured for A/UX mode.
> 

Stupid question: why do you use GPIO to pass the auxmode information between VIA and GLUE?

Can't we use object_property_set_link() to set a pointer to the GLUE object?

Thanks,
Laurent

