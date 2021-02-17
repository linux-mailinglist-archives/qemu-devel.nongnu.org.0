Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A10C31D44F
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 04:45:20 +0100 (CET)
Received: from localhost ([::1]:56322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCDmB-0003AT-7O
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 22:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDlB-0002fQ-7F
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:44:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCDl9-0004Eo-J5
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 22:44:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613533454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fuqi9nPA7apW+27tYrxvwcJ+o6/qyppwS4yODunqqg0=;
 b=I6yWXKRKoPBdwcTRCFVKNXw39l2XXn7UaP4H7usG9/kyyWWf6bo2oaYRr5pfOW1fMSFOyD
 qZhs/RWQpgARig2E46oklEIlsN5nYKaqxSyC5bywCSPMPHD655+0F8GmKa+asRh2BDFW+F
 efrdL5MAadQMv+j3ySvI8anUYsz54gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-hRzsHCTIPrqUon5JM3IRSw-1; Tue, 16 Feb 2021 22:44:11 -0500
X-MC-Unique: hRzsHCTIPrqUon5JM3IRSw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADE31009625;
 Wed, 17 Feb 2021 03:44:10 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 806EB100239A;
 Wed, 17 Feb 2021 03:44:04 +0000 (UTC)
Subject: Re: [PATCH v4 09/24] python: add pylint import exceptions
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-10-jsnow@redhat.com>
 <YCyIcGXWSOPK+9Gq@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <c14cd3ce-7a97-fb45-2ea3-66fdfa9837e1@redhat.com>
Date: Tue, 16 Feb 2021 22:44:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCyIcGXWSOPK+9Gq@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/16/21 10:07 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:41PM -0500, John Snow wrote:
>> Pylint 2.5.x and 2.6.x have regressions that make import checking
>> inconsistent, see:
>>
>> https://github.com/PyCQA/pylint/issues/3609
>> https://github.com/PyCQA/pylint/issues/3624
>> https://github.com/PyCQA/pylint/issues/3651
>>
>> Pinning to 2.4.4 is worse, because it mandates versions of shared
>> dependencies that are too old for features we want in isort and mypy.
>> Oh well.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/qemu/machine/__init__.py | 3 +++
>>   python/qemu/machine/machine.py  | 2 +-
>>   python/qemu/machine/qtest.py    | 2 +-
>>   3 files changed, 5 insertions(+), 2 deletions(-)
>>
> 
> I can see your struggle on those issues, so I choose not to punish
> myself attempting to replicate them.  I'll forever trust you in these
> matters.
> 

:~)

> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> 

Thanks!


