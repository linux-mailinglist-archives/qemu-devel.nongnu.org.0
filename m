Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C757331C103
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 18:51:39 +0100 (CET)
Received: from localhost ([::1]:36178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBi26-0001hm-Js
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 12:51:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBi0U-00019y-Se
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:49:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lBi0T-0003Tg-0f
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 12:49:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613411396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eXCeqs8eech13cqyOiVyvUxA35aYmddDaGBbIpFFs+k=;
 b=L/w7B7kyWoDvk7yCdutJp3iJgd5UH11L+IFTrKSZFQwHkVCtnqHy/nDZMV0VWXM7VX8Epi
 nNxGhYL/HoIX/kxpFU4jM8wa2pUCltGZQGdXRKgf4W1M/JiF4K0r4nbk57qdbRDULSEi9O
 irdxn+iktTfVzSPP543cNzF5ps0Bh0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-L2JFPF_AMtGBsM__M27ACg-1; Mon, 15 Feb 2021 12:49:53 -0500
X-MC-Unique: L2JFPF_AMtGBsM__M27ACg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ACADF107ACF8;
 Mon, 15 Feb 2021 17:49:52 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9900519719;
 Mon, 15 Feb 2021 17:49:46 +0000 (UTC)
Subject: Re: [PATCH] gitlab-ci: Display Avocado log content when tests timeout
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210215171438.935665-1-philmd@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <e0cf9130-2a96-773a-2043-64ebee3fad52@redhat.com>
Date: Mon, 15 Feb 2021 14:49:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215171438.935665-1-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/15/21 2:14 PM, Philippe Mathieu-Daudé wrote:
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
Good idea.
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   .gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 7adb9a4cef0..234cead60c2 100644
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


