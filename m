Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFF1362508
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:05:30 +0200 (CEST)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQyH-0007ga-6w
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:05:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQjz-0003qt-TZ
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:50:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQjw-0000fc-3v
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618588238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iIYnna/LDMNW3KvRq2hk7iXZEnHUkA5+xN/dTfEW8VQ=;
 b=jMGbVcrqRCrVOwjhCYW2thBVm+OCpmIwnCQmNBcDrf9eVfR2xUrAUN/Bf6jbBMtkNMYJwW
 EbiVhdwB8/RO56QmHFN0TeKicMabIasy9L5UV5ArzcHsutNgNXxOnCDrz5iOSGBOfXa0lA
 nSYA6Xe//ka+rdX0kpRICZp7MkPt5ik=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-WNbIhYIzNgCoMzHlL67R3A-1; Fri, 16 Apr 2021 11:50:37 -0400
X-MC-Unique: WNbIhYIzNgCoMzHlL67R3A-1
Received: by mail-vk1-f197.google.com with SMTP id
 k186-20020a1fa1c30000b02901deb88f03ecso2694569vke.11
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iIYnna/LDMNW3KvRq2hk7iXZEnHUkA5+xN/dTfEW8VQ=;
 b=YbAJ5CSfk8lkroKTItfo97Clh0RDamd65WLKdKviyVsnksOQgKQiLnY4cVAeHc5tQs
 PaL2LouAbw3y+pXQUtPHyn3E+iS6PRXpLLFSazvHhpXCZBL7a+sj0DezFkD7Ti5oj/G5
 nbwN164lIWni8gaKZ2krIiWaEqKPMowW2Skz8jl7AGQxgvi0+OP5WCG35JWUufbv2Scy
 LqUJf9RSsjt7toqDpoC1n9yLa7wn6he+YhmBvxcOAuaDpCSduSgMznWU8yaLZi091N/a
 DchAZ4A0uPLZEkhf0sTUHYH3JgyCIFEtkyING4uOeFFY7aVD5lY1/KoFH1pAyYhMbZGi
 OxQA==
X-Gm-Message-State: AOAM533M+EM1SE7o/QDzKWrmUBIpeFf24y9QkLlsaa7j8twOYvG9O8P5
 yeL3bm6vuWWnmcrBs/pOO3Kh60tL1ILQBmGN3QyccOwJZZzXCqFN8ZKO5ly+XII4gs5JNAYSUMw
 Z2M9Rc8e8sFAqrdqFdGz7iwf80iyadgs=
X-Received: by 2002:a67:1744:: with SMTP id 65mr7361344vsx.50.1618588236912;
 Fri, 16 Apr 2021 08:50:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzthsuKcqfQCuKYaGW8N4cWIF9NVRhd9dFnX2lFbjIPnM6acW7yFdqcInH9vrPCw7qvYLMm9n8rgbJPLNeTs9c=
X-Received: by 2002:a67:1744:: with SMTP id 65mr7361329vsx.50.1618588236773;
 Fri, 16 Apr 2021 08:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-5-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-5-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:50:11 -0300
Message-ID: <CAKJDGDYv2z8F9HcYkBCtiNAeuT9vxEHZMgBFQbTsYugxt9rJog@mail.gmail.com>
Subject: Re: [PATCH 4/8] tests/acceptance/migration.py: cancel test if
 migration is not supported
To: Cleber Rosa <crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Auger Eric <eric.auger@redhat.com>,
 "open list:S390 Virtio-ccw" <qemu-s390x@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 15, 2021 at 6:52 PM Cleber Rosa <crosa@redhat.com> wrote:
>
> FIXME: check if there's a way to query migration support before
> actually requesting migration.
>
> Some targets/machines contain devices that do not support migration.
> Let's acknowledge that and cancel the test as early as possible.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/migration.py | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/tests/acceptance/migration.py b/tests/acceptance/migration.py
> index 792639cb69..25ee55f36a 100644
> --- a/tests/acceptance/migration.py
> +++ b/tests/acceptance/migration.py
> @@ -53,7 +53,11 @@ def do_migrate(self, dest_uri, src_uri=None):
>          source_vm = self.get_vm()
>          source_vm.add_args('-nodefaults')
>          source_vm.launch()
> -        source_vm.qmp('migrate', uri=src_uri)
> +        response = source_vm.qmp('migrate', uri=src_uri)
> +        if 'error' in response:
> +            if 'desc' in response['error']:
> +                msg = response['error']['desc']
> +            self.cancel('Migration does not seem to be supported: %s' % msg)

I agree with Phil that a generic function would be reusable when
needed, but as it is not needed yet, this looks good to me:

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


