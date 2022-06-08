Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7DF542B8E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jun 2022 11:27:48 +0200 (CEST)
Received: from localhost ([::1]:59008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyryd-0005mB-4l
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 05:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nyrwN-0004nV-EB
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:25:27 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:49941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nyrwL-00060D-PZ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 05:25:27 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MYvse-1oByzI2Pjs-00UrXd; Wed, 08 Jun 2022 11:25:20 +0200
Message-ID: <d7568b12-96f2-666b-cb06-03af481c59f9@vivier.eu>
Date: Wed, 8 Jun 2022 11:25:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v4 1/3] target/m68k: Eliminate m68k_semi_is_fseek
Content-Language: fr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220607222616.717435-1-richard.henderson@linaro.org>
 <20220607222616.717435-2-richard.henderson@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220607222616.717435-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:R6wxiMg3CSpfIXIkbwkRCDGeG0G3Pz+hO6xRfls0lE3o4wxzvyu
 HlJHJkSnxzz8oUKhUOiiUsKtuaiNm5ngJN+3Di+j8NyZKAlkStuh08o5U7TuCirfveRAqEy
 Uk/W+t1x/RXf2RDKUymIfVCMdHXOHicWp6SE4ALyAwwGAo/vps32KOXBFkEaLwK1WiuSE0D
 8CAYB9wiqvISYNx/cDxpg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rtZe01/QWOU=:d/YaGNkN9BoyW8JRQkjn2X
 AsNPNhmP7Yf/y7WxghVt5LyuXYyEEp1XPTBoMSRpbqemYspIuuKybFlE9dPj8xW/Ud0fuxYLi
 ezxNM971lDnNEETDLMma8c1wfMHC1SNQdcLNzq5bD7iKgCdiicST5sQXfDJBsOsxjA4R3iCOF
 iNxbOaC+5vdMScUXVZn7wAZQ2iwDj96ziWQLpZ3mpX1KSYJbx7SchNH6WWTCaZu+avc/1rd23
 eYtY6q5/S6PaKlNT8A2YjBs9AbF5UhCQOwZNF8Ovudn21i6hHqNK/1xCvo9p/1hgnmNJjcfBj
 oAQPUnMmLL23WQvAln5Uq2fKZeTVxo6MCoKBx63JFvPL3FMeRxzTCGwTX2hcJJrHG5aGBUNwq
 6Tghp6+25UKXtQZ5gwnsr6ACJEDSpfv6ajnuq4HC+I8/X+n0mf1zH3eRfA19c1oBf2a+oTzMS
 ABSlDDwyHylLUf89PZS/cycspgEgJMi9O/I1gJbAb/BU0zjiUggCov95C6xIC4y4FPqXuQNR3
 0vvAEC3K3wi72KBuA6Fuzm/F91aGA51knBb1vGns6Ee8I+PLkawaA0VjJsGV5r697KQYyxyy3
 psydzwkkPPtu4MugpCDWe3JllGU6LpzsH+KKMf9HblHU6Fba7NsT6Rs1LCvba1R+R8hFOsuYq
 msh0Cfg4OyOD/3uT1LZMejVVFXI54KLmQsXE9CcYOuPfJmy3JMCF9YcShhhEtT6AuIy0uFViZ
 jDpAy+X8wKVQ3mPq8+MD3VMsurWrg9MzoNA0Yg==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
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

Le 08/06/2022 à 00:26, Richard Henderson a écrit :
> Reorg m68k_semi_return_* to gdb_syscall_complete_cb.
> Use the 32-bit version normally, and the 64-bit version
> for HOSTED_LSEEK.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/m68k-semi.c | 55 +++++++++++++++++------------------------
>   1 file changed, 23 insertions(+), 32 deletions(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


