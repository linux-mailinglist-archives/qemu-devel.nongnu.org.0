Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B8233F779
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 18:49:59 +0100 (CET)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMaIw-0006T7-Tf
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 13:49:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lMaGG-0004mR-SJ; Wed, 17 Mar 2021 13:47:12 -0400
Received: from forward3-smtp.messagingengine.com ([66.111.4.237]:42505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>)
 id 1lMaGF-0000e7-17; Wed, 17 Mar 2021 13:47:12 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailforward.nyi.internal (Postfix) with ESMTP id 970ED19407F7;
 Wed, 17 Mar 2021 13:47:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 17 Mar 2021 13:47:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=aVqdGB
 QTbnvo4KsxqLw88ljK2sdxjwDz98nPWlVyfAA=; b=Jxf52INQoILa8pn+E45Y5a
 GuRmORojzJ8E3uE9ivZYxU0XS1/LBmymjSNltZPD9hK/ZARUE1y5oMvX8HtYJPA8
 v+cHl4Vgksvq5aRQAk7vrtNRo/mzpu6hj2nRBWlS2oFm7KFbIqVLVtCd+rHR/2Z1
 P0lhGLCqIrAwsAEdPjD7ebYGDeeTZx031b3X1rOY7LazCjKOMl6q4nWnZm+hweoB
 bJvUMu5EEHibYS17AfQwDjhLlwrKTcGSqZJlUIzxQXNPApScGyYZCv/arZWmzkhN
 VXst1iD1pcJ2Np1XiaGJoSP1O0FXZ61yuLBiQPikkkKkJBS6NEN80Q9wOQv53zvg
 ==
X-ME-Sender: <xms:nUBSYEXy8s2m-N4lLSicjVGqMHJkK-Nlz81gWu03UxgNbvvx5M0wrA>
 <xme:nUBSYIlBrWtRM5SJLYIe4VhL9OLsplTeN3yQIA_LwgHcntw-Tx4FBntcL_StjZPli
 neKtqUvxR_cmgcuBEI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedguddtkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 ephfekgeeutddvgeffffetheejvdejieetgfefgfffudegffffgeduheegteegleeknecu
 kfhppeekuddrudekjedrvdeirddvfeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrg
 hrrghmpehmrghilhhfrhhomhepughmvgesughmvgdrohhrgh
X-ME-Proxy: <xmx:nUBSYIZVUrFK09nfeNlyax5oWjRIameqyTBNrv1m15eDQMJQoQZCgw>
 <xmx:nUBSYDU6UMlmtmw6NeHccyJ9bYqEz8izj2Ab7U0yuICTsHL2-Xvmtg>
 <xmx:nUBSYOkqlKbleuZwCQDVHTCRC0Ivmt41pUlS2ldBj7QfjIrJ0oVojw>
 <xmx:nUBSYAhnxaVeg1v9U9m0fbeVYhmPnimtSqCoZ8RwjXX7QJsO9sgOjg>
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net
 [81.187.26.238])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9081C1080057;
 Wed, 17 Mar 2021 13:47:08 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 504287ba;
 Wed, 17 Mar 2021 17:47:07 +0000 (UTC)
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 4/6] coroutine-lock: reimplement CoRwLock to fix
 downgrade bug
In-Reply-To: <3146529c-788a-2d64-0369-cb6f28be2151@redhat.com>
References: <20210317121641.215714-1-pbonzini@redhat.com>
 <20210317121641.215714-5-pbonzini@redhat.com> <cun5z1pvmgi.fsf@oracle.com>
 <3146529c-788a-2d64-0369-cb6f28be2151@redhat.com>
X-HGTTG: heart-of-gold
From: David Edmondson <dme@dme.org>
Date: Wed, 17 Mar 2021 17:47:07 +0000
Message-ID: <m24kh9ekpw.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.237; envelope-from=dme@dme.org;
 helo=forward3-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wednesday, 2021-03-17 at 18:19:58 +01, Paolo Bonzini wrote:

> On 17/03/21 16:17, David Edmondson wrote:
>>> +    if (tkt) {
>>> +        if (tkt->read) {
>>> +            if (lock->owners >= 0) {
>>> +                lock->owners++;
>>> +                co = tkt->co;
>>> +            }
>>> +        } else {
>>> +            if (lock->owners == 0) {
>>> +                lock->owners = -1;
>>> +                co = tkt->co;
>>> +            }
>>> +        }
>>> +    }
>>> +
>>> +    if (co) {
>>> +        QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
>>> +        qemu_co_mutex_unlock(&lock->mutex);
>>> +        aio_co_wake(co);
>>> +    } else {
>>> +        qemu_co_mutex_unlock(&lock->mutex);
>>> +    }
>> 
>> This block could be pushed up into the earlier block, but I imagine that
>> the compiler will do it for you.
>
> I guess I could do
>
>      if (!tkt || (tkt->read ? lock->owners < 0 : lock->owners != 0)) {
>          qemu_co_mutex_unlock(&lock->mutex);
>          return;
>      }
>      if (tkt->read) {
>          lock->owners++;
>      } else {
>          lock->owners = -1;
>      }
>
>      co = tkt->co;
>      QSIMPLEQ_REMOVE_HEAD(&lock->tickets, next);
>      qemu_co_mutex_unlock(&lock->mutex);
>      aio_co_wake(co);
>
> but I find it less readable.

Agreed.

> So that leaves only the of/or typo, right?

Yes.

dme.
-- 
In heaven there is no beer, that's why we drink it here.

