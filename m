Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A2D4C70A4
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 16:31:55 +0100 (CET)
Received: from localhost ([::1]:33510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOi0A-0003AC-9m
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 10:31:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOhy1-0002FD-L5; Mon, 28 Feb 2022 10:29:41 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:41357
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOhxz-0001ZX-Rl; Mon, 28 Feb 2022 10:29:41 -0500
Received: from [10.31.51.144] (dhcp-10-31-51-144.dyn.mit.edu [10.31.51.144])
 (authenticated bits=0) (User authenticated as schaub@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21SFTbcl007387
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 10:29:37 -0500
Message-ID: <b3563f4e-2259-69fe-1958-2b5bedf77e75@mit.edu>
Date: Mon, 28 Feb 2022 10:29:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] explicitly link libqemuutil against rt
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <eddf5c19-5582-7d88-5232-2052f87583ae@mit.edu>
 <CAFEAcA-dStng7OmArapZTMXx=fF9cme3VftLAAd-nQgcv0ZgGA@mail.gmail.com>
 <YhzeYQ7akrGqAIW7@redhat.com> <949b0675-cbae-51dc-5a3b-d0215738279b@mit.edu>
 <CAFEAcA99UBCvE-YTn++BSMTh5S11JqLJB4XsjdiV9D90aBGXjw@mail.gmail.com>
From: Simeon Schaub <schaub@mit.edu>
In-Reply-To: <CAFEAcA99UBCvE-YTn++BSMTh5S11JqLJB4XsjdiV9D90aBGXjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=18.9.28.11; envelope-from=schaub@mit.edu;
 helo=outgoing.mit.edu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ok, I understand.

On 2/28/22 10:17, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 15:13, Simeon Schaub <schaub@mit.edu> wrote:
>>
>> We generally target glibc 2.12 in the Julia ecosystem, since CentOS 6 is
>> still quite common in the HPC community.
> 
> Unfortunately you're on your own there then -- CentOS 6 is
> well out of QEMU upstream's supported-build-platforms list,
> and we will not carry portability fixes required only for it.
> 
> thanks
> -- PMM

