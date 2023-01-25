Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D21D67ADA9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 10:21:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKbx8-0005TC-OP; Wed, 25 Jan 2023 04:20:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKbx6-0005QW-Me
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:20:20 -0500
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pKbx5-0004q7-5n
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 04:20:20 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MPooN-1ozM2j0ZJj-00MrNM; Wed, 25 Jan 2023 10:20:10 +0100
Message-ID: <b0405f3b-195c-73ce-ff9c-413281a0ebd7@vivier.eu>
Date: Wed, 25 Jan 2023 10:20:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 1/5] linux-user/strace: Constify struct flags
Content-Language: fr
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, Drew DeVault <sir@cmpwn.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20221104173632.1052-1-philmd@linaro.org>
 <20221104173632.1052-2-philmd@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221104173632.1052-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:HQtllnj108wNF4ROc32lHll5ahDdMvw92scds4A2Z7cXoRoxbUL
 y6cjIThQ9H2KpGCmBd6nFx2SI84N8MkdflWUeP4PfOiQxT5q0H1BkJyaFPjAo+ezbqE/T+U
 3ICGdR0XnfDQfmOb4VVrmk2UWXl8mKPgaEGmWBAl/x0POfpSor5S38DZF4Fx7A9lq/8e/9K
 VScwr+fYSQg8ptSP56Uqg==
UI-OutboundReport: notjunk:1;M01:P0:8sazs5VJxgc=;13L4bhVPh2nyVLw3KxTDi9zNBWn
 s0RUzFqIHqmMr5SswrSgY/vmaJx/fS++QOY+vWCFlddQfDUvf01FWMqojQg0rFDQdJhlbyReN
 ojBL5hDG0bmATuw9FG2em2Iql5iNgImxy4IOEjC/Y8ANvZ9ewizzRXRcfsYKSfmo3nYPdXNwy
 Fatm71VrXXudZE1+YYzJSjkle3zp3aMJHYCq2Vb2HqlwcP+dXwu8rZtoJMTWrKEzBIve2xZXi
 cH73WoyhIbncVNjvB37AK2aIl5FvrkGjeOI0zlOPDDjkcNiLDiazgES9LUqFp/RYGkV7FrTeX
 v9d6OzGXm9k8e8t+8gpwLwHAQYPn11wiL86F0pdkSk/Irsp0bIJuBjdW0L403pcAiR+S9MpeF
 +1LSj3gIZXCDrdTloYMOgaxq3ApnLgdKA+F1QVZm83/feaqYK1n/BMoIaOCWDXDAct77uVHvm
 2AIBaIZfkE9+owcN1hmcjP+xnlg52U9MZ8xpp3adraPhF8P6sVxOXtS28Wgl2IPEsodVJvyWn
 Nv7jDUkH7ETcO2jTPdOta1NeLX4QVJ1VuoAFMvwr8jXyhOBOBeKdUNjYU+oWXnIhJwR0HIw5v
 kzjvUwRk4OcbeSN99V333KMJXcjJiaJyFOuLaem8NMswMQjnJq1smW9RkAMl7SLnggaI4SX8Y
 tk/xrvIgCe6Ac76wcZfTY82uJLAJBtrWn+jrFllgpA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.148,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 04/11/2022 à 18:36, Philippe Mathieu-Daudé a écrit :
> print_flags() takes a const pointer.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/strace.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


