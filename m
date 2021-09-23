Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEFE4161E9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:19:36 +0200 (CEST)
Received: from localhost ([::1]:42646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQVb-00080r-BR
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:19:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQSl-0005xZ-Fk; Thu, 23 Sep 2021 11:16:40 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:51385)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mTQSi-0007EH-1Q; Thu, 23 Sep 2021 11:16:37 -0400
Received: from [192.168.100.1] ([82.142.21.142]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N5FtF-1msyEa2Da9-011BJH; Thu, 23 Sep 2021 17:16:29 +0200
Subject: Re: [PATCH RESEND 1/1] multi-process: fix usage information
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713004718.20381-1-dongli.zhang@oracle.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <95965a78-318e-9c29-982d-02e8d9e21714@vivier.eu>
Date: Thu, 23 Sep 2021 17:16:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713004718.20381-1-dongli.zhang@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:BkE+Nb1wbfFRzpEbQko+OQw3fp6z0oDPHWq4SoKySK9w9TswzM1
 p/TpLUXw5AN7V/aEPgPZdFI4yX8tRQkQ2w2GUH+jI4Wi80z6AUC1w8GnFRoXu3Geq1LK8QV
 Wu/4jShtBSOIM5Au+He37NBa8r5ASUWXv8kFtyewIqFRIttQNBNE0Sx/M6qB37tKPvEpPAG
 yxILzNgV3Gb+aq9A/0+mg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:eIUrvMH+ZHI=:RKv0uPgNFl50TPWV2yLN5V
 /WP0EMG/p4YI3iSmX/E+rjdXowE2aE/J/OSXPKy2VP+Mr/JKHpPRrVO/gaSMKYvL6Ht0W3bHT
 GuYUJBJC5agOmMPXXJqIwbuIhpWPVYUaCySBX28mRViscJzWp6Ky8k3KRTwEkC3S+oNZB5z8Q
 3C3BOYRZ3PbXteNDnAHYSTdMseZng7U2uMcDvCYpS1CVXxPxPwZy9q1OkpJrLGJMJy8d9NHve
 KLtK2smtCUqmerpLlSCA3wDVwlrtS/P5zO28JKGZfZ5gOJ8X+nT52XJjVDK3jvwNHEnW2qmGM
 kQvgj/XjY7xiS4eKbMPNFkGUXcEkBr9BN/6NO7eIHwT5HsIFpikuS9kArE1s3aw5NL9xbcRKj
 sEl+VQf8Q8sgqbZFdqfuGrZtZ7X1Ws8UYb4s/wHjXto+f6/px+AGbc4E6PbpeDuFh8nIWb3Mw
 tEKOWgYeOEV9qguP+ZhEAHHcFUKiS9532m/1kYghHFZ0Y0aH13l0rmkXXjnDw0z6NCzCkdDF3
 MD/UkvE8vRbTh7aP50fZ8p1tubiurxQTJ7gJz8xnK8WgVGILVFp/SfA9OgQQqL1oTnE1HcxSZ
 fKcOinoizE+1eqQlgWromgXGRrlfk5CaoazeMAYEfk2yMLTCMKskEqoGXe6BxR1ubwwNk4YnF
 +slpi2azRfq4VcSuD1uTJ7fJ67/Dy+44B5N/Vmkx67tycj0PWXZ4zUaIIzvaWdeqjaNkDs79d
 diToy655mPZzEo2fTSBAWeV8ax3fFcgiIUkJrw==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: elena.ufimtseva@oracle.com, mjt@tls.msk.ru, jag.raman@oracle.com,
 john.g.johnson@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 13/07/2021 à 02:47, Dongli Zhang a écrit :
> From source code, the 'devid' of x-remote-object should be one of devices
> in remote QEMU process.
> 
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
> Resend to be applied as trivial patch.
> 
> I have verified by reading the code and playing with below orchestrator.
> https://github.com/finallyjustice/sample/blob/master/kvm/multiprocess/orchestrator.py
> 
>  docs/system/multi-process.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/docs/system/multi-process.rst b/docs/system/multi-process.rst
> index 46bb0cafc2..210531ee17 100644
> --- a/docs/system/multi-process.rst
> +++ b/docs/system/multi-process.rst
> @@ -45,7 +45,7 @@ Following is a description of command-line used to launch mpqemu.
>        -device lsi53c895a,id=lsi0                                         \
>        -drive id=drive_image2,file=/build/ol7-nvme-test-1.qcow2           \
>        -device scsi-hd,id=drive2,drive=drive_image2,bus=lsi0.0,scsi-id=0  \
> -      -object x-remote-object,id=robj1,devid=lsi1,fd=4,
> +      -object x-remote-object,id=robj1,devid=lsi0,fd=4,
>  
>  * QEMU:
>  
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

