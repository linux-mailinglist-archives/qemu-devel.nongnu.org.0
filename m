Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46C4C71A3
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 17:23:52 +0100 (CET)
Received: from localhost ([::1]:56590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOioR-0008PB-DT
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 11:23:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOimk-00075e-9t; Mon, 28 Feb 2022 11:22:06 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:52972
 helo=outgoing.mit.edu)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <schaub@mit.edu>)
 id 1nOimi-0006Ap-KH; Mon, 28 Feb 2022 11:22:05 -0500
Received: from [10.31.51.144] (dhcp-10-31-51-144.dyn.MIT.EDU [10.31.51.144])
 (authenticated bits=0) (User authenticated as schaub@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 21SGM1tL003469
 (version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 28 Feb 2022 11:22:02 -0500
Message-ID: <006d618a-07d5-f58c-fdce-18914c7c7625@mit.edu>
Date: Mon, 28 Feb 2022 11:22:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] allow disabling tests
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <a8bdb3e7-a877-070c-3ef5-6d14086a7f9b@mit.edu>
 <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
From: Simeon Schaub <schaub@mit.edu>
In-Reply-To: <CAFEAcA_jsunyeYOqu0aPtC3XrdD30b1Fk-6QsiDCTs=AJcvYVQ@mail.gmail.com>
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Ah, yes, sorry, I didn't check whether the tests were actually run. I
can rename this to something more like `build-tests` if you think that's
more informative.

Best,
Simeon

On 2/28/22 11:16, Peter Maydell wrote:
> On Mon, 28 Feb 2022 at 16:10, Simeon Schaub <schaub@mit.edu> wrote:
>>
>> From b6ec17a85a8fb2431545f9c5093dbce9a090b522 Mon Sep 17 00:00:00 2001
>> From: Simeon David Schaub <schaub@mit.edu>
>> Date: Mon, 28 Feb 2022 10:51:04 -0500
>> Subject: [PATCH] allow disabling tests
>>
>> Adds an option to avoid running tests as part of the build process. I
>> ran `make update-buildoptions` to update the meson options, but this
>> seemed to also change the `qga-vss` option. I assume this isn't intended
>> to happen, any ideas what's going on there?
> 
> What tests are we running as part of the build process?
> I wouldn't expect us to run any tests unless you ask for them
> by running "make check".
> 
> We *build* the testcase binaries as part of the build process, which
> perhaps is what you're running into ?
> 
> thanks
> -- PMM

