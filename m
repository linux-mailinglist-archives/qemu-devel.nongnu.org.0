Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C7F398FF4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 18:29:23 +0200 (CEST)
Received: from localhost ([::1]:41062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loTkA-00044O-5i
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 12:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loTiz-0002a0-CA
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1loTiw-0003OC-QV
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 12:28:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622651286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oCFBhlJsT4XmaqymF41dgYrn8wzzWPIPFIMVROsR89w=;
 b=iBpQ+P9XVijrkyycFcrzDzBxHsJdbVwn3eIV59TdVEmY246Lj9oWBzUu4u2rloyg4+rbl1
 5YrAcPa3z0HNXoOOS4pp+wmamwD/0qv1QC9Zq9wlN5A1VJPgOsbXvDxSNLmxH0kteUqa/3
 1p1TA+MRBIruUJ8cNSa2raFD/zgnHa4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-qmfDzRt4MIijFl7S7Qx9mQ-1; Wed, 02 Jun 2021 12:28:03 -0400
X-MC-Unique: qmfDzRt4MIijFl7S7Qx9mQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A9F81013726;
 Wed,  2 Jun 2021 16:28:01 +0000 (UTC)
Received: from [10.10.116.137] (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0379A5C1A3;
 Wed,  2 Jun 2021 16:27:47 +0000 (UTC)
Subject: Re: [PULL v2 00/44] Python patches
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210601233118.1103509-1-jsnow@redhat.com>
 <CAFEAcA9J97B2XqC-9vnej2pb=rLjAJv9KnT4buU4BVU20pmy4A@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <de2077e8-ef8a-dbd5-5485-57261275c0d3@redhat.com>
Date: Wed, 2 Jun 2021 12:27:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9J97B2XqC-9vnej2pb=rLjAJv9KnT4buU4BVU20pmy4A@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/21 12:07 PM, Peter Maydell wrote:
> On Wed, 2 Jun 2021 at 00:31, John Snow <jsnow@redhat.com> wrote:
>>
>> The following changes since commit 52848929b70dcf92a68aedcfd90207be81ba3274:
>>
>>    Merge remote-tracking branch 'remotes/kraxel/tags/usb-20210528-pull-request' into staging (2021-05-30 20:10:30 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>>
>> for you to fetch changes up to 6b9c277797879ce41ed20deb6737f4156cc279b3:
>>
>>    gitlab: add python linters to CI (2021-06-01 16:21:21 -0400)
>>
>> ----------------------------------------------------------------
>> Pull request
>>
>> V2:
>>   - Squashed in fixup for
>>     'Python: add utility function for retrieving port redirection'
>>   - Rebased on today's upstream
>>
>> CI here:
>> https://gitlab.com/jsnow/qemu/-/pipelines/313202814
>>
> 
> 
> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
> for any user-visible changes.
> 
> -- PMM
> 

Yay!!!

Shouldn't be any user-visible changes yet, but there are some 
developer-visible ones. (The new CI tests now protecting our python 
code, chiefly.) I don't think it's appropriate matter for the changelog.

Thank you!

🎉


