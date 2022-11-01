Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5E36147EC
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 11:49:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opooI-0002ZU-S6; Tue, 01 Nov 2022 06:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1opooF-0002ZF-OC; Tue, 01 Nov 2022 06:47:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1opooE-0005H8-7i; Tue, 01 Nov 2022 06:47:55 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MAchM-1ojAyq2Leq-00B3QH; Tue, 01 Nov 2022 11:47:48 +0100
Message-ID: <439f8fd5-d7bb-fd10-07ad-80d3ade70175@vivier.eu>
Date: Tue, 1 Nov 2022 11:47:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] qapi: virtio: Fix the introduced version
Content-Language: fr
To: Han Han <hhan@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com
References: <20221101014647.3000801-1-hhan@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221101014647.3000801-1-hhan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:73PoVmVENF5XSHm16/Acp6DHBc3i6PbqD26P6GAApdIWClrk8Ev
 s8knVwPpV28JiGp0eBVbFa4ZESXvLyKoApNA83yNmT2ZHNisXUDf9SRxG/BiqtbdgmDY/Rj
 e8q+AN4wgJCrrd6h8QerY6QPsiBz/OAgC4Zl8IIwFuSA7TlZE3iCALf69d/Bjtnf90B15Cd
 aVXthmC/BuH7evvcJo6bA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nwmRHegJYeM=:m+fUkrBbKrRmP36s7K1NpW
 M7q+95pSjPAv66On1NzFZi6mernBQ5zTwO9VWplRl5NNSnhUg2hDomvPl70FGRj4JGo7j7Z1O
 /35p91Xw6Trmlf6E9rHElA6V7Gx5EiIDn7tJsAzeD/xDsYvFOARznl3sEYRoIWX+MNOl89vVP
 BM3Az4rzhwr5Swi7enhaIAonqurL8nsblnA/SIjgt49d/FI6YZdYGhRCYljmloTXbJcU7vtQ1
 1PUFMrXBLcyUautwZMZqDCu1Vk/Tlk7S32/faQvs5AXyVfXbnsm/lbSnEO0rkYK9/CW+DuJu9
 Z/nwhSQ88lEeNr8HEkfUwkO8RsZSPCtpCiwA1fIgQpInsKC39NPkEh0NLOteNeuA9dKru/+Xp
 F7pLOs3tYzyM6YDXph2fzlyaWZ4yv+47xaVi5yHitf8S1qwgbvjyMfi34jJ9QrYwyH5W1cUNR
 gYzvcVjSbSGNgbZ7Uj/TQREP5pc3PB4Fxgnlfkc6zBkSK0MYOhxARHuQFthNFjeQZ3DQfDfqb
 091t/IQCTuPrZAx525/OspHdiOkZiOrIMzhV6cLIpaarUzAbhAkZ5uCYznQgfZXknojj+hIIU
 asDPoQigS+p7dlp9K6cFqBsCOi9wtiTxfDLpRe/UnLq6NwrtGqePwIDPt8h7hdwo4rpBUorjZ
 InVFwiFoDyLw/o3KH+vW/PFVDJxgUuzbiphuxl5xc5Zgl+s0m1WbptidbY+grnJETJVZ4Kjv2
 J11VGsHlrZbK7XT+wRd0oCYiijJV9Gs7jnuGVmD9xKI+3wMhtHWPRcEI/euTOJBTfu8TaN8q3
 LroNF0X
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

Le 01/11/2022 à 02:46, Han Han a écrit :
> The items of qapi/virtio.json are introduced at a5ebce38576. They will be
> in the version 7.2 not 7.1.
> 
> Signed-off-by: Han Han <hhan@redhat.com>
> ---
>   qapi/virtio.json | 34 +++++++++++++++++-----------------
>   1 file changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


