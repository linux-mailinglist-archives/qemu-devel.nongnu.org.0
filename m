Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B064197EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 17:28:36 +0200 (CEST)
Received: from localhost ([::1]:45076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUsYV-0001q5-Bm
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 11:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUsWr-0000Dc-UZ
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mUsWp-0007bj-1C
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 11:26:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632756409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nuImDDsUhoYi2N4n+d23iP5qi1WcqSD60TpzvnSl+AE=;
 b=DA0p9hH1sU1+82lxrEdXFqlk/96o3sLuQ3dW7WetrdIV2twduHPfkN7QGur0trjJuJdFqj
 BwGPr+GgMO2fcG+7qzwsQnB0wfMpon3sJtM37M9uCcieu8GuWEqSnqbRCM+95/2gBJg4mO
 9Y65A7i/bEEwxA2ZL8xkkZsxRez3SRk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-0927tqEuMYGxnySa7o0u7g-1; Mon, 27 Sep 2021 11:26:46 -0400
X-MC-Unique: 0927tqEuMYGxnySa7o0u7g-1
Received: by mail-wm1-f69.google.com with SMTP id
 17-20020a05600c029100b00305eac9f29aso100182wmk.1
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 08:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nuImDDsUhoYi2N4n+d23iP5qi1WcqSD60TpzvnSl+AE=;
 b=u6RKL+jBmAQyBYr6Rq+dfnRAiU+1kNuI1a+HdyUfnDsOSpqvkwC4gqDg+7JQOx6u1x
 sc65mVjpvO7KehSfIViOmDKfayKKOCVN23n0d7liYbN5GqJXv6uwMPWbk12AlE5U8486
 wZkgcgZIPf71mNekbq69B3/XxAGlkMMAi+jd+Evp45eMGDK2V6ZMjeNG4clnDW+os4qs
 wGFH3Wufs8jwk6bLKQ4vseLAKTQdAlghK0aHjGbDLdTMqt4nWXXgxx8a8tP2qEmDD0Fv
 QJcqYdBaiEp7n0M/Qv8z0ZnZU2oNAgre3sCnt3pukHjY0wjj1g6KqUvncfosdXZU/L62
 GzYQ==
X-Gm-Message-State: AOAM532zn5UjUxraqWLPfcQjZWi4acK+G7zN8dwJdPHls58BMSPIy0h+
 bUU+UYCbC2z1azrDQoxHtR30AF+9YgGPgzxCHCz+n+EmMLsoHgm3Xq3DpKPPeKfhV0uWl4GBssZ
 LwXy7IecgT/xJ3QA=
X-Received: by 2002:a5d:504e:: with SMTP id h14mr582401wrt.48.1632756405133;
 Mon, 27 Sep 2021 08:26:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxGQJmDU0qks6IeXyvM/ALijwJB+i3f3M/nhTWcXBpnH3qAn9Y9eTnLvpWEVBlitUe9qi+qyA==
X-Received: by 2002:a5d:504e:: with SMTP id h14mr582359wrt.48.1632756404961;
 Mon, 27 Sep 2021 08:26:44 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id v17sm16603464wrr.69.2021.09.27.08.26.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Sep 2021 08:26:44 -0700 (PDT)
Message-ID: <f21bc338-f0e1-e32f-980b-e40806a99555@redhat.com>
Date: Mon, 27 Sep 2021 17:26:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH 14/16] tests/acceptance/ppc_prep_40p.py: NetBSD 7.1.2
 location update
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210924185506.2542588-1-crosa@redhat.com>
 <20210924185506.2542588-15-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210924185506.2542588-15-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.136, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Auger Eric <eric.auger@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Willian Rampazzo <wrampazz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Ryo ONODERA <ryoon@netbsd.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/24/21 20:55, Cleber Rosa wrote:
> The NetBSD-7.1.2-prep.iso is no longer available on the CDN, but it's
> still available in the archive.
> 
> Let's update its location so that users without the file on cache can
> still fetch it and run the test.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/acceptance/ppc_prep_40p.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


