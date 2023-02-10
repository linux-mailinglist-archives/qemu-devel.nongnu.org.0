Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56692691FE9
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 14:39:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQTcN-0005YJ-Bc; Fri, 10 Feb 2023 08:39:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTcL-0005R9-BK
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:39:09 -0500
Received: from forwardcorp1a.mail.yandex.net
 ([2a02:6b8:c0e:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQTcI-0007tB-4c
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 08:39:09 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id B4B2660001;
 Fri, 10 Feb 2023 16:38:57 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1310::1:f] (unknown
 [2a02:6b8:b081:1310::1:f])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 vcfjiC0ORa61-5GRAFECd; Fri, 10 Feb 2023 16:38:57 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676036337; bh=fwVf62zJ67cOkWJPs0HAfPYHAy7Ps4Lgfh5bJwAQ704=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=U3nb66lOCgt/b7ca/UOyc9z0XVpl9Oow3A+ubZiA5ZGLeQDl2XqeRumZjRajb6gEA
 lWDET2rS5jQ0LixiLscliIfc/RNBn4CC5enobqXze6YAcxqdOUFordJABBH1aPH/A0
 IStb2WML6GHmOp81/28F3Ce8OJpaqopPIYg3H/l4=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <f2c9773b-8d99-9b19-85aa-f04beaf4c140@yandex-team.ru>
Date: Fri, 10 Feb 2023 16:38:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
 <20230209200808.869275-14-vsementsov@yandex-team.ru>
 <875yc9vmxz.fsf@pond.sub.org>
 <c361c5f3-c623-09e9-0519-cf9ba68ae0a1@yandex-team.ru>
 <874jrtsp9z.fsf@pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <874jrtsp9z.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a02:6b8:c0e:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.149,
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

On 10.02.23 15:01, Markus Armbruster wrote:
>>> What do @hotplug-device and @device name?  Are these qdev-id?
>>>
>>> What kind of paths are @hotplug-path and @path?  Are these paths to an
>>> object device in the QOM tree?  Which object?
>> device / path is same name and path as for DEVICE_DELETED
> Got it.  But there we have just one device, and here we have two.  Which
> two?

One is "bus" in which we insert the device. I'm not sure that's it correct to call pcie-root-port a "bus", but on the other hand in device_add command it's a "bus" argument. In some arguments in code it's called hotplug_dev or something like that. Probably "bus" is better.

> 
> Also, DEVICE_DELETED's doc comment is better:
> 
>      # @device: the device's ID if it has one
>      #
>      # @path: the device's QOM path
> 
> Suggest to steal from there.
> 

OK, agree.

-- 
Best regards,
Vladimir


