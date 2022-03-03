Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427184CC432
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 18:41:29 +0100 (CET)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPpSC-0003UL-Ct
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 12:41:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpQW-0002Tc-3R
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:39:44 -0500
Received: from mout.kundenserver.de ([217.72.192.73]:38131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPpQS-0002Vt-Ok
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 12:39:43 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MhTt7-1o467W49VD-00eaNZ; Thu, 03 Mar 2022 18:39:38 +0100
Message-ID: <d9aaf1aa-65cc-33a4-1904-879d0ab4fa10@vivier.eu>
Date: Thu, 3 Mar 2022 18:39:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 02/12] mac_via: use IFR bit flag constants for VIA1 IRQs
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-3-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-3-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F8YNoD05/0vqC50oJxlWACwPWebUqOFLqLxCikg6NHbYdFrxkYB
 nj0tNxR/pdNpfFHWkaA0xsQRqFp7hR/aBc8WgYS+7tX5Mlw7K2aCUljfdyJBe9n2nV42wtQ
 MS0s/IcfovuU69vlmhoKLQVo852+zg51iOGg55OLi8+Baiv0z0oumqpPYosxWA0eVIUpGSj
 qTGJ24k/Y1SXF0oq6mUYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ly6owyCREM0=:jVai2jNYMsze3LyXwRU+G8
 wOkS37+4uFfUWPjMIO0ObqIAN1Z2chzWaebN/pbtWS7G5dsHqcwecx8Prbr2tuoHrkNTkTkDs
 0v56/X8ptWsVweEV4Hbxq6gzoYD0t6YBf4k6a/wnNuKo035PbC4/WY/mabjsANOKHJmPlKmU5
 hZFtu6F2mKd/SFT9XvqFLuXlKoiltFxD4ngI5wgw5aSIhWQ7kEM7jjBRjQUZylvg9RhVK7f8n
 o8yY64j4j7GWHdtEks73gtmlOAPwJfDblhJP4RMgFyM1Fd0gQ7w9KqQ+emCs/W8PyHXSKuoj5
 2HTUF0NtMSN6rWpdpPVNtIfyrhEBc4S8ItesjsY4b2wrYoDlcOW8hZKo4FomxeiBOa1b7G+Id
 TimLGaYf5amlb+nKabftV6wpy4M2yoOxJxZYGUtBdE6wkBw71/GKwa4lqBmQTv/EXKBuNBu/G
 CdyiYcu5SKgqk+rED0LzQb5ZkwTgLT5mWwtkM+8IWHD6TXORCDoQ2oBZ38O5jGhipMtdbmqnX
 W1EYtxovzFika43Soa/8OjGYwOMi5VHZwe0pbq9OkPxXIYsmVH4FSbxOsS75Ph33bAEwiA5D5
 k/GC9+TasSwdsQHQMMa7MMrJ3SVXFq4cHOs7XqyYUyQ9RkqUxMtq4ScPzPw+H7n47exiXQi/w
 tXVJsZCBD916c15mDlgzta14qAo9yWBMUNZSHyKJju+9Om3KNqi4C1fpFqQoC5qifNRg=
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

Le 24/02/2022 à 12:59, Mark Cave-Ayland a écrit :
> This allows us to easily see how the physical control lines are mapped to the
> IFR bit flags.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>   include/hw/misc/mac_via.h | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


