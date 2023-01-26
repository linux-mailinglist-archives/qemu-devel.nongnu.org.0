Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA8A67CF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 16:08:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL3qh-0000fR-Tw; Thu, 26 Jan 2023 10:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3qd-0000eK-Na
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:07:32 -0500
Received: from mout.kundenserver.de ([212.227.126.134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pL3qc-0003Fc-6r
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 10:07:31 -0500
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MSI6i-1pEZba2cG0-00SiNR; Thu, 26 Jan 2023 16:07:26 +0100
Message-ID: <fda462bb-fb33-f680-4a79-bdbadcb67bd1@vivier.eu>
Date: Thu, 26 Jan 2023 16:07:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] linux-user: Improve strace output of getgroups() and
 setgroups()
Content-Language: fr
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
References: <20230115210057.445132-1-deller@gmx.de>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20230115210057.445132-1-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:VqfaPdk/AlHi7W9tUvfmjTDV/L28CYuyeFvghKuuS7TH9q6TV5l
 V0OJM4iQXK0jVmqmI5/irJslgiUhKjB+25MrtrwcafAF/wzT1yrKMB1/s5XktXNuEfPh/kw
 1EXBTs6w2JyrRAibRK2gUMnZMc8LhyjdTaL7z/Yp3EOGzRd+tD3/hx6+d7WUdWBnhRQazxO
 nnc4U018Sb3DktZQOA0lA==
UI-OutboundReport: notjunk:1;M01:P0:gwIQp7cLgRI=;X2nE1wy6uShuDEAol3z/fGfcjc1
 VdFDU8ULHXbR4uSBXotEY+H88qU5t3R9XdlM7byOyiB6A1k2F/Zc37WAK2w63UvAvOT+TKbdl
 BFEMU3UFzOS3dVMSMgYOURJB+PpVh3llL38UQJbgsFPvlvF3qo/bqi1BR800wrQYlBLy6erXW
 suj5G3+BajrIr0SxUDzhCZ9LXwsQYmhR572RjQXyc0pd0AEXyKZHfXHPUNxv6fVd+ILgq9vkj
 syw42LHRwxLpB30UdjxxR/wCMnLdGFQgzY0D+g70zu02OjC4SvXeIaMPuLQYZWviI2mHRBNX+
 Tep7MqqaSHIKaiLK2/7q3A9eJOIWVjV3L+NyrrjNFIMNE5YZ9U2xCB7GITYTHA2uq/s9x6CL5
 pyJLXhAH7Jy267uLavydpPgdYLZL98epmp0SILfWZ29Idym2FZvBsxMOtcGdppfb4HyN7qxUY
 8mBY6iY/tudYOdQgeE1q06BskxNGTy/wFxcMGBQ86mtQ/WQazX7YrhoBtC5DpBmzd0paYOzNG
 F6yRTX1/j4Sdits8DfimDUlNloDWZ6EcgMPeLWaRb8gEpO/y/sVpzLjzLe4YeRviu7bbKkF+f
 zoAjX9Qixgo1W0I5yGXDd49Spzek9fAUjNmmphVgs5BSCPYYx3wsb8dGmu7Rbw9uCRwXjCJpY
 n7GKXiH5XxE7oT2IV+Jiby35yCSpwIADDgl6VYMQtA==
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.15,
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

Le 15/01/2023 à 22:00, Helge Deller a écrit :
> Make the strace look nicer for those syscalls.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   linux-user/strace.list | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 


Reviewed-by: Laurent Vivier <laurent@vivier.eu>


