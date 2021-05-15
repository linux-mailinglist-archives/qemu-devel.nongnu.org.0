Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED42F381ACB
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:39:51 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li08c-0006Ak-Vg
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li07s-0005IP-Pc; Sat, 15 May 2021 15:39:04 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li07r-00072b-7K; Sat, 15 May 2021 15:39:04 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1Mi2aH-1lDdFV266L-00e6do; Sat, 15 May 2021 21:39:00 +0200
Subject: Re: [PATCH 0/4] linux-user/arm: fpa11 fix and cleanup
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210423165413.338259-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ca091ab4-b657-a336-eccc-57b5cd5d4a46@vivier.eu>
Date: Sat, 15 May 2021 21:38:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210423165413.338259-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kBAMKfbe8bGYGqNnnTwBQZpB06Fga7QVeg+56zchcL6f8m0Cj2s
 9Oqe59+x8EYJYjSPeWpZ9Xi1qApNYxXIbuSJ4QqN4H3wkaJe6jSxzpglbm8gYPlgPB0ARzT
 1XUL7/7xnEj1l+ZCtwhbXV/GfbiEexj+IN/4I/2t2xHKhbCgudb3VZBCpNuiaWo4pcryCoT
 ca6HcSIW3fgGAgbJWFimA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wTe2dBVOnwY=:M7sS4+iQQRwo78us3LdFZZ
 mi0oUlSv52+2ud8+8xs5OPPrafiu9D5s7vfT86engLywHfN38prsMnuKjlUVetW/686Pce97X
 NeW420Mln6RmVFNmlgJqzoxN5keOwZLc+liX4b3ck+yL9IUJ4PIE8lZGgGNzGtzl7srt/1pBP
 bx4ISYFsHg2/E2pISw+z7foNb+xIrEuAEp5hZ6gkOFxkcVDpbql2GshFs2TXajjxMIykJjCbk
 /sVcBGV7X0OlPSu8I2UdzNEz6Bs6/mmsSEXpV0mPlU+dNN2SSJnn6Sibykqb0wK4fyi+4V0Bh
 hs3GHpTKRAYxy8Zw7PwbeUq2VTMOnXmLs7+dFuL11AK19s1KcZ4SoU+ErkRh2us/Q+3UfxZRc
 nk7Ydeoe1TWV6XficMhYf/ZWAgJX70wtIuvAxKZSxf5XPgte75ejJ5LnbODrWxi8cSfx3AvWL
 /VwlCgp3MIPrz5iT6kib5iHxPEw3BKYqI87BAMKsEgkesV1Fq2FoibYNLnG8CBETEtwegpJmy
 6KkM8mF4ZLe5Vgaz5yMa3Y=
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 23/04/2021 à 18:54, Richard Henderson a écrit :
> The bug fix is patch 2, the rest is a bit of tidy-up.
> 
> 
> r~
> 
> Richard Henderson (4):
>   linux-user/arm: Split out emulate_arm_fpa11
>   linux-user/arm: Do not emulate fpa11 in thumb mode
>   linux-user/arm: Do not fill in si_code for fpa11 exceptions
>   linux-user/arm: Simplify accumulating and raising fpa11 exceptions
> 
>  linux-user/arm/cpu_loop.c | 125 ++++++++++++++++++++------------------
>  1 file changed, 66 insertions(+), 59 deletions(-)
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent

