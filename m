Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8C23BE46F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 10:29:12 +0200 (CEST)
Received: from localhost ([::1]:49876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12vf-0007rJ-NQ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 04:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12uq-0007Cl-JO
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m12un-00053l-Sx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 04:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625646496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OfldufTuSONj9eAA2yYHxSKvutH++TX4P0qFLZXpO2c=;
 b=iEP+f/pv2qXs0DOAHhIpvNdmud1Bvi0LvjBsgIodNNlF2NaDiEGCuMizXfnMRJv931gF5h
 rHfdDfRGJ8UcQiyhhQVZThuA5RQI4clo3FRRIkwiisYkMeRbjg2ZdnzNxYV7Za5ybEtj9O
 0rppIzV+zL/1ERAg/vz1svi39pdA7DQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-IdU3PaccOZqWTbi6QlGicw-1; Wed, 07 Jul 2021 04:28:12 -0400
X-MC-Unique: IdU3PaccOZqWTbi6QlGicw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a129-20020a1ce3870000b02901f050bc61d2so669984wmh.8
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 01:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OfldufTuSONj9eAA2yYHxSKvutH++TX4P0qFLZXpO2c=;
 b=Ogev9+63pBq2BN9+VjyVChzP0o3hUJHAxlRMisi39Rm9tg3KS7V3svg7Yg78/ESc2x
 SfPXpya3+LzjsTt9C6EVMzS9/BkHJqytsRb9TsTrI4dqllye7xPwZG02MJkx7ETeZ7Mg
 9n032n7hxc1Ops//PN684wbO9ppMuqoiEqoSVH5UNB9gNLeBKaMVS/ZS8mWd+38AxJ9q
 97vt0wtZIMP/Y3MYfkgVue8zMfHPlC3J36uHXgGMdX2JenPXSse1hhxLndk90t4ToDQq
 BN9DZZKVs/n5S5fWQOsoqlz9r226R1fAUoTRVrJByWJSyCNGiclLxxhl1tUoMlYkEm36
 BjkQ==
X-Gm-Message-State: AOAM532jDdTJ+hDCZ09SmAx6gO9yaZshJar6hsP8cW+KTMYeSzw/5Mkl
 eiUq7Ub8Nb9hFO8z3LoUwxg/WAiKCJdvUOefDONSUR8NngSWULDqtGf+hBctd3HRY8HDqK6OVn3
 JIye/3MqG9OHPU9E=
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr1849173wmm.92.1625646491689; 
 Wed, 07 Jul 2021 01:28:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMWjTKvC+Jb0NGcfUnriM9xTQC1F/IcXNz1fMbI4rdU/j/EaebG7Fmz1epnU6Nlp6X270DYg==
X-Received: by 2002:a05:600c:cf:: with SMTP id
 u15mr1849154wmm.92.1625646491497; 
 Wed, 07 Jul 2021 01:28:11 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j17sm5229897wmi.41.2021.07.07.01.28.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 01:28:11 -0700 (PDT)
Subject: Re: [PATCH] tests/migration: fix unix socket migration
To: huangy81@chinatelecom.cn, qemu-devel <qemu-devel@nongnu.org>
References: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f9a92156-8491-4494-c325-4153abc474ea@redhat.com>
Date: Wed, 7 Jul 2021 10:28:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ea67ec8c4a46979af5515a794759efc00960ed7e.1615304914.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>
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

Maintainer could amend:

See also commit f9cc00346d3 ("tests/migration: fix unix socket batch
migration").

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> Signed-off-by: Hyman <huangy81@chinatelecom.cn>
> ---
>  tests/migration/guestperf/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
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


