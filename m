Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C25553D72A
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Jun 2022 16:11:22 +0200 (CEST)
Received: from localhost ([::1]:56712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nxUUq-0004cJ-Ts
	for lists+qemu-devel@lfdr.de; Sat, 04 Jun 2022 10:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nxUSv-0003vZ-WF
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 10:09:22 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:60699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nxUSt-0001nd-5l
 for qemu-devel@nongnu.org; Sat, 04 Jun 2022 10:09:21 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N01hu-1nc7Yv1zGA-00x2oU; Sat, 04 Jun 2022 16:09:11 +0200
Message-ID: <930eb1a7-e6e3-796a-fb41-9e2683986a2a@vivier.eu>
Date: Sat, 4 Jun 2022 16:09:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] linux-user/x86_64: Fix ELF_PLATFORM
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220603213801.64738-1-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220603213801.64738-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kMUBklHq7bqF7MzHabvISnotQK2ksdiaECD/NcU+SQ8TYBDGJAL
 ma6dIW9waoZBxLt2eCp+nXn62O9aAGYzUbWz58p+FVJqkvUclf0JdSKVC0TzrOBhoM4rKt2
 +m9i8cNfdRj1f1IWYJEACmfa6rvG95QcvWHWGZGchQ8NZqizEMxtGKCCUb+FpB0jVXGCDLy
 tDxmYLp1+U7Yd+L9QbpGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RRP93+gkBns=:WZAWQc8SZRyW5tz3blXtbz
 /nVIzVWw8wBf+AhYSnqmeBEMkSGKxYLdsiH6nXXPNI7zVBoq6nD97wT+gqZQ+txm1RDYxjMHK
 zmDcDccKlR849Zmj//cNuS3nvCVr1lyROjZ5yEI6FxXA0H44g5/1qktUFuxBxtw/pEslps1W0
 KXvPPh+MKvNJn+7t2MkOsOl+HPoEazSYsRrBjt0+Vm4aD9pT4GVM+9b8+6vFjBxQiLXNUYpkR
 8NRdUwBDbTC5SVt15aVvIQVChEPPfO0glyNdeV5jfuaT81uF0+2bWhyRG+IE/HEfHLm0F/oaZ
 b7vWDItjnqhofNAdwpf+nohp5ggYq1DU1Ax63ubLuVCWRaQ/5JeORztFzVl0co55ZEAnosMIS
 Vs0zY7XRM0QGkSBcUSKvpmN6E+x9+aTa4X4KxfrtL65WwZ2dit2ypkJcwU0Y6A6DgYBu09YnU
 k9UvTfo5pRzYuI8y7JOmsgPiHP6a6h8WCjk0Bqw2MykhgKnLkjSUjbyL698h1dWsKVSh5pf6e
 zAz9dfgpU6PTzYGDMDgplQ7x9t9BUxQ8grDo5iDCwyEy4DXON6OuxNeXU8qIQmi9Ndf7qTAAc
 pRGEzRbjVx16rNgNoA7fOQP+qj1mzfz+LORCfd1xq8VFM3oG4585ed7MO1m0Vq3+URO44qx3R
 jSEclcabbVt1ZdWjytIZoH6d0j77Umgv2zu7DgTqJ8vc5Cu844WTVBUihB6FsyzOkHaPu3asM
 TN2V/9q9usumgPymn4kYO67faComWEOz/7Jv3Q==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Le 03/06/2022 à 23:38, Richard Henderson a écrit :
> We had been using the i686 platform string for x86_64.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1041
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   linux-user/elfload.c | 30 +++++++++++++++++-------------
>   1 file changed, 17 insertions(+), 13 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

