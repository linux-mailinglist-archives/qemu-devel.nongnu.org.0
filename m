Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4E84673B6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 10:11:23 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt4bC-0005AW-D9
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 04:11:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4Yz-0004ED-3F
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:09:05 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:43081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mt4Yt-0002H5-R9
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 04:09:04 -0500
Received: from [192.168.100.1] ([82.142.19.82]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1N9MlG-1mXypl3x0W-015INj; Fri, 03 Dec 2021 10:08:54 +0100
Message-ID: <a5d6cec0-8278-4e29-1575-22ab613f6bc8@vivier.eu>
Date: Fri, 3 Dec 2021 10:08:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 05/15] target/m68k: Remove retaddr in m68k_interrupt_all
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211202204900.50973-1-richard.henderson@linaro.org>
 <20211202204900.50973-6-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20211202204900.50973-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PJqXf7yBAKnn4mA5EPrNM9OSrQ8H4B5sDB55Gs14iJdC9jKApda
 xYnrLLkuw5sGW9fEgnaJaSZoW2N26KpOxNO3MIEqZ5VyPjqlANcyC4jJc7nVgpT2FKA3u33
 uEXbnD3XJxSO/OCM7d4kZBAfnIm3wnRiHUctRF1aMWLrUB+TBg3bvhCI+dIx0pyQeOqPmdf
 qdeYMPMw4mxNMGgNOFNXA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VTPx4qMsh80=:oPfz75HmGPnscBkpu9DJkb
 hnZCbPOuIJr+bLzws0qqslYso3qg8Tw8hlCpRjRgf8q4+fByvBrhrPWzD1OWcRSS/60i4y2Ic
 66DZ0jaxlw3W1b04E3jxUwXr3BWmC6aKqeLRxFjy2rI6RJpeN3EArmwlbv++ZPjvnXOnUhp4L
 00G4VAY8d3AaGVpq6SanIt9qFyRni5l5aUzpcntgI3oGxducu5eU6vArrMwS7TpzHOp3P1Vs4
 ico+50QYXyfoShA0c0KVyU01nX0tChZfXD2LV99+HVj8iCuH0UIw4aocfqMpfE41YQG0aTarc
 r3q4aBVYVZEV3X5zfGR250JevWfbHbblpMREBdpAzj+VSSfvwKOlL1vsSU+AehLVx9RejEkxe
 YgLTONZonBjZDp1Tbf+p9u7eFftV1gGUkpHn55xLUT5e9ZUtBbYzCHOpeII+HG+caprC7etV1
 bFuSmhFG0Z8UylUwnOw8p8gJgYCqGsoR3vvLynQP/+SvGy1mLnBEgwd1FmUxYDCf6iOhk2nuB
 K2zKap72mZv9MDZDQEY/Btw3/wg8JyzYg++MaXkHYD0FK4NZMu9jYgjoYuKxgGZwk9plfZAsj
 v//fYFGCP8FNr4y5wnueniVPIFquqgPnNLbJXLoL/yLx6WKmq9QTWRju3p1yZTxHh2gc4aZBb
 T56KcQgOyinCHSKcwjeydU58P/dqm7jPCrFSU12KRS88sEAAVCJDiobAzC5ThhNMiF8M=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.938,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/12/2021 à 21:48, Richard Henderson a écrit :
> The only value this variable holds is now env->pc.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/op_helper.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


