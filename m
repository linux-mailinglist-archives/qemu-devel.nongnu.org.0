Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA79616875
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:22:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGMN-0005xB-44; Wed, 02 Nov 2022 12:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGM8-0005Fy-IG
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:44 -0400
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oqGM0-0004Rk-9U
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:12:44 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MDykM-1oiaq03NvI-009yHa; Wed, 02 Nov 2022 17:12:28 +0100
Message-ID: <ff110382-1612-eb5e-7f53-3040a40e8d5c@vivier.eu>
Date: Wed, 2 Nov 2022 17:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] linux-user: always translate cmsg when recvmsg
Content-Language: fr
To: Icenowy Zheng <uwu@icenowy.me>
Cc: qemu-devel@nongnu.org
References: <20221028081220.1604244-1-uwu@icenowy.me>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221028081220.1604244-1-uwu@icenowy.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:OcCHJyp/90KhRZs9oTELtcZPsU+wl7N/WfHR88uL7Nd/W5GghEG
 mHh3PgLxMxu1FH/a6YAQbktxEljAOJLKcA2GTnUzWfAJcN7Wrc7aI+yB4hEjPhz0ZCW6oK9
 25KlFuVKn9+R55dn9/a2OtnE2JOeG/CejoPIAwa2AkIw2E9Qcf0Y24n4Ssku1ucwa6FSVjB
 +LyMBE6vFsH3p9CIycjoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iG4sumooXT4=:X6Xex/W3wID5gZpdd10XGk
 STw2XaErRko/WcFen4MIyzNC8RND4k2RE8LEAVvYjyRXEvo1/FxZzbHgcwSVegm9IgJYvaRDl
 l4dn914LdqZUkCtpm4bgAFU7XqYN4zr9OLVYVDXgPUiCYFU8xNjEfF/9TiG8oj6n8Exl+TetH
 z6nKUpk9TcqgyhgWk2QSB5dd8AyJ2kb7FP87dnV4uFkEgYEOVKGawYJKRgvv1gH1m7sKM6KIT
 llpraf0jqD9vsdLF2ZhQbI2xwtsxT1EKXKNJ/5/01oa28eiaXO7sZ/CCARMo8q12GRzK31JDH
 /qsqOTofKbxBVyWKWzcsYz1RqeTwadTQK7iTyDWxSwaW7bX+sMJZ0hpGx5abshyZj4n8Mq9h4
 KyGe5bQaoGpSHLQ/KLH4oQ1mASKApLFG9W+F9Nq0tJSe4MqfUk77d1kOyDB0assNZXImdvCuX
 L37KES96hkGobK158+0/JQV2m+gdaXdH+wUssSb7U3X9fwlfx+ertnGXhymiV0R2eV3jtu/3q
 CnsNf3zaC+hW8vlRSI9JUkKQG69yhl5b+g6v8ac2AfH0CzyW0lAF1Uz7ml2HIwixEb10yLiSu
 vIOQNZLP9e50Pcl7XzG/jYScvGmFSyDADU7ix3PzgiSRWYsYVVAAKptmPbtcFBt5tyvAzNTII
 tQMUq8bJkOta/CD3tQxCuMr/bPio4p4BqZyOokTfhy9LaozzU0uTEk2BDulueAx75oXvm7WU8
 sHe8ysuQT5JvXbph6NLlWxgsz7Mju30ckH7s3jPH++vPcbz5YHpnrwvgsvgOhPuSyDfjcqLD5
 4r05YMz
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Le 28/10/2022 à 10:12, Icenowy Zheng a écrit :
> It's possible that a message contains both normal payload and ancillary
> data in the same message, and even if no ancillary data is available
> this information should be passed to the target, otherwise the target
> cmsghdr will be left uninitialized and the target is going to access
> uninitialized memory if it expects cmsg.
> 
> Always call the function that translate cmsg when recvmsg, because that
> function should be empty-cmsg-safe (it creates an empty cmsg in the
> target).
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>   linux-user/syscall.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


