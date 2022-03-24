Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B744E61EE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 11:46:07 +0100 (CET)
Received: from localhost ([::1]:45882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXKyk-0000VE-TH
	for lists+qemu-devel@lfdr.de; Thu, 24 Mar 2022 06:46:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXKvy-0007VJ-Qs
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:43:14 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:34351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nXKvx-0006Qo-4A
 for qemu-devel@nongnu.org; Thu, 24 Mar 2022 06:43:14 -0400
Received: from [192.168.100.1] ([82.142.12.150]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MGQSj-1nH9tg2Wz7-00GqEK; Thu, 24 Mar 2022 11:43:01 +0100
Message-ID: <0e9f8e81-7a73-60cf-4154-aa075a068852@vivier.eu>
Date: Thu, 24 Mar 2022 11:43:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: qemu-binfmt-conf.sh: improvements for mips
Content-Language: fr
To: philippe.mathieu.daude@gmail.com
References: <20220323230559.656291-1-dilfridge@gentoo.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220323230559.656291-1-dilfridge@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:e7UPX8NR3zeiz4QuS/pZQoKkOZGEy66BIBEg5Ab1Vv9WpYKujQM
 8Nid60g8233Zs4sRp/QbOqr9LV0mDMkwca9aAT/YBk1bS4jS4DkE89zZ5JGhbVjhsRGI6Ir
 vZan4WtGSq3HHx9XMiJuwo3F9U8u5tpaPTe5rICgMH8uHm+CCyDjBuPgFDpiRt9Lwa9grQM
 OD9JtU+DB6cq76mto7Kmg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gPUfuoBtYMs=:/f+mJpeGlMUo5ItCnFOhG3
 QTeuvHahD8cTYrY3hfarK5a3HS46LVMmSN0Ojv8PNua4Yfk97l2UiREUbUuNgWlBSDCjdUqIU
 k3wv70llzSsZbaYc6ufcuXEkCoAFORM6jpSLGlzoLCsD5HIdksTK9MH9pMsp2bxFFR8R0n6oz
 pYOMJWcIEA4Ld+sqT5w/nEysenf1yN1vv3EUy34wG4+IWSFNZoKmVfcgUr9mweZsly6KcqBWi
 72J1yBH/Fy2R2528tGvIDIt4sesZUZ34B9MZUIfRY+rbVSAd3AzAkPM8ENzBto5Ed1QjSh+KA
 585L890FOn3iR0ZkpRxarbToOfdmh7DG/hxlHUXtWRGCo3P8V4r2UJyAaYNMmf8XKv6+bAayO
 jFhbJ0g41+u9dWXPbC2HN+JfT99A7P6DOHDS4faMKzdSxvH2H/pD7Y7mh6RcZY8eueqmhzV2B
 HW10OvO/zqmmnV5uNlAXIpJ1O2HzxEqLHl83JkKzjjJJgPGgfNroPIdTCO7fYlxpt/d0WtsP7
 5EPGLpdqkKeNbE4/zAXyhFMtM/PgDT38D/KMoBIFLENf2kVk9DXG0mI6JDly8dWc9MHFfvBVk
 bUmtivQ8QGtJM0PCaSvRJ6Z5seUCor2WgzBG7Izbmc84aD43/akjIyGClYHmAl4i3J3ivkJwq
 MIWn+wfHWiBFmcqh7F8r50TLl/MFWGNbffBtftBSZCchfS8v3G7TNjf+lJbSCJW3az8c=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
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
Cc: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 =?UTF-8?Q?Andreas_K=2e_H=c3=bcttel?= <dilfridge@gentoo.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 24/03/2022 à 00:05, Andreas K. Hüttel a écrit :
> Re-sending v3 unchanged as requested.
> 
> The first patch has already been submitted earlier and is unchanged from v2.
> The second patch extends it and resolves issue 843, "duplicate magic mips patterns".
> Tested with various self-bootstrapped Gentoo chroots and in production on
> the Gentoo release engineering stage builder.
> 
> 

Philippe,

could you review this version (v4) and I will try to push this in 7.0

Thanks,
Laurent

