Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7A8B322C96
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 15:41:57 +0100 (CET)
Received: from localhost ([::1]:43080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEYsu-0001lu-OE
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 09:41:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEYre-0000kz-Iw
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:40:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lEYrb-00078I-CF
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 09:40:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614091234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IPxkWDR/DTnb2/uD60Y3yZuAiZPTdIk9KEETCjwuFsg=;
 b=ey0ZTDDTUssGBdwxcwOiefNJEVrPuA2yE2jHXhkotix8SOA6pXQHptcvPnQvHtCEXL0Se8
 UaS5CoTWJTR+EeDXGR9uGQOhsEWAfL8xpeZHGjj9qxItCk5Mo8GZVuEX8QHOGcXIOOl71M
 WeR/lPMo4EQlKHRUlg8cv3WCIqrgMUM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-pTQuSw5qPFOucaYH8-0f5g-1; Tue, 23 Feb 2021 09:40:33 -0500
X-MC-Unique: pTQuSw5qPFOucaYH8-0f5g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D16841936B66;
 Tue, 23 Feb 2021 14:40:31 +0000 (UTC)
Received: from wainer-laptop.localdomain (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A228F5D9D0;
 Tue, 23 Feb 2021 14:40:23 +0000 (UTC)
Subject: Re: [PATCH 2/3] scripts/ci/gitlab-pipeline-status: give more
 information on failures
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210222193240.921250-1-crosa@redhat.com>
 <20210222193240.921250-3-crosa@redhat.com>
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <d4b61b85-56d1-606a-b9a7-1a2138a20dff@redhat.com>
Date: Tue, 23 Feb 2021 11:40:21 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210222193240.921250-3-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2/22/21 4:32 PM, Cleber Rosa wrote:
> When an HTTP GET request fails, it's useful to go beyond the "not
> successful" message, and show the code returned by the server.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   scripts/ci/gitlab-pipeline-status | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)


Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>


>
> diff --git a/scripts/ci/gitlab-pipeline-status b/scripts/ci/gitlab-pipeline-status
> index 0c1e8bd8a7..ad62ab3cfc 100755
> --- a/scripts/ci/gitlab-pipeline-status
> +++ b/scripts/ci/gitlab-pipeline-status
> @@ -56,7 +56,9 @@ def get_json_http_response(url):
>       connection.request('GET', url=url)
>       response = connection.getresponse()
>       if response.code != http.HTTPStatus.OK:
> -        raise CommunicationFailure("Failed to receive a successful response")
> +        msg = "Received unsuccessful response: %s (%s)" % (response.code,
> +                                                           response.reason)
> +        raise CommunicationFailure(msg)
>       return json.loads(response.read())
>   
>   


