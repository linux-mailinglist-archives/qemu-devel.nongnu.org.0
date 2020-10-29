Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5574829DBA7
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 01:09:42 +0100 (CET)
Received: from localhost ([::1]:37290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXvVd-00059M-E2
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 20:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXvTs-0004Ga-Sb
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 20:07:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXvTq-0005ZM-J5
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 20:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603930069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEvqm3NdSfemmf4xZfPCpCzrG9+c2PFCGOrvmpf/UyQ=;
 b=ifGY2fRzQ4phS80fWuUUgMDa/whivxFeh4QOC66G2dwmJNqKtnHjFnYyPqfT0DKkglI4H/
 xWhqbuVGfJ1fZkh3d2JTb5K7Q7yX7DUwQWkExunkmHzW7FGO3VxfMVNBXqYGwaFKMvVZ0U
 WrtB4CCjHXT7u0CyzjbLRM2sws0IYxM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-xSbC5g45MGW_B3DAcfSKGA-1; Wed, 28 Oct 2020 20:07:48 -0400
X-MC-Unique: xSbC5g45MGW_B3DAcfSKGA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8B519879528;
 Thu, 29 Oct 2020 00:07:46 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2236A60BF1;
 Thu, 29 Oct 2020 00:07:41 +0000 (UTC)
Subject: Re: [PATCH v3 14/15] python/qemu: add isort to pipenv
To: Cleber Rosa <crosa@redhat.com>
References: <20201020193555.1493936-1-jsnow@redhat.com>
 <20201020193555.1493936-15-jsnow@redhat.com>
 <20201028224611.GG2549351@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <6fe5cdf9-549d-8c28-db0c-39f27007eba8@redhat.com>
Date: Wed, 28 Oct 2020 20:07:41 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201028224611.GG2549351@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/28 01:50:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.921, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Ben Widawsky <ben@bwidawsk.net>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>,
 Rohit Shinde <rohit.shinde12194@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 6:46 PM, Cleber Rosa wrote:
> On Tue, Oct 20, 2020 at 03:35:54PM -0400, John Snow wrote:
>> isort 5.0.0 through 5.0.4 has a bug that causes it to misinterpret
>> certain "from ..." clauses that are not related to imports.
>>
>> Require 5.0.5 or greater.
>>
>> isort can be run with 'isort -c qemu' from the python root.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> 

Good suggestion on isort, btw. I was afraid at first it was going to be 
annoying to integrate a fourth tool, but it wound up sliding in very 
nicely as you can see. :)

I like the effect it has already had on these and the QAPI patches.

--js


