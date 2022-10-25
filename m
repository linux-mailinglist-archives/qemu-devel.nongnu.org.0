Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C2360C88E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:41:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onGK6-0000su-0f; Tue, 25 Oct 2022 05:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onGJr-0000FZ-6D; Tue, 25 Oct 2022 05:34:00 -0400
Received: from mout.kundenserver.de ([212.227.126.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1onGJp-0007Vl-2i; Tue, 25 Oct 2022 05:33:58 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M1HuU-1oouDK3kYk-002sUB; Tue, 25 Oct 2022 11:33:53 +0200
Message-ID: <0caceb01-c363-9b28-1989-661ecf00bf22@vivier.eu>
Date: Tue, 25 Oct 2022 11:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 00/11] Trivial branch for 7.2 patches
Content-Language: fr
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20221025073955.3115315-1-laurent@vivier.eu>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20221025073955.3115315-1-laurent@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f0Xzghwij6QDkBepPH9eHGThNNxDveIvWxwAxEnCLDhBsThMwrG
 j41ohPr6gAB3NK9rsVvFkVyh5CBHZTfzUEc7PyG8WOHz6yXWb5j9rxeMlUp4vgCSykmd/Rn
 56tVMg+v8HtFwwUxvH01omkkDgvuXVpRzFTkwfW9WKRqykM5vxdxgAp5SRCZD6AJjYEY8hL
 P/IpFOvil/9h2uqLsCoMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8eY1eVCeiN0=:8Fk7UxXlA7WGYnGDBS4ka0
 4e3wNpGx3E20dhqxeO0xyV5t36skH2Z7goxPZX3r/JU5Yt91WbAhSJuWYhyWqv73u/wbl3Z4N
 F6aKf1u3/oIc56Qz5zXJQ7Zhz4x0m00VeawmcEeLnheGJTKIfLIKY7P57+8/U4ebowJbwEgeA
 OrO1yqTa8DQ6volJOE8L/vC2fpcgKaQmC+UpyQQqeoXuHcTjcCyzRdf2Ei/KlLvPuJyB3ZU8g
 nNdBaW1H0nywYH+MGnluuC/MYLGT6RXV2WESRaKiW47lICa7k3Ke2OhZRDIhO2ZEyQ1yyKg2e
 THHX1TY8uSXjwxj+Bt/18Wu0+he58ziGOQSDQ40Ki3K+ZNiGe41VIb1ScLtMTgCW6e6DGuaeZ
 zwqxZv9zIrl3bbp0ibRkR4SSNvxdBj/NA3Nk7OG6tuQuwX/uv9Q+1xHGzpze6rAk32HHmMdZ5
 W3KSmiZ0EPvi2MXuUelOnEtgowJiYCFbLBt8qVPvxsz19gl5cbdr1Mf7QZr+HzOM/xnykEnq5
 XKdoPJ0K97sX6HA/Cb4Jv8R1VM3cQwNv+vxpSgt1koiE6quQmb/PXTGs6iHDFeTo2oae6eGay
 SDOKvawR04MF3upV0yFLNhAO/vcAtXJeWXZMliLLvOirZtHig/1LJS2jQgyu6b1uGPYG9Ukqf
 QqE2c7c6cDrtATNBif2ByxekEhURvHtwKzQ3pqna8W+Jc9SZal27blyTROhAgQh0DmGTsQWpf
 GtnFJW+hipunfnwGNgW1z6BrWzvQ7/HQC9DjP1K+WCI8D2JUAWM+ByVsSQ21M6evVU/9Tasd8
 QF7jA4q
Received-SPF: none client-ip=212.227.126.131; envelope-from=laurent@vivier.eu;
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

Le 25/10/2022 à 09:39, Laurent Vivier a écrit :
> The following changes since commit 0529245488865038344d64fff7ee05864d3d17f6:
> 
>    Merge tag 'pull-target-arm-20221020' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-10-20 14:36:12 -0400)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.2-pull-request
> 
> for you to fetch changes up to 046ab3b80891f4aa6d0cfd7db15c622b1933e598:
> 
>    accel/tcg/tcg-accel-ops-rr: fix trivial typo (2022-10-24 13:43:42 +0200)
> 
> ----------------------------------------------------------------
> Trivial branch pull request 20221025
> 
> ----------------------------------------------------------------
> 

Sorry for the duplicate messages but I have some issues with git-publish that doesn't send the emails.

This PR is correct and the tags has been updated correctly in my repo (HEAD 046ab3b80891)

Thanks,
Laurent

