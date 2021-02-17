Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD9831DACA
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:40:41 +0100 (CET)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCN4I-0000uy-22
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCN30-0000Sy-7R
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:39:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCN2x-0006NJ-SL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:39:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613569154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2FNNQ1H16S9mwYb0jkthIGb1B7w73CBKta3fpv25w0=;
 b=H0OLYtF2/rNroncKsGoErClEKyJn2/tr4TxEjzyHmMXsB532M3F9JsE7tjvVDcOtdYuhJ2
 khvs+HGht8QRZYdemWyoi6eZixTgz6dV1n5gqgWFK/NmUHG/ytlzd8zqUE96+mbREo2Yk7
 KncuW+UXvRqgnEHiCzWFIWVeqty6eVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-598-yn47CHOZOEqkVikpQzm1gA-1; Wed, 17 Feb 2021 08:39:11 -0500
X-MC-Unique: yn47CHOZOEqkVikpQzm1gA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6542100A8EF;
 Wed, 17 Feb 2021 13:39:09 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-116.ams2.redhat.com [10.36.112.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC1635D9C2;
 Wed, 17 Feb 2021 13:38:56 +0000 (UTC)
Subject: Re: [PATCH v1 2/6] gitlab-ci: Display Avocado log content when tests
 timeout
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210217121932.19986-1-alex.bennee@linaro.org>
 <20210217121932.19986-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e7ab2379-2748-d58c-6bad-0803bf45e20b@redhat.com>
Date: Wed, 17 Feb 2021 14:38:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217121932.19986-3-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, stefanha@redhat.com,
 pbonzini@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/02/2021 13.19, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Since commit ba2232bae6d ("gitlab-ci: Refactor code that show logs
> of failed acceptances") we display the log content of failing tests
> (Avocado "FAIL" event).
> 
> Since we are also interested in tests timeouting, update our global
> Avocado config to display log content for the "INTERRUPT" event,
> "possible when the timeout is reached" (See [*]).
> 
> [*] https://avocado-framework.readthedocs.io/en/latest/guides/writer/chapters/writing.html#test-statuses
> 
> Suggested-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210215171438.935665-1-philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7adb9a4cef..234cead60c 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -64,7 +64,7 @@ include:
>       - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
>       - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
>              >> ~/.config/avocado/avocado.conf
> -    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL"]'
> +    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
>              >> ~/.config/avocado/avocado.conf
>       - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
>           du -chs ${CI_PROJECT_DIR}/avocado-cache ;
> 

Acked-by: Thomas Huth <thuth@redhat.com>


