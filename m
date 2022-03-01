Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E35D4C946C
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:37:01 +0100 (CET)
Received: from localhost ([::1]:43774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8Iu-00015A-Nl
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:37:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nP8DL-0006X4-7c
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:31:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:36145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nP8DI-0007w7-W9
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:31:14 -0500
Received: from [192.168.100.1] ([82.142.17.50]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MZTua-1njMD51AUI-00WSLp; Tue, 01 Mar 2022 20:31:09 +0100
Message-ID: <ff1d9762-2495-f22d-3355-b6e8f6748b32@vivier.eu>
Date: Tue, 1 Mar 2022 20:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC] linux-user: Remove stale "not threadsafe" comments
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220114155032.3767771-1-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220114155032.3767771-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BF+w8NxnGhDLH3hYbi0JEL8Q0KpOYqx8Tn6IHyGHbbXq51tyoW8
 SjPa6/mSgVBVg8kmTehyyuPzgo/XHRVFAORHnu003RL5f41nklp6fOSfjKQDFs9fr9qQ9Jp
 ITjb+vTI4cgJAqv3F9gx/QDxWi9f+U8qNvT3YFIIzAR9OLv2WonYhk/kOyOyUOkwDKy5CJr
 yxzTQImYW/hckRkqgJoOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:n+rlsyUIBeQ=:JgqLY4HpRcgHSsQvKn4AcL
 Q/Mk9GmHC21zzO4R+YPnE8MnUzcFke5yWRyOx4sKgdce1rqq1TDIokdpbpv1HnXeRXlqWV8Z2
 yD2FDcJlyK38K8uNyxSfFu5LGcNiBRevJNU20hQB/JQfXF0woo1Jxg8JKv3BGg+3MuC5Gypa5
 qzaC/F9+Ztkn3POu/0xxrmuXBWMd1VO4G9Xh6JoBGfYzrFipXZqRszjpaljmkAWXvXtJU5kpN
 e55rYdzlfg+I+lV0AjN4+FNVuHwMHiwAGo7HO3kKwEhgVU6orYfsXSiqOnHjQ8j6+pNCrD4NN
 bzoL1DPk076CL/IrLHTKM2pEUsVgBfSJVGF0wM2hhgsShDTdKOK2buln3t4YYwc0R1Yq5IdD7
 KrU2bm4EiQhDpYKitqvNqtibs9+NsT+O6BL+1iFTn0tn+h3lC5fUAjSYCKFS4+DxbMX84M+9c
 fIs5De0uVQO3YMataa5OiuvLdkZllxa44Fx63ykivi/Ko7IhQ0xK0Sd0fRrZH0AUkRZwA+XJu
 4GGA5/3CU9Afm47yRGIEAAnIH62+CJY527glfqcQYzjESO/XR3Z/ql/MVl4U6MJPaQ1vAxsu6
 ISBZ3U9jXqFqd0w/TKBETwKVv3XSSTMm7kWu2hDvQX2Huywf8AbAhijsTTIcV7ac80BmroJbt
 XF+HB2OCvLZ/Wy1MkvsGqXRqnngikiA24H/nLwyfHLuCoDDrY6hs48PW+IO1BVCaDfXg=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 14/01/2022 à 16:50, Peter Maydell a écrit :
> In linux-user/signal.c we have two FIXME comments claiming that
> parts of the signal-handling code are not threadsafe. These are
> very old, as they were first introduced in commit 624f7979058
> in 2008. Since then we've radically overhauled the signal-handling
> logic, while carefully preserving these FIXME comments.
> 
> It's unclear exactly what thread-safety issue the original
> author was trying to point out -- the relevant data structures
> are in the TaskStruct, which makes them per-thread and only
> operated on by that thread. The old code at the time of that
> commit did have various races involving signal handlers being
> invoked at awkward times; possibly this was what was meant.
> 
> Delete these FIXME comments:
>   * they were written at a time when the way we handled
>     signals was completely different
>   * the code today appears to us to not have thread-safety issues
>   * nobody knows what the problem the comments were trying to
>     point out was
> so they are serving no useful purpose for us today.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Marked "RFC" because I'm a bit uneasy with deleting FIXMEs
> simply because I can't personally figure out why they're
> there. This patch is more to start a discussion to see
> if anybody does understand the issue -- in which case we
> can instead augment the comments to describe it.
> ---
>   linux-user/signal.c | 2 --
>   1 file changed, 2 deletions(-)

Applied to my linux-user-for-7.0 branch.

Thanks,
Laurent


