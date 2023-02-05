Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFB968B13A
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 19:48:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOk2q-0004Wc-SR; Sun, 05 Feb 2023 13:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOk2p-0004WS-A4
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 13:47:19 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pOk2m-0001pw-31
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 13:47:17 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 88040746377;
 Sun,  5 Feb 2023 19:44:41 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 7134B745712; Sun,  5 Feb 2023 19:44:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6F9397456E3;
 Sun,  5 Feb 2023 19:44:40 +0100 (CET)
Date: Sun, 5 Feb 2023 19:44:40 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Richard Henderson <richard.henderson@linaro.org>
cc: pixman@lists.freedesktop.org, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: pixman_blt on aarch64
In-Reply-To: <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
Message-ID: <e615e033-a3f6-083f-5f0f-eb506c3c5b4c@eik.bme.hu>
References: <4b519268-f8e8-6542-9d1b-34054879eec0@eik.bme.hu>
 <a7866129-9f7a-02d6-1e58-bf05e1bf89e4@eik.bme.hu>
 <410c3da9-9be5-a715-7b7a-48bd67355c9c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Sun, 5 Feb 2023, Richard Henderson wrote:
> On 2/4/23 06:57, BALATON Zoltan wrote:
>> This has just bounced, I hoped to still be able to post after moderation 
>> but now I'm resending it after subscribing to the pixman list. Meanwhile 
>> I've found this ticket as well: 
>> https://gitlab.freedesktop.org/pixman/pixman/-/merge_requests/71
>> See the rest of the message below. Looks like this is being worked on but 
>> I'm not sure how far is it from getting resolved. Any info on that?
>
> Please try this:
>
> https://gitlab.freedesktop.org/rth7680/pixman/-/tree/general
>
> It provides a pure C version for ultimate fallback.
> Unfortunately, there are no test cases for this, nor documentation.

Thanks, I don't have hardware to test this but maybe Akihiko or somebody 
else here cam try. Do you think pixman_fill won't have the same problem? 
It seems to have at least a fast_path implementation but I'm not sure how 
pixman selects these.

Regards,
BALATON Zoltan

