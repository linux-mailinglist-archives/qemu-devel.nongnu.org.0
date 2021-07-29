Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3603DA0BF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 11:59:40 +0200 (CEST)
Received: from localhost ([::1]:36832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m92pH-0003rD-Ex
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 05:59:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92oU-0003CG-4A
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:58:50 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:33699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1m92oS-0005dS-Bl
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 05:58:49 -0400
Received: from [192.168.100.1] ([82.142.21.182]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MPoPd-1mUg7s0Yux-00MpzY; Thu, 29 Jul 2021 11:58:43 +0200
Subject: Re: [PATCH 1/3] docs: Move the protocol part of barrier.txt into
 interop
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20210727204112.12579-1-peter.maydell@linaro.org>
 <20210727204112.12579-2-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1057128c-6a1a-106e-d720-fc5be94d5551@vivier.eu>
Date: Thu, 29 Jul 2021 11:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727204112.12579-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XBvj9bEp0/O6H2p/5DqtOZMhsLZ+lRbiHnclmb2GInsToCY1cOG
 00Tk4JWe7hsyN1f1ZdihjOLM5HTvTwN5Y9H6rWXKbJEJ6WRV6ce9dUFys71cWq+ItsgbccR
 OpywE9wn36vmYUUPj1Z5ylPeKUy5kSMt+wWZ2tU2iIq/ov7tUMnher5fR5Q3KvgL6LPzI2J
 heiILSiOyvCq/4kJO5YIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ewejOqV+Sno=:Mi+d7x/Egu6W1m7J37yXCT
 jlJh1m4juFqgB+wx1CIBAHbTcmB+ZtQbDkOw63/S5eyZQChYOc9IUVH2KKFxiBPtQ+NcBSafZ
 e60GGQHp8wPNAwjEhkIkJHXG03Vh3+zV1b297cPL9CX8I+yFnQxXM3RhxSY6DPLyIoLEXTqpU
 EULm7bE0x/8QTNMirF/h5CY3LkYhWMYwGEDfGfxAQdQclkBZdsyZFlEluue0f7jBIk83Zk7GR
 mRkIRZvvUfL5391jXRceqSTRg872C7pGMLe4dL+qV0yuMUciVPkiuUvPQxSSf7+9jKz1aPjgE
 H1nmEgaeUaS0GPoWaOqGMBwd+T8QoTpgYhcYRaXc0r+ThJbT6knKObnSBfqotyRMJUadveXe4
 qSh5MUoC0XO/FMvrQBSEmRXtev7KFkHu4ijhOEIP/r6gVpsLzvufASxMWdWjbhAqLgyhYorbp
 SIiVWgXO+RUAkcJZHLoO3auctdt+JXLCPVbfo/Qe3WzRRxodg/H8MVj1UPHS9Efrxtqep+cP6
 G/qLaqQNIZbwE4l/v9T7714SKko28Hque3AnRr1F9iUj0VkKYXwl6q4Gnf2GLzEBnpGu4nHfe
 6Hb1wFBqty1BE6IUpK/JM0UigLv0D6xM4pR2MtMWJkPzMp/TkrExhYO12t75rR6Ghw9RHfaVr
 X1Akt9de1ZKU1d1z9yohEyPI5xe4yOdqDWVEnIuvUaMUjl6AdNEkzB/Wu+d1DNC/wUIsISSNw
 /aTxDSu+kaZseHkNS9GodocnDMoFFj7HDB1+CUggX/Q3pLzv++E3/nsfqURgNTzP46QgjYWL7
 Xkz8Y6K4xN6fJpbyiEcMVFAVlsUUovAv1NLTEsSAOVQp32097hLGUSSpfJGh0XwrCZ0No3b
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.277,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 27/07/2021 à 22:41, Peter Maydell a écrit :
> Most of docs/barrier.txt is describing the protocol implemented
> by the input-barrier device. Move this into the interop
> section of the manual, and rstify it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  docs/barrier.txt         | 318 -----------------------------
>  docs/interop/barrier.rst | 426 +++++++++++++++++++++++++++++++++++++++
>  docs/interop/index.rst   |   1 +
>  3 files changed, 427 insertions(+), 318 deletions(-)
>  create mode 100644 docs/interop/barrier.rst

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


