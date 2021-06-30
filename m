Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3CD3B8526
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 16:38:45 +0200 (CEST)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lybMS-0002EJ-KK
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 10:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybKE-0007Vq-Go
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:36:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lybK4-0002Av-PH
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 10:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625063775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2bOMA/VVxbI80F04qL5WD/kEB60Zpm4pG0xiNs8x3tE=;
 b=IWZhGvwz/G8CXsRg0GiKzONCBQrbeTE1Vs5wKJMA+Wvspb4Os7rtpnNpzFj3a1H49ialye
 aGLWZlo6pFniln5sBxw58hybjIWpotmAGC66+ZmmjT6F00Dwhw9UVdWY1gQZ3tZtcUkOvO
 y9G5bNWrQaxM2BOlssw4pqRLVZ4DMfo=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-GHfugHy8NHOFnDrRxD8WFQ-1; Wed, 30 Jun 2021 10:36:13 -0400
X-MC-Unique: GHfugHy8NHOFnDrRxD8WFQ-1
Received: by mail-vk1-f197.google.com with SMTP id
 t6-20020ac5c3c60000b029024f8f474366so564696vkk.15
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 07:36:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2bOMA/VVxbI80F04qL5WD/kEB60Zpm4pG0xiNs8x3tE=;
 b=oYEsaCx5zMglFYmVaTThPDznN7LWF8w8OpBiN20BFHEt+5NKn6xDE9Tbce/YtK0ke+
 9OdWFZGwQofgIjQlG9kleKEoWuXcW8R/gtKO8j4CE1ywou0sRVJUIgnMr8003bPh12yk
 Le/iDPHJTPoxHnC5DEqfmifLfzO5Rvf+pxchsdwwHti8Itlsf2AeIlL8NvKV+7oNSuQl
 hUY9GbIRTaMaApaYCQ/30tXXnH4x1fPTYiyKPJmSaoEpB6HoRahy3RIQGJbI/0vzcIKH
 gvTVx7STn2drCD16EOLRG77TIEap305c9wciKgxmU6UP7ab6QkhfKhiDO59WdRQQULq+
 LdSQ==
X-Gm-Message-State: AOAM530ysflKogTsMZl1qEGKTblhK8RdXAtS1GpypD5olaKeJqbhswj7
 uitAevG7/tGWjoM37r8cgdHeOP6g7hbI7hR/EOVqKel8prSdAaIKM8nNhUJwb7CzZvp3DA+uxzO
 9A2FRX5d9sv6MIncp40/Mk7F/c5wU1eU=
X-Received: by 2002:ab0:744c:: with SMTP id p12mr16057265uaq.113.1625063772853; 
 Wed, 30 Jun 2021 07:36:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2VTrp1/caSGtj/FJbn5OGPSToQvQqZhXJ29UB8v4JuZAGQaKLs9K4w+d+V8WuWtIZAgQKeJS6mxdzlQt8RAM=
X-Received: by 2002:ab0:744c:: with SMTP id p12mr16057127uaq.113.1625063771711; 
 Wed, 30 Jun 2021 07:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210629214323.1329806-1-jsnow@redhat.com>
 <20210629214323.1329806-2-jsnow@redhat.com>
In-Reply-To: <20210629214323.1329806-2-jsnow@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 30 Jun 2021 11:35:45 -0300
Message-ID: <CAKJDGDbzR=CTVunh4MoCF6U6KzS6P7wG-F4P_834ngvBqCLnDg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] python/qom: Do not use 'err' name at module scope
To: John Snow <jsnow@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 29, 2021 at 6:43 PM John Snow <jsnow@redhat.com> wrote:
>
> Pylint updated to 2.9.0 upstream, adding new warnings for things that
> re-use the 'err' variable. Luckily, this only breaks the
> python-check-tox job, which is allowed to fail as a warning.
>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
> ---
>
> I guess that's good enough evidence that check-pipenv and check-tox both
> have their place :)
>
> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  python/qemu/qmp/qom.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


