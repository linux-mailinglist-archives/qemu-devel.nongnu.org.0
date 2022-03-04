Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E843D4CD283
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:39:15 +0100 (CET)
Received: from localhost ([::1]:38856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ5L9-0004jb-2J
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:39:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Dh-0002tN-Pt
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:31:33 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:53507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nQ5Df-0001YO-3y
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:31:33 -0500
Received: from [192.168.100.1] ([82.142.8.122]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MtOOm-1oKW7Y20OE-00upsk; Fri, 04 Mar 2022 11:31:22 +0100
Message-ID: <f100bdf5-bce0-fcce-e8ec-62f0b4b73d4c@vivier.eu>
Date: Fri, 4 Mar 2022 11:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/10] esp: include the current PDMA callback in the
 migration stream
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, pbonzini@redhat.com,
 fam@euphon.net, qemu-devel@nongnu.org
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-10-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220302212752.6922-10-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+AQpPKUpNkWWyA4aCimxwP011lll/MpRzeL7qrE7o9PpesXLqSZ
 gpreJiECArTb/U0zpx9rKusR4sT2xhQ+JyyeeKDRQXorknHKjEcbG8BUi7TLfFmKgEsI/zA
 741+6HTkcxOl2rIwkOaevxq77trn/7OkVKrRf8AAKklKRevD4w9yWXArUIhV/A3EnCTx83J
 HcVCD+nPT1oX4JJD7U9sA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:a9u+kHYkqV0=:gHuErK1Xak3UKVS0Ylzc8b
 UmpqkkGXrKjJ0NOLQwmFLZDL39HwVjjPfpdxB95sPEd68YuaJU22X8uC6JosLFE9zgcBi+gqp
 ZgV3XNGM9Hu/soGkWdVsaEbAxi6OHu88e9kjND52Satnt0hc5bsu9TN6xOhta8sajfABrep+T
 ChPdVuDoCFA26Eu+dfQeQXkVxXAy8mJ4XYwXbkGaaMSKB/4Et6BG8M5bdl1oc3mApt1rCwyMO
 Tjzv8Zj1Wcko5caPRajiBxWzCXJfbh4dzB73aRDzy4MX3WOcewc/h4Ii3rPncLH3vr9v8Hr1b
 eXYSoO7OtMoSAvk6syg2Cw9eLUbQipgmKvOiCe6EMYcOvUd5OS2bi1iZCDHvBIRJoquK1z2pO
 iRuaPLAVD6Aaf+M/KqLPPUX7sibgyrgvtGm+dXFFMthNKaXrLwYmbaejLankx6Fi5WhjZiY6z
 LBvP5gOv/Y3emXmwNr7R23/umIC+G2yiGeIgJ+VNybiPjxXx9Q+0qk7h6KmvrliQanVAryqHG
 2n5RdqEFq3oWtTPzE1EWALt+B9yVYeMv1pzw21K13eO2WOC6LuHEeBejcdOvy8ijuDIHDU2Z6
 d4FBBwzkDDHETBVoAALYUCvn2X4VrD0hMrb/WjUlA4/RKZ/NuFdbr7nm5UCoEFgLvdQES1kWN
 xtZg2S9H824ela4NbMbNcs8l8RmwXjRvnL+jcwjYlnpDpWZx0kkMZCbVC8BfLQ+X3GJM=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 02/03/2022 à 22:27, Mark Cave-Ayland a écrit :
> This involves (re)adding a PDMA-specific subsection to hold the reference to the
> current PDMA callback.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   hw/scsi/esp.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



