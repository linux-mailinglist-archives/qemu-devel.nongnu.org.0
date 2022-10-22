Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E6609762
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 01:58:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1omjfq-0006Lw-T4
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 18:42:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLis-0007I7-Fd; Sat, 22 Oct 2022 17:08:02 -0400
Received: from mout.kundenserver.de ([212.227.17.13])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1omLiq-0002K2-Bh; Sat, 22 Oct 2022 17:08:02 -0400
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MmkjY-1pTyCD3Hd8-00jmei; Sat, 22 Oct 2022 23:07:55 +0200
Message-ID: <777f273e-2ce0-2d84-4009-9f33a8eae9ef@vivier.eu>
Date: Sat, 22 Oct 2022 23:07:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 0/3] Drop useless casts from void * to pointer
Content-Language: fr
To: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20220923120025.448759-1-armbru@redhat.com>
 <87a65qbsn3.fsf@pond.sub.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <87a65qbsn3.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:w5vBeyN4GHjCOJ/3DVWxaKIG1XGYRYTkJIJjz2etogM8IjcHAai
 3+BTXiZCeL2fPyu2RgmTeSwjLtz7ackqBgvHEY6vu3aQIxzTE37k2mOgbpwY8pmc0XCl8+8
 fIY7QoF/90enR3rqNUAAYvH1h/kaa0eWwkdGh5jw9ZxjQOEFpEhM3oYKjArZZsbqMxxFL3b
 XVb9kUKbcI9EaFAvg1fnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NmnT+JwYM9A=:EXCC7LgB7qoxcV7NvWNHzZ
 PSCqdtt8hVQvKM4Nvg3nYaRmdPAY9guWvVQ2sgD/WC2KWAJ4fzFNJxMPFgiTZtFaxUlmYAjy3
 mlmTloxxgwkpNbD1DrrNBMI/A5e9DR/aFe03m0Ke2JwXePhQI4uwstnd1I78nXTvfVXTkbJem
 0J4/Kj3Z11Vn4iVkhtph7Xd0+HianeF5eAm22jUN1kGrGt2tNYLiv2W2pq9vZFNWMvO01ZqpH
 i9diVBIzsAR6O+4vVEfDIAcXEKCnTS2scWaur/+aWV2thO4eXK+OzaqhAR1i/ju3YIb0V+pyX
 4Uv/GrVVIvVry6vrmcq7w8A74S0mqr+8+7yE7mswWZnZjIt89KjXGQXnb/EXpJs8cO5Y80CJx
 kpf1Qfh+GBCU4FB+o5Mx3pHzvL3toj4CbgfzsObH0iocao8oqH9ULtHlEy/1qsuknTntk3jCM
 qPfJ7MpJd7YEt3g18vyk8j8dq+6/BFPb1slULlnDikM1a/17yxhNkmi2zdr8DAv0Ao9Lem05n
 ZEwufbFG5OnTvu7g0kEDhphqUgbc4OX6ZTS3niwh+NunyQ3TRQOB6rMAc1Id0utsvJzjn6i3e
 WSTZjX2tqkBeUNMwKaItNiZgKZtjb5AxC7U3/M5HXC5Hv9vUauphhdKPbFIG9ILZ3B2waL8ic
 zZcJdHDvgEPm2d+Q3X4+otKkw9bTjZVDmVQM9vk4m9CfknfNYOoQHaI6WtrKkEs7KKiBnQMP6
 bqMx8vsIHk2JXoWtpSIqVTkaMSZqE/P5xNLHfI7Tir5of8o5qbe3lw7uw6p9jW4eFYaTR23Bw
 64b775y
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 20/10/2022 à 14:12, Markus Armbruster a écrit :
> Could this go via qemu-trivial now?
> 
> 

Yes, sorry for the delay.

I think there is a problem with PATCH 3.

Thanks,
Laurent

