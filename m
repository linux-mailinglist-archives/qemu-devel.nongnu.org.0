Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3A26E1CB
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 19:08:36 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIxOd-00021n-Nb
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 13:08:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIxN7-0000go-DE
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 13:07:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53274)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kIxN5-00065w-Ad
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 13:07:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600362417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pV1yDPmKSKMzjSH8e3+bEAkX+UM+ae5YhcE0Qhfm2ZE=;
 b=CmWqWEcE6oxGSaL2VCflUQOulxdUYLC4e9ZaPUynj03VRCGEnN3HO6B1hH/td2wsA3dmKZ
 qlFUNJYU/DF3RHUss2dp30jOfer8e52M9/zP2BuqIgITNGUCgYiXo26mKFrRjSx8Q1htqn
 PV/W3dHP7XFBA9Ox1S2fSOMpnP+s6UE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-FDPDY9KDM6CibXtwKIG5vw-1; Thu, 17 Sep 2020 13:06:55 -0400
X-MC-Unique: FDPDY9KDM6CibXtwKIG5vw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2ACB18C9F5F;
 Thu, 17 Sep 2020 17:06:54 +0000 (UTC)
Received: from [10.10.119.140] (ovpn-119-140.rdu2.redhat.com [10.10.119.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 398F86E714;
 Thu, 17 Sep 2020 17:06:29 +0000 (UTC)
Subject: Re: [PATCH 07/37] qapi: add pylintrc
To: Markus Armbruster <armbru@redhat.com>
References: <20200915224027.2529813-1-jsnow@redhat.com>
 <20200915224027.2529813-8-jsnow@redhat.com>
 <87k0wtoqes.fsf@dusky.pond.sub.org>
 <4da09c14-a768-73ee-3f91-62e7c60ac234@redhat.com>
 <875z8cg7gs.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <8ad4831a-1529-5dcd-ce0e-463ed564d458@redhat.com>
Date: Thu, 17 Sep 2020 13:06:28 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <875z8cg7gs.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 20:51:18
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.997,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/17/20 3:58 AM, Markus Armbruster wrote:
>> We don't care if import statements are similar to those in other
>> files. It's uninteresting entirely.
>>
>> (It matches on from typing import ... that exceed four lines, which I
>> do regularly by the end of the series.)
> What about something like
> 
>       # Ignore imports when computing similarities, because import
>       # statements being similar is uninteresting entirely
> 

OK. I left the "default" comments that pylint itself wrote. I'm now writing:

"Ignore import statements themselves when computing similarities."


