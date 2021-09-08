Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355440347C
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 08:49:30 +0200 (CEST)
Received: from localhost ([::1]:41372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNrOj-0003jl-B9
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 02:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrLj-0001Lz-CX
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:46:23 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:40659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mNrLf-0005NX-Vc
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 02:46:22 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mn2iP-1mqM063c8t-00k94I; Wed, 08 Sep 2021 08:46:17 +0200
Subject: Re: [PATCH 03/12] mac_via: move PRAM contents and block backend to
 MOS6522Q800VIA1State
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
References: <20210830102447.10806-1-mark.cave-ayland@ilande.co.uk>
 <20210830102447.10806-4-mark.cave-ayland@ilande.co.uk>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e46f7959-036a-2375-642b-fa840fc82246@vivier.eu>
Date: Wed, 8 Sep 2021 08:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210830102447.10806-4-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ALMhaRqlExW9feYAzL4rNJNUwlJVoRevcGJPGLeVQa2fBeZcWYJ
 CXwk8tKi5uxJyEmgbAVUvUAAeop6NgsY8S4+tctYusfa/28jphbjuqRvZ6wV8GU9VqoHeKx
 +Inc9jpTgUfR31tArtYnbQeMGObUJChArDZpcObLnnhO3SZd2zlZTFa5uL2eAs52qw+LNvL
 pMurcExlULgjl4UKC0QzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aVa3F7ukeUU=:ukd2rlQqAFpKwWEOalkPku
 dxpL2ztW3ypj5jMuflko3nE6gpkB3LLq79nR7EXZzhfM/M9yFpVNmHvn0snKi8jaJKJcoR1CS
 TmLonJUUhU2MCy9Yc7gLKvgp7M6GaOY1F5CyHrbLzbVqUJ7IAjg6wKv6sfurZaiZR4Pvpmke8
 pZe1FJVAuNgLF+4oQJMsbaOhCTNe03cA/dsdwl9BNHmnobLGJDqMpbTu8ih4fkcSWPv2e/P4v
 n09IuCEVLZWvmQ80Exreae8s4CpzTTBx1Qahw8I5IipuTZhRcRC6czLWqOK6HyTercK34WyF/
 EhOVgtvEDXLHz9PHN5uO6GpcZYyr8OlAZWzxtrFlAjZrPH1fs4t3JDFPbvnnN46n8Tklx0z4N
 IYhez+/Y9bC29M4fBz9QPGihETVoZE34VvTGYjyGUxfWgaoogfh/xyZ5Bdzk7smWAmXCAPrAN
 zkuCvxVwivuHyORWiKslsNMcGloPtV/5WuqHD1pwiJHQp0IX8jHe6yLGoO5lURPLoXu7YfOBZ
 XiAH07fx5z8HA5L95duT6nS9e5KJUaxhNCQmALlS1DKt9KFjmPeaJ0bDOLyG1iGfYoxF7/uRN
 EGMWqiyAlGjRW2BANVmB0AwN3ZvmPEqiHeKNGy8fVe+avWa2UbK3IErE485vE3UgMkKdr40sC
 KddYC9NExKz87M5gbUf1kiTNn/TqOjl9dAXMEJgtB253fiOOjRl8xqsgYagVpS/A0RfMHPoCw
 tHZpUKzsazpzXndofdMewAC6SMo8ME9iyDqGzQ==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/08/2021 à 12:24, Mark Cave-Ayland a écrit :
> The PRAM contents are accessed using clock and data pins on q800 VIA1 port B
> and so can be moved to MOS6522Q800VIA1State.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/misc/mac_via.c         | 59 ++++++++++++++++++++-------------------
>  include/hw/misc/mac_via.h |  7 +++--
>  2 files changed, 34 insertions(+), 32 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


