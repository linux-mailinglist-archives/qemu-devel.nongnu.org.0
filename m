Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A5640DD98
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 17:08:53 +0200 (CEST)
Received: from localhost ([::1]:47558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQt0O-0004zT-BL
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 11:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQswt-0002Bn-Cm
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:05:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mQswr-00066h-2S
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 11:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631804711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T0M8Sgca0e37jqgJMJ8AkaM6yKeG7axVQ+CQ9bcURP4=;
 b=BQGwwT2Ze79WxFnOGkjd2pSIi6evYkCe12pXniP7OGlJg6PgoMdFoDAPqXyjSmjg2AozPl
 giyqftZzDvFxwEPDGggTu5lq4eepeQQe4DTltCJNP4Ow0EX4lPQnOAyz2ZHMMyJevE2PWY
 n4+qdzXYfoYx5txcQB7eXCHew0L7PFs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-u4vqBJJuOb6yHFApt_FaEg-1; Thu, 16 Sep 2021 11:05:10 -0400
X-MC-Unique: u4vqBJJuOb6yHFApt_FaEg-1
Received: by mail-wm1-f70.google.com with SMTP id
 z26-20020a1c4c1a000000b00300ec9d8d77so1313563wmf.5
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 08:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T0M8Sgca0e37jqgJMJ8AkaM6yKeG7axVQ+CQ9bcURP4=;
 b=t7TFj5J7+Yqc8yW69LrdcLgxd8gREcarVPCQ1gCIdS/tzEYs8MN75F4Xa9RWMSjGSs
 ICbh6Xxckt8eEkn78gnaRLAHZuYqb4pIR9Bq25+i592aVxdJAUHAONWulveFE0QueuS2
 iZAkNz5PqZBxMw/igNk522nXD48oPgT6rmZ8rqYNx+zJzPNQHAJIgCWrauF/agjym6Ko
 9uBKrhBCN4iVxrjqeUC8IodJVQ9QLzg5ANMJymEIOlaNQPhAt1raxaUpX4UWvupo5ic4
 rSCzaA0i6gkKg5eiSfPubu8LKAzkbWBqbUHe7t1lkQE9Jy6ch0S6J1Yr853fEacNDuY6
 IVrQ==
X-Gm-Message-State: AOAM533C1KFLiAR2m+UMzzxd/wGW28Zhz8jDwtES8RKHW55/mnq2qbaK
 mTOlq7GrE0b8cJvjo80f1pf5ekBSIydaa18SXJSDUBSGWxafajkN3yfXigAZqxl1eH7E4pDm19i
 niZLLag0MtAd7UZg=
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr3967904wrd.233.1631804709077; 
 Thu, 16 Sep 2021 08:05:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlaLIdYl7Z8ObP6Qcrr62jh73iYA6Zy3mfjl3rEwt43VS84CzyBPqU9W1sXBFB6Acxetymvg==
X-Received: by 2002:adf:d1c4:: with SMTP id b4mr3967866wrd.233.1631804708844; 
 Thu, 16 Sep 2021 08:05:08 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id o24sm7560945wmm.11.2021.09.16.08.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 08:05:08 -0700 (PDT)
Subject: Re: [PATCH v3 02/16] iotests/mirror-top-perms: Adjust imports
To: John Snow <jsnow@redhat.com>
References: <20210916040955.628560-1-jsnow@redhat.com>
 <20210916040955.628560-3-jsnow@redhat.com>
 <d394079e-b83b-33ce-b137-2e5bbc2213a1@redhat.com>
 <CAFn=p-aJViB-rWrVj2Ra_RXsbfqCFu2N1s_D8cCt10s9AoskMg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <39a8cd4b-7188-4f03-862f-7a26000d6b8f@redhat.com>
Date: Thu, 16 Sep 2021 17:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFn=p-aJViB-rWrVj2Ra_RXsbfqCFu2N1s_D8cCt10s9AoskMg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.488, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/16/21 4:27 PM, John Snow wrote:
> On Thu, Sep 16, 2021 at 12:27 AM Philippe Mathieu-Daudé
> <philmd@redhat.com <mailto:philmd@redhat.com>> wrote:
> 
>     On 9/16/21 6:09 AM, John Snow wrote:
>     > We need to import things from the qemu namespace; importing the
>     > namespace alone doesn't bring the submodules with it -- unless someone
>     > else (like iotests.py) imports them too.
>     >
>     > Adjust the imports.
>     >
>     > Signed-off-by: John Snow <jsnow@redhat.com <mailto:jsnow@redhat.com>>
>     > ---
>     >  tests/qemu-iotests/tests/mirror-top-perms | 7 ++++---
>     >  1 file changed, 4 insertions(+), 3 deletions(-)
>     >
>     > diff --git a/tests/qemu-iotests/tests/mirror-top-perms
>     b/tests/qemu-iotests/tests/mirror-top-perms
>     > index 2fc8dd66e0..de18182590 100755
>     > --- a/tests/qemu-iotests/tests/mirror-top-perms
>     > +++ b/tests/qemu-iotests/tests/mirror-top-perms
>     > @@ -25,7 +25,8 @@ from iotests import qemu_img
>     > 
>     >  # Import qemu after iotests.py has amended sys.path
>     >  # pylint: disable=wrong-import-order
>     > -import qemu
>     > +from qemu import qmp
>     > +from qemu.machine import machine
> 
>     Not straight-forward import name...
> 
> 
> You mean the 'qemu.machine.machine' path? If so, I agree. It will be
> fixed when I refactor QEMUMachine. A/QMP happens first.

Good news!


