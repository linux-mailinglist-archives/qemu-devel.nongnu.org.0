Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 977F92C12F9
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 19:20:32 +0100 (CET)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khGRz-0007Yc-5v
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 13:20:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1khGQB-0006p8-DV
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:18:39 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:33982
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1khGQ9-0002Dx-6x
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 13:18:38 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id E027DDA1C08;
 Mon, 23 Nov 2020 19:18:34 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id rb6okNzTBrxh; Mon, 23 Nov 2020 19:17:43 +0100 (CET)
Received: from edv-macbook-pro.fritz.box (p57b420e8.dip0.t-ipconnect.de
 [87.180.32.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 8450ADA038B;
 Mon, 23 Nov 2020 19:17:42 +0100 (CET)
Subject: Re: Regressions in build process introduced since August
To: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <53da03f4-f044-fb1d-9a1a-a793077cccc3@redhat.com>
 <496e409e-533a-74fb-c4f7-8b394452d0be@weilnetz.de>
 <20201123152839.GJ987095@redhat.com> <20201123154106.GK987095@redhat.com>
 <06cdb8fb-7218-c197-30fa-261db68f5e2e@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <ea9ec9fb-d4b3-16cd-0cb9-7aa13f60c638@weilnetz.de>
Date: Mon, 23 Nov 2020 19:17:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <06cdb8fb-7218-c197-30fa-261db68f5e2e@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.11.20 um 17:20 schrieb Paolo Bonzini:

> On 23/11/20 16:41, Daniel P. Berrangé wrote:
>>> Relying on pkg-config should be our strong preference. I expect 
>>> we're doing
>>> the old fashioned library check just for historical reasons, but 
>>> even RHEL-7
>>> supports pkg-config for libjpeg. So I think we're safe to just 
>>> unconditionally
>>> rely on pkg-config these days and thus have it "just work" for cross 
>>> compiles
>>> too.
>>
>> For that matter I think we can also rely on  pkg-config for sasl too, as
>> again all our supported platforms have a new enough cyrus-sasl to have
>> a pkg-config file present these days.
>
> Yes, I agree.  However we have at least -lmpathpersist that does not 
> have a pkg-config file.  In the meanwhile I'll integrate Stefan's 
> patch.  Stefan, is libjpeg the only one that is affected in your build 
> environment?
>
> Paolo
>

Yes, as far as I see currently only libjpeg is affected.

Thanks,
Stefan


