Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6645A4CC6A3
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:57:57 +0100 (CET)
Received: from localhost ([::1]:47730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPraG-0004aR-Gj
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:57:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrUb-0002Zl-Og
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:52:06 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:45815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nPrUa-00078W-7U
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 14:52:05 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MwxNF-1oNiW122n5-00yUQG; Thu, 03 Mar 2022 20:52:02 +0100
Message-ID: <46d11397-618a-3ef3-5de5-9e5c59971fc2@vivier.eu>
Date: Thu, 3 Mar 2022 20:52:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 06/12] mos6522: use device_class_set_parent_reset() to
 propagate reset to parent
Content-Language: fr
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20220224115956.29997-1-mark.cave-ayland@ilande.co.uk>
 <20220224115956.29997-7-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220224115956.29997-7-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Z/xlwPPAFlHfoCNUHRTh+DoPdaC7MGLQT/aQtGTYfro1H0RYIBw
 ycOXyVzBy8CEdRofziLFvOmR8XFQl9TU+m4qvgwHya6PWGb96Ln9UQ/VV7Wb2IhwREax59l
 1Kcfrl1sRLNd8V+MNR00QNC0R94SZLcRYeaY+5wuPTtDMIRtfB6nHxIVNMUPwMljt2Eur5i
 mW/5oLViawtSK7T0o5zPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wi3wNmymz3Y=:AeBmdF2m1i5QYIBdGxbqdp
 bXEwjLkihkHAJR8JnxebNRXbnIftVARusZllO6x6FkfVXanzVO1tdDbIY7Lgep8156nPE5xTm
 XIMVjmP7nRx3IawtdU4lEQtmUZfRS6VpyCr4mc0/h3m86RH9A9DLW8X8PgEDUiXZLTUOIw5lQ
 eZsy5OSjQzWXCMhiTK/XkTLAVEy9bqe46AifWKKtK0uTYRQTa82sl7ooQhL8JRFngUISSrg68
 05V3w5s4mR8U/lW3600NXPq+vEHNj7R7AAGWiv28xekbe1ZWB5rkWumfDTMO5ZBZfiOgkWsqv
 6wR5VbVl9kKdGA2QgflpYB3Qzjvu8OwfQGdKdW0rRpt71LAkYddtOztZqSIa7hKqf2XSazD3o
 2IpEvqAPomhi9Hx8ff4uoF6khLZYQidC2wsYsQMbWjI8gumQFaWgHHaBV+4yz778WKdhAfr32
 /9hmjNmFx5twX+p8X8jINvPTzcxoYQHyeuS2PEN2tqb4X0+wAj4B66Iv0qYzv2AUCYzxOHJMg
 uLf1IMVdklBS0wAGBKUtedGwH3CmRxMSvvGGbGTcc6GXuVggy+DLL1yil2pRZjU19wLX98r3j
 OAG5mfPIU0B5abD+mIlg69IqefwpSZVdsj3xPyI8o0n2RK0OuF9f9Vs5pA19M/w87GB5aUYOK
 DuCtJZ3EDVcjTL/wewvIu+I5JguSTZcsQYR1wjruxkBJ80I0wbHWtmkgJglH7DPOli7M=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
> Switch from using a legacy approach to the more formal approach for propagating
> device reset to the parent.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/mac_via.c    | 7 +++++--
>   hw/misc/macio/cuda.c | 3 ++-
>   hw/misc/macio/pmu.c  | 3 ++-
>   hw/misc/mos6522.c    | 1 -
>   4 files changed, 9 insertions(+), 5 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

