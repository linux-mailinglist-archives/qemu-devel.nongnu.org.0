Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2B336FB63
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:23:39 +0200 (CEST)
Received: from localhost ([::1]:48198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcT7K-0007iu-Li
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcT4g-00060Q-6W; Fri, 30 Apr 2021 09:20:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:54079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lcT4e-0008K5-5j; Fri, 30 Apr 2021 09:20:53 -0400
Received: from [192.168.100.1] ([82.142.15.170]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MirX2-1l6il82C1s-00evfR; Fri, 30 Apr 2021 15:20:46 +0200
Subject: Re: [PATCH] Fix typo in CFI build documentation
To: Serge Guelton <sguelton@redhat.com>, qemu-devel@nongnu.org
References: <1619080415-4888-1-git-send-email-sguelton@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e0fa215b-4b1c-5a13-11b9-6f8b926c2d5e@vivier.eu>
Date: Fri, 30 Apr 2021 15:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1619080415-4888-1-git-send-email-sguelton@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:5S3OBx78HGiRAKDoXBXpnykPMvD232TVmFm0mFzVhRn/uvzXjsG
 /846znH/n9Je7x8xBbPqdFajvwwPD8LxCxLT3kE0VjR76nqHmP7iR/KBullx/yLpRRSFbp6
 oZCu+pbALeq0cakxSs0+0/Jp1Dg+MttHLZod2ZjCrPDsZD6yNWf8UDOhk5Fbs42chGSR005
 aR2Li8QptBWKChgPDbDJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kbUl5uyMlbA=:M5B6JHDh7jlUocSgBehtpc
 TFPW+SHYMtITcKTDz8yGc9hOe9UFK0qF7i/p91upFKMG36quYKrRaCNa1AGuITqUmGPf1JudM
 9+a5mdz3BLxUIm5+F+he8yxTdingYYJisdRRZbtTyAd1DpuxXUNje0LE5QB2IqZ7g/56UgLQq
 7Y3bBHGvKrY7nnDPFIFBty/AljoxdvKqMqNcGdurakV5RblR8ozEaI5G5PdXFaV2vAQQDKT3k
 SETK+TOiDhIs4QOLWpn3AHQMoi/gHguCRp3doLIvHiko/RoSJPrSdvZGbgNJICKmjtESsbKb5
 FI2t2ACWF0B9NTT1dsHejXiTSYRtgIeig8XNMc+NdEq6yFWnK5nZ3aPJIpum7rmjOFxc6Q1lb
 rl7AtzWZxmINr9OZozRCg20xJKd/jcVBCbmHzMd3CtvmTlt6diLqDPhxDtr6PgSHbW/+ZAfvY
 pdKB3UZ93XcA64addSjM508m9updfn0u6wP22STi5KbSgQqVrjt0Qh9V2zreWxT6hGvqrZ1zh
 8zlKwr8Mz+CcmhTHRNg+uI=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 22/04/2021 à 10:33, Serge Guelton a écrit :
> From: serge-sans-paille <sguelton@redhat.com>
> 
> Signed-off-by: Serge Guelton <sguelton@redhat.com>

"If you wrote the patch, make sure your "From:" and "Signed-off-by:" lines use the same spelling."

https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line

Please fix this.

Thanks,
Laurent


