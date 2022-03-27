Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2734E874C
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Mar 2022 12:47:00 +0200 (CEST)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYQQF-0003gz-Eq
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 06:46:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYQOY-00030N-JX
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 06:45:14 -0400
Received: from woodpecker.gentoo.org ([140.211.166.183]:52852
 helo=smtp.gentoo.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <xen0n@gentoo.org>) id 1nYQOW-0003nh-Ni
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 06:45:14 -0400
Message-ID: <1bcd2709-a71a-9883-c216-43cc32e2722c@gentoo.org>
Date: Sun, 27 Mar 2022 18:45:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:100.0) Gecko/20100101
 Thunderbird/100.0a1
Subject: Re: [PATCH v4 2/2] qemu-binfmt-conf.sh: Extend magic to distinguish
 mips o32 and n32 ABI
Content-Language: en-US
To: =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 qemu-devel@nongnu.org
References: <20220323230559.656291-1-dilfridge@gentoo.org>
 <20220323230559.656291-3-dilfridge@gentoo.org>
From: WANG Xuerui <xen0n@gentoo.org>
In-Reply-To: <20220323230559.656291-3-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=140.211.166.183; envelope-from=xen0n@gentoo.org;
 helo=smtp.gentoo.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, laurent@vivier.eu,
 philippe.mathieu.daude@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/22 07:05, Andreas K. Hüttel wrote:
> This information is given by the EF_MIPS_ABI2 (0x20) bit in the
> e_flags field of the ELF header (a 4-byte value at offset 0x24 for
> the here applicable ELFCLASS32).
> 
> See-also: https://www.mail-archive.com/qemu-devel@nongnu.org/msg732572.html
> Signed-off-by: Andreas K. Hüttel <dilfridge@gentoo.org>
> ---
>   scripts/qemu-binfmt-conf.sh | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: WANG Xuerui <xen0n@gentoo.org>

I have tested this myself, but I'd prefer others to take a look too.

-- 
WANG Xuerui
xen0n@gentoo.org
Gentoo Linux developer
PGP: 7C52 19E3 26A0 7311 3EA3 8806 C01F 7214 BC93 1414


