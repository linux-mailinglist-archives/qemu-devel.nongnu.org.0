Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337240DDA6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:12:56 +0200 (CEST)
Received: from localhost ([::1]:54838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt4J-0001pk-7U
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQsxn-0002mQ-Nm
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:06:13 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:58327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mQsxj-00070x-P8
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:06:09 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MBltM-1md0S011wa-00CAlh; Thu, 16 Sep 2021 17:06:04 +0200
Subject: Re: [PATCH 0/2] linux-user/nios2: trap and kuser fixes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210915174951.1852266-1-richard.henderson@linaro.org>
 <2a014319-18ac-2224-982f-19973eb89d6a@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <528272f3-d778-1e84-faa8-acc359e3ce78@vivier.eu>
Date: Thu, 16 Sep 2021 17:06:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2a014319-18ac-2224-982f-19973eb89d6a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TrbhfBuat5KXYcpT02nd0eSnVStiCC/Ca2Z/1s+kKeH3/QDY2iz
 kq2aHpUsTZDglhh1LniYuFgDMQzvshndqLoGYJOTNRSGOcvQihFqVsItL4NY+mNi/0WkIvk
 BIJ2FcxNmna8h00kmE9RvGujOfNXgMbLbIDPxGuNR3vMp9I9H3UoZ+4gDttCT+6KZvfaEMa
 j3951fm/0tYxvuwLpzgfA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:BQggf/X1sY0=:UsAP0XG2rTmW9hq8DtF+d6
 2wnbhuDQ4uDKdYu6IiuF7sTEwxF5ql2WBJd/n7QZAkLfRMQxYPNGjb/o8FZ1mlDWDWEwQv7Mb
 +axcZ0VzRQ56l1pRLwkrousHZBHJaHACGJuE/78LV3UHCNqjuANXeUsHxOs1x+L0jNgCsJEt0
 7LREI8MLaGiesZfKcrkVL3rLeJOK3NyVNYlAwLaP+ZHNGwBXsE+bt/jMCzLY+/NP41yJjMeAs
 mouPSH0sqDK402ZS09U7F3Boaa0O/f5Xv8zp1jpCTDIGQ+1l+OZu0ia9U5hPucyvIvkulhn2p
 oam0SAUzp+DxwuoS2k/czKC4J73yqn3RqgH28pU+Vh7UXNVtP+NQnw6RgBusK8y0WTV7UMWUn
 F5Mz/STjYOi8tOfXoTq00p2d9xi6RW7+AsPWU2hmW5SfGYJYN+dZpCFulQNJEj5yzBIZZ12nk
 8B2AqvAcxFshcO2tuqKVlIabDXS3qutJsVuwqSzajr4Rdm3kfzSZDbwazbu917r4bXjh8ZrrT
 BCME99ZvPKxiMsDspqUcQVw/cqMHFA1ViMef3f9RpdLNaXheF61fu6FdxEug6wX5VU7kp8pW8
 kM2Iw5rZG7o/Y2cC0PBeKHL6UUQ2UCupbe7e2+4Iuw43+Ty0XVMF2EIcdVm7DuEo/5ScliSvx
 Mv5ROKsR1u/r+UjbkokLeqbqriBhNNIoLDhecX2P4NBhoFQLpVm4PQwXxWSzdyfipoqghxhVi
 l+XQyUonVCuKPHFGK6fZP/p5daWHZdzavv41DQ==
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.488,
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
Cc: marex@denx.de, crwulff@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 15/09/2021 à 19:54, Richard Henderson a écrit :
> On 9/15/21 10:49 AM, Richard Henderson wrote:
>> Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
>> ("linux-user: Clean up siginfo_t handling for arm, aarch64")
>> ... for force_sig_fault().
> 
> Laurent, while I posted a follow-up to Peter's patch set, I'd prefer to go ahead and merge his
> first.  Just about everything I'm poking about with currently requires force_sig_fault().
> 

I'm going to send a PR with the "linux-user: split internals out of qemu.h" series, the Peter's
siginfo series will be in the next one.

Thanks,
Laurent

