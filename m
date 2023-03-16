Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD46BC502
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 04:55:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcehE-0000cr-4D; Wed, 15 Mar 2023 23:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pcehA-0000ci-7e
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 23:54:28 -0400
Received: from bg4.exmail.qq.com ([43.155.65.254])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>) id 1pceh5-00022v-Sf
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 23:54:26 -0400
X-QQ-mid: bizesmtp75t1678938839t6cfdskw
Received: from [192.168.3.2] ( [111.196.132.5])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Thu, 16 Mar 2023 11:53:58 +0800 (CST)
X-QQ-SSF: 00200000000000D0E000000A0000000
X-QQ-FEAT: cy+SGFpNa8d66Agipgeo97l5OlC/ulOoU8169m8G/tWxKShKTMl4ekohm+nQg
 Nn+8UGuXyFq0/gFX+wVyC7bwiaYdVlNWhVvlSvAHkmqJjyZ84diFvy3nRiygr8x22OydtBq
 g542r2suK9emef/i0UJyzuvXoHgOVM8Wc1+uHGLCpMkP7rt9g+LNrDgdch/w5LdzQdRaWK5
 PRdijqJtS1fJYiwrvOTDxvmuLKNxtOJ/W4Fp9CoppLOT8F/fqjsnm6bsJiqanCLZKG0vX7s
 Xf41419W6QX6qYowvmpx7QGahcXXSsx/nExBBMhCXDd6p/rTFnX/8ZmA+Nan7OWWkiVl2rg
 3pZ5kMvgPcRcxtoXZU=
X-QQ-GoodBg: 0
From: "Bin Meng" <bmeng@tinylab.org>
To: =?utf-8?q?Alex=20Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 09/10] contrib/gitdm: add more individual contributors
Cc: "alex.bennee" <alex.bennee@linaro.org>, shentey <shentey@gmail.com>,
 amarjargal16 <amarjargal16@gmail.com>, Jason <Jason@zx2c4.com>,
 "strahinja.p.jankovic" <strahinja.p.jankovic@gmail.com>
Date: Thu, 16 Mar 2023 03:53:58 +0000
Message-Id: <em23e0926f-4cc9-4344-a3a3-7bddcc989c07@4e98fe0a.com>
In-Reply-To: <20230310180332.2274827-10-alex.bennee@linaro.org>
References: <20230310180332.2274827-1-alex.bennee@linaro.org>
 <20230310180332.2274827-10-alex.bennee@linaro.org>
User-Agent: eM_Client/9.2.1628.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.155.65.254; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Bin Meng <bmeng@tinylab.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 2023/3/11 2:03:31, "Alex Benn=C3=A9e" <alex.bennee@linaro.org> wrote:

>I'll only add names explicitly acked here. Let me know if you want
>contributions mapped to a company instead.
>
>Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>Cc: Bernhard Beschow <shentey@gmail.com>
>Cc: Amarjargal Gundjalam <amarjargal16@gmail.com>
>Cc: Bin Meng <bmeng@tinylab.org>
>Cc: Jason A. Donenfeld <Jason@zx2c4.com>
>Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
>---
>  contrib/gitdm/group-map-individuals | 5 +++++
>  1 file changed, 5 insertions(+)
>
>diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map=
-individuals
>index e2263a5ee3..0e4618f1ce 100644
>--- a/contrib/gitdm/group-map-individuals
>+++ b/contrib/gitdm/group-map-individuals
>@@ -38,3 +38,8 @@ paul@nowt.org
>git@xen0n.name
>simon@simonsafar.com
>research_trasio@irq.a4lg.com
>+shentey@gmail.com
>+bmeng@tinylab.org
>+amarjargal16@gmail.com
>+strahinjapjankovic@gmail.com
>+jason@zx2c4.com
>--
>


Acked-by: Bin Meng <bmeng@tinylab.org>

