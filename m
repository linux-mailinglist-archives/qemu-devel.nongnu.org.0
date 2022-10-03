Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6615F3937
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 00:39:04 +0200 (CEST)
Received: from localhost ([::1]:53982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofU5W-0001Rw-VL
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 18:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofTgH-0001x7-GJ; Mon, 03 Oct 2022 18:12:57 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:37969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1ofTgC-00062k-G2; Mon, 03 Oct 2022 18:12:57 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MOQyE-1oqvRq2r6c-00PtQe; Tue, 04 Oct 2022 00:12:44 +0200
Message-ID: <5b5b0bdf-5641-8839-5c95-4bc40fa0a296@vivier.eu>
Date: Tue, 4 Oct 2022 00:12:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 0/8] Trivial branch for 7.2 patches
Content-Language: fr, en-US
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220930202144.1109310-1-laurent@vivier.eu>
 <CAJSP0QWbDj42NmV=Yk3DMt7_Skt4k7x+jsJpetWdnr=bbYW2oA@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <CAJSP0QWbDj42NmV=Yk3DMt7_Skt4k7x+jsJpetWdnr=bbYW2oA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:FwRzfTZsz0Cimb865JdFk44hnkAnAFduTFvhuCPNb7SYkPOmFav
 4LtGoIiByEa7XObJz4leKf+OJ/f7oIX+xCMX9jHxbty+u7rbOJbFwk8IKNMZBGBzZOCisg6
 Kb6LR/hcbKvmTLDpWAOPwoVxOvd1frFn8pzEDXOScu+OukmKekoRvTx5o/pw1avPFyy0e/s
 Tj6gKS27PKJkmt4yipAtQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VO5owvht3YI=:d34itDgfARk7FTDi0k4O3G
 i2zfoeEhFcMktVKP2gZzrVieEKpcKnIdAUDkPeo+/u+li/pCZtMaDKrgYRvaqkeLFGzzu2/yG
 FBAG/g3uuGj10aUQf02JdJmKRcPhvA9/MAMhR7m89E7hXirrBA80HmM43+zrJwTY8td6Fkc9u
 WHorARHzDfs7EXmxPW85iCzyF0DEUsFQzih4Bo11kr3LNtihEWaxyGpiqGerORVUmOxAm4dVL
 EGciaZhNy4SKuaIJiZgXxsHaX2PjChnUbWmmwz8GKe7hkDS3yGGp/1P0ZKlzbMgAEdqTd62A7
 aY8Rw4Ps8fi7oO25jLgqWrlELWFEpbepZZiHNOlb6cYqD6edZ/CCWiXFvFGBbettyUg4Ts0LU
 gBG4T4PifBxHPVfwvpRc01LSaAjT3DOI8T0fj6GMnk7lFc2KaYtXJF19zPyXi+6tQmQ7JB+Zb
 TRxVs7MUGmdetOJTea9d/LMSBRgVrqZgQsEWrkh+gp0jvW0KdfjONuVEyYH8lQiVS5sICyKcI
 ZlZXlQyJiqNjGoGmUU0/yJq+UxLl8TR0IQSSE9UKgUB/bWEv1zHo6/U8S9EWwpPd05Ldd9O38
 8gdbIM1nUMPMmv4/9/UElxxePNjwnNVl+METmG4DwXN4CuXz5Hgh7eSAzpgjVw7SIIV4zxdrW
 SDxjRTPT86LXeb/VqprErba1YMuSYsyzBXpVx70jBvOiLiEdPgEOoEfKBN3veMJY0RZT6Jo6S
 MMRCO3aDHR7ketHX9JQnWC4DaFlUDEotL1Gqn6v3RrLORNgzT0RosaR0dpPfy2YI+RoZ3Ul4E
 SSucEVd
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.467,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Le 03/10/2022 à 21:04, Stefan Hajnoczi a écrit :
> On Fri, 30 Sept 2022 at 16:22, Laurent Vivier <laurent@vivier.eu> wrote:
>> Philippe Mathieu-Daudé via (1):
>>    block/qcow2-bitmap: Add missing cast to silent GCC error
> 
> Hi Laurent,
> This commit uses a mailing list email, probably due to DKIM/SPF issues:
> Author: Philippe Mathieu-Daudé via <qemu-devel@nongnu.org>
> 
> I think the policy is to reject such pull requests and fix the
> authorship. Could you update your pull request and resend?
>

Thank you Stefan.

Normally I have a pre-publish-send-email to check that, but it didn't fail in the expected way...

I re-send the PR.

Laurent

