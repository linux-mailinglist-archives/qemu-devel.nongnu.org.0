Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 974BE29D006
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Oct 2020 14:28:22 +0100 (CET)
Received: from localhost ([::1]:36170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXlUz-0002AF-Ky
	for lists+qemu-devel@lfdr.de; Wed, 28 Oct 2020 09:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXlSw-0001Fq-Hn
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kXlSt-00082I-Nx
 for qemu-devel@nongnu.org; Wed, 28 Oct 2020 09:26:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603891570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kg4QH9bQV7p72oYn+Tv8DdXJav1WrxlneiKREZTw3cQ=;
 b=KwRP5Yh8VqNG/8qwuGoW0jdoYVWjyUfovvg87kE2kB3n1gR2xB68cIqFoXrVe5QTvCRXMR
 qjbHOz8TxaP8Y2qD0egLUidHmfA9JEjUvgKSnPR69OpF6o1IHptYLAJNGyrjEBPpO7GcC0
 2zpw68wyhQYXBC3gpHeavhxyeNGQRU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-E7g3DrHXMyKQNpxx6IWAQw-1; Wed, 28 Oct 2020 09:26:08 -0400
X-MC-Unique: E7g3DrHXMyKQNpxx6IWAQw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553B9966B29;
 Wed, 28 Oct 2020 13:26:07 +0000 (UTC)
Received: from [10.10.118.238] (ovpn-118-238.rdu2.redhat.com [10.10.118.238])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 122CB19C4F;
 Wed, 28 Oct 2020 13:26:02 +0000 (UTC)
Subject: Re: [PATCH 4/5] python: add .gitignore
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201027223815.159802-1-jsnow@redhat.com>
 <20201027223815.159802-5-jsnow@redhat.com>
 <f9ea6ce1-f464-0376-29ac-6071f680e63b@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <3962408d-6c07-55d8-21c5-3f093e1ff90a@redhat.com>
Date: Wed, 28 Oct 2020 09:26:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <f9ea6ce1-f464-0376-29ac-6071f680e63b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/20 4:13 AM, Thomas Huth wrote:
> On 27/10/2020 23.38, John Snow wrote:
>> Ignore build and package output (build, dist, qemu.egg-info);
>> effectively these are "in-tree" builds of a kind.
> 
> Since we recently moved away from in-tree builds, could these also be made
> out-of-tree only?
> 
>   Thomas
> 

I'm not sure to be really honest with you.

For "developer installs", I think the answer is *no*, it has to be 
in-tree. Basically you are installing this directory as a living 
package, as the live copy. It adds some metadata to the folder to do 
that. No way around it.

I'll investigate, but I have doubts.

--js


