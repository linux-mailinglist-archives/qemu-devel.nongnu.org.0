Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ADCB31DD89
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 17:44:45 +0100 (CET)
Received: from localhost ([::1]:42376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCPwS-0007QB-Av
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 11:44:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCPu4-0006BE-HE
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:42:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lCPu2-0001Ln-77
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 11:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613580133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8jwG3HhqRofAoDRkYDZT9y9mj58pFYD6sbMtJA1HemU=;
 b=YPK5sOkYMnXtwoubTdH9XaFhEVA5PxLqiX4gyTtKOIPgxi0rVf7Gfjx8I5UvsbmY8G6kAk
 jF94F02kKmtPM4m4/gh9pYRxvlxgWIx30xtfIXvpVmC/J3s/FKtgYPmtd05u4+kBDJ3DQc
 CUQXJ6YxoCpg3a5VXeQWCWoCzw1jA8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-fwWAFlERMcGd5Zi0YZaW7A-1; Wed, 17 Feb 2021 11:42:11 -0500
X-MC-Unique: fwWAFlERMcGd5Zi0YZaW7A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE872801978;
 Wed, 17 Feb 2021 16:42:09 +0000 (UTC)
Received: from [10.10.112.247] (ovpn-112-247.rdu2.redhat.com [10.10.112.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F3F065D9C2;
 Wed, 17 Feb 2021 16:42:04 +0000 (UTC)
Subject: Re: [PATCH v4 18/24] python/qemu: add qemu package itself to pipenv
To: Cleber Rosa <crosa@redhat.com>
References: <20210211185856.3975616-1-jsnow@redhat.com>
 <20210211185856.3975616-19-jsnow@redhat.com>
 <YCyf6YQ72ZGxP8Gv@localhost.localdomain>
From: John Snow <jsnow@redhat.com>
Message-ID: <eaa2c2f6-1d47-f1c9-5eba-48c754a3a3d4@redhat.com>
Date: Wed, 17 Feb 2021 11:42:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCyf6YQ72ZGxP8Gv@localhost.localdomain>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

On 2/16/21 11:47 PM, Cleber Rosa wrote:
> On Thu, Feb 11, 2021 at 01:58:50PM -0500, John Snow wrote:
>> This adds the python qemu packages themselves to the pipenv manifest.
>> 'pipenv sync' will create a virtual environment sufficient to use the SDK.
>> 'pipenv sync --dev' will create a virtual environment sufficient to use
>> and test the SDK (with pylint, mypy, isort, flake8, etc.)
>>
>> The qemu packages are installed in 'editable' mode; all changes made to
>> the python package inside the git tree will be reflected in the
>> installed package without reinstallation. This includes changes made
>> via git pull and so on.
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>   python/Pipfile      | 1 +
>>   python/Pipfile.lock | 9 +++++++--
>>   2 files changed, 8 insertions(+), 2 deletions(-)
>>
> 
> Reviewed-by: Cleber Rosa <crosa@redhat.com>
> Tested-by: Cleber Rosa <crosa@redhat.com>
> 

Thanks for the reviews so far!


