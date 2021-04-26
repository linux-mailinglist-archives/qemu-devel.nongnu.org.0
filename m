Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7F536B447
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 15:50:46 +0200 (CEST)
Received: from localhost ([::1]:48998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb1dK-0002aH-V5
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 09:50:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@posteo.de>) id 1lb1bd-0002B3-Sm
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:48:57 -0400
Received: from mout01.posteo.de ([185.67.36.65]:54913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@posteo.de>) id 1lb1bb-0003sw-F5
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 09:48:57 -0400
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id DF3E924002E
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 15:48:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1619444931; bh=/+/Sl4Bejksg/7oTL11RmJW9+oi/lLcOB2t2DCS9OkM=;
 h=Subject:To:From:Date:From;
 b=LHpV8nvFMHxPXQIPItkN11sPJ0RtP4dVpHkjlXQMaMXF6x2HhJoI8ifkH2iiRuPer
 dziF4PnzEsP/Kfg//9t/MRnPyXRLCzXkN9OolRidPZHIHAQSY/rPxYvXrzExNy8L8L
 X+mAMENEvKsQUzbcKQIysXPs5wthMAoVxvGVGcDjJt5p94F2CfOaYuoVSzkxr7sIDS
 k5BP0mUiOlqx7GT3TZPZh/5ceR5KZ6lJhYu6y4CkpZTjaPDQ/kaADd+LbXfzpqVYz5
 ILdXzm1wzGlxJMjHj5t/VOt/jtaR811ONEgaTEnsdorq3OrstsyjUo7m8FjOBcv6GX
 cPmIViwkoevvw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 4FTR7k2KCWz9rxG;
 Mon, 26 Apr 2021 15:48:50 +0200 (CEST)
Subject: Re: X on old (non-x86) Linux guests
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 richard.henderson@linaro.org, balaton@eik.bme.hu, kraxel@redhat.com,
 Thomas Huth <thuth@redhat.com>
References: <YIaPdjz7PpvwVPP/@work-vm>
From: Thomas Huth <th.huth@posteo.de>
Message-ID: <dc3bad6e-3a44-f5c1-e9d4-0bf51a682215@posteo.de>
Date: Mon, 26 Apr 2021 13:48:49 +0000
MIME-Version: 1.0
In-Reply-To: <YIaPdjz7PpvwVPP/@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=185.67.36.65; envelope-from=th.huth@posteo.de;
 helo=mout01.posteo.de
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/04/2021 12.01, Dr. David Alan Gilbert wrote:
> Hi,
>    Over the weekend I got a Red Hat 6.x (not RHEL!) for Alpha booting
> under QEMU which was pretty neat.  But I failed to find a succesful
> combination to get X working; has anyone any suggestions?
> 
>    That distro was from around 2000; the challenge is since we don't have
> VESA on non-x86, we can't change mode that way, so generic XF86_SVGA
> doesn't want to play with any of the devices.
> 
>    I also tried the ati device, but the accelerated mach64 driver
> didn't recognise that ID.
> 
>    Has anyone found any combo that works?

Not sure if it is of any help, but IIRC the advent calendar image #4 from 
the 2014 edition also uses an ancient Red Hat image with X, and it still 
seems to be working with recent versions of QEMU:

  https://www.qemu-advent-calendar.org/2014/#day-4

Maybe you could copy the config from that image?

  Thomas

