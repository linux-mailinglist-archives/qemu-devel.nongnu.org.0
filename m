Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 567001D566F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 18:46:00 +0200 (CEST)
Received: from localhost ([::1]:46146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZdTD-0007F3-E0
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 12:45:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jZdSH-0006cB-RU
 for qemu-devel@nongnu.org; Fri, 15 May 2020 12:45:01 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55330
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jZdSH-0006xA-1y
 for qemu-devel@nongnu.org; Fri, 15 May 2020 12:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589561100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=OAVRKhCKvuhqCwpF4H0vwd5LZqawvdkM4SaPvGsQzrQ=;
 b=ESlfug2MqC7FPa4Eeq91HUITT5ZDipHMkfkxF17RGbmwS36a/Y2pNOozMK32ReS7O6biT2
 856wD8nnKh6ZyMLdg7AVW6a/UhhqudyX+N/TUdClg8OmNxmnChsk+/bzfE9IOxgXHXb98l
 hdBk8e/W4Z/Timz9jTFAlkTNs9trwLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-412-bHFw2AUmOfemiKcBNZXZkw-1; Fri, 15 May 2020 12:44:48 -0400
X-MC-Unique: bHFw2AUmOfemiKcBNZXZkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68329100A8FC;
 Fri, 15 May 2020 16:44:46 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-42.ams2.redhat.com [10.36.113.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BA2D7619F4;
 Fri, 15 May 2020 16:44:41 +0000 (UTC)
Subject: Re: [PATCH v2 3/5] gitlab-ci: Remove flex/bison packages
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200515163029.12917-1-philmd@redhat.com>
 <20200515163029.12917-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <7e818ab2-a811-7b33-89b2-695a3241eee4@redhat.com>
Date: Fri, 15 May 2020 18:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200515163029.12917-4-philmd@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/15 00:07:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Ed Maste <emaste@freebsd.org>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/05/2020 18.30, Philippe Mathieu-Daudé wrote:
> QEMU does not use flex/bison packages.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  .gitlab-ci.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index b889fb96b6..994774250f 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -4,7 +4,7 @@ include:
>  
>  before_script:
>   - apt-get update -qq
> - - apt-get install -y -qq flex bison libglib2.0-dev libpixman-1-dev genisoimage
> + - apt-get install -y -qq libglib2.0-dev libpixman-1-dev genisoimage
>  
>  build-system1:
>   script:
> 

Acked-by: Thomas Huth <thuth@redhat.com>


