Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D78935F950
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 18:57:51 +0200 (CEST)
Received: from localhost ([::1]:33618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWipp-0006uG-Uq
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 12:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lWims-0005Al-OR
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:54:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lWimq-0004hl-CD
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 12:54:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618419283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6CXjVFibXsXylcUaAXlYswDsDfQUo7K7CLGg0o9LCI=;
 b=aML17Pe/n8lc0tWo6HuzbW0FYRs6r5nX9ZaNciA9sgqtVq14yv5yDCawz96is02zlWdy0U
 XPBA/TJEn+GIIwardLyOPm2nkzwSsnq3KsN5XWcfHXq7ZrZK1qNItEECYgzg0J2+wBpzuj
 qmT5w4lyjUIL/kSlMFderInZa012AkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-SGBY7PMEPCObfKDBADeNeg-1; Wed, 14 Apr 2021 12:54:39 -0400
X-MC-Unique: SGBY7PMEPCObfKDBADeNeg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8244107ACCA;
 Wed, 14 Apr 2021 16:54:38 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-57.gru2.redhat.com
 [10.97.116.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1362910074F1;
 Wed, 14 Apr 2021 16:54:33 +0000 (UTC)
Subject: Re: [PATCH 1/1] Acceptance Tests: bump Avocado version requirement to
 87.0
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210414161144.1598980-1-crosa@redhat.com>
 <20210414161144.1598980-2-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <2eaa3002-9350-138d-8a9b-ec66923c03eb@redhat.com>
Date: Wed, 14 Apr 2021 13:54:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210414161144.1598980-2-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 4/14/21 1:11 PM, Cleber Rosa wrote:
> This version (and 86.0) contain improvements that address specific
> QEMU use cases, including:
>
> * Fix to the error message given when downloading assets
>
> * Asset listing/purging capabilities
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   tests/requirements.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Acked-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/tests/requirements.txt b/tests/requirements.txt
> index 91f3a343b9..f57e895c4a 100644
> --- a/tests/requirements.txt
> +++ b/tests/requirements.txt
> @@ -1,5 +1,5 @@
>   # Add Python module requirements, one per line, to be installed
>   # in the tests/venv Python virtual environment. For more info,
>   # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
> -avocado-framework==85.0
> +avocado-framework==87.0
>   pycdlib==1.11.0


