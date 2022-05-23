Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3EF531D6E
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:11:13 +0200 (CEST)
Received: from localhost ([::1]:42536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFKa-0004jD-Le
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntF2w-0008GQ-A6; Mon, 23 May 2022 16:52:58 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:38129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ntF2u-0005qR-Gx; Mon, 23 May 2022 16:52:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M277h-1nqmCm1eED-002Xur; Mon, 23 May 2022 22:52:49 +0200
Message-ID: <e024f86b-84bc-e1fa-8c7c-7e9f9e691ed9@vivier.eu>
Date: Mon, 23 May 2022 22:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 0/2] linux-user/s390x: Fix unwinding from signal handlers
Content-Language: fr
To: Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220503225157.1696774-1-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:2JLGliSb5qVeKGznVVIEkSf+hTRPVnNlAGr6H1JICUbOUHtsOpq
 mbfo9pkDXm5dAwR1W82MBeU7VxKEO1ouZoIFJZVmKQD5XC8D3zeSNCIoFL7QVZC/MfyLafD
 TEae+loHS9LP4EotQh7DA9ESz+W5Gyt0rpZz5BrrITiHxxyrD0LHBA0LO945XeNTRjLKrcW
 8ymqtuw4h8QO+l29WjFfQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:J0hc2Y2bMpo=:GKRodBbyVorOMyCjME/STr
 Srq2iQgTmmoLPSjTUPKhO/n3wViM7heoPwko3pQ9KdYHvMCscq04RUeKC5gQYBQ9PtetrCtwi
 SY5XhJS2JPy/dIVyrT6S1ug9cwamq9pqy61TERXev+8EwBSy3Zra38JA7JyDoBV5jLdrFRv47
 UGLpDfZ3d+JteCMbHX8JtJIOUZCQAVeFa8Kr7mgri/kwZdn01UO8BdpV22fZE+slajwWBHob0
 Sxt84D+F1FA3D3zfvGgdGxM7fKPZQyGycJfdCupLSUdWJspRWgNSVscCYY+B8RrwDo6NDC+j6
 x76+qmQ8GRTKRwC3oRn2gCUyjvtW57i9lnMci5CvnaUx1MalwIcZn8NfM/qsNM6d8KzGPA0Xh
 femi3AfSRccr1Pwk/zbqTmhtsZRA5IrcsTWSGYASPmSumaPdQQOqkN3FOHSlm0UuCtfrSSnnQ
 yWYLK+aOvup0uxqz4jARPNMsc0j0HtnEItiQ+uyewVfu7t6bNvBwUffhXAhb72a86rkM0fIwc
 1/s6AD7agodE5Yjb1MtpqUELhb7xXxDJS22OWTsPFZ5X+OEW4mT9mvXLdlZJHc4WHJxdVo/l7
 6ycb+m4U+uhUiGlNxQA7IbC2U+MtFAUSqf2X/tdiwF2bNX0d4RbQHZn002wo4LBquDJuVFH90
 UmgVoreo8sbLwgBGnQzjGa5aYOVLD8CiZc1ITLjBX1KWqm/3nWo1ucoCADOBQPnpC1o/AYCLD
 Fe2tuAmVaRcPLuX/BcR07AyLHglq93U0vdxHZw==
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

Le 04/05/2022 à 00:51, Ilya Leoshkevich a écrit :
> Hi,
> 
> This is the fix for the issue discussed in [1].
> Patch 1 fixes the issue itself, patch 2 adds a test.
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-04/msg05127.html
> 
> Best regards,
> Ilya
> 
> Ilya Leoshkevich (2):
>    linux-user/s390x: Fix unwinding from signal handlers
>    tests/tcg/s390x: Test unwinding from signal handlers
> 
>   linux-user/s390x/signal.c       |  5 +++
>   tests/tcg/s390x/signals-s390x.c | 69 ++++++++++++++++++++++++++-------
>   2 files changed, 60 insertions(+), 14 deletions(-)
> 

Series applied to my linux-user-for-7.1 branch.

Thanks,
Laurent


