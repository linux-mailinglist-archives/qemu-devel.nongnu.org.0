Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F63624F9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 18:04:27 +0200 (CEST)
Received: from localhost ([::1]:50262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXQxG-0006IR-GQ
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 12:04:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQoP-0000Cg-NC
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:55:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lXQoL-0002Pk-29
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 11:55:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618588512;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TuL/kMFJTRYBRAWEmfzHmLsRvk5byGqdy24idS5Rv1A=;
 b=Deczcs7Z65/0/hnJG8L1jk9NRlAaVM8alpSMmrJ20dRvT760sPWHH+N/mtcaK/RJTw8qPD
 678DQP60Qmi1KQIFMJyY5oZmW1J9v/003Ek2IEqRR6ZznlA3t4mlRNiCq9rwiESTIMZzXK
 8/MAXEDvy/GyxxJNp1r9y2ni7tqSi0s=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-rAMVM13JMG-jCdGLRWUdLA-1; Fri, 16 Apr 2021 11:55:10 -0400
X-MC-Unique: rAMVM13JMG-jCdGLRWUdLA-1
Received: by mail-vk1-f198.google.com with SMTP id
 j67-20020a1f55460000b02901d93424fdc4so2689197vkb.10
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 08:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TuL/kMFJTRYBRAWEmfzHmLsRvk5byGqdy24idS5Rv1A=;
 b=R88sHJpsbLJC1kJvluV81hBe29kC5d2ahgooFwWyWws+auLGIb0NuwuVspgjDDBV9q
 fyxTCLMYp/507bzgA/LMve2aHV0fB6zDDUmw8xAF1C4zZORLwpuf+0c6dGoCUPZSoKFn
 mVDk7SvNw2nkU7UkSqwM5T3FEpL4i61nRmaoLZ3TdCR9aa3mOBQN1r/qs4GRRb+43pBm
 +wnTGIHG+r7m0MZOGEA+Wop4sVirJJO/kk4WFWhYimFRDBuVbquMLUwFZRIh4avpTsfn
 hju1d+dwoUk7bmzhv4PcMKUuiytjrRNTxqJ4RWRpFh/G7AJNd+7kQJmnoxpljMKVqoEs
 bdZQ==
X-Gm-Message-State: AOAM530F5mfvCuAp+6Y/Z4S6i23VRzT59oVtyZ9uUfWHuafvLR6w5DFk
 8hu3GMXrNz/dC5NocGnho/6rTG3r9K5weihaCXolzRB7myNV6zpGCe52BWbqi7H6cmMH6r1XG5h
 REUutSU6zlTKLCMZ/fobi6pvPWQ6nDvQ=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr7566210vsn.39.1618588509641; 
 Fri, 16 Apr 2021 08:55:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1UVaeXnYeuymhPU2XuHuvWaDUv+z14ErUDwZTMPzZiETwfh4a16jcN5fQiJvxfYmb0RBinnvNLqUCcZLsBbI=
X-Received: by 2002:a67:27c2:: with SMTP id n185mr7566195vsn.39.1618588509432; 
 Fri, 16 Apr 2021 08:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210415215141.1865467-1-crosa@redhat.com>
 <20210415215141.1865467-6-crosa@redhat.com>
In-Reply-To: <20210415215141.1865467-6-crosa@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Fri, 16 Apr 2021 12:54:43 -0300
Message-ID: <CAKJDGDb91Sy9PJjb4vihFY++uJ9SkeMyNiu7-rWNefpsO8CytQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] tests/acceptance/cpu_queries.py: use the proper
 logging channels
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
> The test contains methods for the proper log of test related
> information.  Let's use that and remove the print and the unused
> logging import.
>
> Reference: https://avocado-framework.readthedocs.io/en/87.0/api/test/avocado.html#avocado.Test.log
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/cpu_queries.py | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


