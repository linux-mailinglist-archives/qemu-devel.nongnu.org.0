Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC0942EE6F
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 12:07:56 +0200 (CEST)
Received: from localhost ([::1]:33248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbK83-0001cP-8f
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 06:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mbK5U-0006s8-6U
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:05:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.151.124]:43814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mbK5Q-0006qp-B4
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 06:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634292310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=20GHwvqxjOdySp8hXy6nVwIGBnfmzjt0SvdFEe+CNtE=;
 b=eSCUiD/d73KLWRlW21FlGKQn9EHZK5RRlx+NaTdOv1R34aQXJWrr5bTRzAZ5wBflU7TEX4
 5jBNU4Jeh/JfFyrFnjrQE8IQSUL/7jDqIVKZCfXx8cHQd2JWSUGU+cKYjcTq0myeN8PqZS
 wAQvR7sEQtBFEK0l6mNDgAHptgg7LfA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-GlBVU06ROt6uhuBVpHXp6A-1; Fri, 15 Oct 2021 06:05:09 -0400
X-MC-Unique: GlBVU06ROt6uhuBVpHXp6A-1
Received: by mail-ed1-f72.google.com with SMTP id
 l22-20020aa7c316000000b003dbbced0731so7788638edq.6
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 03:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=20GHwvqxjOdySp8hXy6nVwIGBnfmzjt0SvdFEe+CNtE=;
 b=uIAShLgwzzJAGuxIURy1m5nngqQfzNFqugS5q/87dc696JwYvL4GDDFEhopgQGu+Jr
 mdgpMNNXlW3yHG0bCnVzweIy85sDswJhWzzUn4gIs2HaPnOSi1iQl0kHphDdi3MRT9aq
 tfL56+uQ+YzDE/LgjP7TyrHG0oB0Bj86nTGszNnAE48Le+Myxy2/qoZYqsHujrLXPjqZ
 MiEkImzhre9nJRbFinX9GkB0FTutEuRn1bx6QCn51VPP9fMiwv24J7RM8pWsBXYnEW2B
 UimuYR2855xToWOc+XmwiISRrgrPUMAmjHs9ohJe3nSlP7rjKOA/GkGsN3aGWi+kls7j
 X/dA==
X-Gm-Message-State: AOAM5330a4Gf11Xp96TOnKHflGPw3J0p9AO68LuXcISm9KPgphR79Qt+
 ZcS24Vehxb4AS+m1kzySyOnzrn7iXICKA3zVgJwxC1uhYeIqW6fFglStGEekTNDUd2LJgPpIHEM
 EOnQjFyTO1S/vZMdDALXymXDWLa6LO+swf0TgieSGM7llb17LqoSmH2tuj/2jPrC1x9Q=
X-Received: by 2002:a17:906:5d6:: with SMTP id
 t22mr5606145ejt.98.1634292307942; 
 Fri, 15 Oct 2021 03:05:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDmLZO1kd3vmGGAdyVY6Kbkt/SedPAL/ypmR5AT7aECvMu2dmok7pKC3DkC7/cfJBzTYk4zA==
X-Received: by 2002:a17:906:5d6:: with SMTP id
 t22mr5606096ejt.98.1634292307596; 
 Fri, 15 Oct 2021 03:05:07 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 i10sm4423185edl.15.2021.10.15.03.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Oct 2021 03:05:07 -0700 (PDT)
Subject: Re: [PATCH v3 02/25] include/block/block: split header into I/O and
 global state API
To: Eric Blake <eblake@redhat.com>
References: <20211012084906.2060507-1-eesposit@redhat.com>
 <20211012084906.2060507-3-eesposit@redhat.com>
 <20211014203130.7ez223436cdrg6zs@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <47175de4-dd21-0d3e-8274-275d6adc39eb@redhat.com>
Date: Fri, 15 Oct 2021 12:05:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20211014203130.7ez223436cdrg6zs@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.151.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> diff --git a/include/block/block-common.h b/include/block/block-common.h
>> new file mode 100644
>> index 0000000000..4f1fd8de21
>> --- /dev/null
>> +++ b/include/block/block-common.h
>> @@ -0,0 +1,389 @@
>> +#ifndef BLOCK_COMMON_H
>> +#define BLOCK_COMMON_H
> 
> As a new file, it probably deserves a copyright/license blurb copied
> from the file it is split out of.
> 
>> diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
>> new file mode 100644
>> index 0000000000..b57e275da9
>> --- /dev/null
>> +++ b/include/block/block-global-state.h
>> @@ -0,0 +1,263 @@
>> +#ifndef BLOCK_GLOBAL_STATE_H
>> +#define BLOCK_GLOBAL_STATE_H
> 
> Likewise, here and in all other newly-split files in your series.

In general, as you might have seen, I kept the same copyright/license 
from the original file I split. But block.h seems to be the only header 
with no license.
> 
>> +++ b/include/block/block.h
>> @@ -1,864 +1,9 @@
>>   #ifndef BLOCK_H
>>   #define BLOCK_H
> 
> Oh. There wasn't one to copy from :( Well, now's as good a time to fix
> that as any.
> 
So now the question is which one to use, because I see 2 different types 
of copyrights templates:

- long version copyright, used in block_int.h, blockjob_int.h and many 
others

/*
  * QEMU System Emulator block driver
  *
  * Copyright (c) 2003 Fabrice Bellard
  *
  * Permission is hereby granted, free of charge, to any person 
obtaining a copy
[...]
  *
  * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
EXPRESS OR
[...]
  */

- short version, used in block-backend.h and many others

/*
  * QEMU Block backends
  *
  * Copyright (C) 2014-2016 Red Hat, Inc.
  *
  * Authors:
  *  ....
  *
  * This work is licensed under the terms of the GNU LGPL, version 2.1
  * or later.  See the COPYING.LIB file in the top-level directory.
  */

Maybe since we are talking about block.h we should stick to the same 
format as block_int.h? I am not sure though.

Thank you,
Emanuele


