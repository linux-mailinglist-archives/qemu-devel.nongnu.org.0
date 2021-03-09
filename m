Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E2E332E93
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 19:55:38 +0100 (CET)
Received: from localhost ([::1]:34946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJhW5-0000fI-Dv
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 13:55:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJfeB-0004je-A4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:55:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJfe8-00081E-Ji
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 11:55:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615308947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BwmjkIXkcJE1QWGPvrXEnHMmnp7Q12/fR1lnycREjZc=;
 b=YZKPL9HRjH7o8hZiAgqLVKMkXUqtH647OOkj8WmyvTF8rn+mR4br06u5Ocy6jR2Bh0Uc88
 iwlG/4Y1ZNELoUf+O2hLAFqFnXmFM69cmCoBMZE1zG73OtKMJHeF3zBa2DmfzrGjDgGrrg
 BdjBbBXXBO9BX7n/0m6hfwEFnXHh6dQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-1u0aSKZdMKy5v8eZpMPUcQ-1; Tue, 09 Mar 2021 11:55:44 -0500
X-MC-Unique: 1u0aSKZdMKy5v8eZpMPUcQ-1
Received: by mail-ed1-f72.google.com with SMTP id w16so7046364edc.22
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 08:55:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BwmjkIXkcJE1QWGPvrXEnHMmnp7Q12/fR1lnycREjZc=;
 b=JOTVeeSLjxRhg6a7/RarZOV3tVMbxO4k4a8/ALf2pBhIjEcQiHqTjkDXKgT4z6yWsc
 I5EbwObrnV6mxhyj8yl0lsR6385phWgcNpf2BePlcPCXH9pc/Nqck+cWO4TTBb4naW+S
 seTR8iKmbVpvmDGGCp+wM+v/lTW1uE4/zc2u98WsZewgOzlKytV0EagHjqn2RiIrUViN
 qGWvP0gU5C5DkWR64oqN0+x2OuQBL0KIF/p+yGzECOIzoxHwgIZPvOaDo2PmzX0SFYz/
 2iivN1Q6scHAdgA7LaKp6JeSLW6GfPFMfLe4ZFJgHJMoU2kV2NsqLKQN8UnHAPwBfFaT
 dJlw==
X-Gm-Message-State: AOAM533hIZpzdBOb9O2ZnTqyfCDJCPSd9NAoKZRvQXzFCjHFK36AgI0S
 Z41T3kryXmbgTJgFbUpnIEj2JBzh5IepFZ9IVaVWxI3gx/ItgIo2fHUpvs3lR35mSZbRZTa+wPE
 U8uX43Apr9qDXIFM=
X-Received: by 2002:aa7:c386:: with SMTP id k6mr5112226edq.224.1615308943187; 
 Tue, 09 Mar 2021 08:55:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUSj+03CyIikKj9y6ReQeSn4L7y+Gwl4CNtG/5hUq7XyZBo9VEQtqOGVzU8WU2PnBK1I9hJw==
X-Received: by 2002:aa7:c386:: with SMTP id k6mr5112210edq.224.1615308943024; 
 Tue, 09 Mar 2021 08:55:43 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j1sm8570260ejt.18.2021.03.09.08.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 08:55:42 -0800 (PST)
Subject: Re: [PATCH] tests/migration: fix unix socket migration
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8a8d72ee-d24c-5aac-3b89-192d4d54f7cb@redhat.com>
Date: Tue, 9 Mar 2021 17:55:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/9/21 5:00 PM, huangy81@chinatelecom.cn wrote:
> From: Hyman <huangy81@chinatelecom.cn>
> 
> The test aborts and error message as the following be throwed:
> "No such file or directory: '/var/tmp/qemu-migrate-{pid}.migrate",
> when the unix socket migration test nearly done. The reason is
> qemu removes the unix socket file after migration before
> guestperf.py script do it. So pre-check if the socket file exists
> when removing it to prevent the guestperf program from aborting.
> 
> Signed-off-by: Hyman <huangy81@chinatelecom.cn>
> ---
>  tests/migration/guestperf/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Interesting, we have in MAINTAINERS:

Python scripts
M: Eduardo Habkost <ehabkost@redhat.com>
M: Cleber Rosa <crosa@redhat.com>
S: Odd Fixes
F: scripts/*.py
F: tests/*.py

However:

./scripts/get_maintainer.pl -f tests/migration/guestperf/engine.py
get_maintainer.pl: No maintainers found, printing recent contributors.
get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.

> diff --git a/tests/migration/guestperf/engine.py b/tests/migration/guestperf/engine.py
> index 83bfc3b..86d4f21 100644
> --- a/tests/migration/guestperf/engine.py
> +++ b/tests/migration/guestperf/engine.py
> @@ -405,7 +405,7 @@ def run(self, hardware, scenario, result_dir=os.getcwd()):
>              progress_history = ret[0]
>              qemu_timings = ret[1]
>              vcpu_timings = ret[2]
> -            if uri[0:5] == "unix:":
> +            if uri[0:5] == "unix:" and os.path.exists(uri[5:]):
>                  os.remove(uri[5:])
>              if self._verbose:
>                  print("Finished migration")
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


